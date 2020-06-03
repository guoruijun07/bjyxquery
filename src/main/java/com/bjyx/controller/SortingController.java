package com.bjyx.controller;

import com.bjyx.entity.po.TbSortingInfo;
import com.bjyx.mapper.TbSortingInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class SortingController {
    @Autowired(required = false)
    private TbSortingInfoMapper tbSortingInfoMapper;

    @RequestMapping("/getSorting")
    @ResponseBody
    public List<TbSortingInfo> pcLogin(TbSortingInfo tbSortingInfo) {

        List<TbSortingInfo> result = tbSortingInfoMapper.selectBySortingCode("东区");

        return  null;
    }
}
