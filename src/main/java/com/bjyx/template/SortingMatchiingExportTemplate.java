package com.bjyx.template;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.write.style.ColumnWidth;

public class SortingMatchiingExportTemplate {

    @ExcelProperty(value = "配货单号",index = 0)
    @ColumnWidth(20)
    private String waybillNo;
    @ExcelProperty(value = "收件人地址",index = 1)
    @ColumnWidth(70)
    private String receiveAddress;
    @ExcelProperty(value = "三级分拣码",index = 2)
    @ColumnWidth(40)
    private String threeSorting;
    @ExcelProperty(value = "分拣码",index = 3)
    @ColumnWidth(15)
    private String threeSortingSimple;
    @ExcelProperty(value = "标识",index = 4)
    @ColumnWidth(10)
    private String marking;
    @ExcelProperty(value = "集散中心",index = 5)
    @ColumnWidth(20)
    private String distribuCenter;
    @ExcelProperty(value = "投递部",index = 6)
    @ColumnWidth(20)
    private String dlvName;
    @ExcelProperty(value = "编号",index = 7)
    @ColumnWidth(10)
    private String areaNum;
    @ExcelProperty(value = "机构代码",index = 8)
    @ColumnWidth(15)
    private String orgNum;
    @ExcelProperty(value = "机构名称",index = 9)
    @ColumnWidth(80)
    private String orgName;

    public String getWaybillNo() {
        return waybillNo;
    }

    public void setWaybillNo(String waybillNo) {
        this.waybillNo = waybillNo;
    }

    public String getReceiveAddress() {
        return receiveAddress;
    }

    public void setReceiveAddress(String receiveAddress) {
        this.receiveAddress = receiveAddress;
    }

    public String getThreeSorting() {
        return threeSorting;
    }

    public void setThreeSorting(String threeSorting) {
        this.threeSorting = threeSorting;
    }

    public String getThreeSortingSimple() {
        return threeSortingSimple;
    }

    public void setThreeSortingSimple(String threeSortingSimple) {
        this.threeSortingSimple = threeSortingSimple;
    }

    public String getMarking() {
        return marking;
    }

    public void setMarking(String marking) {
        this.marking = marking;
    }

    public String getDistribuCenter() {
        return distribuCenter;
    }

    public void setDistribuCenter(String distribuCenter) {
        this.distribuCenter = distribuCenter;
    }

    public String getDlvName() {
        return dlvName;
    }

    public void setDlvName(String dlvName) {
        this.dlvName = dlvName;
    }

    public String getAreaNum() {
        return areaNum;
    }

    public void setAreaNum(String areaNum) {
        this.areaNum = areaNum;
    }

    public String getOrgNum() {
        return orgNum;
    }

    public void setOrgNum(String orgNum) {
        this.orgNum = orgNum;
    }

    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }
}
