package com.bjyx.mapper;


import com.bjyx.entity.po.TbBindingRemoveRalation;
import com.bjyx.entity.po.TbOrderImport;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Component;

import java.util.List;

@Component(value ="OrderImportMapper")
public interface OrderImportMapper {




    /**
     *
     * @mbggenerated
     */
    @Select({
            "<script>",
            "select",
            "order_date, send_date, ",
            "company, mail_no, ",
            "fee, inner_name, ",
            "count, reciver_name,",
            "reciver_mobile_one, reciver_province, ",
            "reciver_city, reciver_county, ",
            "reciver_address, sender_name, ",
            "sender_mobile_one, order_channel, ",
            "order_no, is_fee, ",
            "weight,real_fee  ",
            "package_fee,total_fee  ",
            "profit,profit_rate  ",
            "from tb_order_import ",
            "where 1=1  ",
            "<if test='id!=0'>",
            "and id = #{id,jdbcType=INTEGER} ",
            "</if>",
            "<if test='reciverName!=null'>",
            "and reciver_name = #{reciverName,jdbcType=VARCHAR} ",
            "</if>",
            "<if test='reciverMobileOne!=null'>",
            "and reciver_mobile_one = #{reciverMobileOne,jdbcType=VARCHAR} ",
            "</if>",
            "<if test='mailNo!=null'>",
            "and mail_no = #{mailNo,jdbcType=VARCHAR} ",
            "</if>",
            "<if test='beginDate!=null'>",
            "and send_date <![CDATA[>= ]]>  #{sendDate,jdbcType=TIMESTAMP} ",
            "</if>",
            "<if test='endDate!=null'>",
            "and send_date  <![CDATA[<= ]]>  #{endDate,jdbcType=TIMESTAMP}  ",
            "</if>",
            " limit 100",
            "</script>"


    })
    List<TbOrderImport> select(TbOrderImport record);


}