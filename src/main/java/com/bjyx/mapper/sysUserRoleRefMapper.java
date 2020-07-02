package com.bjyx.mapper;

import com.bjyx.entity.po.sysUserRoleRef;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.type.JdbcType;

public interface sysUserRoleRefMapper {


    /**
     *
     * @mbggenerated
     */
    @Delete({
        "delete from sys_user_role_ref",
        "where id = #{id,jdbcType=BIGINT}"
    })
    int deleteByPrimaryKey(Long id);

    /**
     *
     * @mbggenerated
     */
    @Insert({
        "insert into sys_user_role_ref (id, user_id, ",
        "role_id)",
        "values (#{id,jdbcType=BIGINT}, #{userId,jdbcType=BIGINT}, ",
        "#{roleId,jdbcType=BIGINT})"
    })
    int insert(sysUserRoleRef record);

    /**
     *
     * @mbggenerated
     */
    @Select({
        "select",
        "id, user_id, role_id",
        "from sys_user_role_ref",
        "where id = #{id,jdbcType=BIGINT}"
    })
    @ConstructorArgs({
        @Arg(column="id", javaType=Long.class, jdbcType=JdbcType.BIGINT, id=true),
        @Arg(column="user_id", javaType=Long.class, jdbcType=JdbcType.BIGINT),
        @Arg(column="role_id", javaType=Long.class, jdbcType=JdbcType.BIGINT)
    })
    sysUserRoleRef selectByPrimaryKey(Long id);

    /**
     *
     * @mbggenerated
     */
    @Update({
        "update sys_user_role_ref",
        "set user_id = #{userId,jdbcType=BIGINT},",
          "role_id = #{roleId,jdbcType=BIGINT}",
        "where id = #{id,jdbcType=BIGINT}"
    })
    int updateByPrimaryKey(sysUserRoleRef record);
}