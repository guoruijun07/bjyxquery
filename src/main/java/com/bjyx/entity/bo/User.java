package com.bjyx.entity.bo;

import java.util.Set;

/**
 * @author GuoRJ
 * @date 2020/6/28 13:45
 */
public class User {

    private String id;
    private String username;
    private String password;
    /**
     * 用户对应的角色集合
     */
    private Set<Role> roles;

    public User(String id, String username, String password, Set<Role> roles) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.roles = roles;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }
}
