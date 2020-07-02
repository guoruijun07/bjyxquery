package com.bjyx.entity.po;

public class sysRolePermissionsRef {
    /**
     * 用户角色关联 id
     */
    private Long id;

    /**
     * 用户主键 permission_id
     */
    private Long permissionId;

    /**
     * 角色主键 role_id
     */
    private Long roleId;

    /**
     *
     * @mbggenerated
     */
    public sysRolePermissionsRef(Long id, Long permissionId, Long roleId) {
        this.id = id;
        this.permissionId = permissionId;
        this.roleId = roleId;
    }

    /**
     *
     * @mbggenerated
     */
    public sysRolePermissionsRef() {
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
    
     * @return permission_id 用户主键
     */
    public Long getPermissionId() {
        return permissionId;
    }

    /**
     * 用户主键
    
     * @param permissionId 用户主键
     */
    public void setPermissionId(Long permissionId) {
        this.permissionId = permissionId;
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