package com.bjyx.template;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.write.style.ColumnWidth;

public class BaseInfoExportTemplate {

    @ExcelProperty(value = "id",index = 0)
    @ColumnWidth(20)
    private String id;
    @ExcelProperty(value = "机构号",index = 1)
    @ColumnWidth(70)
    private String org_num;
    @ExcelProperty(value = "机构名称",index = 2)
    @ColumnWidth(40)
    private String org_name;
    @ExcelProperty(value = "分拣码第三级",index = 3)
    @ColumnWidth(15)
    private String sorting_name;
    @ExcelProperty(value = "集散中心",index = 4)
    @ColumnWidth(10)
    private String distribu_center;
    @ExcelProperty(value = "投递部",index = 5)
    @ColumnWidth(20)
    private String dlv_name;
    @ExcelProperty(value = "分区",index = 6)
    @ColumnWidth(20)
    private String area;
    @ExcelProperty(value = "编号",index = 7)
    @ColumnWidth(10)
    private String area_num;
    @ExcelProperty(value = "标识",index = 8)
    @ColumnWidth(15)
    private String marking;
    @ExcelProperty(value = "备注",index = 9)
    @ColumnWidth(10)
    private String remark;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getOrg_num() {
        return org_num;
    }

    public void setOrg_num(String org_num) {
        this.org_num = org_num;
    }

    public String getOrg_name() {
        return org_name;
    }

    public void setOrg_name(String org_name) {
        this.org_name = org_name;
    }

    public String getSorting_name() {
        return sorting_name;
    }

    public void setSorting_name(String sorting_name) {
        this.sorting_name = sorting_name;
    }

    public String getDistribu_center() {
        return distribu_center;
    }

    public void setDistribu_center(String distribu_center) {
        this.distribu_center = distribu_center;
    }

    public String getDlv_name() {
        return dlv_name;
    }

    public void setDlv_name(String dlv_name) {
        this.dlv_name = dlv_name;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getArea_num() {
        return area_num;
    }

    public void setArea_num(String area_num) {
        this.area_num = area_num;
    }

    public String getMarking() {
        return marking;
    }

    public void setMarking(String marking) {
        this.marking = marking;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
