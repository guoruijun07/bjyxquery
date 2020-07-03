package com.bjyx.entity.po;

import java.util.Date;

public class sysUser {
    /**
     * 用户主键 id
     */
    private Long id;

    /**
     * 登录账户 username
     */
    private String username;

    /**
     * 登录密码 password
     */
    private String password;

    /**
     * 盐值，密码秘钥 secretkey
     */
    private String secretkey;

    /**
     *  locked
     */
    private Boolean locked;

    /**
     * 真实姓名 real_name
     */
    private String realName;

    /**
     * 删除标记:0未删除，1删除 is_delete
     */
    private Boolean isDelete;

    /**
     * 创建日期 create_time
     */
    private Date createTime;

    /**
     * 创建用户 create_user
     */
    private String createUser;

    /**
     * 修改日期 update_user
     */
    private Date updateUser;

    /**
     * 修改用户 update_time
     */
    private Date updateTime;

    /**
     * 时间戳 ts
     */
    private Date ts;

    /**
     *
     * @mbggenerated
     */
    public sysUser(Long id, String username, String password, String secretkey, Boolean locked, String realName, Boolean isDelete, Date createTime, String createUser, Date updateUser, Date updateTime, Date ts) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.secretkey = secretkey;
        this.locked = locked;
        this.realName = realName;
        this.isDelete = isDelete;
        this.createTime = createTime;
        this.createUser = createUser;
        this.updateUser = updateUser;
        this.updateTime = updateTime;
        this.ts = ts;
    }

    /**
     *
     * @mbggenerated
     */
    public sysUser() {
        super();
    }

    /**
     * 用户主键
    
     * @return id 用户主键
     */
    public Long getId() {
        return id;
    }

    /**
     * 用户主键
    
     * @param id 用户主键
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * 登录账户
    
     * @return username 登录账户
     */
    public String getUsername() {
        return username;
    }

    /**
     * 登录账户
    
     * @param username 登录账户
     */
    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    /**
     * 登录密码
    
     * @return password 登录密码
     */
    public String getPassword() {
        return password;
    }

    /**
     * 登录密码
    
     * @param password 登录密码
     */
    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    /**
     * 盐值，密码秘钥
    
     * @return secretkey 盐值，密码秘钥
     */
    public String getSecretkey() {
        return secretkey;
    }

    /**
     * 盐值，密码秘钥
    
     * @param secretkey 盐值，密码秘钥
     */
    public void setSecretkey(String secretkey) {
        this.secretkey = secretkey == null ? null : secretkey.trim();
    }

    /**
     * 
    
     * @return locked 
     */
    public Boolean getLocked() {
        return locked;
    }

    /**
     * 
    
     * @param locked 
     */
    public void setLocked(Boolean locked) {
        this.locked = locked;
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
     * 删除标记:0未删除，1删除
    
     * @return is_delete 删除标记:0未删除，1删除
     */
    public Boolean getIsDelete() {
        return isDelete;
    }

    /**
     * 删除标记:0未删除，1删除
    
     * @param isDelete 删除标记:0未删除，1删除
     */
    public void setIsDelete(Boolean isDelete) {
        this.isDelete = isDelete;
    }

    /**
     * 创建日期
    
     * @return create_time 创建日期
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * 创建日期
    
     * @param createTime 创建日期
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * 创建用户
    
     * @return create_user 创建用户
     */
    public String getCreateUser() {
        return createUser;
    }

    /**
     * 创建用户
    
     * @param createUser 创建用户
     */
    public void setCreateUser(String createUser) {
        this.createUser = createUser == null ? null : createUser.trim();
    }

    /**
     * 修改日期
    
     * @return update_user 修改日期
     */
    public Date getUpdateUser() {
        return updateUser;
    }

    /**
     * 修改日期
    
     * @param updateUser 修改日期
     */
    public void setUpdateUser(Date updateUser) {
        this.updateUser = updateUser;
    }

    /**
     * 修改用户
    
     * @return update_time 修改用户
     */
    public Date getUpdateTime() {
        return updateTime;
    }

    /**
     * 修改用户
    
     * @param updateTime 修改用户
     */
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    /**
     * 时间戳
    
     * @return ts 时间戳
     */
    public Date getTs() {
        return ts;
    }

    /**
     * 时间戳
    
     * @param ts 时间戳
     */
    public void setTs(Date ts) {
        this.ts = ts;
    }
}