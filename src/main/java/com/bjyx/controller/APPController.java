package com.bjyx.controller;

import com.alibaba.csb.sdk.HttpCallerException;
import com.alibaba.fastjson.JSON;
import com.bjyx.entity.bo.OrderOriginalBO;
import com.bjyx.entity.po.*;
import com.bjyx.entity.vo.TbUserInfoVO;
import com.bjyx.enums.EnumPriceCode;
import com.bjyx.mapper.TbPriceInfoMapper;
import com.bjyx.mapper.TbSortingInfoMapper;
import com.bjyx.mapper.TbUserInfoMapper;
import com.bjyx.service.SortingMatchingService;
import com.bjyx.utils.CommomUtils;
import com.bjyx.utils.SysResult;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
public class APPController {
    private static final Logger logger = LoggerFactory.getLogger(APPController.class);

    @Autowired(required = false)
    private TbUserInfoMapper tbUserInfoMapper;

    @Autowired(required = false)
    private TbPriceInfoMapper tbPriceInfoMapper;

    @Autowired(required = false)
    private TbSortingInfoMapper tbSortingInfoMapper;

    @Autowired(required = false)
    private SortingMatchingService sortingMatchingService;

    DecimalFormat df = new DecimalFormat("#.00");

    @Value("${currentVersion}")
    private String currentVersion;

    @Value("${baseDir}")
    private String baseDir;

    @PostMapping("/appLogin")
    @ResponseBody
    public SysResult Applogin(TbUserInfoVO tbUserInfoVO) {
        logger.info("app 被调取到:{}", tbUserInfoVO.toString());
        //校验登录方式
        String version = tbUserInfoVO.getVersion();
        String token = "";

        if (!CommomUtils.isValidVersion(version,currentVersion)) {
            logger.info("手机号为{}当前版本为:{}", tbUserInfoVO.getVersion(), tbUserInfoVO.getMobile());
            return new SysResult(0, "请升级app版本");
        }

        TbUserInfo tbUserInfo = new TbUserInfo();
        tbUserInfo.setMobile(tbUserInfoVO.getMobile());
        tbUserInfo.setImei(tbUserInfoVO.getImei());

        TbUserInfo tbUserInfoTmp = tbUserInfoMapper.selectByMobile(tbUserInfoVO);
        if (tbUserInfoTmp == null) {
            return new SysResult(0, "此手机号没有授权,请联系管理员授权");
        }
        if (tbUserInfoTmp.getStatus() == 0) {
            return new SysResult(0, "本用户已失效，请联系管理员");
        }

        if (StringUtils.isBlank(tbUserInfoTmp.getImei())) {
            //把串码录入库里
            tbUserInfo.setId(tbUserInfoTmp.getId());
            token = UUID.randomUUID().toString();
            //把token存入库里
            tbUserInfo.setToken(token);
            tbUserInfo.setInvalidDate(CommomUtils.getInvalidDate());
            tbUserInfoMapper.updateTokenByPrimaryKey(tbUserInfo);
            logger.info("==用户 APP 登录:{} 成功!", tbUserInfo.toString());
            return new SysResult(1,"登录成功", token, tbUserInfoTmp.getRemainingSum() == null ? 0.00 : tbUserInfoTmp.getRemainingSum());

        } else {
            //手机登录
            tbUserInfo = tbUserInfoMapper.selectByMobileAndIMEI(tbUserInfoVO);
            if (tbUserInfo != null) {
                tbUserInfo.setInvalidDate(CommomUtils.getInvalidDate());
                tbUserInfoMapper.updateTokenByPrimaryKey(tbUserInfo);
                return new SysResult(1,"登录成功", tbUserInfo.getToken(), tbUserInfo.getRemainingSum() == null ? 0.00 : tbUserInfo.getRemainingSum());
            } else {
                return new SysResult(0, "此手机号已在其他设备授权");
            }
        }
    }

    @PostMapping("/checkToken")
    @ResponseBody
    public SysResult checkToken(String token, String version) {
        logger.info("app 校验token:{}", token);
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
//            String currentDateStr = DateUtils.format(new Date(), "yyyy-MM-dd 00:00:00");
//            Date currentDate =null;
//            try {
//                currentDate = DateUtils.parseDate(currentDateStr);
//            } catch (ParseException e) {
//                e.printStackTrace();
//            }

            if (invalidDate != null && new Date().getTime() <= invalidDate.getTime()) {
                logger.info("==用户 APP 登录:{} 成功!", tbUserInfo.toString());
                return new SysResult(1, "登录成功",token, tbUserInfo.getRemainingSum() == null ? 0.00 : tbUserInfo.getRemainingSum());
            } else {
                return new SysResult(0, "当前登录已失效，请重新登录");
            }
        }

        return new SysResult(0,"登录失败，请重新登录");
    }

    @PostMapping("/queryWaybillNo")
    @ResponseBody
    public SysResult queryWaybillNo(String token, String version,String menu) {

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
                TbPriceInfo tbPriceInfo = tbPriceInfoMapper.selectPriceByUserId(tbUserInfo.getId(), EnumPriceCode.APP_PRICE.getCode(),Integer.valueOf(menu));
                Double remainingSum = tbUserInfo.getRemainingSum() == null ? 0.00 : tbUserInfo.getRemainingSum();
                if (remainingSum <= 0) {
                    return new SysResult(2, "账户余额为0，请联系管理员充值",token, remainingSum);
                }
                if (tbPriceInfo == null) {
                    return new SysResult(2, "请先联系管理员，先配置该用户单价",token, remainingSum);
                }
                Double pcPrice = tbPriceInfo.getPrice() == null ? 0.0 : tbPriceInfo.getPrice();

                if (pcPrice > remainingSum) {
                    return new SysResult(2, "当前余额不够支付本次消费金额，请联系管理员充值",token, remainingSum);
                }

                //更新余额
                Double remainingSumAfter = remainingSum - pcPrice;
                String formatRemainingSum = df.format(remainingSumAfter);
                TbUserInfo tbUserInfo1 = new TbUserInfo();
                tbUserInfo1.setId(tbUserInfo.getId());
                tbUserInfo1.setRemainingSum(remainingSumAfter);

                tbUserInfoMapper.updateRemainingSumByPrimaryKey(tbUserInfo1);

                return new SysResult(1,"查询成功", token, remainingSumAfter);
            }else{
                return new SysResult(0, "当前登录已失效，请重新登录");
            }
        }

        return new SysResult(0, token);
    }


    @RequestMapping(value = "/baseInfoDownload")
    @ResponseBody
    public List<TbSortingInfo> exportBaseInfoExcel(HttpServletResponse response, HttpSession session) {

        List<TbSortingInfo> tbSortingInfos = tbSortingInfoMapper.selectAllData();
        logger.info("数据总条数:"+tbSortingInfos.size());
        for (TbSortingInfo tbSortingInfo : tbSortingInfos) {
            logger.info("数据为:"+tbSortingInfo.toString());
        }
        return tbSortingInfos;
//        OutputStream outputStream = null;
//
//        List<BaseInfoExportTemplate> list = new ArrayList<>();
//        for (TbSortingInfo tbSortingInfo : tbSortingInfos) {
//            BaseInfoExportTemplate baseInfoExportTemplate = new BaseInfoExportTemplate();
//            BeanUtils.copyProperties(tbSortingInfo,baseInfoExportTemplate);
//            list.add(baseInfoExportTemplate);
//        }
//        try{
//            String baseFileName = "基础数据_" + DateUtils.format(new Date(), "yyyyMMddHHmmss");
//            outputStream = response.getOutputStream();
//            response.setContentType("application/vnd.ms-excel");
//            response.setCharacterEncoding("utf-8");
//            String utf8fileName = URLEncoder.encode(baseFileName, "UTF-8");
//            response.setHeader("Content-disposition", "attachment;filename=" + utf8fileName + ".xlsx");
//            EasyExcel.write(outputStream, BaseInfoExportTemplate.class).sheet("基础数据").doWrite(list);
//
//        } catch (IOException e) {
//            e.printStackTrace();
//        } finally {
//            if (outputStream != null) {
//                try {
//                    outputStream.close();
//                } catch (IOException e) {
//                    e.printStackTrace();
//                }
//            }
//        }
//        return new SysResult(1, "");
    }

    @PostMapping("/querySortingInfo")
    @ResponseBody
    public SysResult querySortingInfo(OrderOriginalBO orderOriginal, String token, String version,String menu) {
        logger.info("app 校验token:{}", token);
        if (!CommomUtils.isValidVersion(version,currentVersion)) {
            logger.info("token为{}当前版本为:{}", token, version);
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

        Date invalidDate = tbUserInfo.getInvalidDate();

        if (invalidDate==null || (invalidDate != null && new Date().getTime() > invalidDate.getTime())) {
            return new SysResult(0, "当前登录已失效，请重新登录");
        }


        TbPriceInfo tbPriceInfo = tbPriceInfoMapper.selectPriceByUserId(tbUserInfo.getId(), EnumPriceCode.APP_PRICE.getCode(),Integer.valueOf(menu));

        Double remainingSum = tbUserInfo.getRemainingSum() == null ? 0.00 : tbUserInfo.getRemainingSum();

        Double pcPrice = tbPriceInfo.getPrice() == null ? 0.0 : tbPriceInfo.getPrice();

        if (pcPrice > remainingSum) {
            return new SysResult(2, "当前余额不够支付本次消费金额，请联系管理员充值",token, remainingSum);
        }


        BeanUtils.copyProperties(orderOriginal,tbOrderOriginalInfo);
        tbOrderOriginalInfo.setOrderNo(CommomUtils.getOrderNo());
        try {
            TbSortingMatchingInfo tbSortingMatchingInfo = sortingMatchingService.sortingMatchingByApp(tbOrderOriginalInfo);
            Double remainingSumAfter = remainingSum;
           if(!tbSortingMatchingInfo.getSortingName().contains("*")) {
               //更新余额
               remainingSumAfter = remainingSum - pcPrice;
               TbUserInfo tbUserInfo1 = new TbUserInfo();
               tbUserInfo1.setId(tbUserInfo.getId());
               tbUserInfo1.setRemainingSum(remainingSumAfter);

               tbUserInfoMapper.updateRemainingSumByPrimaryKey(tbUserInfo1);
           }

            return new SysResult(1,"查询成功", token, remainingSumAfter, JSON.toJSONString(tbSortingMatchingInfo));

        } catch (HttpCallerException e) {
            e.printStackTrace();
        }
        return new SysResult(0,"匹配失败，请重新匹配");
    }

}
