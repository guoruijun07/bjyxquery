package com.bjyx.mapper;

import com.bjyx.entity.TbPriceInfo;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.type.JdbcType;

public interface TbPriceInfoMapper {

    /**
     *
     * @mbggenerated
     */
    @Delete({
            "delete from tb_price_info",
            "where id = #{id,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer id);

    /**
     *
     * @mbggenerated
     */
    @Insert({
            "insert into tb_price_info (id, user_id, ",
            "menu, price)",
            "values (#{id,jdbcType=INTEGER}, #{userId,jdbcType=INTEGER}, ",
            "#{menu,jdbcType=INTEGER}, #{price,jdbcType=DOUBLE})"
    })
    int insert(TbPriceInfo record);

    /**
     *
     * @mbggenerated
     */
    @Select({
            "select",
            "id, user_id, menu, price",
            "from tb_price_info",
            "where id = #{id,jdbcType=INTEGER}"
    })
    @ConstructorArgs({
            @Arg(column="id", javaType=Integer.class, jdbcType=JdbcType.INTEGER, id=true),
            @Arg(column="user_id", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="menu", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="price", javaType=Double.class, jdbcType=JdbcType.DOUBLE)
    })
    TbPriceInfo selectByPrimaryKey(Integer id);

    /**
     *
     * @mbggenerated
     */
    @Select({
            "select",
            "id, user_id, menu, price",
            "from tb_price_info",
            "where user_id = #{userId,jdbcType=INTEGER} and menu = #{device,jdbcType=INTEGER}"
    })
    @ConstructorArgs({
            @Arg(column="id", javaType=Integer.class, jdbcType=JdbcType.INTEGER, id=true),
            @Arg(column="user_id", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="menu", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="price", javaType=Double.class, jdbcType=JdbcType.DOUBLE)
    })
    TbPriceInfo selectPriceByUserId(Integer userId,Integer device);

    /**
     *
     * @mbggenerated
     */
    @Select({
            "select",
            "id, user_id, menu, price",
            "from tb_price_info",
            "where user_id = #{userId,jdbcType=INTEGER} and menu = 1"
    })
    @ConstructorArgs({
            @Arg(column="id", javaType=Integer.class, jdbcType=JdbcType.INTEGER, id=true),
            @Arg(column="user_id", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="menu", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="price", javaType=Double.class, jdbcType=JdbcType.DOUBLE)
    })
    TbPriceInfo selectPcPriceByUserId(Integer userId);
    /**
     *
     * @mbggenerated
     */
    @Update({
            "update tb_price_info",
            "set user_id = #{userId,jdbcType=INTEGER},",
            "menu = #{menu,jdbcType=INTEGER},",
            "price = #{price,jdbcType=DOUBLE}",
            "where id = #{id,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(TbPriceInfo record);
}