package com.bjyx.controller;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.util.DateUtils;
import com.bjyx.common.Constants;
import com.bjyx.entity.bo.OrderOriginalBO;
import com.bjyx.entity.po.*;
import com.bjyx.enums.EnumPriceCode;
import com.bjyx.listener.OrderOriginalListener;
import com.bjyx.mapper.*;
import com.bjyx.service.SortingMatchingService;
import com.bjyx.template.SortingMatchiingExportTemplate;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

@Controller
@RequestMapping("/address")
public class AddressBatchController {

    private static final Logger logger = LoggerFactory.getLogger(AddressBatchController.class);

    @Value("${currentVersion}")
    private String currentVersion;

    @Value("${baseDir}")
    private String baseDir;

    @Autowired(required = false)
    private TbUserInfoMapper tbUserInfoMapper;

    @Autowired(required = false)
    private TbPriceInfoMapper tbPriceInfoMapper;

    @Autowired(required = false)
    private TbOrderOriginalInfoMapper tbOrderOriginalInfoMapper;

    @Autowired(required = false)
    private TbSortingMatchingInfoMapper tbSortingMatchingInfoMapper;

    @Autowired(required = false)
    private TbOrderBatchInfoMapper tbOrderBatchInfoMapper;

    @Autowired(required = false)
    private SortingMatchingService sortingMatchingService;

    private  String dirPath = "/home/code"+ java.io.File.separator + "exportSorting" + java.io.File.separator;

    Random random=new Random();

    @RequestMapping("/getList")
    public String getSortingOrderList(HttpSession session, Model model, Integer pageNum) {

        TbUserInfo tbUserInfo= (TbUserInfo) session.getAttribute(Constants.SESSION_KEY);
        tbUserInfo = tbUserInfoMapper.selectByPrimaryKey(tbUserInfo.getId());
        session.setAttribute("remainingSum",tbUserInfo.getRemainingSum());
        System.out.println("当前页为："+pageNum);
        pageNum = pageNum==null?1:pageNum;
        PageHelper.startPage(pageNum,10,"create_time desc");
        List<TbOrderBatchInfo> tbOrderBatchInfos = tbOrderBatchInfoMapper.selectByUserId(tbUserInfo.getId());
        PageInfo<TbOrderBatchInfo> page = new PageInfo<>(tbOrderBatchInfos);
        System.out.println("总记录条数为："+page.getTotal());
        model.addAttribute("page",page);

        return "sorting/addresslist";
    }


    /**
     * excel文件的上传
     */
    @PostMapping("/uploadOrderOriginal")
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


//    DecimalFormat bathNoDF=new DecimalFormat("0000");//设置格式
//    DecimalFormat orderNoDF=new DecimalFormat("000000");//设置格式
//    String str=format1.format(100);//格式转换

    /**
     * 点击匹配按钮，调取实时接口匹配
     */
    @PostMapping("/matchingBatchNo")
    @ResponseBody
    public SysResult orderMatching( HttpSession session,String batchNo) throws IOException {
        Long startTime = System.currentTimeMillis();
        TbUserInfo tbUserInfo = (TbUserInfo) session.getAttribute(Constants.SESSION_KEY);

        //取出用户的余额
        TbUserInfo tbUserInfo2 = tbUserInfoMapper.selectByPrimaryKey(tbUserInfo.getId());
        Double totalSum = tbUserInfo2.getRemainingSum() == null ? 0.0 : tbUserInfo2.getRemainingSum();
        TbPriceInfo tbPriceInfo = tbPriceInfoMapper.selectPriceByUserId(tbUserInfo.getId(), EnumPriceCode.PC_PRICE.getCode(),2);
        if(tbPriceInfo ==  null){
            return new SysResult(0, "请先设置该用户pc功能单价");
        }
        Double pcPrice = tbPriceInfo.getPrice() == null ? 0.0 : tbPriceInfo.getPrice();

        //获取到总得需要匹配的条数
        List<TbOrderOriginalInfo> tbOrderOriginalInfos = tbOrderOriginalInfoMapper.selectByBatchNo(batchNo);

        int totalNum = tbOrderOriginalInfos.size();

        //如果余额不够，直接返回，不生成文件
        Double cost = totalNum * pcPrice;
//        Double cost = successNum * Double.valueOf(perMoney);
        if (cost > totalSum) {
            return new SysResult(0, "您的余额不够，请联系管理员充值");
        }

        //传入批次号，调取远程接口，根据匹配状态，生成对应文件导出
        try{
            //调取接口匹配分拣码
            sortingMatchingService.sortingMatchingInfoByPc(batchNo);

        }catch (Exception e){
            e.printStackTrace();
            return new SysResult(0, "匹配数据失败");

        }

        List<TbSortingMatchingInfo> tbSortingMatchingInfoList = tbSortingMatchingInfoMapper.selectByBatchNo(batchNo);
        Integer successMatching   = tbSortingMatchingInfoMapper.selectByCountSucessAndBatchNo(batchNo);

        //更新余额
        //如果余额不够，直接返回，不生成文件
        Double matchingCost = successMatching * pcPrice;
        Double remainingSum = totalSum - matchingCost;

        TbUserInfo tbUserInfo1 = new TbUserInfo();
        tbUserInfo1.setId(tbUserInfo.getId());
        tbUserInfo1.setRemainingSum(remainingSum);
        tbUserInfoMapper.updateRemainingSumByPrimaryKey(tbUserInfo1);

        String fileName = new String(("order" + "_" + DateUtils.format(new Date(), "yyyyMMddHHmmss") + ".xlsx").getBytes(), "UTF-8");
        try {

            File exportFile = MakeLogDir(fileName, tbUserInfo.getMobile());

            OutputStream outputStream = new FileOutputStream(exportFile);

            List<SortingMatchiingExportTemplate>  sortingMatchiingExports = new ArrayList<>();

            for (TbSortingMatchingInfo tbSortingMatchingInfo : tbSortingMatchingInfoList) {
                SortingMatchiingExportTemplate sortingMatchiingExportTemplate = new SortingMatchiingExportTemplate();
                sortingMatchiingExportTemplate.setSenderName(tbSortingMatchingInfo.getSenderName());
                sortingMatchiingExportTemplate.setSender_mobile_one(tbSortingMatchingInfo.getSenderMobileOne());
                sortingMatchiingExportTemplate.setSender_mobile_two(tbSortingMatchingInfo.getSenderMobileTwo());
                sortingMatchiingExportTemplate.setSenderProvince(tbSortingMatchingInfo.getSenderProvince());
                sortingMatchiingExportTemplate.setSenderCity(tbSortingMatchingInfo.getSenderCity());
                sortingMatchiingExportTemplate.setSenderCounty(tbSortingMatchingInfo.getSenderCounty());
                sortingMatchiingExportTemplate.setSenderAddress(tbSortingMatchingInfo.getSenderAddress());

                sortingMatchiingExportTemplate.setReciverName(tbSortingMatchingInfo.getReciverName());
                sortingMatchiingExportTemplate.setReciverMobileOne(tbSortingMatchingInfo.getReciverMobileOne());
                sortingMatchiingExportTemplate.setReciverMobileTwo(tbSortingMatchingInfo.getReciverMobileTwo());
                sortingMatchiingExportTemplate.setReciverProvince(tbSortingMatchingInfo.getReciverProvince());
                sortingMatchiingExportTemplate.setReciverCity(tbSortingMatchingInfo.getReciverCity());
                sortingMatchiingExportTemplate.setReciverCounty(tbSortingMatchingInfo.getReciverCounty());
                sortingMatchiingExportTemplate.setReciverAddress(tbSortingMatchingInfo.getReciverAddress());

                sortingMatchiingExportTemplate.setCityWideFlag(tbSortingMatchingInfo.getCityWideFlag()==1?"是":"否");
                sortingMatchiingExportTemplate.setLevelFourSortingName(tbSortingMatchingInfo.getLevelFourSortingName());
                sortingMatchiingExportTemplate.setSortingName(tbSortingMatchingInfo.getSortingName());
                sortingMatchiingExportTemplate.setMarking(tbSortingMatchingInfo.getMarking());
                sortingMatchiingExportTemplate.setDistribuCenter(tbSortingMatchingInfo.getDistribuCenter());
                sortingMatchiingExportTemplate.setDlvName(tbSortingMatchingInfo.getDlvName());
                sortingMatchiingExportTemplate.setAreaNum(tbSortingMatchingInfo.getDlvNo());
                sortingMatchiingExportTemplate.setOrgNum(tbSortingMatchingInfo.getOrgNo());
                sortingMatchiingExportTemplate.setOrgName(tbSortingMatchingInfo.getOrgName());

                sortingMatchiingExports.add(sortingMatchiingExportTemplate);
            }

            //把数据封装为对象
            EasyExcel.write(outputStream, SortingMatchiingExportTemplate.class).sheet("订单数据").doWrite(sortingMatchiingExports);


            TbOrderBatchInfo tbOrderBatchInfo = tbOrderBatchInfoMapper.selectByBatchNo(batchNo);
            tbOrderBatchInfo.setFileName(fileName);
            tbOrderBatchInfo.setTotalNum(totalNum);
            tbOrderBatchInfo.setSuccessNum(successMatching);
            tbOrderBatchInfo.setMoney(matchingCost);
            tbOrderBatchInfo.setStatus(1);
            tbOrderBatchInfo.setModifyTime(new Date());
            tbOrderBatchInfoMapper.updateByPrimaryKey(tbOrderBatchInfo);


        } catch (Exception e) {
            e.printStackTrace();
        }

        return new SysResult(1, "匹配数据成功","",remainingSum, "");
    }


    @RequestMapping(value = "/download", method = RequestMethod.GET)
    public String exportDownExcel(HttpServletResponse response, HttpSession session, String fileName) {
        logger.info("文件名为:" + fileName);
        TbUserInfo tbUserInfo = (TbUserInfo) session.getAttribute(Constants.SESSION_KEY);
        String fileNamePath = dirPath + tbUserInfo.getMobile() + java.io.File.separator + fileName;
        File file = new File(fileNamePath);
        if (file.exists()) {
            OutputStream os = null;
            FileInputStream fis = null;
            BufferedInputStream bis = null;
            try {
                response.setContentType("application/force-download");
//                response.setContentType("application/json;charset=UTF-8");
                response.setCharacterEncoding("utf-8");
                String utf8fileName = URLEncoder.encode(fileName, "UTF-8");
                response.addHeader("Content-Disposition", "attachment;fileName=" + utf8fileName);

                byte[] buffer = new byte[1024];
                fis = new FileInputStream(file);
                bis = new BufferedInputStream(fis);
                os = response.getOutputStream();

                int i = bis.read(buffer);
                while (i != -1) {
                    os.write(buffer, 0, i);
                    i = bis.read(buffer);
                }
                os.flush();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (bis != null) {
                        bis.close();
                    }
                    if (fis != null) {
                        fis.close();
                    }
                    if (os != null) {
                        os.close();
                    }

                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return "此文件已丢失";
    }


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

    private File MakeLogDir(String fileName, String mobile) {
        File folder = new File(dirPath + mobile);
        if (!folder.exists()) {
            folder.mkdirs();
        }
        File file = new File(dirPath + mobile + java.io.File.separator + fileName);
        if (file.exists()) {
            file.delete();
        }
        return file;
    }
}
