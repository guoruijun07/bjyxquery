package com.bjyx.entity.po;

public class SysUserRoleRef {
    /**
     * 用户角色关联 id
     */
    private Integer id;

    /**
     * 用户主键 user_id
     */
    private Integer userId;

    /**
     * 角色主键 role_id
     */
    private Integer roleId;

    /**
     *
     * @mbggenerated
     */
    public SysUserRoleRef(Integer id, Integer userId, Integer roleId) {
        this.id = id;
        this.userId = userId;
        this.roleId = roleId;
    }

    /**
     *
     * @mbggenerated
     */
    public SysUserRoleRef() {
        super();
    }

    /**
     * 用户角色关联
    
     * @return id 用户角色关联
     */
    public Integer getId() {
        return id;
    }

    /**
     * 用户角色关联
    
     * @param id 用户角色关联
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 用户主键
    
     * @return user_id 用户主键
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * 用户主键
    
     * @param userId 用户主键
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     * 角色主键
    
     * @return role_id 角色主键
     */
    public Integer getRoleId() {
        return roleId;
    }

    /**
     * 角色主键
    
     * @param roleId 角色主键
     */
    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }
}