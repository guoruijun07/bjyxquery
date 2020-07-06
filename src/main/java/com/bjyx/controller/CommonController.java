package com.bjyx.controller;

import com.bjyx.utils.SysResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author GuoRJ
 * @date 2020/7/6 15:11
 */
@Controller
public class CommonController {

    @RequestMapping("/nopermission")
    @ResponseBody
    public SysResult error() {

        return new SysResult(0, "您没有权限操作！");
    }
}
