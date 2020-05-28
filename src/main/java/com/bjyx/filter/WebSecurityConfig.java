package com.bjyx.filter;

import com.bjyx.common.Constants;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 登录配置 博客出处：http://www.cnblogs.com/GoodHelper/
 *
 *
 * “SecurityInterceptor”类继承“HandlerInterceptorAdapter”，并重新“preHandle”方法，当session为空时，则跳转到登录页面
 *
 * “WebSecurityConfig”类继承“WebMvcConfigurerAdapter”，重新“addInterceptors”方法，其目的是设置拦截规则，excludePathPatterns为需要排除的规则，addPathPatterns为需要拦截的规则。
 */
@Configuration
public class WebSecurityConfig extends WebMvcConfigurerAdapter {

    @Bean
    public SecurityInterceptor getSecurityInterceptor() {
        return new SecurityInterceptor();
    }

    public void addInterceptors(InterceptorRegistry registry) {
        InterceptorRegistration addInterceptor = registry.addInterceptor(getSecurityInterceptor());

        // 排除配置
        addInterceptor.excludePathPatterns("/");
        addInterceptor.excludePathPatterns("/pcLogin");
        addInterceptor.excludePathPatterns("/appLogin");
        addInterceptor.excludePathPatterns("/checkToken");
        addInterceptor.excludePathPatterns("/queryWaybillNo");
        addInterceptor.excludePathPatterns("/error");
        addInterceptor.excludePathPatterns("/login**");
        addInterceptor.excludePathPatterns("/static/**");
        addInterceptor.excludePathPatterns("/static/**");


        // 拦截配置
        addInterceptor.addPathPatterns("/**");

    }

    private class SecurityInterceptor extends HandlerInterceptorAdapter {

        @Override
        public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
                throws Exception {
            HttpSession session = request.getSession();
            if (session.getAttribute(Constants.SESSION_KEY) != null)
                return true;

            // 跳转登录
            String url = "/";
            response.sendRedirect(url);
            return false;
        }
    }
}