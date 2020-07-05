package com.bjyx.mapper;

import com.bjyx.entity.po.SysRolePermissionRel;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.type.JdbcType;

public interface SysRolePermissionRelMapper {

    /**
     *
     * @mbggenerated
     */
    @Delete({
        "delete from sys_role_permission_rel",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer id);

    /**
     *
     * @mbggenerated
     */
    @Insert({
        "insert into sys_role_permission_rel (id, role_id, ",
        "permission_id)",
        "values (#{id,jdbcType=INTEGER}, #{roleId,jdbcType=INTEGER}, ",
        "#{permissionId,jdbcType=INTEGER})"
    })
    int insert(SysRolePermissionRel record);

    /**
     *
     * @mbggenerated
     */
    @Select({
        "select",
        "id, role_id, permission_id",
        "from sys_role_permission_rel",
        "where id = #{id,jdbcType=INTEGER}"
    })
    @ConstructorArgs({
        @Arg(column="id", javaType=Integer.class, jdbcType=JdbcType.INTEGER, id=true),
        @Arg(column="role_id", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
        @Arg(column="permission_id", javaType=Integer.class, jdbcType=JdbcType.INTEGER)
    })
    SysRolePermissionRel selectByPrimaryKey(Integer id);


    /**
     *
     * @mbggenerated
     */
    @Update({
        "update sys_role_permission_rel",
        "set role_id = #{roleId,jdbcType=INTEGER},",
          "permission_id = #{permissionId,jdbcType=INTEGER}",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(SysRolePermissionRel record);
}