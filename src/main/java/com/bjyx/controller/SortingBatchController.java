package com.bjyx.controller;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.util.DateUtils;
import com.bjyx.common.Constants;
import com.bjyx.entity.bo.ReadySortingData;
import com.bjyx.entity.po.TbExportInfo;
import com.bjyx.entity.po.TbPriceInfo;
import com.bjyx.entity.po.TbSortingInfo;
import com.bjyx.entity.po.TbUserInfo;
import com.bjyx.enums.EnumPriceCode;
import com.bjyx.listener.BathSortingDataListener;
import com.bjyx.mapper.TbExportInfoMapper;
import com.bjyx.mapper.TbPriceInfoMapper;
import com.bjyx.mapper.TbSortingInfoMapper;
import com.bjyx.mapper.TbUserInfoMapper;
import com.bjyx.template.SortingExportTemplate;
import com.bjyx.utils.CommomUtils;
import com.bjyx.utils.SysResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
import java.util.*;

/**
 * 分拣码批量查询
 */
@Controller
@RequestMapping("/sorting")
public class SortingBatchController {

    private static final Logger logger = LoggerFactory.getLogger(SortingBatchController.class);
    @Autowired(required = false)
    private TbSortingInfoMapper tbSortingInfoMapper;
    @Autowired(required = false)
    private TbExportInfoMapper tbExportInfoMapper;

    @Autowired(required = false)
    private TbUserInfoMapper userInfoMapper;

    @Autowired(required = false)
    private TbPriceInfoMapper tbPriceInfoMapper;

    String dirPath = "/home/code" + java.io.File.separator + "exportMatching" + java.io.File.separator;

    @RequestMapping("/getSorting")
    @ResponseBody
    public List<TbSortingInfo> pcLogin(TbSortingInfo tbSortingInfo) {

        List<TbSortingInfo> result = tbSortingInfoMapper.selectBySortingCode("东区");

        return  null;
    }

    /**
     * 分拣码批量查询
     * @param session
     * @param model
     * @param pageNum
     * @return
     */
    @RequestMapping("/getList")
    public String getList(HttpSession session, Model model, Integer pageNum) {

//        PageHelper.startPage(queryVo.getPage(), queryVo.getLimit());
        TbUserInfo user = (TbUserInfo)SecurityUtils.getSubject().getSession().getAttribute(Constants.SESSION_KEY);
        TbUserInfo tbUserInfo1 = (TbUserInfo) session.getAttribute(Constants.SESSION_KEY);
        TbUserInfo tbUserInfo2 = userInfoMapper.selectByPrimaryKey(tbUserInfo1.getId());
        session.setAttribute("remainingSum",tbUserInfo2.getRemainingSum());
        System.out.println("当前页为："+pageNum);
        pageNum = pageNum==null?1:pageNum;
        PageHelper.startPage(pageNum,10,"create_time desc");
        List<TbExportInfo> tbExportInfos = tbExportInfoMapper.selectByUserId(tbUserInfo1.getId());
        PageInfo<TbExportInfo> page = new PageInfo<>(tbExportInfos);
        System.out.println("总记录条数为："+page.getTotal());
        model.addAttribute("page",page);

        return "sorting/sortinglist";

    }

    /**
     * excel文件的上传
     */
    @PostMapping("/upload")
    @ResponseBody
    public SysResult upload(MultipartFile file, HttpSession session) throws IOException {
        Long startTime = System.currentTimeMillis();
        TbUserInfo tbUserInfo = (TbUserInfo) session.getAttribute(Constants.SESSION_KEY);

        //取出用户的余额
        TbUserInfo tbUserInfo2 = userInfoMapper.selectByPrimaryKey(tbUserInfo.getId());
        Double totalSum = tbUserInfo2.getRemainingSum() == null ? 0.0 : tbUserInfo2.getRemainingSum();
        TbPriceInfo tbPriceInfo = tbPriceInfoMapper.selectPriceByUserId(tbUserInfo.getId(), EnumPriceCode.PC_PRICE.getCode(), 1);
        if (tbPriceInfo == null) {
            return new SysResult(0, "请先设置该用户pc功能单价");
        }
        Double pcPrice = tbPriceInfo.getPrice() == null ? 0.0 : tbPriceInfo.getPrice();

        List<ReadySortingData> list = new ArrayList<>();
        // 这里 需要指定读用哪个class去读，然后读取第一个sheet 文件流会自动关闭
        EasyExcel.read(file.getInputStream(), ReadySortingData.class, new BathSortingDataListener(list)).sheet().doRead();
        int totalNum = list.size();
        int successNum = 0;
        //获取到所有分拣信息
        List<TbSortingInfo> tbSortingInfos = tbSortingInfoMapper.selectAllData();
        Map<String, TbSortingInfo> map = new HashMap<>();
        for (TbSortingInfo tbSortingInfo : tbSortingInfos) {
            map.put(tbSortingInfo.getSortingName(), tbSortingInfo);
        }

        List<SortingExportTemplate> exportDatas = new ArrayList<>();

        for (ReadySortingData readySortingData : list) {
            SortingExportTemplate sortingExport = new SortingExportTemplate();
            sortingExport.setWaybillNo(readySortingData.getWaybillNo());
            sortingExport.setReceiveAddress(readySortingData.getReceiveAddress());
            sortingExport.setThreeSorting(readySortingData.getThreeSorting());
            sortingExport.setThreeSortingSimple(readySortingData.getThreeSortingSimple());

            TbSortingInfo tbSortingInfo = map.get(readySortingData.getThreeSortingSimple());
            if (tbSortingInfo != null) {
                successNum++;
                sortingExport.setMarking(tbSortingInfo.getMarking());
                sortingExport.setDistribuCenter(tbSortingInfo.getDistribuCenter());
                sortingExport.setDlvName(tbSortingInfo.getDlvName());
                sortingExport.setAreaNum(tbSortingInfo.getAreaNum());

                String orgNo = "";
                if (tbSortingInfo.getOrgNum() != null) {
                    orgNo = String.valueOf(tbSortingInfo.getOrgNum());
                }
                sortingExport.setOrgNum(orgNo);
                sortingExport.setOrgName(tbSortingInfo.getOrgName());
            }

            exportDatas.add(sortingExport);
        }
        //如果余额不够，直接返回，不生成文件
        Double cost = successNum * pcPrice;
//        Double cost = successNum * Double.valueOf(perMoney);
        if (cost > totalSum) {
            return new SysResult(0, "您的余额不够，请联系管理员充值");
        }
        //更新余额
        Double remainingSum = totalSum - cost;
        TbUserInfo tbUserInfo1 = new TbUserInfo();
        tbUserInfo1.setId(tbUserInfo.getId());
        tbUserInfo1.setRemainingSum(remainingSum);
        userInfoMapper.updateRemainingSumByPrimaryKey(tbUserInfo1);

        String fileNameOriginal = file.getOriginalFilename();
        String fileName = new String((fileNameOriginal + "_" + DateUtils.format(new Date(), "yyyyMMddHHmmss") + ".xlsx").getBytes(), "UTF-8");
        try {

            File exportFile = CommomUtils.MakeLogDir(dirPath, fileName, tbUserInfo.getMobile());

            OutputStream outputStream = new FileOutputStream(exportFile);

            //把数据封装为对象
            EasyExcel.write(outputStream, SortingExportTemplate.class).sheet("订单数据").doWrite(exportDatas);

            TbExportInfo tbExportInfo = new TbExportInfo();
            tbExportInfo.setUserId(tbUserInfo.getId());
            tbExportInfo.setFileName(fileName);
            tbExportInfo.setTotalNum(totalNum);
            tbExportInfo.setSucessNum(successNum);
            tbExportInfo.setMoney(cost);
            tbExportInfo.setCreateTime(new Date());
            tbExportInfoMapper.insert(tbExportInfo);

        } catch (Exception e) {
            e.printStackTrace();
        }

        List<TbExportInfo> tbExportInfos = tbExportInfoMapper.selectAll();
        return new SysResult(1, "导入数据成功", "", remainingSum, tbExportInfos);
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
}
