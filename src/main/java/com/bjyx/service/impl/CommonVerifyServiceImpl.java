package com.bjyx.service.impl;

import com.bjyx.entity.po.TbOrderOriginalInfo;
import com.bjyx.entity.po.TbPriceInfo;
import com.bjyx.entity.po.TbUserInfo;
import com.bjyx.enums.EnumPriceCode;
import com.bjyx.mapper.TbPriceInfoMapper;
import com.bjyx.mapper.TbSortingInfoMapper;
import com.bjyx.mapper.TbUserInfoMapper;
import com.bjyx.service.CommonVerifyService;
import com.bjyx.service.SortingMatchingService;
import com.bjyx.utils.CommomUtils;
import com.bjyx.utils.SysResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * @author GuoRJ
 * @date 2020/7/4 13:29
 */
@Service
public class CommonVerifyServiceImpl implements CommonVerifyService {
    private static final Logger logger = LoggerFactory.getLogger(CommonVerifyServiceImpl.class);

    @Autowired(required = false)
    private TbUserInfoMapper tbUserInfoMapper;

    @Autowired(required = false)
    private TbPriceInfoMapper tbPriceInfoMapper;

    @Autowired(required = false)
    private TbSortingInfoMapper tbSortingInfoMapper;

    @Autowired(required = false)
    private SortingMatchingService sortingMatchingService;

    @Value("${currentVersion}")
    private String currentVersion;

    @Value("${baseDir}")
    private String baseDir;

    @Override
    public SysResult verifyUser(String token, String version,String menu){

        if (!CommomUtils.isValidVersion(version,currentVersion)) {
            logger.info("token为{}当前版本为:{}", token, version);
            return new SysResult(0, "请升级app版本");
        }
        //校验登录方式
        TbUserInfo tbUserInfo = tbUserInfoMapper.selectByToken(token);
        if (tbUserInfo != null) {
            if (tbUserInfo.getStatus() == 0) {

                return new SysResult(0, "本用户已失效，请联系管理员");
            }

            Date invalidDate = tbUserInfo.getInvalidDate();
            if (invalidDate != null && new Date().getTime() <= invalidDate.getTime()) {
                TbPriceInfo tbPriceInfo = tbPriceInfoMapper.selectPriceByUserId(tbUserInfo.getId(), EnumPriceCode.APP_PRICE.getCode(), Integer.valueOf(menu));
                Double remainingSum = tbUserInfo.getRemainingSum() == null ? 0.00 : tbUserInfo.getRemainingSum();
                if (remainingSum <= 0) {
                    return new SysResult(2, "账户余额为0，请联系管理员充值", token, remainingSum);
                }
                if (tbPriceInfo == null) {
                    return new SysResult(2, "请先联系管理员，先配置该用户单价", token, remainingSum);
                }
                Double pcPrice = tbPriceInfo.getPrice() == null ? 0.0 : tbPriceInfo.getPrice();

                if (pcPrice > remainingSum) {
                    return new SysResult(2, "当前余额不够支付本次消费金额，请联系管理员充值", token, remainingSum);
                }
                return new SysResult(1,"登录成功", token);
            }
        }
        return new SysResult(0, "当前登录已失效，请重新登录");
    }

    @Override
    public SysResult verifyAppUser(String token) {

        if (!CommomUtils.isValidVersion(CommomUtils.getAppVersion(),currentVersion)) {
            logger.info("token为{}当前版本为:{}", token, CommomUtils.getAppVersion());
            return new SysResult(0, "请升级app版本");
        }
        //校验登录方式
        TbUserInfo tbUserInfo = tbUserInfoMapper.selectByToken(token);
        TbOrderOriginalInfo tbOrderOriginalInfo = new TbOrderOriginalInfo();
        if (tbUserInfo == null) {
            return new SysResult(0, "用户不存在");
        }
        if (tbUserInfo.getStatus() == 0) {
            return new SysResult(0, "本用户已失效，请联系管理员");
        }

        return new SysResult(1, "用户状态正常");
    }

    @Override
    public SysResult verifyAppUserBalance(TbUserInfo userInfo, String token, String meunu) {

        Date invalidDate = userInfo.getInvalidDate();

        if (invalidDate==null || (invalidDate != null && new Date().getTime() > invalidDate.getTime())) {
            return new SysResult(0, "当前登录已失效，请重新登录");
        }

        TbPriceInfo tbPriceInfo = tbPriceInfoMapper.selectPriceByUserId(userInfo.getId(), EnumPriceCode.APP_PRICE.getCode(),Integer.valueOf(meunu));

        Double remainingSum = userInfo.getRemainingSum() == null ? 0.00 : userInfo.getRemainingSum();

        Double pcPrice = tbPriceInfo.getPrice() == null ? 0.0 : tbPriceInfo.getPrice();

        if (pcPrice > remainingSum) {
            return new SysResult(2, "当前余额不够支付本次消费金额，请联系管理员充值",token, remainingSum);
        }
        return new SysResult(1, "用户状态正常");
    }

    @Override
    public SysResult AppUserCost(TbUserInfo userInfo, String meunu) {
        TbPriceInfo tbPriceInfo = tbPriceInfoMapper.selectPriceByUserId(userInfo.getId(), EnumPriceCode.APP_PRICE.getCode(),Integer.valueOf(meunu));

        Double remainingSum = userInfo.getRemainingSum() == null ? 0.00 : userInfo.getRemainingSum();

        Double pcPrice = tbPriceInfo.getPrice() == null ? 0.0 : tbPriceInfo.getPrice();
        //更新余额
        Double remainingSumAfter = remainingSum - pcPrice;
        userInfo.setRemainingSum(remainingSumAfter);

        tbUserInfoMapper.updateRemainingSumByPrimaryKey(userInfo);

        return new SysResult(1, "扣费成功");
    }

}
