package com.bjyx.entity.po;

public class SysRoleMenusRef {
    /**
     * 用户角色关联 id
     */
    private Integer id;

    /**
     * 用户主键 permission_id
     */
    private Integer permissionId;

    /**
     * 角色主键 role_id
     */
    private Integer roleId;

    /**
     *
     * @mbggenerated
     */
    public SysRoleMenusRef(Integer id, Integer permissionId, Integer roleId) {
        this.id = id;
        this.permissionId = permissionId;
        this.roleId = roleId;
    }

    /**
     *
     * @mbggenerated
     */
    public SysRoleMenusRef() {
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
    
     * @return permission_id 用户主键
     */
    public Integer getPermissionId() {
        return permissionId;
    }

    /**
     * 用户主键
    
     * @param permissionId 用户主键
     */
    public void setPermissionId(Integer permissionId) {
        this.permissionId = permissionId;
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