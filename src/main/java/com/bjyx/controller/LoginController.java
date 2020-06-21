package com.bjyx.controller;

import com.bjyx.common.Constants;
import com.bjyx.entity.po.TbUserInfo;
import com.bjyx.mapper.TbUserInfoMapper;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
public class LoginController {
    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    @Autowired(required = false)
    private TbUserInfoMapper tbuserInfoMapper;

    @PostMapping(value = "/user/login")
    public String login(@RequestParam("username") String username,
                        @RequestParam("password") String password,
                        Map<String,Object> map, HttpSession session){

        String mac = "11";
        //判断是PC登录还是手机登录
        boolean pcLogin = StringUtils.isNotBlank(username) && StringUtils.isNotBlank(password) && StringUtils.isNotBlank(mac);
        TbUserInfo tbUserInfo = new TbUserInfo();
        tbUserInfo.setUsername(username);
        tbUserInfo.setPassword(password);
        if (pcLogin) {
            tbUserInfo = tbuserInfoMapper.selectByUserInfo(tbUserInfo);
            if (tbUserInfo == null) {
                map.put("msg","用户名或密码错误");
                return "login";
            }
            tbUserInfo.setRemainingSum(tbUserInfo.getRemainingSum() == null ? 0.0 : tbUserInfo.getRemainingSum());
            // 设置session
            session.setAttribute(Constants.SESSION_KEY, tbUserInfo);
            logger.info("==用户 PC登录:{}成功!", tbUserInfo.toString());
            return "redirect:/main.html";
        } else {
            map.put("msg","用户名或密码错误");
            return "login";
        }
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
//            return "index";
            return "forward:/getSortingOrderList?id=" + tbUserInfo.getId();
        } else {
            return "redirect:/";
        }
    }
}
