package com.bjyx.controller;

import com.bjyx.common.Constants;
import com.bjyx.entity.TbExportInfo;
import com.bjyx.entity.TbUserInfo;
import com.bjyx.mapper.TbExportInfoMapper;
import com.bjyx.mapper.TbUserInfoMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ExportFileInfoAPI {

    @Autowired(required = false)
    private TbExportInfoMapper tbExportInfoMapper;

    @Autowired(required = false)
    private TbUserInfoMapper tbuserInfoMapper;

    @RequestMapping("/getList")
    public String getList(HttpSession session,TbUserInfo tbUserInfo, Model model,Integer pageNum) {

//        PageHelper.startPage(queryVo.getPage(), queryVo.getLimit());
        TbUserInfo tbUserInfo1 = (TbUserInfo) session.getAttribute(Constants.SESSION_KEY);

        System.out.println("当前页为："+pageNum);
        pageNum = pageNum==null?1:pageNum;
        PageHelper.startPage(pageNum,15,"create_time desc");
        List<TbExportInfo> tbExportInfos = tbExportInfoMapper.selectByUserId(tbUserInfo1.getId());
        PageInfo<TbExportInfo> page = new PageInfo<>(tbExportInfos);
        System.out.println("总记录条数为："+page.getTotal());
        model.addAttribute("page",page);
        return "list";


//        tbUserInfo = tbuserInfoMapper.selectByPrimaryKey(tbUserInfo.getId());
//        model.addAttribute("exportInfos", tbExportInfos);
//        session.setAttribute(Constants.SESSION_KEY, tbUserInfo);
//        Page<Article> articles = articleService.findWithBLOBsByPage(pageNum, pageSize);
        // 需要把Page包装成PageInfo对象才能序列化。该插件也默认实现了一个PageInfo
//        PageInfo<Article> pageInfo = new PageInfo<>(articles);

//        return new SysResult(1, "",tbExportInfos);
//        return "list";

    }
}
