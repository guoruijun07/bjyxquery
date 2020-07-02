package com.bjyx.mapper;


import com.bjyx.entity.po.sysRolePermissionsRef;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.type.JdbcType;

public interface sysRolePermissionsRefMapper {

    /**
     *
     * @mbggenerated
     */
    @Delete({
        "delete from sys_role_permissions_ref",
        "where id = #{id,jdbcType=BIGINT}"
    })
    int deleteByPrimaryKey(Long id);

    /**
     *
     * @mbggenerated
     */
    @Insert({
        "insert into sys_role_permissions_ref (id, permission_id, ",
        "role_id)",
        "values (#{id,jdbcType=BIGINT}, #{permissionId,jdbcType=BIGINT}, ",
        "#{roleId,jdbcType=BIGINT})"
    })
    int insert(sysRolePermissionsRef record);


    /**
     *
     * @mbggenerated
     */
    @Select({
        "select",
        "id, permission_id, role_id",
        "from sys_role_permissions_ref",
        "where id = #{id,jdbcType=BIGINT}"
    })
    @ConstructorArgs({
        @Arg(column="id", javaType=Long.class, jdbcType=JdbcType.BIGINT, id=true),
        @Arg(column="permission_id", javaType=Long.class, jdbcType=JdbcType.BIGINT),
        @Arg(column="role_id", javaType=Long.class, jdbcType=JdbcType.BIGINT)
    })
    sysRolePermissionsRef selectByPrimaryKey(Long id);

    /**
     *
     * @mbggenerated
     */
    @Update({
        "update sys_role_permissions_ref",
        "set permission_id = #{permissionId,jdbcType=BIGINT},",
          "role_id = #{roleId,jdbcType=BIGINT}",
        "where id = #{id,jdbcType=BIGINT}"
    })
    int updateByPrimaryKey(sysRolePermissionsRef record);
}