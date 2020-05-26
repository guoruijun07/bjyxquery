package com.bjyx.entity;

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
     * 功能 1:pc 2：app  menu
     */
    private Integer menu;

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
     * 功能 1:pc 2：app
    
     * @return  menu 功能 1:pc 2：app
     */
    public Integer getMenu() {
        return menu;
    }

    /**
     * 功能 1:pc 2：app
    
     * @param menu 功能 1:pc 2：app
     */
    public void setMenu(Integer menu) {
        this.menu = menu;
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