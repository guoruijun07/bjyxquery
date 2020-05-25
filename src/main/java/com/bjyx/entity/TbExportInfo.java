package com.bjyx.entity;

import java.util.Date;

public class TbExportInfo {
    /**
     * 主建id id
     */
    private Integer id;

    /**
     * 用户Id user_id
     */
    private Integer userId;

    /**
     * 文件名 file_name
     */
    private String fileName;

    /**
     * 总条数 total_num
     */
    private Integer totalNum;

    /**
     * 成功条数 sucess_num
     */
    private Integer sucessNum;

    /**
     * 金额 money
     */
    private Double money;

    /**
     * 创建时间 create_time
     */
    private Date createTime;

    /**
     * 备注 remark
     */
    private String remark;

    /**
     *
     * @mbggenerated
     */
    public TbExportInfo(Integer id, Integer userId, String fileName, Integer totalNum, Integer sucessNum, Double money, Date createTime, String remark) {
        this.id = id;
        this.userId = userId;
        this.fileName = fileName;
        this.totalNum = totalNum;
        this.sucessNum = sucessNum;
        this.money = money;
        this.createTime = createTime;
        this.remark = remark;
    }

    /**
     *
     * @mbggenerated
     */
    public TbExportInfo() {
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
     * 用户Id
    
     * @return user_id 用户Id
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * 用户Id
    
     * @param userId 用户Id
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     * 文件名
    
     * @return file_name 文件名
     */
    public String getFileName() {
        return fileName;
    }

    /**
     * 文件名
    
     * @param fileName 文件名
     */
    public void setFileName(String fileName) {
        this.fileName = fileName == null ? null : fileName.trim();
    }

    /**
     * 总条数
    
     * @return total_num 总条数
     */
    public Integer getTotalNum() {
        return totalNum;
    }

    /**
     * 总条数
    
     * @param totalNum 总条数
     */
    public void setTotalNum(Integer totalNum) {
        this.totalNum = totalNum;
    }

    /**
     * 成功条数
    
     * @return sucess_num 成功条数
     */
    public Integer getSucessNum() {
        return sucessNum;
    }

    /**
     * 成功条数
    
     * @param sucessNum 成功条数
     */
    public void setSucessNum(Integer sucessNum) {
        this.sucessNum = sucessNum;
    }

    /**
     * 金额
    
     * @return money 金额
     */
    public Double getMoney() {
        return money;
    }

    /**
     * 金额
    
     * @param money 金额
     */
    public void setMoney(Double money) {
        this.money = money;
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
}