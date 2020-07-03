package com.bjyx.entity.po;

import java.util.Date;

public class sysRole {
    /**
     * 角色主键 id
     */
    private Long id;

    /**
     * 角色编码 code
     */
    private String code;

    /**
     * 角色名称 name
     */
    private String name;

    /**
     * 删除标记:0未删除，1删除 is_delete
     */
    private Boolean isDelete;

    /**
     * 备注 mark
     */
    private String mark;

    /**
     * 创建日期 create_time
     */
    private Date createTime;

    /**
     * 创建用户 create_user
     */
    private String createUser;

    /**
     * 修改日期 update_time
     */
    private Date updateTime;

    /**
     * 修改用户 update_user
     */
    private String updateUser;

    /**
     * 时间戳 ts
     */
    private Date ts;

    /**
     *
     * @mbggenerated
     */
    public sysRole(Long id, String code, String name, Boolean isDelete, String mark, Date createTime, String createUser, Date updateTime, String updateUser, Date ts) {
        this.id = id;
        this.code = code;
        this.name = name;
        this.isDelete = isDelete;
        this.mark = mark;
        this.createTime = createTime;
        this.createUser = createUser;
        this.updateTime = updateTime;
        this.updateUser = updateUser;
        this.ts = ts;
    }

    /**
     *
     * @mbggenerated
     */
    public sysRole() {
        super();
    }

    /**
     * 角色主键
    
     * @return id 角色主键
     */
    public Long getId() {
        return id;
    }

    /**
     * 角色主键
    
     * @param id 角色主键
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * 角色编码
    
     * @return code 角色编码
     */
    public String getCode() {
        return code;
    }

    /**
     * 角色编码
    
     * @param code 角色编码
     */
    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    /**
     * 角色名称
    
     * @return name 角色名称
     */
    public String getName() {
        return name;
    }

    /**
     * 角色名称
    
     * @param name 角色名称
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
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
     * 备注
    
     * @return mark 备注
     */
    public String getMark() {
        return mark;
    }

    /**
     * 备注
    
     * @param mark 备注
     */
    public void setMark(String mark) {
        this.mark = mark == null ? null : mark.trim();
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
    
     * @return update_time 修改日期
     */
    public Date getUpdateTime() {
        return updateTime;
    }

    /**
     * 修改日期
    
     * @param updateTime 修改日期
     */
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    /**
     * 修改用户
    
     * @return update_user 修改用户
     */
    public String getUpdateUser() {
        return updateUser;
    }

    /**
     * 修改用户
    
     * @param updateUser 修改用户
     */
    public void setUpdateUser(String updateUser) {
        this.updateUser = updateUser == null ? null : updateUser.trim();
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