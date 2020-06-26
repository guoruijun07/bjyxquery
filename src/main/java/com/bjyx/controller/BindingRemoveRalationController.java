package com.bjyx.controller;

import com.bjyx.entity.po.TbBindingRemoveRalation;
import com.bjyx.entity.po.TbSortingInfo;
import com.bjyx.mapper.TbBindingRmoveRalationMapper;
import com.bjyx.mapper.TbSortingInfoMapper;
import com.bjyx.service.bindingandremove.BindingRalation;
import com.bjyx.service.bindingandremove.RemoveRalation;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class BindingRemoveRalationController {
    @Autowired(required = false)
    private BindingRalation bindingRalation;
    @Autowired(required = false)
    private RemoveRalation removeRalation;
    @Autowired(required = false)
    private TbBindingRmoveRalationMapper tbBindingRmoveRalationMapper;




    //根据邮件号绑定
    @RequestMapping("/binding")
    @ResponseBody
    public TbBindingRemoveRalation binding(String phone, String mailNo) throws IOException {
        TbBindingRemoveRalation params=new TbBindingRemoveRalation();
        TbBindingRemoveRalation out=new TbBindingRemoveRalation();
        if(StringUtils.isBlank(phone)){
            out.setResult("电话不能为空");
            return  out;
        }
        if(StringUtils.isBlank(mailNo)){
            out.setResult("邮件号不能为空");
            return  out;
        }
        //获取用户

        //获取菜单

        //获取合作伙伴编码
        params.setPrtms(phone);
        params.setUnitID("10000000034");
        params.setUuidinpartner(mailNo);
        out=bindingRalation.bindingRalation(params);
        return  out;
    }

    //根据邮件号解绑
    @RequestMapping("/remove")
    @ResponseBody
    public TbBindingRemoveRalation remove( String mailNo) throws IOException {
        TbBindingRemoveRalation params=new TbBindingRemoveRalation();
        TbBindingRemoveRalation out=new TbBindingRemoveRalation();
        if(StringUtils.isBlank(mailNo)){
            out.setResult("邮件号不能为空");
            return  out;
        }
        //获取用户

        //获取菜单

        //获取合作伙伴编码
        params.setUnitID("10000000034");
        params.setUuidinpartner(mailNo);
        out=removeRalation.removeRalation(params);
        return  out;
    }

    //查询
    //根据邮件号解绑
    @RequestMapping("/queryBinding")
    @ResponseBody
    public List<TbBindingRemoveRalation> queryBinding(String phone , String Xphone, String mailNo, String beginDate, String endDate) throws IOException, ParseException {
        TbBindingRemoveRalation params=new TbBindingRemoveRalation();
        if(StringUtils.isBlank(phone)&&StringUtils.isBlank(Xphone)&&StringUtils.isBlank(mailNo)){
            return null;
        }
        params.setPrtms(phone);
        params.setSmbms(Xphone);
        params.setUuidinpartner(mailNo);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");//注意月份是MM
        if(beginDate!=null)
        params.setBeginDate(simpleDateFormat.parse(beginDate));
        if(endDate!=null)
        params.setEndDate(simpleDateFormat.parse(endDate));
        params.setUuidinpartner(mailNo);
        List<TbBindingRemoveRalation>  out=tbBindingRmoveRalationMapper.select(params);
        return  out;
    }
}
