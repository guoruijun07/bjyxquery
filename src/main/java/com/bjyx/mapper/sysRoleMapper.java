package com.bjyx.mapper;

import com.bjyx.entity.po.SysRole;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.type.JdbcType;

import java.util.Date;

public interface SysRoleMapper {

    /**
     *
     * @mbggenerated
     */
    @Delete({
        "delete from sys_role",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer id);

    /**
     *
     * @mbggenerated
     */
    @Insert({
        "insert into sys_role (id, code, ",
        "name, is_delete, mark, ",
        "create_time, create_user, ",
        "update_time, update_user, ",
        "ts)",
        "values (#{id,jdbcType=INTEGER}, #{code,jdbcType=VARCHAR}, ",
        "#{name,jdbcType=VARCHAR}, #{isDelete,jdbcType=BIT}, #{mark,jdbcType=VARCHAR}, ",
        "#{createTime,jdbcType=TIMESTAMP}, #{createUser,jdbcType=VARCHAR}, ",
        "#{updateTime,jdbcType=TIMESTAMP}, #{updateUser,jdbcType=VARCHAR}, ",
        "#{ts,jdbcType=TIMESTAMP})"
    })
    int insert(SysRole record);

    /**
     *
     * @mbggenerated
     */
    @Select({
        "select",
        "id, code, name, is_delete, mark, create_time, create_user, update_time, update_user, ",
        "ts",
        "from sys_role",
        "where id = #{id,jdbcType=INTEGER}"
    })
    @ConstructorArgs({
        @Arg(column="id", javaType=Integer.class, jdbcType=JdbcType.INTEGER, id=true),
        @Arg(column="code", javaType=String.class, jdbcType=JdbcType.VARCHAR),
        @Arg(column="name", javaType=String.class, jdbcType=JdbcType.VARCHAR),
        @Arg(column="is_delete", javaType=Boolean.class, jdbcType=JdbcType.BIT),
        @Arg(column="mark", javaType=String.class, jdbcType=JdbcType.VARCHAR),
        @Arg(column="create_time", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP),
        @Arg(column="create_user", javaType=String.class, jdbcType=JdbcType.VARCHAR),
        @Arg(column="update_time", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP),
        @Arg(column="update_user", javaType=String.class, jdbcType=JdbcType.VARCHAR),
        @Arg(column="ts", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP)
    })
    SysRole selectByPrimaryKey(Integer id);


    /**
     *
     * @mbggenerated
     */
    @Update({
        "update sys_role",
        "set code = #{code,jdbcType=VARCHAR},",
          "name = #{name,jdbcType=VARCHAR},",
          "is_delete = #{isDelete,jdbcType=BIT},",
          "mark = #{mark,jdbcType=VARCHAR},",
          "create_time = #{createTime,jdbcType=TIMESTAMP},",
          "create_user = #{createUser,jdbcType=VARCHAR},",
          "update_time = #{updateTime,jdbcType=TIMESTAMP},",
          "update_user = #{updateUser,jdbcType=VARCHAR},",
          "ts = #{ts,jdbcType=TIMESTAMP}",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(SysRole record);

    /**
     *
     * @mbggenerated
     */
    @Select({
            "SELECT b.id, code, name, is_delete, mark, create_time, create_user, update_time, update_user, ts FROM sys_user_role_ref a",
            "LEFT JOIN sys_role b ON a.role_id=b.id AND b.is_delete=0 ",
            "where a.user_id = #{userId,jdbcType=INTEGER}"
    })
    @ConstructorArgs({
            @Arg(column="id", javaType=Integer.class, jdbcType=JdbcType.INTEGER, id=true),
            @Arg(column="code", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="name", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="is_delete", javaType=Boolean.class, jdbcType=JdbcType.BIT),
            @Arg(column="mark", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="create_time", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP),
            @Arg(column="create_user", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="update_time", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP),
            @Arg(column="update_user", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="ts", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP)
    })
    SysRole selectByUserId(Integer userId);
}