package com.bjyx.controller;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.util.DateUtils;
import com.bjyx.common.Constants;
import com.bjyx.entity.bo.OrderOriginalBO;
import com.bjyx.entity.po.TbOrderBatchInfo;
import com.bjyx.entity.po.TbOrderOriginalInfo;
import com.bjyx.entity.po.TbUserInfo;
import com.bjyx.listener.OrderOriginalListener;
import com.bjyx.mapper.TbOrderBatchInfoMapper;
import com.bjyx.mapper.TbOrderOriginalInfoMapper;
import com.bjyx.mapper.TbUserInfoMapper;
import com.bjyx.utils.SysResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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

    @Autowired(required = false)
    private TbOrderBatchInfoMapper tbOrderBatchInfoMapper;

    Random random=new Random();

    @RequestMapping("/getSortingOrderList")
    public String getSortingOrderList(HttpSession session, Model model, Integer pageNum) {

        TbUserInfo tbUserInfo= (TbUserInfo) session.getAttribute(Constants.SESSION_KEY);
        tbUserInfo = tbuserInfoMapper.selectByPrimaryKey(tbUserInfo.getId());
        model.addAttribute("remainingSum",tbUserInfo.getRemainingSum());
        System.out.println("当前页为："+pageNum);
        pageNum = pageNum==null?1:pageNum;
        PageHelper.startPage(pageNum,10,"create_time desc");
        List<TbOrderBatchInfo> tbOrderBatchInfos = tbOrderBatchInfoMapper.selectByUserId(tbUserInfo.getId());
        PageInfo<TbOrderBatchInfo> page = new PageInfo<>(tbOrderBatchInfos);
        System.out.println("总记录条数为："+page.getTotal());
        model.addAttribute("page",page);

        return "orderInfo";
    }


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
        String batchNo = getBatchNo();
        TbOrderBatchInfo tbOrderBatchInfo = new TbOrderBatchInfo();
        tbOrderBatchInfo.setBatchNo(batchNo);
        tbOrderBatchInfo.setStatus(0);
        tbOrderBatchInfo.setTotalNum(totalNum);
        tbOrderBatchInfo.setUserId(tbUserInfo.getId());
        tbOrderBatchInfo.setModifyTime(new Date());
        tbOrderBatchInfo.setCreateTime(new Date());
        tbOrderBatchInfoMapper.insert(tbOrderBatchInfo);
        int batchId = tbOrderBatchInfo.getId();
        //生成批次号
        List<TbOrderOriginalInfo> tbOrderOriginalInfoList = new ArrayList<>();

        for (OrderOriginalBO orderOriginalBO : orderOriginalBOList) {
            TbOrderOriginalInfo tbOrderOriginalInfo = new TbOrderOriginalInfo();
            BeanUtils.copyProperties(orderOriginalBO,tbOrderOriginalInfo);
            tbOrderOriginalInfo.setBatchNo(batchNo);
            tbOrderOriginalInfo.setOrderNo(getOrderNo());
            tbOrderOriginalInfo.setOperationNo(tbUserInfo.getId().toString());
            tbOrderOriginalInfo.setOperationName(tbUserInfo.getRealName());
            tbOrderOriginalInfo.setOperationTime(new Date());
            tbOrderOriginalInfo.setCityWideFlag(1); //同城标识（1同城，0外阜）
            tbOrderOriginalInfo.setSortingStatus(0);
            tbOrderOriginalInfo.setModifyTime(new Date());
            tbOrderOriginalInfo.setCreateTime(new Date());
            tbOrderOriginalInfoList.add(tbOrderOriginalInfo);
        }

        //批量入库
        tbOrderOriginalInfoMapper.batchInsert(tbOrderOriginalInfoList);

        return new SysResult(1, batchNo+","+tbOrderOriginalInfoList.size());
    }

    @RequestMapping("/matchingBatchNo")
    public String matchingBatchNo(HttpSession session, Model model, String  batchNo) {

logger.info(batchNo);

        return "list";
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
//    DecimalFormat bathNoDF=new DecimalFormat("0000");//设置格式
//    DecimalFormat orderNoDF=new DecimalFormat("000000");//设置格式
//    String str=format1.format(100);//格式转换



    //获取批次号
    private String getBatchNo() {
        int number=random.nextInt(900)+1000;
        return DateUtils.format(new Date(), DateUtils.DATE_FORMAT_14) + number;
    }

    //获取订单号
    private String getOrderNo() {
        int number=random.nextInt(90000)+100000;
        return DateUtils.format(new Date(), DateUtils.DATE_FORMAT_14) +number;
    }
}
