package com.bjyx.mapper;

import com.bjyx.entity.po.sysPermissions;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.type.JdbcType;

import java.util.Date;

public interface sysPermissionsMapper {

    /**
     *
     * @mbggenerated
     */
    @Delete({
        "delete from sys_permissions",
        "where id = #{id,jdbcType=BIGINT}"
    })
    int deleteByPrimaryKey(Long id);

    /**
     *
     * @mbggenerated
     */
    @Insert({
        "insert into sys_permissions (id, parent_id, ",
        "code, name, icon, ",
        "type, url, is_delete, ",
        "create_time, create_user_id, ",
        "update_time, update_user, ",
        "ts)",
        "values (#{id,jdbcType=BIGINT}, #{parentId,jdbcType=BIGINT}, ",
        "#{code,jdbcType=VARCHAR}, #{name,jdbcType=VARCHAR}, #{icon,jdbcType=VARCHAR}, ",
        "#{type,jdbcType=BIT}, #{url,jdbcType=VARCHAR}, #{isDelete,jdbcType=BIT}, ",
        "#{createTime,jdbcType=TIMESTAMP}, #{createUserId,jdbcType=VARCHAR}, ",
        "#{updateTime,jdbcType=TIMESTAMP}, #{updateUser,jdbcType=VARCHAR}, ",
        "#{ts,jdbcType=TIMESTAMP})"
    })
    int insert(sysPermissions record);


    /**
     *
     * @mbggenerated
     */
    @Select({
        "select",
        "id, parent_id, code, name, icon, type, url, is_delete, create_time, create_user_id, ",
        "update_time, update_user, ts",
        "from sys_permissions",
        "where id = #{id,jdbcType=BIGINT}"
    })
    @ConstructorArgs({
        @Arg(column="id", javaType=Long.class, jdbcType=JdbcType.BIGINT, id=true),
        @Arg(column="parent_id", javaType=Long.class, jdbcType=JdbcType.BIGINT),
        @Arg(column="code", javaType=String.class, jdbcType=JdbcType.VARCHAR),
        @Arg(column="name", javaType=String.class, jdbcType=JdbcType.VARCHAR),
        @Arg(column="icon", javaType=String.class, jdbcType=JdbcType.VARCHAR),
        @Arg(column="type", javaType=Boolean.class, jdbcType=JdbcType.BIT),
        @Arg(column="url", javaType=String.class, jdbcType=JdbcType.VARCHAR),
        @Arg(column="is_delete", javaType=Boolean.class, jdbcType=JdbcType.BIT),
        @Arg(column="create_time", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP),
        @Arg(column="create_user_id", javaType=String.class, jdbcType=JdbcType.VARCHAR),
        @Arg(column="update_time", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP),
        @Arg(column="update_user", javaType=String.class, jdbcType=JdbcType.VARCHAR),
        @Arg(column="ts", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP)
    })
    sysPermissions selectByPrimaryKey(Long id);


    /**
     *
     * @mbggenerated
     */
    @Update({
        "update sys_permissions",
        "set parent_id = #{parentId,jdbcType=BIGINT},",
          "code = #{code,jdbcType=VARCHAR},",
          "name = #{name,jdbcType=VARCHAR},",
          "icon = #{icon,jdbcType=VARCHAR},",
          "type = #{type,jdbcType=BIT},",
          "url = #{url,jdbcType=VARCHAR},",
          "is_delete = #{isDelete,jdbcType=BIT},",
          "create_time = #{createTime,jdbcType=TIMESTAMP},",
          "create_user_id = #{createUserId,jdbcType=VARCHAR},",
          "update_time = #{updateTime,jdbcType=TIMESTAMP},",
          "update_user = #{updateUser,jdbcType=VARCHAR},",
          "ts = #{ts,jdbcType=TIMESTAMP}",
        "where id = #{id,jdbcType=BIGINT}"
    })
    int updateByPrimaryKey(sysPermissions record);
}