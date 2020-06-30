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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public  Map<String,Object> queryBinding(String phone, String Xphone, String mailNo, String beginDate, String endDate) throws IOException, ParseException {
        TbBindingRemoveRalation params = new TbBindingRemoveRalation();
        if (StringUtils.isBlank(phone) && StringUtils.isBlank(Xphone) && StringUtils.isBlank(mailNo)) {
            return null;
        }
        params.setPrtms(phone);
        params.setSmbms(Xphone);
        params.setUuidinpartner(mailNo);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");//注意月份是MM
        if (beginDate != null)
            params.setBeginDate(simpleDateFormat.parse(beginDate));
        if (endDate != null)
            params.setEndDate(simpleDateFormat.parse(endDate));
        params.setUuidinpartner(mailNo);
        List<TbBindingRemoveRalation> out = tbBindingRmoveRalationMapper.select(params);

        Map<String,Object> outPut=new HashMap<>();
        outPut.put("code","0");
        outPut.put("msg","查询成功");
        outPut.put("data",out);
        return outPut;
    }
}
