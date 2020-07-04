package com.bjyx.service;

import com.bjyx.utils.SysResult;

/**
 * @author GuoRJ
 * @date 2020/7/2 12:45
 * 判断用户是否失效，是否有余额
 */
public interface CommonVerifyService {
    SysResult verifyUser(String token, String version,String menu);
}
