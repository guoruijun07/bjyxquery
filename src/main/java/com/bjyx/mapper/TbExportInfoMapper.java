package com.bjyx.mapper;


import com.bjyx.entity.TbExportInfo;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.type.JdbcType;

import java.util.Date;
import java.util.List;

public interface TbExportInfoMapper {
    /**
     *
     * @mbggenerated
     */
    @Delete({
            "delete from tb_export_info",
            "where id = #{id,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer id);

    /**
     *
     * @mbggenerated
     */
    @Insert({
            "insert into tb_export_info (id, user_id, ",
            "file_name, total_num, ",
            "sucess_num, money, ",
            "create_time, remark)",
            "values (#{id,jdbcType=INTEGER}, #{userId,jdbcType=INTEGER}, ",
            "#{fileName,jdbcType=VARCHAR}, #{totalNum,jdbcType=INTEGER}, ",
            "#{sucessNum,jdbcType=INTEGER}, #{money,jdbcType=DOUBLE}, ",
            "#{createTime,jdbcType=TIMESTAMP}, #{remark,jdbcType=VARCHAR})"
    })
    int insert(TbExportInfo record);

    /**
     *
     * @mbggenerated
     */
    @Select({
            "select",
            "id, user_id, file_name, total_num, sucess_num, money, create_time, remark",
            "from tb_export_info",
            "where id = #{id,jdbcType=INTEGER}"
    })
    @ConstructorArgs({
            @Arg(column="id", javaType=Integer.class, jdbcType=JdbcType.INTEGER, id=true),
            @Arg(column="user_id", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="file_name", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="total_num", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="sucess_num", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="money", javaType=Double.class, jdbcType=JdbcType.DOUBLE),
            @Arg(column="create_time", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP),
            @Arg(column="remark", javaType=String.class, jdbcType=JdbcType.VARCHAR)
    })
    TbExportInfo selectByPrimaryKey(Integer id);

    /**
     *
     * @mbggenerated
     */
    @Select({
            "select",
            "id, user_id, file_name, total_num, sucess_num, money, create_time, remark",
            "from tb_export_info",
            "where user_id = #{id,jdbcType=INTEGER}"
    })
    @ConstructorArgs({
            @Arg(column="id", javaType=Integer.class, jdbcType=JdbcType.INTEGER, id=true),
            @Arg(column="user_id", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="file_name", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="total_num", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="sucess_num", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="money", javaType=Double.class, jdbcType=JdbcType.DOUBLE),
            @Arg(column="create_time", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP),
            @Arg(column="remark", javaType=String.class, jdbcType=JdbcType.VARCHAR)
    })
    List<TbExportInfo> selectByUserId(Integer userId);

    /**
     *
     * @mbggenerated
     */
    @Update({
            "update tb_export_info",
            "set user_id = #{userId,jdbcType=INTEGER},",
            "file_name = #{fileName,jdbcType=VARCHAR},",
            "total_num = #{totalNum,jdbcType=INTEGER},",
            "sucess_num = #{sucessNum,jdbcType=INTEGER},",
            "money = #{money,jdbcType=DOUBLE},",
            "create_time = #{createTime,jdbcType=TIMESTAMP},",
            "remark = #{remark,jdbcType=VARCHAR}",
            "where id = #{id,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(TbExportInfo record);
}