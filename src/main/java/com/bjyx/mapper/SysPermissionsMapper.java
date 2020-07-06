package com.bjyx.mapper;

import com.bjyx.entity.po.SysPermissions;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.type.JdbcType;

import java.util.Date;
import java.util.List;

public interface SysPermissionsMapper {

    /**
     *
     * @mbggenerated
     */
    @Delete({
            "delete from sys_permissions",
            "where id = #{id,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer id);

    /**
     *
     * @mbggenerated
     */
    @Insert({
            "insert into sys_permissions (id, menu_id, ",
            "parent_id, code, ",
            "url, perms, name, ",
            "icon, type, is_delete, ",
            "create_time, create_user_id, ",
            "update_time, update_user, ",
            "ts)",
            "values (#{id,jdbcType=INTEGER}, #{menuId,jdbcType=INTEGER}, ",
            "#{parentId,jdbcType=INTEGER}, #{code,jdbcType=VARCHAR}, ",
            "#{url,jdbcType=VARCHAR}, #{perms,jdbcType=VARCHAR}, #{name,jdbcType=VARCHAR}, ",
            "#{icon,jdbcType=VARCHAR}, #{type,jdbcType=BIT}, #{isDelete,jdbcType=BIT}, ",
            "#{createTime,jdbcType=TIMESTAMP}, #{createUserId,jdbcType=VARCHAR}, ",
            "#{updateTime,jdbcType=TIMESTAMP}, #{updateUser,jdbcType=VARCHAR}, ",
            "#{ts,jdbcType=TIMESTAMP})"
    })
    int insert(SysPermissions record);

    /**
     *
     * @mbggenerated
     */
    @Select({
            "select",
            "id, menu_id, parent_id, code, url, perms, name, icon, type, is_delete, create_time, ",
            "create_user_id, update_time, update_user, ts",
            "from sys_permissions",
            "where id = #{id,jdbcType=INTEGER}"
    })
    @ConstructorArgs({
            @Arg(column="id", javaType=Integer.class, jdbcType= JdbcType.INTEGER, id=true),
            @Arg(column="menu_id", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="parent_id", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="code", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="url", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="perms", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="name", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="icon", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="type", javaType=Boolean.class, jdbcType=JdbcType.BIT),
            @Arg(column="is_delete", javaType=Boolean.class, jdbcType=JdbcType.BIT),
            @Arg(column="create_time", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP),
            @Arg(column="create_user_id", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="update_time", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP),
            @Arg(column="update_user", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="ts", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP)
    })
    SysPermissions selectByPrimaryKey(Integer id);

    /**
     *
     * @mbggenerated
     */
    @Update({
            "update sys_permissions",
            "set menu_id = #{menuId,jdbcType=INTEGER},",
            "parent_id = #{parentId,jdbcType=INTEGER},",
            "code = #{code,jdbcType=VARCHAR},",
            "url = #{url,jdbcType=VARCHAR},",
            "perms = #{perms,jdbcType=VARCHAR},",
            "name = #{name,jdbcType=VARCHAR},",
            "icon = #{icon,jdbcType=VARCHAR},",
            "type = #{type,jdbcType=BIT},",
            "is_delete = #{isDelete,jdbcType=BIT},",
            "create_time = #{createTime,jdbcType=TIMESTAMP},",
            "create_user_id = #{createUserId,jdbcType=VARCHAR},",
            "update_time = #{updateTime,jdbcType=TIMESTAMP},",
            "update_user = #{updateUser,jdbcType=VARCHAR},",
            "ts = #{ts,jdbcType=TIMESTAMP}",
            "where id = #{id,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(SysPermissions record);

    /**
     *
     * @mbggenerated
     */
    @Select({
            " select id, menu_id, parent_id, code, url, perms, name, icon, type, is_delete, create_time,  create_user_id, update_time, update_user, ts ",
            "from sys_permissions",
    })
    @ConstructorArgs({
            @Arg(column="id", javaType=Integer.class, jdbcType= JdbcType.INTEGER, id=true),
            @Arg(column="menu_id", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="parent_id", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="code", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="url", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="perms", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="name", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="icon", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="type", javaType=Boolean.class, jdbcType=JdbcType.BIT),
            @Arg(column="is_delete", javaType=Boolean.class, jdbcType=JdbcType.BIT),
            @Arg(column="create_time", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP),
            @Arg(column="create_user_id", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="update_time", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP),
            @Arg(column="update_user", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="ts", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP)
    })
    List<SysPermissions> selectALL();

    /**
     *
     * @mbggenerated
     */
    @Select({
            " select d.id, d.menu_id, d.parent_id, d.code, d.url, d.perms, d.name, d.icon, d.type, d.is_delete, d.create_time,  d.create_user_id, d.update_time, d.update_user, d.ts ",
            "from sys_user_role_ref a",
            "LEFT JOIN sys_role b ON a.role_id=b.id AND b.is_delete=0",
            "LEFT JOIN sys_role_permission_rel c ON c.role_id=b.id",
            "LEFT JOIN sys_permissions d ON c.permission_id= d.id",
            "WHERE a.user_id = #{userId,jdbcType=INTEGER}"
    })
    @ConstructorArgs({
            @Arg(column="id", javaType=Integer.class, jdbcType= JdbcType.INTEGER, id=true),
            @Arg(column="menu_id", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="parent_id", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="code", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="url", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="perms", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="name", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="icon", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="type", javaType=Boolean.class, jdbcType=JdbcType.BIT),
            @Arg(column="is_delete", javaType=Boolean.class, jdbcType=JdbcType.BIT),
            @Arg(column="create_time", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP),
            @Arg(column="create_user_id", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="update_time", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP),
            @Arg(column="update_user", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="ts", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP)
    })
    List<SysPermissions> selectByUserId(Integer userId);
}