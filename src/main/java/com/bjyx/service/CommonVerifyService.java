package com.bjyx.service;

import com.bjyx.entity.po.TbUserInfo;
import com.bjyx.utils.SysResult;

/**
 * @author GuoRJ
 * @date 2020/7/2 12:45
 * 判断用户是否失效，是否有余额
 */
public interface CommonVerifyService {
    SysResult verifyUser(String token, String version,String menu);

    /**
     * 根据token校验用户
     * @param token
     * @return
     */
    SysResult verifyAppUser(String token);

    /**
     * 校验用户余额
     * @param userInfo
     * @param token
     * @param meunu
     * @return
     */
    SysResult verifyAppUserBalance(TbUserInfo userInfo,String token, String meunu);
    /**
     * 扣费服务
     * @param userInfo
     * @param meunu
     * @return
     */

    SysResult AppUserCost(TbUserInfo userInfo, String meunu);
}
