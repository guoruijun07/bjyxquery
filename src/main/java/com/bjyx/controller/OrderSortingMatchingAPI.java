package com.bjyx.controller;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.util.DateUtils;
import com.bjyx.common.Constants;
import com.bjyx.entity.bo.OrderOriginalBO;
import com.bjyx.entity.po.TbOrderOriginalInfo;
import com.bjyx.entity.po.TbUserInfo;
import com.bjyx.listener.OrderOriginalListener;
import com.bjyx.mapper.TbOrderOriginalInfoMapper;
import com.bjyx.mapper.TbUserInfoMapper;
import com.bjyx.utils.SysResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

@Controller
public class OrderSortingMatchingAPI {

    private static final Logger logger = LoggerFactory.getLogger(OrderSortingMatchingAPI.class);
    @Value("${currentVersion}")
    private String currentVersion;

    @Autowired(required = false)
    private TbUserInfoMapper tbuserInfoMapper;

    @Autowired(required = false)
    private TbOrderOriginalInfoMapper tbOrderOriginalInfoMapper;

    /**
     * excel文件的上传
     */
    @PostMapping("uploadOrderOriginal")
    @ResponseBody
    public SysResult upload(MultipartFile file, HttpSession session) throws IOException {
        Long startTime = System.currentTimeMillis();
        TbUserInfo tbUserInfo = (TbUserInfo) session.getAttribute(Constants.SESSION_KEY);

        List<OrderOriginalBO> orderOriginalBOList = new ArrayList<>();
        // 这里 需要指定读用哪个class去读，然后读取第一个sheet 文件流会自动关闭
        EasyExcel.read(file.getInputStream(), OrderOriginalBO.class, new OrderOriginalListener(orderOriginalBOList)).sheet().doRead();
        int totalNum = orderOriginalBOList.size();
        //生成批次号
        //生成批次号
        List<TbOrderOriginalInfo> tbOrderOriginalInfoList = new ArrayList<>();
        String batchNo = getBatchNo();
        for (OrderOriginalBO orderOriginalBO : orderOriginalBOList) {
            TbOrderOriginalInfo tbOrderOriginalInfo = new TbOrderOriginalInfo();
            BeanUtils.copyProperties(orderOriginalBO,tbOrderOriginalInfo);
            tbOrderOriginalInfo.setBatchNo(batchNo);
            tbOrderOriginalInfo.setOrderNo(getOrderNo());
            tbOrderOriginalInfo.setOperationNo(tbUserInfo.getId().toString());
            tbOrderOriginalInfo.setOperationName(tbUserInfo.getRealName());
            tbOrderOriginalInfo.setOperationTime(new Date());
            tbOrderOriginalInfo.setCityWideFlag(01);
            tbOrderOriginalInfo.setSortingStatus(0);
            tbOrderOriginalInfo.setModifyTime(new Date());
            tbOrderOriginalInfo.setCreateTime(new Date());
            tbOrderOriginalInfoList.add(tbOrderOriginalInfo);
        }

        //批量入库
        tbOrderOriginalInfoMapper.batchInsert(tbOrderOriginalInfoList);
        return new SysResult(1, batchNo+","+tbOrderOriginalInfoList.size());
    }

    @PostMapping("/querySortingInfo")
    @ResponseBody
    public SysResult querySortingInfo(OrderOriginalBO orderOriginal,String token,String version) {
        logger.info("app 校验token:{}", token);
        if (!currentVersion.equals(version)) {
            logger.info("token为{}当前版本为:{}", token, version);
            return new SysResult(0, "请升级app版本");
        }
        //校验登录方式
        TbUserInfo tbUserInfo = tbuserInfoMapper.selectByToken(token);

        if (tbUserInfo != null) {
            if (tbUserInfo.getStatus() == 0) {
                return new SysResult(0, "本用户已失效，请联系管理员");
            }

            Date invalidDate = tbUserInfo.getInvalidDate();

            if (invalidDate != null && new Date().getTime() <= invalidDate.getTime()) {
                logger.info("==用户 APP 登录:{} 成功!", tbUserInfo.toString());
                return new SysResult(1, "登录成功",token, tbUserInfo.getRemainingSum() == null ? 0.00 : tbUserInfo.getRemainingSum());
            } else {
                return new SysResult(0, "当前登录已失效，请重新登录");
            }
        }

        return new SysResult(0,"登录失败，请重新登录");
    }

    //获取批次号
    private String getBatchNo() {

        return DateUtils.format(new Date(), DateUtils.DATE_FORMAT_14) + System.currentTimeMillis();
    }

    //获取订单号
    private String getOrderNo() {
        Random random=new Random();
        int number=random.nextInt(90)+10;
        return DateUtils.format(new Date(), DateUtils.DATE_FORMAT_14) + System.currentTimeMillis()+number;
    }
}
