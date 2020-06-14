package com.bjyx.mapper;

import com.bjyx.entity.po.TbDetailTrajectoryOutsideInfo;
import com.bjyx.entity.po.TbUserInfo;
import com.bjyx.entity.vo.TbUserInfoVO;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.type.JdbcType;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;
@Component(value ="TbDetailTrajectoryOutsideInfoMapper")
public interface TbDetailTrajectoryOutsideInfoMapper {




    /**
     *
     * @mbggenerated
     */
    @Insert({
            "<script>",
            "insert into tb_detail_trajectory_outside_info ( traceNo, ",
            "opTime, opCode, ",
            "opName, opDesc, opOrgProvName, ",
            "opOrgCity, opOrgCode, opOrgName, ",
            "operatorNo, operatorName) values",
            "<foreach collection='tbDetailTrajectoryOutsideInfo' item='item' index='index' separator=','>",
            " ( #{item.traceNo,jdbcType=VARCHAR}, ",
            "#{item.opTime,jdbcType=TIMESTAMP}, #{item.opCode,jdbcType=VARCHAR}, ",
            "#{item.opName,jdbcType=VARCHAR}, #{item.opDesc,jdbcType=VARCHAR}, ",
            "#{item.opOrgProvName,jdbcType=VARCHAR}, #{item.opOrgCity,jdbcType=VARCHAR}, #{item.opOrgCode,jdbcType=VARCHAR}, ",
            "#{item.opOrgName,jdbcType=VARCHAR}, #{item.operatorNo,jdbcType=VARCHAR}, #{item.operatorName,jdbcType=VARCHAR}) ",
            "</foreach>",
            "</script>"

    })
    int batchInsert(@Param("tbDetailTrajectoryOutsideInfo")List<TbDetailTrajectoryOutsideInfo> TbDetailTrajectoryOutsideInfo);

    /**
     *
     * @mbggenerated
     */
    @Delete({
            "delete from tb_detail_trajectory_outside_info",
            "where traceNo = #{mailNo,jdbcType=VARCHAR}"
    })
    int deleteByMailNo(String mailNo);


}