package com.bjyx.controller;

import com.bjyx.common.Constants;
import com.bjyx.entity.TbUserInfo;
import com.bjyx.mapper.TbExportInfoMapper;
import com.bjyx.mapper.TbUserInfoMapper;
import com.bjyx.utils.SysResult;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
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

    @RequestMapping("/")
    public String login(Model model) {
        model.addAttribute("userInfo", new TbUserInfo());
        return "login";
    }

    @PostMapping("/pcLogin")
    public String pcLogin(TbUserInfo tbUserInfo, Model model,HttpSession session) {

        //校验登录方式
        String username = tbUserInfo.getUsername();
        String password = tbUserInfo.getPassword();
        String realName = tbUserInfo.getRealName();
//        String mac = tbUserInfo.getMac();
        String mac = "11";
        //判断是PC登录还是手机登录
        boolean pcLogin = StringUtils.isNotBlank(username) && StringUtils.isNotBlank(password) && StringUtils.isNotBlank(mac);

        if (pcLogin) {
            tbUserInfo = tbuserInfoMapper.selectByUserInfo(tbUserInfo);
            if (tbUserInfo == null) {
                return "redirect:/";
            }
            tbUserInfo.setRemainingSum(tbUserInfo.getRemainingSum()==null?0.0:tbUserInfo.getRemainingSum());
//            List<TbExportInfo> tbExportInfos = tbExportInfoMapper.selectByUserId(tbUserInfo.getId());
//            model.addAttribute("exportInfos", tbExportInfos);
            // 设置session
            session.setAttribute(Constants.SESSION_KEY, tbUserInfo);

            return "forward:/getList?id="+tbUserInfo.getId();
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
        if(mobileLogin) {
            return new SysResult(0, token);
        }
        TbUserInfo  tbUserInfoTmp = tbuserInfoMapper.selectByMobile(tbUserInfo);
        if (tbUserInfoTmp == null) {
            return new SysResult(0, "此手机号没有授权,请联系管理员授权");
        }

        if(StringUtils.isBlank(tbUserInfoTmp.getImei())){
            //把串码录入库里
            tbUserInfo.setId(tbUserInfoTmp.getId());
            token = UUID.randomUUID().toString();
            //把token存入库里
            Calendar calendar = Calendar.getInstance();
            calendar.add(Calendar.YEAR, 1);
            Date invalidDate = calendar.getTime();
            tbUserInfo.setToken(token);
            tbUserInfo.setInvalidDate(invalidDate);
            tbuserInfoMapper.updateTokenByPrimaryKey(tbUserInfo);
            return new SysResult(1, token);

        }else{
            //手机登录
            tbUserInfo = tbuserInfoMapper.selectByMobileAndIMEI(tbUserInfo);
            if (tbUserInfo != null) {
                return new SysResult(1, tbUserInfo.getToken());
            }else{
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
                return new SysResult(1, token);
            }
        }

        return new SysResult(0, token);
    }
}
