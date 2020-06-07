package com.bjyx.entity.po;

import java.util.Date;

public class TbOrderOriginalInfo {
    /**
     * 主建 id
     */
    private Integer id;

    /**
     * 批次号 batch_no
     */
    private String batchNo;

    /**
     * 订单号 order_no
     */
    private String orderNo;

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
     * 同城标识（1同城，0外阜） city_wide_flag
     */
    private Integer cityWideFlag;

    /**
     * 分拣码匹配状态（1已匹配、0未匹配） sorting_status
     */
    private Integer sortingStatus;

    /**
     * 备注 remark
     */
    private String remark;

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
    public TbOrderOriginalInfo(Integer id, String batchNo, String orderNo, String senderName, String senderMobileOne, String senderMobileTwo, String senderProvince, String senderCity, String senderCounty, String senderAddress, String reciverName, String reciverMobileOne, String reciverMobileTwo, String reciverProvince, String reciverCity, String reciverCounty, String reciverAddress, String operationNo, String operationName, Date operationTime, Integer cityWideFlag, Integer sortingStatus, String remark, Date modifyTime, Date createTime) {
        this.id = id;
        this.batchNo = batchNo;
        this.orderNo = orderNo;
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
        this.operationNo = operationNo;
        this.operationName = operationName;
        this.operationTime = operationTime;
        this.cityWideFlag = cityWideFlag;
        this.sortingStatus = sortingStatus;
        this.remark = remark;
        this.modifyTime = modifyTime;
        this.createTime = createTime;
    }

    /**
     *
     * @mbggenerated
     */
    public TbOrderOriginalInfo() {
        super();
    }

    /**
     * 主建
    
     * @return id 主建
     */
    public Integer getId() {
        return id;
    }

    /**
     * 主建
    
     * @param id 主建
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
     * 订单号
    
     * @return order_no 订单号
     */
    public String getOrderNo() {
        return orderNo;
    }

    /**
     * 订单号
    
     * @param orderNo 订单号
     */
    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo == null ? null : orderNo.trim();
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
     * 同城标识（1同城，0外阜）
    
     * @return city_wide_flag 同城标识（1同城，0外阜）
     */
    public Integer getCityWideFlag() {
        return cityWideFlag;
    }

    /**
     * 同城标识（1同城，0外阜）
    
     * @param cityWideFlag 同城标识（1同城，0外阜）
     */
    public void setCityWideFlag(Integer cityWideFlag) {
        this.cityWideFlag = cityWideFlag;
    }

    /**
     * 分拣码匹配状态（1已匹配、0未匹配）
    
     * @return sorting_status 分拣码匹配状态（1已匹配、0未匹配）
     */
    public Integer getSortingStatus() {
        return sortingStatus;
    }

    /**
     * 分拣码匹配状态（1已匹配、0未匹配）
    
     * @param sortingStatus 分拣码匹配状态（1已匹配、0未匹配）
     */
    public void setSortingStatus(Integer sortingStatus) {
        this.sortingStatus = sortingStatus;
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