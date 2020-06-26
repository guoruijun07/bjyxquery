package com.bjyx.template;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.write.style.ColumnWidth;

public class SortingMatchiingExportTemplate {

    @ExcelProperty(value = "寄件人姓名",index = 0)
    @ColumnWidth(10)
    private String senderName;
    @ExcelProperty(value = "寄件人电话1",index = 1)
    @ColumnWidth(14)
    private String sender_mobile_one;
    @ExcelProperty(value = "寄件人电话2",index = 2)
    @ColumnWidth(14)
    private String sender_mobile_two;
    @ExcelProperty(value = "寄件省",index = 3)
    @ColumnWidth(10)
    private String senderProvince;
    @ExcelProperty(value = "寄件市",index = 4)
    @ColumnWidth(10)
    private String senderCity;
    @ExcelProperty(value = "寄件区",index = 5)
    @ColumnWidth(10)
    private String senderCounty;
    @ExcelProperty(value = "寄件详细地址",index = 6)
    @ColumnWidth(30)
    private String senderAddress;
    @ExcelProperty(value = "收件人姓名",index = 7)
    @ColumnWidth(10)
    private String reciverName;
    @ExcelProperty(value = "收件人电话1",index = 8)
    @ColumnWidth(14)
    private String reciverMobileOne;
    @ExcelProperty(value = "收件人电话2",index = 9)
    @ColumnWidth(14)
    private String reciverMobileTwo;
    @ExcelProperty(value = "收件省",index = 10)
    @ColumnWidth(10)
    private String reciverProvince;
    @ExcelProperty(value = "收件市",index = 11)
    @ColumnWidth(10)
    private String reciverCity;
    @ExcelProperty(value = "收件区",index = 12)
    @ColumnWidth(10)
    private String reciverCounty;
    @ExcelProperty(value = "收件详细地址",index = 13)
    @ColumnWidth(30)
    private String reciverAddress;
    @ExcelProperty(value = "同城标识",index = 14)
    @ColumnWidth(4)
    private String cityWideFlag;
    @ExcelProperty(value = "四级分拣码",index = 15)
    @ColumnWidth(20)
    private String levelFourSortingName;
    @ExcelProperty(value = "分拣码",index = 16)
    @ColumnWidth(10)
    private String sortingName;
    @ExcelProperty(value = "标识",index = 17)
    @ColumnWidth(10)
    private String marking;
    @ExcelProperty(value = "集散中心",index = 18)
    @ColumnWidth(15)
    private String distribuCenter;
    @ExcelProperty(value = "投递部",index = 19)
    @ColumnWidth(15)
    private String dlvName;
    @ExcelProperty(value = "编号",index = 20)
    @ColumnWidth(10)
    private String areaNum;
    @ExcelProperty(value = "机构代码",index = 21)
    @ColumnWidth(15)
    private String orgNum;
    @ExcelProperty(value = "机构名称",index = 22)
    @ColumnWidth(80)
    private String orgName;

    public String getSenderName() {
        return senderName;
    }

    public void setSenderName(String senderName) {
        this.senderName = senderName;
    }

    public String getSender_mobile_one() {
        return sender_mobile_one;
    }

    public void setSender_mobile_one(String sender_mobile_one) {
        this.sender_mobile_one = sender_mobile_one;
    }

    public String getSender_mobile_two() {
        return sender_mobile_two;
    }

    public void setSender_mobile_two(String sender_mobile_two) {
        this.sender_mobile_two = sender_mobile_two;
    }

    public String getSenderProvince() {
        return senderProvince;
    }

    public void setSenderProvince(String senderProvince) {
        this.senderProvince = senderProvince;
    }

    public String getSenderCity() {
        return senderCity;
    }

    public void setSenderCity(String senderCity) {
        this.senderCity = senderCity;
    }

    public String getSenderCounty() {
        return senderCounty;
    }

    public void setSenderCounty(String senderCounty) {
        this.senderCounty = senderCounty;
    }

    public String getSenderAddress() {
        return senderAddress;
    }

    public void setSenderAddress(String senderAddress) {
        this.senderAddress = senderAddress;
    }

    public String getReciverName() {
        return reciverName;
    }

    public void setReciverName(String reciverName) {
        this.reciverName = reciverName;
    }

    public String getReciverMobileOne() {
        return reciverMobileOne;
    }

    public void setReciverMobileOne(String reciverMobileOne) {
        this.reciverMobileOne = reciverMobileOne;
    }

    public String getReciverMobileTwo() {
        return reciverMobileTwo;
    }

    public void setReciverMobileTwo(String reciverMobileTwo) {
        this.reciverMobileTwo = reciverMobileTwo;
    }

    public String getReciverProvince() {
        return reciverProvince;
    }

    public void setReciverProvince(String reciverProvince) {
        this.reciverProvince = reciverProvince;
    }

    public String getReciverCity() {
        return reciverCity;
    }

    public void setReciverCity(String reciverCity) {
        this.reciverCity = reciverCity;
    }

    public String getReciverCounty() {
        return reciverCounty;
    }

    public void setReciverCounty(String reciverCounty) {
        this.reciverCounty = reciverCounty;
    }

    public String getReciverAddress() {
        return reciverAddress;
    }

    public void setReciverAddress(String reciverAddress) {
        this.reciverAddress = reciverAddress;
    }

    public String getCityWideFlag() {
        return cityWideFlag;
    }

    public void setCityWideFlag(String cityWideFlag) {
        this.cityWideFlag = cityWideFlag;
    }

    public String getLevelFourSortingName() {
        return levelFourSortingName;
    }

    public void setLevelFourSortingName(String levelFourSortingName) {
        this.levelFourSortingName = levelFourSortingName;
    }

    public String getSortingName() {
        return sortingName;
    }

    public void setSortingName(String sortingName) {
        this.sortingName = sortingName;
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
