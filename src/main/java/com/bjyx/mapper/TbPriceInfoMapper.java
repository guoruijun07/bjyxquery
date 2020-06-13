package com.bjyx.mapper;

import com.bjyx.entity.po.TbPriceInfo;
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
            "menu, source, price)",
            "values (#{id,jdbcType=INTEGER}, #{userId,jdbcType=INTEGER}, ",
            "#{menu,jdbcType=INTEGER}, #{source,jdbcType=INTEGER}, #{price,jdbcType=DOUBLE})"
    })
    int insert(TbPriceInfo record);

    /**
     *
     * @mbggenerated
     */
    @Select({
            "select",
            "id, user_id, menu, source, price",
            "from tb_price_info",
            "where id = #{id,jdbcType=INTEGER}"
    })
    @ConstructorArgs({
            @Arg(column="id", javaType=Integer.class, jdbcType=JdbcType.INTEGER, id=true),
            @Arg(column="user_id", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="menu", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="source", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="price", javaType=Double.class, jdbcType=JdbcType.DOUBLE)
    })
    TbPriceInfo selectByPrimaryKey(Integer id);

    /**
     *
     * @mbggenerated
     */
    @Select({
            "select",
            "id, user_id, menu, source, price",
            "from tb_price_info",
            "where user_id = #{userId,jdbcType=INTEGER} and menu = #{device,jdbcType=INTEGER} and source = #{device,jdbcType=INTEGER}"
    })
    @ConstructorArgs({
            @Arg(column="id", javaType=Integer.class, jdbcType=JdbcType.INTEGER, id=true),
            @Arg(column="user_id", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="menu", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="source", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="price", javaType=Double.class, jdbcType=JdbcType.DOUBLE)
    })
    TbPriceInfo selectPriceByUserId(Integer userId,Integer device,Integer meunu);

    /**
     *
     * @mbggenerated
     */
    @Select({
            "select",
            "id, user_id, menu, source, price",
            "from tb_price_info",
            "where user_id = #{userId,jdbcType=INTEGER} and source = 1"
    })
    @ConstructorArgs({
            @Arg(column="id", javaType=Integer.class, jdbcType=JdbcType.INTEGER, id=true),
            @Arg(column="user_id", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="menu", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="source", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="price", javaType=Double.class, jdbcType=JdbcType.DOUBLE)
    })
    TbPriceInfo selectPcPriceByUserId(Integer userId);
    /**
     *
     * @mbggenerated
     */
    @Select({
            "select",
            "id, user_id, menu, source, price",
            "from tb_price_info",
            "where user_id = #{userId,jdbcType=INTEGER} and source = 2"
    })
    @ConstructorArgs({
            @Arg(column="id", javaType=Integer.class, jdbcType=JdbcType.INTEGER, id=true),
            @Arg(column="user_id", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="menu", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="source", javaType=Integer.class, jdbcType=JdbcType.INTEGER),
            @Arg(column="price", javaType=Double.class, jdbcType=JdbcType.DOUBLE)
    })
    TbPriceInfo selectAppPriceByUserId(Integer userId);

    /**
     *
     * @mbggenerated
     */
    @Update({
            "update tb_price_info",
            "set user_id = #{userId,jdbcType=INTEGER},",
            "menu = #{menu,jdbcType=INTEGER},",
            "source = #{source,jdbcType=INTEGER},",
            "price = #{price,jdbcType=DOUBLE}",
            "where id = #{id,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(TbPriceInfo record);
}