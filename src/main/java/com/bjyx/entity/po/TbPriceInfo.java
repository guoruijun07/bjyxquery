package com.bjyx.entity.po;

public class TbPriceInfo {
    /**
     *  id
     */
    private Integer id;

    /**
     *  user_id
     */
    private Integer userId;

    /**
     * 菜单: 0:根据数据设备查询 1:匹配查询，2:地址查询，3:面单打印 menu
     */
    private Integer menu;

    /**
     * 数据来源: 0:根据菜单查询 :1WEB，2APP，3接口 source
     */
    private Integer source;


    /**
     * 单价:元 price
     */
    private Double price;

    /**
     *
     * @mbggenerated
     */
    public TbPriceInfo(Integer id, Integer userId, Integer menu, Double price) {
        this.id = id;
        this.userId = userId;
        this.menu = menu;
        this.price = price;
    }

    /**
     *
     * @mbggenerated
     */
    public TbPriceInfo(Integer id, Integer userId, Integer menu, Integer source, Double price) {
        this.id = id;
        this.userId = userId;
        this.menu = menu;
        this.source = source;
        this.price = price;
    }

    /**
     *
     * @mbggenerated
     */
    public TbPriceInfo() {
        super();
    }

    /**
     * 
    
     * @return id 
     */
    public Integer getId() {
        return id;
    }

    /**
     * 
    
     * @param id 
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 
    
     * @return user_id 
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * 
    
     * @param userId 
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     * 菜单: 0:根据数据设备查询 1:匹配查询，2:地址查询，3:面单打印

     * @return menu 菜单: 0:根据数据设备查询 1:匹配查询，2:地址查询，3:面单打印
     */
    public Integer getMenu() {
        return menu;
    }

    /**
     * 菜单: 0:根据数据设备查询 1:匹配查询，2:地址查询，3:面单打印

     * @param menu 菜单: 0:根据数据设备查询 1:匹配查询，2:地址查询，3:面单打印
     */
    public void setMenu(Integer menu) {
        this.menu = menu;
    }

    /**
     * 数据来源: 0:根据菜单查询 :1WEB，2APP，3接口

     * @return source 数据来源: 0:根据菜单查询 :1WEB，2APP，3接口
     */
    public Integer getSource() {
        return source;
    }

    /**
     * 数据来源: 0:根据菜单查询 :1WEB，2APP，3接口

     * @param source 数据来源: 0:根据菜单查询 :1WEB，2APP，3接口
     */
    public void setSource(Integer source) {
        this.source = source;
    }

    /**
     * 单价:元
    
     * @return price 单价:元
     */
    public Double getPrice() {
        return price;
    }

    /**
     * 单价:元
    
     * @param price 单价:元
     */
    public void setPrice(Double price) {
        this.price = price;
    }
}