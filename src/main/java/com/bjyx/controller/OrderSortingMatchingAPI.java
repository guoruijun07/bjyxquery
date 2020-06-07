package com.bjyx.controller;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.util.DateUtils;
import com.bjyx.common.Constants;
import com.bjyx.entity.bo.OrderOriginalBO;
import com.bjyx.entity.po.TbOrderOriginalInfo;
import com.bjyx.entity.po.TbUserInfo;
import com.bjyx.listener.OrderOriginalListener;
import com.bjyx.mapper.TbOrderOriginalInfoMapper;
import com.bjyx.utils.SysResult;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class OrderSortingMatchingAPI {

    @Autowired(required = false)
    private TbOrderOriginalInfoMapper tbOrderOriginalInfoMapper;

    /**
     * excel文件的上传
     */
    @PostMapping("uploadOrderOriginal")
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
            tbOrderOriginalInfo.setModifyTime(new Date());
            tbOrderOriginalInfo.setCreateTime(new Date());
            tbOrderOriginalInfoList.add(tbOrderOriginalInfo);
        }

        //批量入库
        tbOrderOriginalInfoMapper.batchInsert(tbOrderOriginalInfoList);
        return new SysResult(1, batchNo+","+tbOrderOriginalInfoList.size());
    }

    //获取批次号
    private String getBatchNo() {

        return DateUtils.format(new Date(), DateUtils.DATE_FORMAT_14) + System.currentTimeMillis();
    }

    //获取订单号
    private String getOrderNo() {

        return DateUtils.format(new Date(), DateUtils.DATE_FORMAT_14) + System.currentTimeMillis();
    }
}
