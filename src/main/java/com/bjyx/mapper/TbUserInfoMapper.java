package com.bjyx.mapper;

import com.bjyx.entity.bo.UserInfoBO;
import com.bjyx.entity.po.TbUserInfo;
import com.bjyx.entity.vo.TbUserInfoVO;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.type.JdbcType;

import java.util.Date;

public interface TbUserInfoMapper {

    /**
     *
     * @mbggenerated
     */
    @Delete({
            "delete from tb_user_info",
            "where id = #{id,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer id);


    /**
     *
     * @mbggenerated
     */
    @Insert({
            "insert into tb_user_info (id, username, ",
            "password, real_name, ",
            "mobile, imei, mac, ",
            "status, token, invalid_date, ",
            "org_num, org_name, ",
            "remaining_sum, project_base, ",
            "remark, create_time, ",
            "receive1, receive3, ",
            "receive2, receive4, ",
            "receive5)",
            "values (#{id,jdbcType=INTEGER}, #{username,jdbcType=VARCHAR}, ",
            "#{password,jdbcType=VARCHAR}, #{realName,jdbcType=VARCHAR}, ",
            "#{mobile,jdbcType=VARCHAR}, #{imei,jdbcType=VARCHAR}, #{mac,jdbcType=VARCHAR}, ",
            "#{status,jdbcType=INTEGER}, #{token,jdbcType=VARCHAR}, #{invalidDate,jdbcType=DATE}, ",
            "#{orgNum,jdbcType=INTEGER}, #{orgName,jdbcType=VARCHAR}, ",
            "#{remainingSum,jdbcType=DOUBLE}, #{projectBase,jdbcType=VARCHAR}, ",
            "#{remark,jdbcType=VARCHAR}, #{createTime,jdbcType=TIMESTAMP}, ",
            "#{receive1,jdbcType=VARCHAR}, #{receive3,jdbcType=VARCHAR}, ",
            "#{receive2,jdbcType=VARCHAR}, #{receive4,jdbcType=VARCHAR}, ",
            "#{receive5,jdbcType=VARCHAR})"
    })
    int insert(TbUserInfo record);


    /**
     *
     * @mbggenerated
     */
    @Select({
            "select",
            "id, username, password, real_name, mobile, imei, mac, status, token, invalid_date, ",
            "org_num, org_name, remaining_sum, project_base, remark, create_time, receive1, ",
            "receive3, receive2, receive4, receive5",
            "from tb_user_info",
            "where id = #{id,jdbcType=INTEGER}"
    })
    @ConstructorArgs({
            @Arg(column="id", javaType=Integer.class, jdbcType=JdbcType.INTEGER, id=true),
            @Arg(column="username", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="password", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="real_name", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="mobile", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="imei", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="mac", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="status", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="token", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="invalid_date", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP),
            @Arg(column="org_num", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="org_name", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="remaining_sum", javaType=Double.class, jdbcType=JdbcType.DOUBLE),
            @Arg(column="project_base", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="remark", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="create_time", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP),
            @Arg(column="receive1", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="receive3", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="receive2", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="receive4", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="receive5", javaType=String.class, jdbcType=JdbcType.VARCHAR)
    })
    TbUserInfo selectByPrimaryKey(Integer id);


    /**
     *
     * @mbggenerated
     */
    @Select({
            "select",
            "id, username, password, real_name, mobile, imei, mac, status, token, invalid_date, ",
            "org_num, org_name, remaining_sum, project_base, remark, create_time, receive1, ",
            "receive3, receive2, receive4, receive5",
            "from tb_user_info",
            "where 1=1 and status = 1 and username = #{username,jdbcType=VARCHAR} and password = #{password,jdbcType=VARCHAR}",
    })
    @ConstructorArgs({
            @Arg(column="id", javaType=Integer.class, jdbcType=JdbcType.INTEGER, id=true),
            @Arg(column="username", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="password", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="real_name", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="mobile", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="imei", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="mac", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="status", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="token", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="invalid_date", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP),
            @Arg(column="org_num", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="org_name", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="remaining_sum", javaType=Double.class, jdbcType=JdbcType.DOUBLE),
            @Arg(column="project_base", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="remark", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="create_time", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP),
            @Arg(column="receive1", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="receive3", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="receive2", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="receive4", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="receive5", javaType=String.class, jdbcType=JdbcType.VARCHAR)
    })
    TbUserInfo selectByUserInfo(TbUserInfo tbUserInfo);

    /**
     *
     * @mbggenerated
     */
    @Select({
            "select",
            "id, username, password, real_name, mobile, imei, mac, status, token, invalid_date, ",
            "org_num, org_name, remaining_sum, project_base, remark, create_time, receive1, ",
            "receive3, receive2, receive4, receive5",
            "from tb_user_info",
            "where 1=1 and status = 1 and username = #{username,jdbcType=VARCHAR}",
    })
    @ConstructorArgs({
            @Arg(column="id", javaType=Integer.class, jdbcType=JdbcType.INTEGER, id=true),
            @Arg(column="username", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="password", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="real_name", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="mobile", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="imei", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="mac", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="status", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="token", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="invalid_date", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP),
            @Arg(column="org_num", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="org_name", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="remaining_sum", javaType=Double.class, jdbcType=JdbcType.DOUBLE),
            @Arg(column="project_base", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="remark", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="create_time", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP),
            @Arg(column="receive1", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="receive3", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="receive2", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="receive4", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="receive5", javaType=String.class, jdbcType=JdbcType.VARCHAR)
    })
    TbUserInfo selectByUserName(String username);

    /**
     *
     * @mbggenerated
     */
    @Select({
            "select",
            "id, username, password, real_name, mobile, imei, mac, status, token, invalid_date, ",
            "org_num, org_name, remaining_sum, project_base, remark, create_time, receive1, ",
            "receive3, receive2, receive4, receive5",
            "from tb_user_info",
            "where 1=1 and status = 1 and  mobile = #{mobile,jdbcType=VARCHAR} and IMEI = #{imei,jdbcType=VARCHAR}",
    })
    @ConstructorArgs({
            @Arg(column="id", javaType=Integer.class, jdbcType=JdbcType.INTEGER, id=true),
            @Arg(column="username", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="password", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="real_name", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="mobile", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="imei", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="mac", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="status", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="token", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="invalid_date", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP),
            @Arg(column="org_num", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="org_name", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="remaining_sum", javaType=Double.class, jdbcType=JdbcType.DOUBLE),
            @Arg(column="project_base", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="remark", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="create_time", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP),
            @Arg(column="receive1", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="receive3", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="receive2", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="receive4", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="receive5", javaType=String.class, jdbcType=JdbcType.VARCHAR)
    })
    TbUserInfo selectByMobileAndIMEI(TbUserInfoVO tbUserInfo);

    /**
     *
     * @mbggenerated
     */
    @Select({
            "select",
            "id, username, password, real_name, mobile, imei, mac, status, token, invalid_date, ",
            "org_num, org_name, remaining_sum, project_base, remark, create_time, receive1, ",
            "receive3, receive2, receive4, receive5",
            "from tb_user_info",
            "where 1=1  and  mobile = #{mobile,jdbcType=VARCHAR}",
    })
    @ConstructorArgs({
            @Arg(column="id", javaType=Integer.class, jdbcType=JdbcType.INTEGER, id=true),
            @Arg(column="username", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="password", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="real_name", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="mobile", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="imei", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="mac", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="status", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="token", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="invalid_date", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP),
            @Arg(column="org_num", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="org_name", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="remaining_sum", javaType=Double.class, jdbcType=JdbcType.DOUBLE),
            @Arg(column="project_base", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="remark", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="create_time", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP),
            @Arg(column="receive1", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="receive3", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="receive2", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="receive4", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="receive5", javaType=String.class, jdbcType=JdbcType.VARCHAR)
    })
    TbUserInfo selectByMobile(TbUserInfoVO tbUserInfo);

    /**
     *
     * @mbggenerated
     */
    @Select({
            "select",
            "id, username, password, real_name, mobile, imei, mac, status, token, invalid_date, ",
            "org_num, org_name, remaining_sum, project_base, remark, create_time, receive1, ",
            "receive3, receive2, receive4, receive5",
            "from tb_user_info",
            "where 1=1  and  token = #{token,jdbcType=VARCHAR}",
    })
    @ConstructorArgs({
            @Arg(column="id", javaType=Integer.class, jdbcType=JdbcType.INTEGER, id=true),
            @Arg(column="username", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="password", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="real_name", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="mobile", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="imei", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="mac", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="status", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="token", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="invalid_date", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP),
            @Arg(column="org_num", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="org_name", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="remaining_sum", javaType=Double.class, jdbcType=JdbcType.DOUBLE),
            @Arg(column="project_base", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="remark", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="create_time", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP),
            @Arg(column="receive1", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="receive3", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="receive2", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="receive4", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="receive5", javaType=String.class, jdbcType=JdbcType.VARCHAR)
    })
    TbUserInfo selectByToken(String token);

    @Update({
            "update tb_user_info",
            "set username = #{username,jdbcType=VARCHAR},",
            "password = #{password,jdbcType=VARCHAR},",
            "real_name = #{realName,jdbcType=VARCHAR},",
            "mobile = #{mobile,jdbcType=VARCHAR},",
            "imei = #{imei,jdbcType=VARCHAR},",
            "mac = #{mac,jdbcType=VARCHAR},",
            "status = #{status,jdbcType=INTEGER},",
            "token = #{token,jdbcType=VARCHAR},",
            "invalid_date = #{invalidDate,jdbcType=TIMESTAMP},",
            "org_num = #{orgNum,jdbcType=INTEGER},",
            "org_name = #{orgName,jdbcType=VARCHAR},",
            "remaining_sum = #{remainingSum,jdbcType=DOUBLE},",
            "project_base = #{projectBase,jdbcType=VARCHAR},",
            "remark = #{remark,jdbcType=VARCHAR},",
            "create_time = #{createTime,jdbcType=TIMESTAMP},",
            "receive1 = #{receive1,jdbcType=VARCHAR},",
            "receive3 = #{receive3,jdbcType=VARCHAR},",
            "receive2 = #{receive2,jdbcType=VARCHAR},",
            "receive4 = #{receive4,jdbcType=VARCHAR},",
            "receive5 = #{receive5,jdbcType=VARCHAR}",
            "where id = #{id,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(TbUserInfo record);

    /**
     *
     * @mbggenerated
     */
    @Update({
            "update tb_user_info",
            "set ",
            "imei = #{imei,jdbcType=VARCHAR},",
            "token = #{token,jdbcType=VARCHAR},",
            "invalid_date = #{invalidDate,jdbcType=TIMESTAMP}",
            "where id = #{id,jdbcType=INTEGER}"
    })
    int updateTokenByPrimaryKey(TbUserInfo record);

    /**
     *
     * @mbggenerated
     */
    @Update({
            "update tb_user_info",
            "set ",
            "imei = #{imei,jdbcType=VARCHAR}",
            "where id = #{id,jdbcType=INTEGER}"
    })
    int updateImeiByPrimaryKey(TbUserInfo record);

    /**
     *
     * @mbggenerated
     */
    @Update({
            "update tb_user_info",
            "set ",
            "remaining_sum = #{remainingSum,jdbcType=DOUBLE}",
            "where id = #{id,jdbcType=INTEGER}"
    })
    int updateRemainingSumByPrimaryKey(TbUserInfo record);


    /**
     *
     * @mbggenerated
     */
    @Select({
            "select",
            "id, username, password, real_name, mobile, imei, mac, status, token, invalid_date, ",
            "org_num, org_name, remaining_sum, project_base, remark, create_time, receive1, ",
            "receive3, receive2, receive4, receive5",
            "from tb_user_info",
            "where 1=1  and id = #{id,jdbcType=INTEGER}",
    })
    @Results({
            @Result(column="id", property = "id",javaType=Integer.class, jdbcType=JdbcType.INTEGER, id=true),
            @Result(column="username",property = "username", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Result(column="password", property = "password",javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Result(column="real_name", property = "realName",javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Result(column="mobile", property = "mobile",javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Result(column="imei", property = "imei",javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Result(column="mac", property = "mac",javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Result(column="status", property = "status",javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Result(column="token", property = "token",javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Result(column="invalid_date",property = "invalidDate", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP),
            @Result(column="org_num", property = "orgNum",javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Result(column="org_name", property = "orgName",javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Result(column="remaining_sum",property = "remainingSum", javaType=Double.class, jdbcType=JdbcType.DOUBLE),
            @Result(column="project_base", property = "projectBase",javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Result(column="remark", property = "remark",javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Result(column="create_time",property = "createTime", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP),
            @Result(column = "id", property = "sysRole", one = @One(select = "com.bjyx.mapper.SysRoleMapper.selectByUserId")),
            @Result(column = "id", property = "sysMenus", many = @Many(select = "com.bjyx.mapper.SysMenusMapper.selectByUserId")),
            @Result(column = "id", property = "permms", many = @Many(select = "com.bjyx.mapper.SysPermissionsMapper.selectByUserId")),
    })
    UserInfoBO selectById(Integer id);

}