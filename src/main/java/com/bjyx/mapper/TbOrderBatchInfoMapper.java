package com.bjyx.mapper;

import com.bjyx.entity.po.TbOrderBatchInfo;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.type.JdbcType;

import java.util.Date;
import java.util.List;

public interface TbOrderBatchInfoMapper {

    /**
     *
     * @mbggenerated
     */
    @Delete({
        "delete from tb_order_batch_info",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer id);

    /**
     *
     * @mbggenerated
     */
    @Insert({
        "insert into tb_order_batch_info (batch_no, ",
        "file_name, total_num, ",
        "success_num, money, ",
        "status,user_id, modify_time, ",
        "create_time)",
        "values ( #{batchNo,jdbcType=VARCHAR}, ",
        "#{fileName,jdbcType=VARCHAR}, #{totalNum,jdbcType=INTEGER}, ",
        "#{successNum,jdbcType=INTEGER}, #{money,jdbcType=DOUBLE}, ",
        "#{status,jdbcType=INTEGER}, #{userId,jdbcType=INTEGER},#{modifyTime,jdbcType=TIMESTAMP}, ",
        "#{createTime,jdbcType=TIMESTAMP})"
    })
    @Options(useGeneratedKeys = true, keyProperty = "id")
    int insert(TbOrderBatchInfo record);


    /**
     *
     * @mbggenerated
     */
    @Select({
        "select",
        "id, batch_no, file_name, total_num, success_num, money, status,user_id, modify_time, ",
        "create_time",
        "from tb_order_batch_info",
        "where id = #{id,jdbcType=INTEGER}"
    })
    @ConstructorArgs({
        @Arg(column="id", javaType=Integer.class, jdbcType=JdbcType.INTEGER, id=true),
        @Arg(column="batch_no", javaType=String.class, jdbcType=JdbcType.VARCHAR),
        @Arg(column="file_name", javaType=String.class, jdbcType=JdbcType.VARCHAR),
        @Arg(column="total_num", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
        @Arg(column="success_num", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
        @Arg(column="money", javaType=Double.class, jdbcType=JdbcType.DOUBLE),
        @Arg(column="status", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
        @Arg(column="user_id", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
        @Arg(column="modify_time", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP),
        @Arg(column="create_time", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP)
    })
    TbOrderBatchInfo selectByPrimaryKey(Integer id);


    /**
     *
     * @mbggenerated
     */
    @Select({
            "select",
            "id, batch_no, file_name, total_num, success_num, money, status,user_id, modify_time, ",
            "create_time",
            "from tb_order_batch_info",
            "where user_id = #{userId,jdbcType=INTEGER}"
    })
    @ConstructorArgs({
            @Arg(column="id", javaType=Integer.class, jdbcType=JdbcType.INTEGER, id=true),
            @Arg(column="batch_no", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="file_name", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="total_num", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="success_num", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="money", javaType=Double.class, jdbcType=JdbcType.DOUBLE),
            @Arg(column="status", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="user_id", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="modify_time", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP),
            @Arg(column="create_time", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP)
    })
    List<TbOrderBatchInfo> selectByUserId(Integer id);

    /**
     *
     * @mbggenerated
     */
    @Select({
            "select",
            "id, batch_no, file_name, total_num, success_num, money, status,user_id, modify_time, ",
            "create_time",
            "from tb_order_batch_info",
            "where batch_no = #{batchNo,jdbcType=VARCHAR}"
    })
    @ConstructorArgs({
            @Arg(column="id", javaType=Integer.class, jdbcType=JdbcType.INTEGER, id=true),
            @Arg(column="batch_no", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="file_name", javaType=String.class, jdbcType=JdbcType.VARCHAR),
            @Arg(column="total_num", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="success_num", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="money", javaType=Double.class, jdbcType=JdbcType.DOUBLE),
            @Arg(column="status", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="user_id", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="modify_time", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP),
            @Arg(column="create_time", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP)
    })
    TbOrderBatchInfo selectByBatchNo(String batchNo);

    /**
     *
     * @mbggenerated
     */
    @Update({
        "update tb_order_batch_info",
        "set batch_no = #{batchNo,jdbcType=VARCHAR},",
          "file_name = #{fileName,jdbcType=VARCHAR},",
          "total_num = #{totalNum,jdbcType=INTEGER},",
          "success_num = #{successNum,jdbcType=INTEGER},",
          "money = #{money,jdbcType=DOUBLE},",
          "status = #{status,jdbcType=INTEGER},",
          "modify_time = #{modifyTime,jdbcType=TIMESTAMP},",
          "create_time = #{createTime,jdbcType=TIMESTAMP}",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(TbOrderBatchInfo record);
}