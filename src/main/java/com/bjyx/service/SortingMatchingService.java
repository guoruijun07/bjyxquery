package com.bjyx.service;

import com.alibaba.csb.sdk.HttpCallerException;
import com.bjyx.entity.po.TbOrderOriginalInfo;
import com.bjyx.entity.po.TbSortingMatchingInfo;


public interface SortingMatchingService {
    void sortingMatchingInfoByPc(String batchNo) throws HttpCallerException;
    TbSortingMatchingInfo sortingMatchingByApp(TbOrderOriginalInfo tbOrderOriginalInfo) throws HttpCallerException;
}
