package com.bjyx.entity.po;

public class sysUserRoleRef {
    /**
     * 用户角色关联 id
     */
    private Long id;

    /**
     * 用户主键 user_id
     */
    private Long userId;

    /**
     * 角色主键 role_id
     */
    private Long roleId;

    /**
     *
     * @mbggenerated
     */
    public sysUserRoleRef(Long id, Long userId, Long roleId) {
        this.id = id;
        this.userId = userId;
        this.roleId = roleId;
    }

    /**
     *
     * @mbggenerated
     */
    public sysUserRoleRef() {
        super();
    }

    /**
     * 用户角色关联
    
     * @return id 用户角色关联
     */
    public Long getId() {
        return id;
    }

    /**
     * 用户角色关联
    
     * @param id 用户角色关联
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * 用户主键
    
     * @return user_id 用户主键
     */
    public Long getUserId() {
        return userId;
    }

    /**
     * 用户主键
    
     * @param userId 用户主键
     */
    public void setUserId(Long userId) {
        this.userId = userId;
    }

    /**
     * 角色主键
    
     * @return role_id 角色主键
     */
    public Long getRoleId() {
        return roleId;
    }

    /**
     * 角色主键
    
     * @param roleId 角色主键
     */
    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }
}