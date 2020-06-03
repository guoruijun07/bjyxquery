package com.bjyx.entity.po;

public class TbSortingInfo {
    /**
     * id id
     */
    private Integer id;

    /**
     * 机构号 org_num
     */
    private Integer orgNum;

    /**
     * 机构名称 org_name
     */
    private String orgName;

    /**
     * 分拣码第三级 sorting_name
     */
    private String sortingName;

    /**
     * 集散中心 distribu_center
     */
    private String distribuCenter;

    /**
     * 投递部 dlv_name
     */
    private String dlvName;

    /**
     * 分区 area
     */
    private String area;

    /**
     * 编号 area_num
     */
    private String areaNum;

    /**
     * 标识 marking
     */
    private String marking;

    /**
     * 备注 remark
     */
    private String remark;

    /**
     * 预留字段 receive1
     */
    private String receive1;

    /**
     *  receive2
     */
    private String receive2;

    /**
     *  receive3
     */
    private String receive3;

    /**
     *  receive4
     */
    private String receive4;

    /**
     *  receive5
     */
    private String receive5;

    /**
     *
     * @mbggenerated
     */
    public TbSortingInfo(Integer id, Integer orgNum, String orgName, String sortingName, String distribuCenter, String dlvName, String area, String areaNum, String marking, String remark, String receive1, String receive2, String receive3, String receive4, String receive5) {
        this.id = id;
        this.orgNum = orgNum;
        this.orgName = orgName;
        this.sortingName = sortingName;
        this.distribuCenter = distribuCenter;
        this.dlvName = dlvName;
        this.area = area;
        this.areaNum = areaNum;
        this.marking = marking;
        this.remark = remark;
        this.receive1 = receive1;
        this.receive2 = receive2;
        this.receive3 = receive3;
        this.receive4 = receive4;
        this.receive5 = receive5;
    }

    /**
     *
     * @mbggenerated
     */
    public TbSortingInfo() {
        super();
    }

    /**
     * id
    
     * @return id id
     */
    public Integer getId() {
        return id;
    }

    /**
     * id
    
     * @param id id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 机构号
    
     * @return org_num 机构号
     */
    public Integer getOrgNum() {
        return orgNum;
    }

    /**
     * 机构号
    
     * @param orgNum 机构号
     */
    public void setOrgNum(Integer orgNum) {
        this.orgNum = orgNum;
    }

    /**
     * 机构名称
    
     * @return org_name 机构名称
     */
    public String getOrgName() {
        return orgName;
    }

    /**
     * 机构名称
    
     * @param orgName 机构名称
     */
    public void setOrgName(String orgName) {
        this.orgName = orgName == null ? null : orgName.trim();
    }

    /**
     * 分拣码第三级
    
     * @return sorting_name 分拣码第三级
     */
    public String getSortingName() {
        return sortingName;
    }

    /**
     * 分拣码第三级
    
     * @param sortingName 分拣码第三级
     */
    public void setSortingName(String sortingName) {
        this.sortingName = sortingName == null ? null : sortingName.trim();
    }

    /**
     * 集散中心
    
     * @return distribu_center 集散中心
     */
    public String getDistribuCenter() {
        return distribuCenter;
    }

    /**
     * 集散中心
    
     * @param distribuCenter 集散中心
     */
    public void setDistribuCenter(String distribuCenter) {
        this.distribuCenter = distribuCenter == null ? null : distribuCenter.trim();
    }

    /**
     * 投递部
    
     * @return dlv_name 投递部
     */
    public String getDlvName() {
        return dlvName;
    }

    /**
     * 投递部
    
     * @param dlvName 投递部
     */
    public void setDlvName(String dlvName) {
        this.dlvName = dlvName == null ? null : dlvName.trim();
    }

    /**
     * 分区
    
     * @return area 分区
     */
    public String getArea() {
        return area;
    }

    /**
     * 分区
    
     * @param area 分区
     */
    public void setArea(String area) {
        this.area = area == null ? null : area.trim();
    }

    /**
     * 编号
    
     * @return area_num 编号
     */
    public String getAreaNum() {
        return areaNum;
    }

    /**
     * 编号
    
     * @param areaNum 编号
     */
    public void setAreaNum(String areaNum) {
        this.areaNum = areaNum == null ? null : areaNum.trim();
    }

    /**
     * 标识
    
     * @return marking 标识
     */
    public String getMarking() {
        return marking;
    }

    /**
     * 标识
    
     * @param marking 标识
     */
    public void setMarking(String marking) {
        this.marking = marking == null ? null : marking.trim();
    }

    /**
     * 备注
    
     * @return remark 备注
     */
    public String getRemark() {
        return remark;
    }

    /**
     * 备注
    
     * @param remark 备注
     */
    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    /**
     * 预留字段
    
     * @return receive1 预留字段
     */
    public String getReceive1() {
        return receive1;
    }

    /**
     * 预留字段
    
     * @param receive1 预留字段
     */
    public void setReceive1(String receive1) {
        this.receive1 = receive1 == null ? null : receive1.trim();
    }

    /**
     * 
    
     * @return receive2 
     */
    public String getReceive2() {
        return receive2;
    }

    /**
     * 
    
     * @param receive2 
     */
    public void setReceive2(String receive2) {
        this.receive2 = receive2 == null ? null : receive2.trim();
    }

    /**
     * 
    
     * @return receive3 
     */
    public String getReceive3() {
        return receive3;
    }

    /**
     * 
    
     * @param receive3 
     */
    public void setReceive3(String receive3) {
        this.receive3 = receive3 == null ? null : receive3.trim();
    }

    /**
     * 
    
     * @return receive4 
     */
    public String getReceive4() {
        return receive4;
    }

    /**
     * 
    
     * @param receive4 
     */
    public void setReceive4(String receive4) {
        this.receive4 = receive4 == null ? null : receive4.trim();
    }

    /**
     * 
    
     * @return receive5 
     */
    public String getReceive5() {
        return receive5;
    }

    /**
     * 
    
     * @param receive5 
     */
    public void setReceive5(String receive5) {
        this.receive5 = receive5 == null ? null : receive5.trim();
    }
}