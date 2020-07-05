package com.bjyx.shiro;

import com.bjyx.common.Constants;
import com.bjyx.entity.bo.UserInfoBO;
import com.bjyx.entity.po.SysPermissions;
import com.bjyx.entity.po.TbUserInfo;
import com.bjyx.mapper.TbUserInfoMapper;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author GuoRJ
 * @date 2020/6/28 13:46
 */
public class CustomRealm extends AuthorizingRealm {

    @Autowired(required = false)
    private TbUserInfoMapper userInfoMapper;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        //添加角色和权限
        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();

        //获取登录用户名
        TbUserInfo user = (TbUserInfo) principalCollection.getPrimaryPrincipal();

//        for (Role role : user.getRoles()) {
//            //添加角色
//            simpleAuthorizationInfo.addRole(role.getRoleName());
//            //添加权限
//            for (Permissions permissions : role.getPermissions()) {
//                simpleAuthorizationInfo.addStringPermission(permissions.getPermissionsName());
//            }
//        }
        UserInfoBO userInfoBO = userInfoMapper.selectById(user.getId());

        simpleAuthorizationInfo.addRole(userInfoBO.getSysRole().getName());
        List<SysPermissions> permms = userInfoBO.getPermms();

        //添加权限
        for (SysPermissions permissions : permms) {
            simpleAuthorizationInfo.addStringPermission(permissions.getPerms());
        }

        return simpleAuthorizationInfo;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        //加这一步的目的是在Post请求的时候会先进认证，然后在到请求
        if (authenticationToken.getPrincipal() == null) {
            return null;
        }
        //获取用户信息
        String name = authenticationToken.getPrincipal().toString();
//        User user = loginService.getUserByName(name);
        TbUserInfo user = userInfoMapper.selectByUserName(name);

        if (user == null) {
            //这里返回后会报出对应异常
            return null;
        } else {
            //这里验证authenticationToken和simpleAuthenticationInfo的信息
            Session session = SecurityUtils.getSubject().getSession();
            session.setAttribute(Constants.SESSION_KEY, user);
            SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(user, user.getPassword(), getName());
            return simpleAuthenticationInfo;
        }
    }
}
