package com.bjyx.mapper;

import com.bjyx.entity.po.TbOrderBatchInfo;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.type.JdbcType;

import java.math.BigDecimal;
import java.util.Date;

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
        "insert into tb_order_batch_info (id, batch_no, ",
        "file_name, total_num, ",
        "success_num, money, ",
        "status, modify_time, ",
        "create_time)",
        "values (#{id,jdbcType=INTEGER}, #{batchNo,jdbcType=VARCHAR}, ",
        "#{fileName,jdbcType=VARCHAR}, #{totalNum,jdbcType=INTEGER}, ",
        "#{successNum,jdbcType=INTEGER}, #{money,jdbcType=DECIMAL}, ",
        "#{status,jdbcType=INTEGER}, #{modifyTime,jdbcType=TIMESTAMP}, ",
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
        "id, batch_no, file_name, total_num, success_num, money, status, modify_time, ",
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
        @Arg(column="money", javaType=BigDecimal.class, jdbcType=JdbcType.DECIMAL),
        @Arg(column="status", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
        @Arg(column="modify_time", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP),
        @Arg(column="create_time", javaType=Date.class, jdbcType=JdbcType.TIMESTAMP)
    })
    TbOrderBatchInfo selectByPrimaryKey(Integer id);

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
          "money = #{money,jdbcType=DECIMAL},",
          "status = #{status,jdbcType=INTEGER},",
          "modify_time = #{modifyTime,jdbcType=TIMESTAMP},",
          "create_time = #{createTime,jdbcType=TIMESTAMP}",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(TbOrderBatchInfo record);
}