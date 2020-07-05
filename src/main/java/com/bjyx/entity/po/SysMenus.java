package com.bjyx.entity.po;

public class SysMenus {
    /**
     *  menu_id
     */
    private Integer menuId;

    /**
     *  menu_name
     */
    private String menuName;

    /**
     *  perms
     */
    private String perms;

    /**
     *  father_id
     */
    private Integer fatherId;

    /**
     *
     * @mbggenerated
     */
    public SysMenus(Integer menuId, String menuName, String perms, Integer fatherId) {
        this.menuId = menuId;
        this.menuName = menuName;
        this.perms = perms;
        this.fatherId = fatherId;
    }

    /**
     *
     * @mbggenerated
     */
    public SysMenus() {
        super();
    }

    /**
     * 
    
     * @return menu_id 
     */
    public Integer getMenuId() {
        return menuId;
    }

    /**
     * 
    
     * @param menuId 
     */
    public void setMenuId(Integer menuId) {
        this.menuId = menuId;
    }

    /**
     * 
    
     * @return menu_name 
     */
    public String getMenuName() {
        return menuName;
    }

    /**
     * 
    
     * @param menuName 
     */
    public void setMenuName(String menuName) {
        this.menuName = menuName == null ? null : menuName.trim();
    }

    /**
     * 
    
     * @return perms 
     */
    public String getPerms() {
        return perms;
    }

    /**
     * 
    
     * @param perms 
     */
    public void setPerms(String perms) {
        this.perms = perms == null ? null : perms.trim();
    }

    /**
     * 
    
     * @return father_id 
     */
    public Integer getFatherId() {
        return fatherId;
    }

    /**
     * 
    
     * @param fatherId 
     */
    public void setFatherId(Integer fatherId) {
        this.fatherId = fatherId;
    }
}