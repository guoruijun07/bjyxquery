package com.bjyx.entity.po;

public class SysRolePermissionRel {
    /**
     * 自增Id id
     */
    private Integer id;

    /**
     * 角色id role_id
     */
    private Integer roleId;

    /**
     * 权限id permission_id
     */
    private Integer permissionId;

    /**
     *
     * @mbggenerated
     */
    public SysRolePermissionRel(Integer id, Integer roleId, Integer permissionId) {
        this.id = id;
        this.roleId = roleId;
        this.permissionId = permissionId;
    }

    /**
     *
     * @mbggenerated
     */
    public SysRolePermissionRel() {
        super();
    }

    /**
     * 自增Id
    
     * @return id 自增Id
     */
    public Integer getId() {
        return id;
    }

    /**
     * 自增Id
    
     * @param id 自增Id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 角色id
    
     * @return role_id 角色id
     */
    public Integer getRoleId() {
        return roleId;
    }

    /**
     * 角色id
    
     * @param roleId 角色id
     */
    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    /**
     * 权限id
    
     * @return permission_id 权限id
     */
    public Integer getPermissionId() {
        return permissionId;
    }

    /**
     * 权限id
    
     * @param permissionId 权限id
     */
    public void setPermissionId(Integer permissionId) {
        this.permissionId = permissionId;
    }
}