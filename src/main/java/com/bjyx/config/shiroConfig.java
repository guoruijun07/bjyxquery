package com.bjyx.config;

import com.bjyx.mapper.SysPermissionsMapper;
import com.bjyx.shiro.CustomRealm;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @author GuoRJ
 * @date 2020/6/28 13:45
 */
@Configuration
public class shiroConfig {

    @Autowired
    private SysPermissionsMapper sysPermissionsMapper;

    @Bean
    @ConditionalOnMissingBean
    public DefaultAdvisorAutoProxyCreator defaultAdvisorAutoProxyCreator() {
        DefaultAdvisorAutoProxyCreator defaultAAP = new DefaultAdvisorAutoProxyCreator();
        defaultAAP.setProxyTargetClass(true);
        return defaultAAP;
    }

    //将自己的验证方式加入容器
    @Bean(name = "customRealm")
    public CustomRealm myShiroRealm() {
        CustomRealm customRealm = new CustomRealm();
        return customRealm;
    }

    //权限管理，配置主要是Realm的管理认证
    @Bean(name = "securityManager")
    public SecurityManager securityManager(@Qualifier("customRealm") CustomRealm customRealm) {
        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        securityManager.setRealm(customRealm);
        return securityManager;
    }

    //Filter工厂，设置对应的过滤条件和跳转条件
    @Bean
    public ShiroFilterFactoryBean shiroFilterFactoryBean(@Qualifier("securityManager") SecurityManager securityManager) {
        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
        shiroFilterFactoryBean.setSecurityManager(securityManager);
        //添加shiro内置过滤器
        /**
         * shiro内置过滤器，可以实现权限相关的拦截器
         * 常见的过滤器:
         *     anon：无需认证（登录）可以访问
         *     authc: 必须登录认证才可以访问
         *     user: 如果使用remember的功能可以直接访问
         *     perms: 该资源必须得到资源权限才可以访问
         *     role: 该资源必须得到角色权限才可以访问
         */
        Map<String, String> filterMap = new LinkedHashMap<String, String>();
        ;
        //登出
        filterMap.put("/logout", "logout");
        //对所有用户认证
        filterMap.put("/static/**", "anon");
        filterMap.put("/webjars/**", "anon");
        filterMap.put("/asserts/js/**", "anon");
        filterMap.put("/asserts/css/**", "anon");
        filterMap.put("/asserts/img/**", "anon");

        filterMap.put("/login", "anon");
        filterMap.put("/toLogin", "anon");
        filterMap.put("/dashboard", "anon");
        filterMap.put("/binding", "anon");
        filterMap.put("/removeBinding", "anon");
        filterMap.put("/queryBinding", "anon");
        filterMap.put("/appLogin", "anon");
        filterMap.put("/queryBinding", "anon");
        filterMap.put("/appLogin", "anon");
        filterMap.put("/checkToken", "anon");
        filterMap.put("/queryWaybillNo", "anon");
        filterMap.put("/baseInfoDownload", "anon");
        filterMap.put("/querySortingInfo", "anon");

        //自定义加载权限资源关系
//        List<SysPermissions> sysPermissions = sysPermissionsMapper.selectALL();
//        for (SysPermissions sysPermission : sysPermissions) {
//            if (StringUtils.isNotEmpty(sysPermission.getPerms())) {
//                String permimison = "perms[" + sysPermission.getPerms() + "]";
//                filterMap.put(sysPermission.getUrl(), permimison);
//            }
//        }

        filterMap.put("/sorting/getList","perms[sorting:getList]");
        filterMap.put("/sorting/upload","perms[sorting:upload]");
        filterMap.put("/sorting/download","perms[sorting:download]");

        filterMap.put("/address/getList","perms[address:getList]");
        filterMap.put("/address/matchingBatchNo","perms[address:matchingBatchNo]");
        filterMap.put("/address/uploadOrderOriginal","perms[address:uploadOrderOriginal]");
        filterMap.put("/address/download","perms[address:download]");

        filterMap.put("/**", "authc");

        //登录
        shiroFilterFactoryBean.setLoginUrl("/");
        //首页
        shiroFilterFactoryBean.setSuccessUrl("/index");
        //错误页面，认证不通过跳转
        shiroFilterFactoryBean.setUnauthorizedUrl("/nopermission");
        shiroFilterFactoryBean.setFilterChainDefinitionMap(filterMap);
        return shiroFilterFactoryBean;
    }

    @Bean
    public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(@Qualifier("securityManager") SecurityManager securityManager) {
        AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor = new AuthorizationAttributeSourceAdvisor();
        authorizationAttributeSourceAdvisor.setSecurityManager(securityManager);
        return authorizationAttributeSourceAdvisor;
    }
}
