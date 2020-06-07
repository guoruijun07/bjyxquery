package com.bjyx.entity.po;

import java.util.Date;

public class TbSortingMatchingInfo {
    /**
     * 主建id id
     */
    private Integer id;

    /**
     * 批次号 batch_no
     */
    private String batchNo;

    /**
     * 寄件人姓名 sender_name
     */
    private String senderName;

    /**
     * 寄件人电话1 sender_mobile_one
     */
    private String senderMobileOne;

    /**
     * 寄件人电话2 sender_mobile_two
     */
    private String senderMobileTwo;

    /**
     * 寄件省 sender_province
     */
    private String senderProvince;

    /**
     * 寄件市 sender_city
     */
    private String senderCity;

    /**
     * 寄件区 sender_county
     */
    private String senderCounty;

    /**
     * 寄件详细地址 sender_address
     */
    private String senderAddress;

    /**
     * 收件人姓名 reciver_name
     */
    private String reciverName;

    /**
     * 收件人电话1 reciver_mobile_one
     */
    private String reciverMobileOne;

    /**
     * 收件人电话2 reciver_mobile_two
     */
    private String reciverMobileTwo;

    /**
     * 收件省 reciver_province
     */
    private String reciverProvince;

    /**
     * 收件市 reciver_city
     */
    private String reciverCity;

    /**
     * 收件区 reciver_county
     */
    private String reciverCounty;

    /**
     * 收件详细地址 reciver_address
     */
    private String reciverAddress;

    /**
     * 大头笔 datoubi
     */
    private String datoubi;

    /**
     * 大头笔编码 datoubi_code
     */
    private String datoubiCode;

    /**
     * 集包地名称 consolidation_name
     */
    private String consolidationName;

    /**
     * 集包地编码 consolidation_code
     */
    private String consolidationCode;

    /**
     * 四级分拣码 level_four_sorting_name
     */
    private String levelFourSortingName;

    /**
     * 分拣码 sorting_name
     */
    private String sortingName;

    /**
     * 标识 marking
     */
    private String marking;

    /**
     * 集散中心 distribu_center
     */
    private String distribuCenter;

    /**
     * 投递部代码 dlv_no
     */
    private String dlvNo;

    /**
     * 投递部名称 dlv_name
     */
    private String dlvName;

    /**
     * 机构代码 org_no
     */
    private String orgNo;

    /**
     * 机构名称 org_name
     */
    private String orgName;

    /**
     * 操作员id operation_no
     */
    private String operationNo;

    /**
     * 操作员姓名 operation_name
     */
    private String operationName;

    /**
     * 操作时间 operation_time
     */
    private Date operationTime;

    /**
     * 修改时间 modify_time
     */
    private Date modifyTime;

    /**
     * 创建时间 create_time
     */
    private Date createTime;

    /**
     *
     * @mbggenerated
     */
    public TbSortingMatchingInfo(Integer id, String batchNo, String senderName, String senderMobileOne, String senderMobileTwo, String senderProvince, String senderCity, String senderCounty, String senderAddress, String reciverName, String reciverMobileOne, String reciverMobileTwo, String reciverProvince, String reciverCity, String reciverCounty, String reciverAddress, String datoubi, String datoubiCode, String consolidationName, String consolidationCode, String levelFourSortingName, String sortingName, String marking, String distribuCenter, String dlvNo, String dlvName, String orgNo, String orgName, String operationNo, String operationName, Date operationTime, Date modifyTime, Date createTime) {
        this.id = id;
        this.batchNo = batchNo;
        this.senderName = senderName;
        this.senderMobileOne = senderMobileOne;
        this.senderMobileTwo = senderMobileTwo;
        this.senderProvince = senderProvince;
        this.senderCity = senderCity;
        this.senderCounty = senderCounty;
        this.senderAddress = senderAddress;
        this.reciverName = reciverName;
        this.reciverMobileOne = reciverMobileOne;
        this.reciverMobileTwo = reciverMobileTwo;
        this.reciverProvince = reciverProvince;
        this.reciverCity = reciverCity;
        this.reciverCounty = reciverCounty;
        this.reciverAddress = reciverAddress;
        this.datoubi = datoubi;
        this.datoubiCode = datoubiCode;
        this.consolidationName = consolidationName;
        this.consolidationCode = consolidationCode;
        this.levelFourSortingName = levelFourSortingName;
        this.sortingName = sortingName;
        this.marking = marking;
        this.distribuCenter = distribuCenter;
        this.dlvNo = dlvNo;
        this.dlvName = dlvName;
        this.orgNo = orgNo;
        this.orgName = orgName;
        this.operationNo = operationNo;
        this.operationName = operationName;
        this.operationTime = operationTime;
        this.modifyTime = modifyTime;
        this.createTime = createTime;
    }

    /**
     *
     * @mbggenerated
     */
    public TbSortingMatchingInfo() {
        super();
    }

    /**
     * 主建id
    
     * @return id 主建id
     */
    public Integer getId() {
        return id;
    }

    /**
     * 主建id
    
     * @param id 主建id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 批次号
    
     * @return batch_no 批次号
     */
    public String getBatchNo() {
        return batchNo;
    }

    /**
     * 批次号
    
     * @param batchNo 批次号
     */
    public void setBatchNo(String batchNo) {
        this.batchNo = batchNo == null ? null : batchNo.trim();
    }

    /**
     * 寄件人姓名
    
     * @return sender_name 寄件人姓名
     */
    public String getSenderName() {
        return senderName;
    }

    /**
     * 寄件人姓名
    
     * @param senderName 寄件人姓名
     */
    public void setSenderName(String senderName) {
        this.senderName = senderName == null ? null : senderName.trim();
    }

    /**
     * 寄件人电话1
    
     * @return sender_mobile_one 寄件人电话1
     */
    public String getSenderMobileOne() {
        return senderMobileOne;
    }

    /**
     * 寄件人电话1
    
     * @param senderMobileOne 寄件人电话1
     */
    public void setSenderMobileOne(String senderMobileOne) {
        this.senderMobileOne = senderMobileOne == null ? null : senderMobileOne.trim();
    }

    /**
     * 寄件人电话2
    
     * @return sender_mobile_two 寄件人电话2
     */
    public String getSenderMobileTwo() {
        return senderMobileTwo;
    }

    /**
     * 寄件人电话2
    
     * @param senderMobileTwo 寄件人电话2
     */
    public void setSenderMobileTwo(String senderMobileTwo) {
        this.senderMobileTwo = senderMobileTwo == null ? null : senderMobileTwo.trim();
    }

    /**
     * 寄件省
    
     * @return sender_province 寄件省
     */
    public String getSenderProvince() {
        return senderProvince;
    }

    /**
     * 寄件省
    
     * @param senderProvince 寄件省
     */
    public void setSenderProvince(String senderProvince) {
        this.senderProvince = senderProvince == null ? null : senderProvince.trim();
    }

    /**
     * 寄件市
    
     * @return sender_city 寄件市
     */
    public String getSenderCity() {
        return senderCity;
    }

    /**
     * 寄件市
    
     * @param senderCity 寄件市
     */
    public void setSenderCity(String senderCity) {
        this.senderCity = senderCity == null ? null : senderCity.trim();
    }

    /**
     * 寄件区
    
     * @return sender_county 寄件区
     */
    public String getSenderCounty() {
        return senderCounty;
    }

    /**
     * 寄件区
    
     * @param senderCounty 寄件区
     */
    public void setSenderCounty(String senderCounty) {
        this.senderCounty = senderCounty == null ? null : senderCounty.trim();
    }

    /**
     * 寄件详细地址
    
     * @return sender_address 寄件详细地址
     */
    public String getSenderAddress() {
        return senderAddress;
    }

    /**
     * 寄件详细地址
    
     * @param senderAddress 寄件详细地址
     */
    public void setSenderAddress(String senderAddress) {
        this.senderAddress = senderAddress == null ? null : senderAddress.trim();
    }

    /**
     * 收件人姓名
    
     * @return reciver_name 收件人姓名
     */
    public String getReciverName() {
        return reciverName;
    }

    /**
     * 收件人姓名
    
     * @param reciverName 收件人姓名
     */
    public void setReciverName(String reciverName) {
        this.reciverName = reciverName == null ? null : reciverName.trim();
    }

    /**
     * 收件人电话1
    
     * @return reciver_mobile_one 收件人电话1
     */
    public String getReciverMobileOne() {
        return reciverMobileOne;
    }

    /**
     * 收件人电话1
    
     * @param reciverMobileOne 收件人电话1
     */
    public void setReciverMobileOne(String reciverMobileOne) {
        this.reciverMobileOne = reciverMobileOne == null ? null : reciverMobileOne.trim();
    }

    /**
     * 收件人电话2
    
     * @return reciver_mobile_two 收件人电话2
     */
    public String getReciverMobileTwo() {
        return reciverMobileTwo;
    }

    /**
     * 收件人电话2
    
     * @param reciverMobileTwo 收件人电话2
     */
    public void setReciverMobileTwo(String reciverMobileTwo) {
        this.reciverMobileTwo = reciverMobileTwo == null ? null : reciverMobileTwo.trim();
    }

    /**
     * 收件省
    
     * @return reciver_province 收件省
     */
    public String getReciverProvince() {
        return reciverProvince;
    }

    /**
     * 收件省
    
     * @param reciverProvince 收件省
     */
    public void setReciverProvince(String reciverProvince) {
        this.reciverProvince = reciverProvince == null ? null : reciverProvince.trim();
    }

    /**
     * 收件市
    
     * @return reciver_city 收件市
     */
    public String getReciverCity() {
        return reciverCity;
    }

    /**
     * 收件市
    
     * @param reciverCity 收件市
     */
    public void setReciverCity(String reciverCity) {
        this.reciverCity = reciverCity == null ? null : reciverCity.trim();
    }

    /**
     * 收件区
    
     * @return reciver_county 收件区
     */
    public String getReciverCounty() {
        return reciverCounty;
    }

    /**
     * 收件区
    
     * @param reciverCounty 收件区
     */
    public void setReciverCounty(String reciverCounty) {
        this.reciverCounty = reciverCounty == null ? null : reciverCounty.trim();
    }

    /**
     * 收件详细地址
    
     * @return reciver_address 收件详细地址
     */
    public String getReciverAddress() {
        return reciverAddress;
    }

    /**
     * 收件详细地址
    
     * @param reciverAddress 收件详细地址
     */
    public void setReciverAddress(String reciverAddress) {
        this.reciverAddress = reciverAddress == null ? null : reciverAddress.trim();
    }

    /**
     * 大头笔
    
     * @return datoubi 大头笔
     */
    public String getDatoubi() {
        return datoubi;
    }

    /**
     * 大头笔
    
     * @param datoubi 大头笔
     */
    public void setDatoubi(String datoubi) {
        this.datoubi = datoubi == null ? null : datoubi.trim();
    }

    /**
     * 大头笔编码
    
     * @return datoubi_code 大头笔编码
     */
    public String getDatoubiCode() {
        return datoubiCode;
    }

    /**
     * 大头笔编码
    
     * @param datoubiCode 大头笔编码
     */
    public void setDatoubiCode(String datoubiCode) {
        this.datoubiCode = datoubiCode == null ? null : datoubiCode.trim();
    }

    /**
     * 集包地名称
    
     * @return consolidation_name 集包地名称
     */
    public String getConsolidationName() {
        return consolidationName;
    }

    /**
     * 集包地名称
    
     * @param consolidationName 集包地名称
     */
    public void setConsolidationName(String consolidationName) {
        this.consolidationName = consolidationName == null ? null : consolidationName.trim();
    }

    /**
     * 集包地编码
    
     * @return consolidation_code 集包地编码
     */
    public String getConsolidationCode() {
        return consolidationCode;
    }

    /**
     * 集包地编码
    
     * @param consolidationCode 集包地编码
     */
    public void setConsolidationCode(String consolidationCode) {
        this.consolidationCode = consolidationCode == null ? null : consolidationCode.trim();
    }

    /**
     * 四级分拣码
    
     * @return level_four_sorting_name 四级分拣码
     */
    public String getLevelFourSortingName() {
        return levelFourSortingName;
    }

    /**
     * 四级分拣码
    
     * @param levelFourSortingName 四级分拣码
     */
    public void setLevelFourSortingName(String levelFourSortingName) {
        this.levelFourSortingName = levelFourSortingName == null ? null : levelFourSortingName.trim();
    }

    /**
     * 分拣码
    
     * @return sorting_name 分拣码
     */
    public String getSortingName() {
        return sortingName;
    }

    /**
     * 分拣码
    
     * @param sortingName 分拣码
     */
    public void setSortingName(String sortingName) {
        this.sortingName = sortingName == null ? null : sortingName.trim();
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
     * 投递部代码
    
     * @return dlv_no 投递部代码
     */
    public String getDlvNo() {
        return dlvNo;
    }

    /**
     * 投递部代码
    
     * @param dlvNo 投递部代码
     */
    public void setDlvNo(String dlvNo) {
        this.dlvNo = dlvNo == null ? null : dlvNo.trim();
    }

    /**
     * 投递部名称
    
     * @return dlv_name 投递部名称
     */
    public String getDlvName() {
        return dlvName;
    }

    /**
     * 投递部名称
    
     * @param dlvName 投递部名称
     */
    public void setDlvName(String dlvName) {
        this.dlvName = dlvName == null ? null : dlvName.trim();
    }

    /**
     * 机构代码
    
     * @return org_no 机构代码
     */
    public String getOrgNo() {
        return orgNo;
    }

    /**
     * 机构代码
    
     * @param orgNo 机构代码
     */
    public void setOrgNo(String orgNo) {
        this.orgNo = orgNo == null ? null : orgNo.trim();
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
     * 操作员id
    
     * @return operation_no 操作员id
     */
    public String getOperationNo() {
        return operationNo;
    }

    /**
     * 操作员id
    
     * @param operationNo 操作员id
     */
    public void setOperationNo(String operationNo) {
        this.operationNo = operationNo == null ? null : operationNo.trim();
    }

    /**
     * 操作员姓名
    
     * @return operation_name 操作员姓名
     */
    public String getOperationName() {
        return operationName;
    }

    /**
     * 操作员姓名
    
     * @param operationName 操作员姓名
     */
    public void setOperationName(String operationName) {
        this.operationName = operationName == null ? null : operationName.trim();
    }

    /**
     * 操作时间
    
     * @return operation_time 操作时间
     */
    public Date getOperationTime() {
        return operationTime;
    }

    /**
     * 操作时间
    
     * @param operationTime 操作时间
     */
    public void setOperationTime(Date operationTime) {
        this.operationTime = operationTime;
    }

    /**
     * 修改时间
    
     * @return modify_time 修改时间
     */
    public Date getModifyTime() {
        return modifyTime;
    }

    /**
     * 修改时间
    
     * @param modifyTime 修改时间
     */
    public void setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
    }

    /**
     * 创建时间
    
     * @return create_time 创建时间
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * 创建时间
    
     * @param createTime 创建时间
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}