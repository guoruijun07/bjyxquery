package com.bjyx.entity.bo;

import com.bjyx.entity.po.SysMenus;
import com.bjyx.entity.po.SysPermissions;
import com.bjyx.entity.po.SysRole;
import com.bjyx.entity.po.TbUserInfo;

import java.util.List;

public class UserInfoBO extends TbUserInfo {

    private SysRole sysRole;
    private List<SysMenus> sysMenus;
    private List<SysPermissions> permms;

    public SysRole getSysRole() {
        return sysRole;
    }

    public void setSysRole(SysRole sysRole) {
        this.sysRole = sysRole;
    }

    public List<SysMenus> getSysMenus() {
        return sysMenus;
    }

    public void setSysMenus(List<SysMenus> sysMenus) {
        this.sysMenus = sysMenus;
    }

    public List<SysPermissions> getPermms() {
        return permms;
    }

    public void setPermms(List<SysPermissions> permms) {
        this.permms = permms;
    }
}
