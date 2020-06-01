package com.bjyx.entity;

import java.util.Date;

public class TbUserInfo {
    /**
     *  id
     */
    private Integer id;

    /**
     * 登录用户名 username
     */
    private String username;

    /**
     * 密码 password
     */
    private String password;

    /**
     * 真实姓名 real_name
     */
    private String realName;

    /**
     * 手机号 mobile
     */
    private String mobile;

    /**
     * 手机串号 imei
     */
    private String imei;

    /**
     * PC网卡地址 mac
     */
    private String mac;

    /**
     * 用户状态:1生效，0失效 status
     */
    private Integer status;

    /**
     * token token
     */
    private String token;

    /**
     * token失效日期 invalid_date
     */
    private Date invalidDate;

    /**
     * 机构号 org_num
     */
    private Integer orgNum;

    /**
     * 机构名称 org_name
     */
    private String orgName;

    /**
     * 余额 remaining_sum
     */
    private Double remainingSum;

    /**
     * 项目归属地 project_base
     */
    private String projectBase;

    /**
     * 备注 remark
     */
    private String remark;

    /**
     * 创建时间 create_time
     */
    private Date createTime;

    /**
     *  receive1
     */
    private String receive1;

    /**
     *  receive3
     */
    private String receive3;

    /**
     *  receive2
     */
    private String receive2;

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
    public TbUserInfo(Integer id, String username, String password, String realName, String mobile, String imei, String mac, String token, Date invalidDate, Integer orgNum, String orgName, Double remainingSum, String projectBase, String remark, Date createTime, String receive1, String receive3, String receive2, String receive4, String receive5) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.realName = realName;
        this.mobile = mobile;
        this.imei = imei;
        this.mac = mac;
        this.token = token;
        this.invalidDate = invalidDate;
        this.orgNum = orgNum;
        this.orgName = orgName;
        this.remainingSum = remainingSum;
        this.projectBase = projectBase;
        this.remark = remark;
        this.createTime = createTime;
        this.receive1 = receive1;
        this.receive3 = receive3;
        this.receive2 = receive2;
        this.receive4 = receive4;
        this.receive5 = receive5;
    }

    /**
     *
     * @mbggenerated
     */
    public TbUserInfo(Integer id, String username, String password, String realName, String mobile, String imei, String mac, Integer status, String token, Date invalidDate, Integer orgNum, String orgName, Double remainingSum, String projectBase, String remark, Date createTime, String receive1, String receive3, String receive2, String receive4, String receive5) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.realName = realName;
        this.mobile = mobile;
        this.imei = imei;
        this.mac = mac;
        this.status = status;
        this.token = token;
        this.invalidDate = invalidDate;
        this.orgNum = orgNum;
        this.orgName = orgName;
        this.remainingSum = remainingSum;
        this.projectBase = projectBase;
        this.remark = remark;
        this.createTime = createTime;
        this.receive1 = receive1;
        this.receive3 = receive3;
        this.receive2 = receive2;
        this.receive4 = receive4;
        this.receive5 = receive5;
    }

    /**
     *
     * @mbggenerated
     */
    public TbUserInfo() {
        super();
    }

    /**
     * 
    
     * @return id 
     */
    public Integer getId() {
        return id;
    }

    /**
     * 
    
     * @param id 
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 登录用户名
    
     * @return username 登录用户名
     */
    public String getUsername() {
        return username;
    }

    /**
     * 登录用户名
    
     * @param username 登录用户名
     */
    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    /**
     * 密码
    
     * @return password 密码
     */
    public String getPassword() {
        return password;
    }

    /**
     * 密码
    
     * @param password 密码
     */
    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    /**
     * 真实姓名
    
     * @return real_name 真实姓名
     */
    public String getRealName() {
        return realName;
    }

    /**
     * 真实姓名
    
     * @param realName 真实姓名
     */
    public void setRealName(String realName) {
        this.realName = realName == null ? null : realName.trim();
    }

    /**
     * 手机号
    
     * @return mobile 手机号
     */
    public String getMobile() {
        return mobile;
    }

    /**
     * 手机号
    
     * @param mobile 手机号
     */
    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    /**
     * 手机串号
    
     * @return imei 手机串号
     */
    public String getImei() {
        return imei;
    }

    /**
     * 手机串号
    
     * @param imei 手机串号
     */
    public void setImei(String imei) {
        this.imei = imei == null ? null : imei.trim();
    }

    /**
     * PC网卡地址
    
     * @return mac PC网卡地址
     */
    public String getMac() {
        return mac;
    }

    /**
     * PC网卡地址
    
     * @param mac PC网卡地址
     */
    public void setMac(String mac) {
        this.mac = mac == null ? null : mac.trim();
    }

    /**
     * 用户状态:1生效，0失效

     * @return status 用户状态:1生效，0失效
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * 用户状态:1生效，0失效

     * @param status 用户状态:1生效，0失效
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * token
    
     * @return token token
     */
    public String getToken() {
        return token;
    }

    /**
     * token
    
     * @param token token
     */
    public void setToken(String token) {
        this.token = token == null ? null : token.trim();
    }

    /**
     * token失效日期
    
     * @return invalid_date token失效日期
     */
    public Date getInvalidDate() {
        return invalidDate;
    }

    /**
     * token失效日期
    
     * @param invalidDate token失效日期
     */
    public void setInvalidDate(Date invalidDate) {
        this.invalidDate = invalidDate;
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
     * 余额
    
     * @return remaining_sum 余额
     */
    public Double getRemainingSum() {
        return remainingSum;
    }

    /**
     * 余额
    
     * @param remainingSum 余额
     */
    public void setRemainingSum(Double remainingSum) {
        this.remainingSum = remainingSum;
    }

    /**
     * 项目归属地
    
     * @return project_base 项目归属地
     */
    public String getProjectBase() {
        return projectBase;
    }

    /**
     * 项目归属地
    
     * @param projectBase 项目归属地
     */
    public void setProjectBase(String projectBase) {
        this.projectBase = projectBase == null ? null : projectBase.trim();
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
     * 
    
     * @return receive1 
     */
    public String getReceive1() {
        return receive1;
    }

    /**
     * 
    
     * @param receive1 
     */
    public void setReceive1(String receive1) {
        this.receive1 = receive1 == null ? null : receive1.trim();
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