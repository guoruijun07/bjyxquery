package com.bjyx.mapper;

import com.bjyx.entity.po.SysRoleMenusRef;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.type.JdbcType;

public interface SysRoleMenusRefMapper {

    /**
     *
     * @mbggenerated
     */
    @Delete({
        "delete from sys_role_menus_ref",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer id);

    /**
     *
     * @mbggenerated
     */
    @Insert({
        "insert into sys_role_menus_ref (id, permission_id, ",
        "role_id)",
        "values (#{id,jdbcType=INTEGER}, #{permissionId,jdbcType=INTEGER}, ",
        "#{roleId,jdbcType=INTEGER})"
    })
    int insert(SysRoleMenusRef record);

    /**
     *
     * @mbggenerated
     */
    @Select({
        "select",
        "id, permission_id, role_id",
        "from sys_role_menus_ref",
        "where id = #{id,jdbcType=INTEGER}"
    })
    @ConstructorArgs({
        @Arg(column="id", javaType=Integer.class, jdbcType=JdbcType.INTEGER, id=true),
        @Arg(column="permission_id", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
        @Arg(column="role_id", javaType=Integer.class, jdbcType=JdbcType.INTEGER)
    })
    SysRoleMenusRef selectByPrimaryKey(Integer id);

    /**
     *
     * @mbggenerated
     */
    @Update({
        "update sys_role_menus_ref",
        "set permission_id = #{permissionId,jdbcType=INTEGER},",
          "role_id = #{roleId,jdbcType=INTEGER}",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(SysRoleMenusRef record);
}