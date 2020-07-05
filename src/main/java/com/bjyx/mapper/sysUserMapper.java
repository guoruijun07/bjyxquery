package com.bjyx.mapper;

import com.bjyx.entity.po.SysUser;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.type.JdbcType;

import java.util.Date;

public interface SysUserMapper {

    /**
     *
     * @mbggenerated
     */
    @Delete({
        "delete from sys_user",
        "where id = #{id,jdbcType=BIGINT}"
    })
    int deleteByPrimaryKey(Long id);

    /**
     *
     * @mbggenerated
     */
    @Insert({
        "insert into sys_user (id, username, ",
        "password, secretkey, ",
        "locked, real_name, is_delete, ",
        "create_time, create_user, ",
        "update_user, update_time, ",
        "ts)",
        "values (#{id,jdbcType=BIGINT}, #{username,jdbcType=VARCHAR}, ",
        "#{password,jdbcType=VARCHAR}, #{secretkey,jdbcType=VARCHAR}, ",
        "#{locked,jdbcType=BIT}, #{realName,jdbcType=VARCHAR}, #{isDelete,jdbcType=BIT}, ",
        "#{createTime,jdbcType=TIMESTAMP}, #{createUser,jdbcType=VARCHAR}, ",
        "#{updateUser,jdbcType=TIMESTAMP}, #{updateTime,jdbcType=TIMESTAMP}, ",
        "#{ts,jdbcType=TIMESTAMP})"
    })
    int insert(SysUser record);


    /**
     *
     * @mbggenerated
     */
    @Select({
        "select",
        "id, username, password, secretkey, locked, real_name, is_delete, create_time, ",
        "create_user, update_user, update_time, ts",
        "from sys_user",
        "where id = #{id,jdbcType=BIGINT}"
    })
    @ConstructorArgs({
        @Arg(column="id", javaType=Long.class, jdbcType=JdbcType.BIGINT, id=true),
        @Arg(column="username", javaType=String.class, jdbcType=JdbcType.VARCHAR),
        @Arg(column="password", javaType=String.class, jdbcType=JdbcType.VARCHAR),
        @Arg(column="secretkey", javaType=String.class, jdbcType=JdbcType.VARCHAR),
        @Arg(column="locked", javaType=Boolean.class, jdbcType=JdbcType.BIT),
        @Arg(column="real_name", javaType=String.class, jdbcType=JdbcType.VARCHAR),
        @Arg(column="is_delete", javaType=Boolean.class, jdbcType=JdbcType.BIT),
        @Arg(column="create_time", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP),
        @Arg(column="create_user", javaType=String.class, jdbcType=JdbcType.VARCHAR),
        @Arg(column="update_user", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP),
        @Arg(column="update_time", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP),
        @Arg(column="ts", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP)
    })
    SysUser selectByPrimaryKey(Long id);

    /**
     *
     * @mbggenerated
     */
    @Update({
        "update sys_user",
        "set username = #{username,jdbcType=VARCHAR},",
          "password = #{password,jdbcType=VARCHAR},",
          "secretkey = #{secretkey,jdbcType=VARCHAR},",
          "locked = #{locked,jdbcType=BIT},",
          "real_name = #{realName,jdbcType=VARCHAR},",
          "is_delete = #{isDelete,jdbcType=BIT},",
          "create_time = #{createTime,jdbcType=TIMESTAMP},",
          "create_user = #{createUser,jdbcType=VARCHAR},",
          "update_user = #{updateUser,jdbcType=TIMESTAMP},",
          "update_time = #{updateTime,jdbcType=TIMESTAMP},",
          "ts = #{ts,jdbcType=TIMESTAMP}",
        "where id = #{id,jdbcType=BIGINT}"
    })
    int updateByPrimaryKey(SysUser record);
}