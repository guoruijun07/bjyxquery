package com.bjyx;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.ExcelReader;
import com.alibaba.excel.read.metadata.ReadSheet;
import com.alibaba.excel.util.DateUtils;
import com.bjyx.entity.bo.DemoData;
import com.bjyx.entity.bo.ReadySortingData;
import com.bjyx.entity.po.TbSortingInfo;
import com.bjyx.listener.DemoDataListener;
import com.bjyx.mapper.TbSortingInfoMapper;
import com.bjyx.template.SortingExportTemplate;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.*;

@SpringBootTest
class BjqueryApplicationTests {

    @Autowired(required = false)
    private TbSortingInfoMapper tbSortingInfoMapper;

    @Test
    void contextLoads() {

    }
    /**
     * 最简单的读
     * <p>1. 创建excel对应的实体对象 参照{@link DemoData}
     * <p>2. 由于默认一行行的读取excel，所以需要创建excel一行一行的回调监听器，参照{@link DemoDataListener}
     * <p>3. 直接读即可
     */
    @Test
    public void simpleRead() {
        // 有个很重要的点 DemoDataListener 不能被spring管理，要每次读取excel都要new,然后里面用到spring可以构造方法传进去
        // 写法1：
//       String fileName = TestFileUtil.getPath() + "demo" + File.separator + "demo.xlsx";
        String fileName = "E://shuju.xls";
        List<ReadySortingData> list = new ArrayList<>();
        // 这里 需要指定读用哪个class去读，然后读取第一个sheet 文件流会自动关闭
        EasyExcel.read(fileName, ReadySortingData.class, new DemoDataListener(list)).sheet().doRead();

        //获取到所有分拣信息
        List<TbSortingInfo> tbSortingInfos = tbSortingInfoMapper.selectAllData();
        Map<String,TbSortingInfo> map = new HashMap<>();
        for (TbSortingInfo tbSortingInfo : tbSortingInfos) {
            map.put(tbSortingInfo.getSortingName(),tbSortingInfo);
        }

        List<SortingExportTemplate> datas = new ArrayList<>();

        for (ReadySortingData readySortingData : list) {
            SortingExportTemplate sortingExport = new SortingExportTemplate();
            sortingExport.setWaybillNo(readySortingData.getWaybillNo());
            sortingExport.setReceiveAddress(readySortingData.getReceiveAddress());
            sortingExport.setThreeSorting(readySortingData.getThreeSorting());
            sortingExport.setThreeSortingSimple(readySortingData.getThreeSortingSimple());

            TbSortingInfo tbSortingInfo = map.get(readySortingData.getThreeSortingSimple());
            if(tbSortingInfo!=null){
                sortingExport.setMarking(tbSortingInfo.getMarking());
                sortingExport.setDistribuCenter(tbSortingInfo.getDistribuCenter());
                sortingExport.setDlvName(tbSortingInfo.getDlvName());
                sortingExport.setAreaNum(tbSortingInfo.getAreaNum());
                sortingExport.setOrgNum(tbSortingInfo.getOrgNum().toString());
                sortingExport.setOrgName(tbSortingInfo.getOrgName());
            }

            datas.add(sortingExport);
        }

        Long startTime = System.currentTimeMillis();
        OutputStream outputStream = null;

        try {
            String dirPath = "D:\\";
            String fileName1 = new String(("shuju" + DateUtils.format(new Date(), "yyyyMMddHHmmss") + ".xlsx").getBytes(), "UTF-8");
            File file = MakeLogDir(fileName1);

            outputStream = new FileOutputStream(file);

            //把数据封装为对象
            EasyExcel.write(outputStream, SortingExportTemplate.class).sheet("订单数据").doWrite(datas);
        }catch (Exception e){
            e.printStackTrace();
        }

    }

    /**
     * 最简单的读
     * <p>1. 创建excel对应的实体对象 参照{@link DemoData}
     * <p>2. 由于默认一行行的读取excel，所以需要创建excel一行一行的回调监听器，参照{@link DemoDataListener}
     * <p>3. 直接读即可
     */
    @Test
    public void TestRead() {
        // 有个很重要的点 DemoDataListener 不能被spring管理，要每次读取excel都要new,然后里面用到spring可以构造方法传进去
        // 写法1：
//       String fileName = TestFileUtil.getPath() + "demo" + File.separator + "demo.xlsx";
        String fileName = "E://demo.xlsx";
        List<ReadySortingData> list = new ArrayList<>();
        // 这里 需要指定读用哪个class去读，然后读取第一个sheet 文件流会自动关闭
        EasyExcel.read(fileName, DemoData.class, new DemoDataListener(list)).sheet().doRead();
        // 写法2：
//        fileName = TestFileUtil.getPath() + "demo" + File.separator + "demo.xlsx";
        ExcelReader excelReader = EasyExcel.read(fileName, DemoData.class, new DemoDataListener(list)).build();
        ReadSheet readSheet = EasyExcel.readSheet(0).build();
        excelReader.read(readSheet);
        // 这里千万别忘记关闭，读的时候会创建临时文件，到时磁盘会崩的
        excelReader.finish();

    }

    private File MakeLogDir(String fileName) {
        File folder = new File("D:\\");
        if (!folder.exists()) {
            folder.mkdirs();
        }
        File file = new File("D:\\" + fileName);
        if (file.exists()) {
            file.delete();
        }
        return file;
    }

}
