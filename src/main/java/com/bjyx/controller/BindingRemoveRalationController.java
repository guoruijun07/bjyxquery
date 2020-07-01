package com.bjyx.controller;

import com.bjyx.entity.po.TbBindingRemoveRalation;
import com.bjyx.entity.po.TbUserInfo;
import com.bjyx.entity.vo.TbUserInfoVO;
import com.bjyx.mapper.TbBindingRmoveRalationMapper;
import com.bjyx.mapper.TbUserInfoMapper;
import com.bjyx.service.bindingandremove.BindingRalation;
import com.bjyx.service.bindingandremove.RemoveRalation;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class BindingRemoveRalationController {
    @Autowired(required = false)
    private BindingRalation bindingRalation;
    @Autowired(required = false)
    private RemoveRalation removeRalation;
    @Autowired(required = false)
    private TbBindingRmoveRalationMapper tbBindingRmoveRalationMapper;
    @Autowired(required = false)
    private TbUserInfoMapper tbuserInfoMapper;


    //根据邮件号绑定
    @RequestMapping("/binding")
    @ResponseBody
    public Map<String,Object> binding(HttpSession session, String phone, String mailNo, String userMobile) throws IOException {
        TbBindingRemoveRalation params = new TbBindingRemoveRalation();
        TbBindingRemoveRalation out = new TbBindingRemoveRalation();
        Map<String,Object> outPut=new HashMap<>();
        if (StringUtils.isBlank(phone)) {
            outPut.put("code","-1");
            outPut.put("msg","电话不能为空");
            return outPut;
        }
        if (StringUtils.isBlank(mailNo)) {
            outPut.put("code","-1");
            outPut.put("msg","邮件号不能为空");
            return outPut;
        }
        //获取用户
//        TbUserInfo tbUserInfo= (TbUserInfo) session.getAttribute(Constants.SESSION_KEY);
        TbUserInfoVO tbUserInfoParam = new TbUserInfoVO();
        tbUserInfoParam.setMobile(userMobile);
        TbUserInfo tbUserInfo = tbuserInfoMapper.selectByMobile(tbUserInfoParam);
        if (tbUserInfo != null) {
            params.setUsername(tbUserInfo.getUsername());
            params.setUserid(tbUserInfo.getId());
        }
        //获取菜单

        //获取合作伙伴编码
        params.setPrtms(phone);
        params.setUnitID("10000000034");
        params.setUuidinpartner(mailNo);
        out = bindingRalation.bindingRalation(params);
        outPut.put("code",out.getCode());
        outPut.put("msg",out.getResult());
        Map<String,String> data=new HashMap<>();
        data.put("prtms",out.getPrtms());
        data.put("smbms",out.getSmbms());
        data.put("subts",out.getSubts());
        outPut.put("data",data);
        return outPut;
    }

    //根据邮件号解绑
    @RequestMapping("/removeBinding")
    @ResponseBody
    public Map<String,Object> remove(HttpSession session, String mailNo) throws IOException {
        TbBindingRemoveRalation params = new TbBindingRemoveRalation();
        TbBindingRemoveRalation out = new TbBindingRemoveRalation();
        Map<String,Object> outPut=new HashMap<>();
        if (StringUtils.isBlank(mailNo)) {
            outPut.put("code","-1");
            outPut.put("msg","邮件号不能为空");
            return outPut;
        }
        //获取合作伙伴编码
        params.setUnitID("10000000034");
        params.setUuidinpartner(mailNo);
        out = removeRalation.removeRalation(params);
        outPut.put("code",out.getCode());
        outPut.put("msg",out.getResult());
        return outPut;
    }

    //查询
    //根据邮件号解绑
    @RequestMapping("/queryBinding")
    @ResponseBody
    public  Map<String,Object> queryBinding(String phone, String Xphone, String mailNo, String beginDate, String endDate,String userMobile) throws IOException, ParseException {
        TbBindingRemoveRalation params = new TbBindingRemoveRalation();
        Map<String,Object> outPut=new HashMap<>();
        if("".equals(phone))
            phone=null;
        if("".equals(Xphone))
            Xphone=null;
        if("".equals(mailNo))
            mailNo=null;
        params.setPrtms(phone);
        params.setSmbms(Xphone);
        params.setUuidinpartner(mailNo);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");//注意月份是MM


        if (StringUtils.isNotBlank(beginDate) ) {
            params.setBeginDate(simpleDateFormat.parse(beginDate));
        }else{
            outPut.put("code","-1");
            outPut.put("msg","时间为必填项");
            return  outPut;
        }
        if (StringUtils.isNotBlank(endDate) ) {
            params.setEndDate(simpleDateFormat.parse(endDate));
        }else{
            outPut.put("code","-1");
            outPut.put("msg","时间为必填项");
            return  outPut;
        }
        params.setUuidinpartner(mailNo);
        TbUserInfoVO tbUserInfoParam = new TbUserInfoVO();
        tbUserInfoParam.setMobile(userMobile);
        TbUserInfo tbUserInfo = tbuserInfoMapper.selectByMobile(tbUserInfoParam);
        if(null==tbUserInfo){
            outPut.put("code","-1");
            outPut.put("msg","未查询到本设备用户信息");
            return outPut;
        }
        params.setUserid(tbUserInfo.getId());
        List<TbBindingRemoveRalation> out = tbBindingRmoveRalationMapper.select(params);

        outPut.put("code","0");
        outPut.put("msg","查询成功");
        outPut.put("data",out);
        return outPut;
    }

}
