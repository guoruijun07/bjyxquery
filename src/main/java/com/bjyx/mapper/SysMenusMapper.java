package com.bjyx.mapper;

import com.bjyx.entity.po.SysMenus;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.type.JdbcType;

public interface SysMenusMapper {

    /**
     *
     * @mbggenerated
     */
    @Delete({
            "delete from sys_menus",
            "where menu_id = #{menuId,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer menuId);

    /**
     *
     * @mbggenerated
     */
    @Insert({
            "insert into sys_menus (menu_id, menu_name, ",
            "perms, father_id)",
            "values (#{menuId,jdbcType=INTEGER}, #{menuName,jdbcType=VARCHAR}, ",
            "#{perms,jdbcType=VARCHAR}, #{fatherId,jdbcType=INTEGER})"
    })
    int insert(SysMenus record);

    /**
     *
     * @mbggenerated
     */
    @Select({
            "select",
            "menu_id, menu_name, perms, father_id",
            "from sys_menus",
            "where menu_id = #{menuId,jdbcType=INTEGER}"
    })
    @ConstructorArgs({
            @Arg(column="menu_id", javaType=Integer.class, jdbcType=JdbcType.INTEGER, id=true),
            @Arg(column="menu_name", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="perms", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="father_id", javaType=Integer.class, jdbcType=JdbcType.INTEGER)
    })
    SysMenus selectByPrimaryKey(Integer menuId);

    /**
     *
     * @mbggenerated
     */
    @Update({
            "update sys_menus",
            "set menu_name = #{menuName,jdbcType=VARCHAR},",
            "perms = #{perms,jdbcType=VARCHAR},",
            "father_id = #{fatherId,jdbcType=INTEGER}",
            "where menu_id = #{menuId,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(SysMenus record);

    /**
     *
     * @mbggenerated
     */
    @Select({
            "SELECT d.menu_id, menu_name, perms, father_id FROM sys_user_role_ref a",
            "LEFT JOIN sys_role b ON a.role_id=b.id AND b.is_delete=0",
            "LEFT JOIN sys_role_menus_ref c ON c.role_id=b.id",
            "LEFT JOIN sys_menus d ON c.menu_id= d.menu_id",
            "WHERE a.user_id = #{userId,jdbcType=INTEGER}"

    })
    @ConstructorArgs({
            @Arg(column="menu_id", javaType=Integer.class, jdbcType=JdbcType.INTEGER, id=true),
            @Arg(column="menu_name", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="perms", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="father_id", javaType=Integer.class, jdbcType=JdbcType.INTEGER)
    })
    SysMenus selectByUserId(Integer userId);
}