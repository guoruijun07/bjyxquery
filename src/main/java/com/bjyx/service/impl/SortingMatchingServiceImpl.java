package com.bjyx.service.impl;

import com.alibaba.csb.sdk.HttpCaller;
import com.alibaba.csb.sdk.HttpCallerException;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.bjyx.entity.bo.Address;
import com.bjyx.entity.bo.SingleRouteInfoRequest;
import com.bjyx.entity.po.TbOrderOriginalInfo;
import com.bjyx.entity.po.TbSortingInfo;
import com.bjyx.entity.po.TbSortingMatchingInfo;
import com.bjyx.mapper.TbOrderOriginalInfoMapper;
import com.bjyx.mapper.TbSortingInfoMapper;
import com.bjyx.mapper.TbSortingMatchingInfoMapper;
import com.bjyx.service.SortingMatchingService;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * @author GuoRJ
 * @date 2020/7/4 13:35
 */
/*四级分拣码 通过CSB调用*/
@Service
public class SortingMatchingServiceImpl implements SortingMatchingService{

    private static final Logger logger = LoggerFactory.getLogger(SortingMatchingService.class);

    @Autowired
    private TbOrderOriginalInfoMapper tbOrderOriginalInfoMapper;
    @Autowired
    private TbSortingMatchingInfoMapper tbSortingMatchingInfoMapper;
    @Autowired(required = false)
    private TbSortingInfoMapper tbSortingInfoMapper;

    public void sortingMatchingInfoByPc(String batchNo) throws HttpCallerException {
        //batchNo="1";
        final List<TbOrderOriginalInfo> tbOrderOriginalInfos = tbOrderOriginalInfoMapper.selectByBatchNo(batchNo);
        final List<TbSortingMatchingInfo> tbSortingMatchingInfos = tbSortingMatchingInfoMapper.selectByBatch(batchNo);
        logger.info("查询完毕");
        if (tbSortingMatchingInfos == null || tbSortingMatchingInfos.size() == 0) {
            //新增操作
            tbSortingMatchingInfoMapper.batchInsert(tbOrderOriginalInfos);
        } else {
            //修改操作
        }

        List<SingleRouteInfoRequest> logisticsInterfaces = new ArrayList<>();
        List<TbSortingMatchingInfo> sortingMatchingInfos = new ArrayList<>();
        List<TbOrderOriginalInfo> orderOriginalInfos = new ArrayList<>();

        for (TbOrderOriginalInfo tbOrderOriginalInfo : tbOrderOriginalInfos) {
            SingleRouteInfoRequest singleRouteInfoRequest = new SingleRouteInfoRequest();
            Address senderAddress = new Address();
            Address receiverAddress = new Address();
            singleRouteInfoRequest.setObjectId(parseString(tbOrderOriginalInfo.getOrderNo()));
            senderAddress.setTown(null);
            senderAddress.setCity(tbOrderOriginalInfo.getSenderCity());
            senderAddress.setArea(tbOrderOriginalInfo.getSenderCounty());
            senderAddress.setDetail(tbOrderOriginalInfo.getSenderAddress());
            senderAddress.setProvince(tbOrderOriginalInfo.getSenderProvince());
            senderAddress.setZip(null);
            singleRouteInfoRequest.setSenderAddress(senderAddress);
            receiverAddress.setTown(null);
            receiverAddress.setCity(tbOrderOriginalInfo.getReciverCity());
            receiverAddress.setArea(tbOrderOriginalInfo.getReciverCounty());
            receiverAddress.setDetail(tbOrderOriginalInfo.getReciverAddress());
            receiverAddress.setProvince(tbOrderOriginalInfo.getReciverProvince());
            receiverAddress.setZip(null);
            singleRouteInfoRequest.setReceiverAddress(receiverAddress);
            logisticsInterfaces.add(singleRouteInfoRequest);
        }

        getMatchingData(logisticsInterfaces, sortingMatchingInfos, orderOriginalInfos);

//        for (TbSortingMatchingInfo sortingMatchingInfo : sortingMatchingInfos) {
//            tbSortingMatchingInfoMapper.updateByOrderNo(sortingMatchingInfo);
//        }
//        for (TbOrderOriginalInfo orderOriginalInfo : orderOriginalInfos) {
//            tbOrderOriginalInfoMapper.updateByOrderNo(orderOriginalInfo);
//        }
        if (sortingMatchingInfos.size() > 0) {
            tbSortingMatchingInfoMapper.batchUpdateByOrderNo(sortingMatchingInfos);
            tbOrderOriginalInfoMapper.batchUpdateByOrderNo(orderOriginalInfos);
        }

    }


    public TbSortingMatchingInfo sortingMatchingByApp(TbOrderOriginalInfo tbOrderOriginalInfo) throws HttpCallerException {

        List<SingleRouteInfoRequest> logisticsInterfaces = new ArrayList<>();
        List<TbSortingMatchingInfo> sortingMatchingInfos = new ArrayList<>();
        List<TbOrderOriginalInfo> orderOriginalInfos = new ArrayList<>();

        SingleRouteInfoRequest singleRouteInfoRequest = new SingleRouteInfoRequest();

        Address senderAddress = new Address();
        Address receiverAddress = new Address();
        singleRouteInfoRequest.setObjectId(parseString(tbOrderOriginalInfo.getOrderNo()));
        senderAddress.setTown(null);
        senderAddress.setCity(tbOrderOriginalInfo.getSenderCity());
        senderAddress.setArea(tbOrderOriginalInfo.getSenderCounty());
        senderAddress.setDetail(tbOrderOriginalInfo.getSenderAddress());
        senderAddress.setProvince(tbOrderOriginalInfo.getSenderProvince());
        senderAddress.setZip(null);
        singleRouteInfoRequest.setSenderAddress(senderAddress);
        receiverAddress.setTown(null);
        receiverAddress.setCity(tbOrderOriginalInfo.getReciverCity());
        receiverAddress.setArea(tbOrderOriginalInfo.getReciverCounty());
        receiverAddress.setDetail(tbOrderOriginalInfo.getReciverAddress());
        receiverAddress.setProvince(tbOrderOriginalInfo.getReciverProvince());
        receiverAddress.setZip(null);
        singleRouteInfoRequest.setReceiverAddress(receiverAddress);
        logisticsInterfaces.add(singleRouteInfoRequest);

        getMatchingData(logisticsInterfaces, sortingMatchingInfos, orderOriginalInfos);
        return sortingMatchingInfos.get(0);
    }

    private void getMatchingData(List<SingleRouteInfoRequest> logisticsInterface, List<TbSortingMatchingInfo> sortingMatchingInfos, List<TbOrderOriginalInfo> orderOriginalInfos) throws HttpCallerException {

        //获取基础信息
        List<TbSortingInfo> tbSortingBaseInfos = tbSortingInfoMapper.selectAllData();
        Map<String, TbSortingInfo> mapBasesSortingInfos = new HashMap<>();
        for (TbSortingInfo tbSortingInfo : tbSortingBaseInfos) {
            mapBasesSortingInfos.put(tbSortingInfo.getSortingName(), tbSortingInfo);
        }

        Map<String, String> params = new HashMap<String, String>();
        params.put("logisticsInterface", JSON.toJSONString(logisticsInterface));
        params.put("dataDigest", "bb");
        params.put("wpCode", "DNMN-EMS");

        String requestURL = "https://211.156.195.14:443/csb_jidi1_1";
        String API_NAME = "routInfoQueryForPDD"; // CSB发布服务定义的服务名
        String version = "1.0.0";
        String ak = "111fdaf33ba14163b504fdfd4984b0fa";//
        String sk = "j3oGVJx9lq/wS2Eey+rasNwkrFs="; // 用户安全校验的签名密钥对

        String result = HttpCaller.doPost(requestURL, API_NAME, version, params, ak, sk);

        if (result != null) {
            logger.info("四级分拣码匹配成功，result：" + result);
            Map<String, Object> mapPc = JSONObject.parseObject(result);
            Map<String, Object> body = (Map<String, Object>) mapPc.get("body");
            if ("true".equals(body.get("success"))) {
                List<Map<String, Object>> list = (List<Map<String, Object>>) body.get("result");
                for (Map<String, Object> resultMap : list) {
                    if ("true".equals(resultMap.get("success"))) {
                        if (!"".equals(parseString(resultMap.get("objectId")))) {

                            TbSortingMatchingInfo tbSortingMatchingInfo = new TbSortingMatchingInfo();
                            tbSortingMatchingInfo.setOrderNo(parseString(resultMap.get("objectId")));

                            tbSortingMatchingInfo.setSortingStatus(1);
                            tbSortingMatchingInfo.setDatoubi(parseString(resultMap.get("datoubi")));
                            tbSortingMatchingInfo.setDatoubiCode(parseString(resultMap.get("datoubiCode")));
                            //四级分拣码，得到分拣码
                            String levelFourSortingName = parseString(resultMap.get("routeCode"));
                            if (StringUtils.isNotBlank(levelFourSortingName)) {

                                String substringTmp = levelFourSortingName.substring(0, levelFourSortingName.lastIndexOf("-"));

                                String sortingName = substringTmp.substring(substringTmp.lastIndexOf("-") + 1);

//                                String[] split = levelFourSortingName.split("-");
//                                if (split.length > 3) {
//                                    String sortingName = split[3];
                                tbSortingMatchingInfo.setSortingName(sortingName);
                                TbSortingInfo tbSortingInfo = mapBasesSortingInfos.get(sortingName);
                                if (tbSortingInfo != null) {
                                    tbSortingMatchingInfo.setDistribuCenter(tbSortingInfo.getDistribuCenter());
                                    tbSortingMatchingInfo.setMarking(tbSortingInfo.getMarking());
                                    String orgNo = "";
                                    if (tbSortingInfo.getOrgNum() != null) {
                                        orgNo = String.valueOf(tbSortingInfo.getOrgNum());
                                    }
                                    tbSortingMatchingInfo.setOrgNo(orgNo);
                                    tbSortingMatchingInfo.setOrgName(tbSortingInfo.getOrgName());
                                    tbSortingMatchingInfo.setDlvName(tbSortingInfo.getDlvName());
                                    tbSortingMatchingInfo.setDlvNo(tbSortingInfo.getAreaNum());
                                }
//                                }
                            }
                            tbSortingMatchingInfo.setLevelFourSortingName(levelFourSortingName);
                            if (resultMap.get("consolidationList") != null) {
                                List<Map<String, Object>> conList = (List<Map<String, Object>>) resultMap.get("consolidationList");
                                if (conList != null && conList.size() > 0) {
                                    tbSortingMatchingInfo.setConsolidationCode(parseString(conList.get(0).get("code")));
                                    tbSortingMatchingInfo.setConsolidationName(parseString(conList.get(0).get("name")));
                                }
                            }

//									tbSortingMatchingInfoMapper.updateByOrderNo(tbSortingMatchingInfo);
                            TbOrderOriginalInfo updateOrderOriginalInfo = new TbOrderOriginalInfo();
                            updateOrderOriginalInfo.setOrderNo(parseString(resultMap.get("objectId")));
                            updateOrderOriginalInfo.setSortingStatus(1);
                            updateOrderOriginalInfo.setModifyTime(new Date());
//									tbOrderOriginalInfoMapper.updateByOrderNo(updateOrderOriginalInfo);

                            sortingMatchingInfos.add(tbSortingMatchingInfo);
                            orderOriginalInfos.add(updateOrderOriginalInfo);
                        }
                    }

                }

            } else {
                logger.info("errorCode:" + body.get("errorCode"));
                logger.info("errorMsg:" + body.get("errorMsg"));

            }
        } else {
            logger.info("没有任何数据。");
        }
    }


    public String parseString(Object obj) {
        if (obj == null) {
            return "";
        } else {
            return obj.toString();
        }
    }

}
