package com.bjyx.controller;

import com.alibaba.excel.util.DateUtils;
import com.bjyx.common.Constants;
import com.bjyx.entity.po.TbPriceInfo;
import com.bjyx.entity.po.TbUserInfo;
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

    @Value("${version}")
    private String version;

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

    @PostMapping("/appLogin")
    @ResponseBody
    public SysResult Applogin(TbUserInfo tbUserInfo) {
        logger.info("app 被调取到:{}", tbUserInfo.toString());
        //校验登录方式
        String mobile = tbUserInfo.getMobile();
        String imei = tbUserInfo.getImei();
        String token = "";
        boolean mobileLogin = StringUtils.isBlank(mobile) || StringUtils.isBlank(imei);
        //如果第一次登陆，库里imei是空
        if (mobileLogin) {
            return new SysResult(0, token);
        }
        TbUserInfo tbUserInfoTmp = tbuserInfoMapper.selectByMobile(tbUserInfo);
        if (tbUserInfoTmp == null) {
            return new SysResult(0, "此手机号没有授权,请联系管理员授权");
        }

        if (StringUtils.isBlank(tbUserInfoTmp.getImei())) {
            //把串码录入库里
            tbUserInfo.setId(tbUserInfoTmp.getId());
            token = UUID.randomUUID().toString();
            //把token存入库里
            Calendar calendar = Calendar.getInstance();
            calendar.add(Calendar.DATE, 1);
            Date invalidDate = calendar.getTime();
            String formatDate = DateUtils.format(invalidDate, "yyyy-MM-dd 00:00:00");
            try {
                invalidDate = DateUtils.parseDate(formatDate);
            } catch (ParseException e) {
                e.printStackTrace();
            }

            tbUserInfo.setToken(token);
            tbUserInfo.setInvalidDate(invalidDate);
            tbuserInfoMapper.updateTokenByPrimaryKey(tbUserInfo);
            logger.info("==用户 APP 登录:{} 成功!", tbUserInfo.toString());
            return new SysResult(1, token, tbUserInfo.getRemainingSum() == null ? 0.00 : tbUserInfo.getRemainingSum(), "");

        } else {
            //手机登录
            tbUserInfo = tbuserInfoMapper.selectByMobileAndIMEI(tbUserInfo);
            if (tbUserInfo != null) {
                return new SysResult(1, tbUserInfo.getToken(), tbUserInfo.getRemainingSum() == null ? 0.00 : tbUserInfo.getRemainingSum(), "");
            } else {
                return new SysResult(0, "此手机号已在其他设备授权");
            }
        }
    }

    @PostMapping("/checkToken")
    @ResponseBody
    public SysResult checkToken(String token) {
        logger.info("app 校验token:{}", token);
        //校验登录方式
        TbUserInfo tbUserInfo = tbuserInfoMapper.selectByToken(token);

        if (tbUserInfo != null) {
            Date invalidDate = tbUserInfo.getInvalidDate();
            if (invalidDate != null && new Date().getTime() < invalidDate.getTime()) {
                logger.info("==用户 APP 登录:{} 成功!", tbUserInfo.toString());
                return new SysResult(1, token, tbUserInfo.getRemainingSum() == null ? 0.00 : tbUserInfo.getRemainingSum(), "");
            } else {
                return new SysResult(0, token, 0.00, "登录已失效，请重新登录");
            }
        }

        return new SysResult(0, token, 0.00, "获取数据错误，请重新登录");
    }

    @PostMapping("/queryWaybillNo")
    @ResponseBody
    public SysResult queryWaybillNo(String token) {

        //校验登录方式
        TbUserInfo tbUserInfo = tbuserInfoMapper.selectByToken(token);
        if (tbUserInfo != null) {
            Date invalidDate = tbUserInfo.getInvalidDate();
            if (invalidDate != null && new Date().getTime() < invalidDate.getTime()) {
                TbPriceInfo tbPriceInfo = tbPriceInfoMapper.selectPriceByUserId(tbUserInfo.getId(), EnumPriceCode.APP_PRICE.getCode());
                Double remainingSum = tbUserInfo.getRemainingSum() == null ? 0.00 : tbUserInfo.getRemainingSum();
                if (tbPriceInfo == null) {
                    return new SysResult(0, token, remainingSum, "请先配置该用户单价");
                }
                Double pcPrice = tbPriceInfo.getPrice() == null ? 0.0 : tbPriceInfo.getPrice();

                if (pcPrice > remainingSum) {
                    return new SysResult(0, token, remainingSum, "余额不足，请联系管理员充值");
                }

                //更新余额
                Double remainingSumAfter = remainingSum - pcPrice;
                String formatRemainingSum = df.format(remainingSumAfter);
                TbUserInfo tbUserInfo1 = new TbUserInfo();
                tbUserInfo1.setId(tbUserInfo.getId());
                tbUserInfo1.setRemainingSum(remainingSumAfter);

                tbuserInfoMapper.updateRemainingSumByPrimaryKey(tbUserInfo1);

                return new SysResult(1, token, remainingSumAfter, null);
            }
        }

        return new SysResult(0, token);
    }

}
