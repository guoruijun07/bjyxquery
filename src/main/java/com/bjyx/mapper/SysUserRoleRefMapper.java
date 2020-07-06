package com.bjyx.mapper;

import com.bjyx.entity.po.SysUserRoleRef;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.type.JdbcType;

public interface SysUserRoleRefMapper {

    /**
     *
     * @mbggenerated
     */
    @Delete({
        "delete from sys_user_role_ref",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer id);

    /**
     *
     * @mbggenerated
     */
    @Insert({
        "insert into sys_user_role_ref (id, user_id, ",
        "role_id)",
        "values (#{id,jdbcType=INTEGER}, #{userId,jdbcType=INTEGER}, ",
        "#{roleId,jdbcType=INTEGER})"
    })
    int insert(SysUserRoleRef record);

    /**
     *
     * @mbggenerated
     */
    @Select({
        "select",
        "id, user_id, role_id",
        "from sys_user_role_ref",
        "where id = #{id,jdbcType=INTEGER}"
    })
    @ConstructorArgs({
        @Arg(column="id", javaType=Integer.class, jdbcType=JdbcType.INTEGER, id=true),
        @Arg(column="user_id", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
        @Arg(column="role_id", javaType=Integer.class, jdbcType=JdbcType.INTEGER)
    })
    SysUserRoleRef selectByPrimaryKey(Integer id);

    /**
     *
     * @mbggenerated
     */
    @Update({
        "update sys_user_role_ref",
        "set user_id = #{userId,jdbcType=INTEGER},",
          "role_id = #{roleId,jdbcType=INTEGER}",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(SysUserRoleRef record);


}