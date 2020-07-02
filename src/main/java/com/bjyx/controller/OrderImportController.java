package com.bjyx.controller;

import com.bjyx.entity.po.TbBindingRemoveRalation;
import com.bjyx.entity.po.TbDetailTrajectoryOutsideInfo;
import com.bjyx.entity.po.TbOrderImport;
import com.bjyx.entity.po.TbUserInfo;
import com.bjyx.entity.vo.TbUserInfoVO;
import com.bjyx.mapper.OrderImportMapper;
import com.bjyx.mapper.TbBindingRmoveRalationMapper;
import com.bjyx.mapper.TbUserInfoMapper;
import com.bjyx.service.QueryTrackInfo;
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
public class OrderImportController {

    @Autowired(required = false)
    private OrderImportMapper orderImportMapper;

    @Autowired(required = false)
    private QueryTrackInfo queryTrackInfo;


    //查询
    @RequestMapping("/orderImport/query")
    @ResponseBody
    public Map<String,Object> query(HttpSession session, TbOrderImport tbOrderImport) throws IOException {
        TbBindingRemoveRalation out = new TbBindingRemoveRalation();
        Map<String,Object> outPut=new HashMap<>();
        if(StringUtils.isBlank(tbOrderImport.getReciverName())&&StringUtils.isBlank(tbOrderImport.getMailNo())&&StringUtils.isBlank(tbOrderImport.getReciverMobileOne())){
            outPut.put("code","-1");
            outPut.put("msg","收件人姓名、收件人手机、邮件号三者不能同时为空");
            return outPut;
        }
        if("".equals(tbOrderImport.getReciverName()))
            tbOrderImport.setReciverName(null);
        if("".equals(tbOrderImport.getMailNo()))
            tbOrderImport.setMailNo(null);
        if("".equals(tbOrderImport.getReciverMobileOne()))
            tbOrderImport.setReciverMobileOne(null);
        List<TbOrderImport> datas=orderImportMapper.select(tbOrderImport);
        outPut.put("code","0");
        outPut.put("msg","查询成功");
        Map<String,String> data=new HashMap<>();
        outPut.put("data",datas);
        return outPut;
    }


    //查询
    @RequestMapping("/orderImport/queryTrackInfo")
    @ResponseBody
    public Map<String,Object> queryTrackInfo(HttpSession session, String mailNo) throws IOException {
        Map<String,Object> outPut=new HashMap<>();
        List<TbDetailTrajectoryOutsideInfo> data = queryTrackInfo.queryTrackInfo(mailNo);
        outPut.put("code", "0");
        outPut.put("msg", "查询成功");
        outPut.put("data", data);
        return outPut;
    }


}
