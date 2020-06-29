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
import java.util.List;

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
    public TbBindingRemoveRalation binding(HttpSession session, String phone, String mailNo, String userMobile) throws IOException {
        TbBindingRemoveRalation params = new TbBindingRemoveRalation();
        TbBindingRemoveRalation out = new TbBindingRemoveRalation();
        if (StringUtils.isBlank(phone)) {
            out.setResult("电话不能为空");
            return out;
        }
        if (StringUtils.isBlank(mailNo)) {
            out.setResult("邮件号不能为空");
            return out;
        }
        //获取用户
//        TbUserInfo tbUserInfo= (TbUserInfo) session.getAttribute(Constants.SESSION_KEY);
        TbUserInfoVO tbUserInfoParam = new TbUserInfoVO();
        tbUserInfoParam.setMobile(userMobile);
        TbUserInfo tbUserInfo = tbuserInfoMapper.selectByMobile(tbUserInfoParam);
        if (tbUserInfo != null) {
            params.setUsername(tbUserInfo.getUsername());
            params.setUserid(tbUserInfo.getId().toString());
        }
        //获取菜单

        //获取合作伙伴编码
        params.setPrtms(phone);
        params.setUnitID("10000000034");
        params.setUuidinpartner(mailNo);
        out = bindingRalation.bindingRalation(params);
        return out;
    }

    //根据邮件号解绑
    @RequestMapping("/removeBinding")
    @ResponseBody
    public TbBindingRemoveRalation remove(HttpSession session, String mailNo) throws IOException {
        TbBindingRemoveRalation params = new TbBindingRemoveRalation();
        TbBindingRemoveRalation out = new TbBindingRemoveRalation();
        if (StringUtils.isBlank(mailNo)) {
            out.setResult("邮件号不能为空");
            return out;
        }

        //获取合作伙伴编码
        params.setUnitID("10000000034");
        params.setUuidinpartner(mailNo);
        out = removeRalation.removeRalation(params);
        return out;
    }

    //查询
    //根据邮件号解绑
    @RequestMapping("/queryBinding")
    @ResponseBody
    public List<TbBindingRemoveRalation> queryBinding(String phone, String Xphone, String mailNo, String beginDate, String endDate) throws IOException, ParseException {
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
        return out;
    }
}
