package com.bjyx.entity.po;

import java.util.Date;

public class sysPermissions {
    /**
     * 功能主键 id
     */
    private Long id;

    /**
     * 父级主键 parent_id
     */
    private Long parentId;

    /**
     * 编码 code
     */
    private String code;

    /**
     * 名称 name
     */
    private String name;

    /**
     * 图标 icon
     */
    private String icon;

    /**
     * 项目类型:1-菜单2-按钮3-链接4-表单 type
     */
    private Boolean type;

    /**
     * url地址 url
     */
    private String url;

    /**
     * 删除标记:0未删除，1删除 is_delete
     */
    private Boolean isDelete;

    /**
     * 创建日期 create_time
     */
    private Date createTime;

    /**
     * 创建用户 create_user_id
     */
    private String createUserId;

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
    public sysPermissions(Long id, Long parentId, String code, String name, String icon, Boolean type, String url, Boolean isDelete, Date createTime, String createUserId, Date updateTime, String updateUser, Date ts) {
        this.id = id;
        this.parentId = parentId;
        this.code = code;
        this.name = name;
        this.icon = icon;
        this.type = type;
        this.url = url;
        this.isDelete = isDelete;
        this.createTime = createTime;
        this.createUserId = createUserId;
        this.updateTime = updateTime;
        this.updateUser = updateUser;
        this.ts = ts;
    }

    /**
     *
     * @mbggenerated
     */
    public sysPermissions() {
        super();
    }

    /**
     * 功能主键
    
     * @return id 功能主键
     */
    public Long getId() {
        return id;
    }

    /**
     * 功能主键
    
     * @param id 功能主键
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * 父级主键
    
     * @return parent_id 父级主键
     */
    public Long getParentId() {
        return parentId;
    }

    /**
     * 父级主键
    
     * @param parentId 父级主键
     */
    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    /**
     * 编码
    
     * @return code 编码
     */
    public String getCode() {
        return code;
    }

    /**
     * 编码
    
     * @param code 编码
     */
    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    /**
     * 名称
    
     * @return name 名称
     */
    public String getName() {
        return name;
    }

    /**
     * 名称
    
     * @param name 名称
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * 图标
    
     * @return icon 图标
     */
    public String getIcon() {
        return icon;
    }

    /**
     * 图标
    
     * @param icon 图标
     */
    public void setIcon(String icon) {
        this.icon = icon == null ? null : icon.trim();
    }

    /**
     * 项目类型:1-菜单2-按钮3-链接4-表单
    
     * @return type 项目类型:1-菜单2-按钮3-链接4-表单
     */
    public Boolean getType() {
        return type;
    }

    /**
     * 项目类型:1-菜单2-按钮3-链接4-表单
    
     * @param type 项目类型:1-菜单2-按钮3-链接4-表单
     */
    public void setType(Boolean type) {
        this.type = type;
    }

    /**
     * url地址
    
     * @return url url地址
     */
    public String getUrl() {
        return url;
    }

    /**
     * url地址
    
     * @param url url地址
     */
    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
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
    
     * @return create_user_id 创建用户
     */
    public String getCreateUserId() {
        return createUserId;
    }

    /**
     * 创建用户
    
     * @param createUserId 创建用户
     */
    public void setCreateUserId(String createUserId) {
        this.createUserId = createUserId == null ? null : createUserId.trim();
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