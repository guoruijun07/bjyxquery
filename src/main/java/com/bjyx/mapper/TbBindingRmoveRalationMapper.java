package com.bjyx.mapper;


import com.bjyx.entity.po.TbBindingRemoveRalation;
import com.bjyx.entity.po.TbExportInfo;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.type.JdbcType;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

@Component(value ="TbBindingRmoveRalation")
public interface TbBindingRmoveRalationMapper {


    /**
     *
     * @mbggenerated
     */
    @Insert({
            "insert into tb_binding_remove_ralation (id, unitID, ",
            "prtms, smbms, ",
            "otherms, subts, ",
            "dissubts, callrestrict,",
            "calldisplay, callrecording, ",
            "validitytime, uuidinpartner, ",
            "usertype, regphone, ",
            "status, source, ",
            "menu, userid, ",
            "username, create_time, ",
            "modify_time )",
            "values (#{id,jdbcType=INTEGER}, #{unitID,jdbcType=INTEGER}, ",
            "#{prtms,jdbcType=VARCHAR}, #{smbms,jdbcType=VARCHAR}, ",
            "#{otherms,jdbcType=VARCHAR}, #{subts,jdbcType=TIMESTAMP}, ",
            "#{dissubts,jdbcType=TIMESTAMP}, #{callrestrict,jdbcType=VARCHAR}, ",
            "#{calldisplay,jdbcType=VARCHAR}, #{callrecording,jdbcType=VARCHAR}, ",
            "#{validitytime,jdbcType=TIMESTAMP}, #{uuidinpartner,jdbcType=VARCHAR}, ",
            "#{usertype,jdbcType=VARCHAR}, #{regphone,jdbcType=VARCHAR}, ",
            "#{status,jdbcType=VARCHAR}, #{source,jdbcType=INTEGER}, ",
            "#{menu,jdbcType=INTEGER}, #{userid,jdbcType=INTEGER}, ",
            "#{username,jdbcType=VARCHAR}, #{createTime,jdbcType=TIMESTAMP}, ",
            "#{modifyTime,jdbcType=TIMESTAMP})"
    })
    int insert(TbBindingRemoveRalation record);

    /**
     *
     * @mbggenerated
     */
    @Select({
            "<script>",
            "select",
            "id, unitID, ",
            "prtms, smbms, ",
            "otherms, subts, ",
            "dissubts, callrestrict,",
            "calldisplay, callrecording, ",
            "validitytime, uuidinpartner, ",
            "usertype, regphone, ",
            "status, source, ",
            "menu, userid, ",
            "username,  ",
            " create_time as createTime, modify_time as modifyTime from tb_binding_remove_ralation ",
            "where 1=1 and userid= #{userid,jdbcType=BIGINT}",
            "<if test='id!=0'>",
            "and id = #{id,jdbcType=INTEGER} ",
            "</if>",
            "<if test='prtms!=null'>",
            "and prtms = #{prtms,jdbcType=VARCHAR} ",
            "</if>",
            "<if test='smbms!=null'>",
            "and smbms = #{smbms,jdbcType=VARCHAR} ",
            "</if>",
            "<if test='uuidinpartner!=null'>",
            "and uuidinpartner = #{uuidinpartner,jdbcType=VARCHAR} ",
            "</if>",
            "<if test='beginDate!=null'>",
            "and subts <![CDATA[>= ]]>  #{beginDate,jdbcType=DATE} ",
            "</if>",
            "<if test='endDate!=null'>",
            "and date_format(subts, '%Y-%m-%d')  <![CDATA[<= ]]>  #{endDate,jdbcType=DATE}  ",
            "</if>",
           // " order by subts desc ",
           // " limit 100",
            "</script>"


    })
    List<TbBindingRemoveRalation> select(TbBindingRemoveRalation record);

    /**
     *
     * @mbggenerated
     */
    @Update({
            "<script>",
            "update tb_binding_remove_ralation",
            "set dissubts = #{dissubts,jdbcType=VARCHAR},",
            "regphone = #{regphone,jdbcType=VARCHAR},",
            "status = #{status,jdbcType=VARCHAR},",
            "modify_time = #{modifyTime,jdbcType=TIMESTAMP}",
            "where 1=1 ",
            "<if test='id!=0'>",
            "and id = #{id,jdbcType=INTEGER} ",
            "</if>",
            "<if test='prtms!=null'>",
            "and prtms = #{prtms,jdbcType=VARCHAR} ",
            "</if>",
            "<if test='smbms!=null'>",
            "and smbms = #{smbms,jdbcType=VARCHAR} ",
            "</if>",
            "<if test='uuidinpartner!=null'>",
            "and uuidinpartner = #{uuidinpartner,jdbcType=VARCHAR} ",
            "</if>",
            "</script>"
    })
    int update(TbBindingRemoveRalation record);
}