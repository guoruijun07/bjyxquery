package com.bjyx.controller;

import com.bjyx.common.Constants;
import com.bjyx.entity.bo.User;
import com.bjyx.entity.po.TbUserInfo;
import com.bjyx.mapper.TbUserInfoMapper;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
                        Map<String,Object> map, HttpSession session,Model model){

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
            session.setAttribute("remainingSum", tbUserInfo.getRemainingSum());

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

//    @RequestMapping("/login")
    public String login(User user) {
        //添加用户认证信息
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken usernamePasswordToken = new UsernamePasswordToken(
                user.getUserName(),
                user.getPassword()
        );
        try {
            //进行验证，这里可以捕获异常，然后返回对应信息
            subject.login(usernamePasswordToken);
//            subject.checkRole("admin");
//            subject.checkPermissions("query", "add");
        } catch (AuthenticationException e) {
            e.printStackTrace();
            return "账号或密码错误！";
        } catch (AuthorizationException e) {
            e.printStackTrace();
            return "没有权限";
        }
        return "login success";
    }
    //注解验角色和权限
    @RequiresRoles("admin")
    @RequiresPermissions("add")
    @RequestMapping("/index")
    public String index() {
        return "index!";
    }

}
