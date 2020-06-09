package com.bjyx.controller;

import com.alibaba.excel.util.DateUtils;
import com.bjyx.common.Constants;
import com.bjyx.entity.po.TbPriceInfo;
import com.bjyx.entity.po.TbUserInfo;
import com.bjyx.entity.vo.TbUserInfoVO;
import com.bjyx.enumeration.EnumPriceCode;
import com.bjyx.mapper.TbExportInfoMapper;
import com.bjyx.mapper.TbPriceInfoMapper;
import com.bjyx.mapper.TbUserInfoMapper;
import com.bjyx.utils.SysResult;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

@Controller
public class LoginController {
    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    @Autowired(required = false)
    private TbUserInfoMapper tbuserInfoMapper;
    @Autowired(required = false)
    private TbExportInfoMapper tbExportInfoMapper;

    @Autowired(required = false)
    private TbPriceInfoMapper tbPriceInfoMapper;

    @Value("${currentVersion}")
    private String currentVersion;

    DecimalFormat df = new DecimalFormat("#.00");

    @RequestMapping("/")
    public String login(Model model) {
        model.addAttribute("userInfo", new TbUserInfo());
        return "login";
    }

    @PostMapping("/pcLogin")
    public String pcLogin(TbUserInfo tbUserInfo, Model model, HttpSession session) {

        //校验登录方式
        String username = tbUserInfo.getUsername();
        String password = tbUserInfo.getPassword();
        String realName = tbUserInfo.getRealName();
        String mac = "11";
        //判断是PC登录还是手机登录
        boolean pcLogin = StringUtils.isNotBlank(username) && StringUtils.isNotBlank(password) && StringUtils.isNotBlank(mac);

        if (pcLogin) {
            tbUserInfo = tbuserInfoMapper.selectByUserInfo(tbUserInfo);
            if (tbUserInfo == null) {
                return "redirect:/";
            }
            tbUserInfo.setRemainingSum(tbUserInfo.getRemainingSum() == null ? 0.0 : tbUserInfo.getRemainingSum());
            // 设置session
            session.setAttribute(Constants.SESSION_KEY, tbUserInfo);
            logger.info("==用户 PC登录:{}成功!", tbUserInfo.toString());
            return "forward:/getList?id=" + tbUserInfo.getId();
        } else {
            return "redirect:/";
        }
    }

    @PostMapping("/pcLogin2")
    public String pcLogin2(TbUserInfo tbUserInfo, Model model, HttpSession session) {

        //校验登录方式
        String username = tbUserInfo.getUsername();
        String password = tbUserInfo.getPassword();
        String realName = tbUserInfo.getRealName();
        String mac = "11";
        //判断是PC登录还是手机登录
        boolean pcLogin = StringUtils.isNotBlank(username) && StringUtils.isNotBlank(password) && StringUtils.isNotBlank(mac);

        if (pcLogin) {
            tbUserInfo = tbuserInfoMapper.selectByUserInfo(tbUserInfo);
            if (tbUserInfo == null) {
                return "redirect:/";
            }
            tbUserInfo.setRemainingSum(tbUserInfo.getRemainingSum() == null ? 0.0 : tbUserInfo.getRemainingSum());
            // 设置session
            session.setAttribute(Constants.SESSION_KEY, tbUserInfo);
            logger.info("==用户 PC登录:{}成功!", tbUserInfo.toString());
            return "forward:/getSortingOrderList?id=" + tbUserInfo.getId();
        } else {
            return "redirect:/";
        }
    }

    @PostMapping("/appLogin")
    @ResponseBody
    public SysResult Applogin(TbUserInfoVO tbUserInfoVO) {
        logger.info("app 被调取到:{}", tbUserInfoVO.toString());
        //校验登录方式
        String version = tbUserInfoVO.getVersion();
        String token = "";

        if (!currentVersion.equals(version)) {
            logger.info("手机号为{}当前版本为:{}", tbUserInfoVO.getVersion(), tbUserInfoVO.getMobile());
            return new SysResult(0, "请升级app版本");
        }

        TbUserInfo tbUserInfo = new TbUserInfo();
        tbUserInfo.setMobile(tbUserInfoVO.getMobile());
        tbUserInfo.setImei(tbUserInfoVO.getImei());

        TbUserInfo tbUserInfoTmp = tbuserInfoMapper.selectByMobile(tbUserInfoVO);
        if (tbUserInfoTmp == null) {
            return new SysResult(0, "此手机号没有授权,请联系管理员授权");
        }
        if (tbUserInfoTmp.getStatus() == 0) {
            return new SysResult(0, "本用户已失效，请联系管理员");
        }

        if (StringUtils.isBlank(tbUserInfoTmp.getImei())) {
            //把串码录入库里
            tbUserInfo.setId(tbUserInfoTmp.getId());
            token = UUID.randomUUID().toString();
            //把token存入库里
            tbUserInfo.setToken(token);
            tbUserInfo.setInvalidDate(getInvalidDate());
            tbuserInfoMapper.updateTokenByPrimaryKey(tbUserInfo);
            logger.info("==用户 APP 登录:{} 成功!", tbUserInfo.toString());
            return new SysResult(1,"登录成功", token, tbUserInfoTmp.getRemainingSum() == null ? 0.00 : tbUserInfoTmp.getRemainingSum());

        } else {
            //手机登录
            tbUserInfo = tbuserInfoMapper.selectByMobileAndIMEI(tbUserInfoVO);
            if (tbUserInfo != null) {
                tbUserInfo.setInvalidDate(getInvalidDate());
                tbuserInfoMapper.updateTokenByPrimaryKey(tbUserInfo);
                return new SysResult(1,"登录成功", tbUserInfo.getToken(), tbUserInfo.getRemainingSum() == null ? 0.00 : tbUserInfo.getRemainingSum());
            } else {
                return new SysResult(0, "此手机号已在其他设备授权");
            }
        }
    }

    @PostMapping("/checkToken")
    @ResponseBody
    public SysResult checkToken(String token, String version) {
        logger.info("app 校验token:{}", token);
        if (!currentVersion.equals(version)) {
            logger.info("token为{}当前版本为:{}", token, version);
            return new SysResult(0, "请升级app版本");
        }
        //校验登录方式
        TbUserInfo tbUserInfo = tbuserInfoMapper.selectByToken(token);

        if (tbUserInfo != null) {
            if (tbUserInfo.getStatus() == 0) {
                return new SysResult(0, "本用户已失效，请联系管理员");
            }

            Date invalidDate = tbUserInfo.getInvalidDate();
//            String currentDateStr = DateUtils.format(new Date(), "yyyy-MM-dd 00:00:00");
//            Date currentDate =null;
//            try {
//                currentDate = DateUtils.parseDate(currentDateStr);
//            } catch (ParseException e) {
//                e.printStackTrace();
//            }

            if (invalidDate != null && new Date().getTime() <= invalidDate.getTime()) {
                logger.info("==用户 APP 登录:{} 成功!", tbUserInfo.toString());
                return new SysResult(1, "登录成功",token, tbUserInfo.getRemainingSum() == null ? 0.00 : tbUserInfo.getRemainingSum());
            } else {
                return new SysResult(0, "当前登录已失效，请重新登录");
            }
        }

        return new SysResult(0,"登录失败，请重新登录");
    }

    @PostMapping("/queryWaybillNo")
    @ResponseBody
    public SysResult queryWaybillNo(String token, String version) {

        if (!currentVersion.equals(version)) {
            logger.info("token为{}当前版本为:{}", token, version);
            return new SysResult(0, "请升级app版本");
        }
        //校验登录方式
        TbUserInfo tbUserInfo = tbuserInfoMapper.selectByToken(token);
        if (tbUserInfo != null) {
            if (tbUserInfo.getStatus() == 0) {
                return new SysResult(0, "本用户已失效，请联系管理员");
            }

            Date invalidDate = tbUserInfo.getInvalidDate();
            if (invalidDate != null && new Date().getTime() <= invalidDate.getTime()) {
                TbPriceInfo tbPriceInfo = tbPriceInfoMapper.selectPriceByUserId(tbUserInfo.getId(), EnumPriceCode.APP_PRICE.getCode());
                Double remainingSum = tbUserInfo.getRemainingSum() == null ? 0.00 : tbUserInfo.getRemainingSum();
                if (remainingSum <= 0) {
                    return new SysResult(2, "账户余额为0，请联系管理员充值",token, remainingSum);
                }
                if (tbPriceInfo == null) {
                    return new SysResult(2, "请先联系管理员，先配置该用户单价",token, remainingSum);
                }
                Double pcPrice = tbPriceInfo.getPrice() == null ? 0.0 : tbPriceInfo.getPrice();

                if (pcPrice > remainingSum) {
                    return new SysResult(2, "当前余额不够支付本次消费金额，请联系管理员充值",token, remainingSum);
                }

                //更新余额
                Double remainingSumAfter = remainingSum - pcPrice;
                String formatRemainingSum = df.format(remainingSumAfter);
                TbUserInfo tbUserInfo1 = new TbUserInfo();
                tbUserInfo1.setId(tbUserInfo.getId());
                tbUserInfo1.setRemainingSum(remainingSumAfter);

                tbuserInfoMapper.updateRemainingSumByPrimaryKey(tbUserInfo1);

                return new SysResult(1,"查询成功", token, remainingSumAfter);
            }else{
                return new SysResult(0, "当前登录已失效，请重新登录");
            }
        }

        return new SysResult(0, token);
    }

    private Date getInvalidDate() {

        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DATE, 1);
        Date invalidDate = calendar.getTime();
        String formatDate = DateUtils.format(new Date(), "yyyy-MM-dd 23:59:59");
        try {
            invalidDate = DateUtils.parseDate(formatDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return invalidDate;
    }
}
