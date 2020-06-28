package com.bjyx.filter;

import org.apache.shiro.authz.AuthorizationException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author GuoRJ
 * @date 2020/6/28 13:46
 */
//@ControllerAdvice
//@Slf4j
public class MyExceptionHandler {
    private final Logger logger = LoggerFactory.getLogger(MyExceptionHandler.class);
    @ExceptionHandler
    @ResponseBody
    public String ErrorHandler(AuthorizationException e) {
        logger.error("没有通过权限验证！", e);
        return "没有通过权限验证！";
    }
}
