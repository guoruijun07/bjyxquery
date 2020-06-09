package com.bjyx.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import com.bjyx.controller.LoginController;
import com.bjyx.entity.bo.Address;
import com.bjyx.entity.bo.SingleRouteInfoRequest;
import com.bjyx.entity.po.TbOrderOriginalInfo;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bjyx.entity.po.TbSortingMatchingInfo;
import com.bjyx.mapper.TbOrderOriginalInfoMapper;
import com.bjyx.mapper.TbSortingMatchingInfoMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.csb.sdk.HttpCaller;
import com.alibaba.csb.sdk.HttpCallerException;

/*四级分拣码 通过CSB调用*/
@Controller
public class SortingMatchingInfo {

	@Autowired
	private TbOrderOriginalInfoMapper tbOrderOriginalInfoMapper;
	@Autowired
	private TbSortingMatchingInfoMapper tbSortingMatchingInfoMapper;
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	
	@RequestMapping(value = "/query", method = RequestMethod.GET)
	@ResponseBody
	public boolean sortingMatchingInfo(String batchNo) {
		batchNo="1";
		final List<TbOrderOriginalInfo> tbOrderOriginalInfos = tbOrderOriginalInfoMapper.selectByBatchNo(batchNo);
		final List<TbSortingMatchingInfo> tbSortingMatchingInfos= tbSortingMatchingInfoMapper.selectByBatch(batchNo);
		logger.info("查询完毕");
		if(tbSortingMatchingInfos==null||tbSortingMatchingInfos.size()==0){
			//新增操作
			tbSortingMatchingInfoMapper.batchInsert(tbOrderOriginalInfos);
		}else{
			//修改操作
		}
		return send(tbOrderOriginalInfos);
	}


	public boolean send(List<TbOrderOriginalInfo> tbOrderOriginalInfos) {

		List<SingleRouteInfoRequest> logisticsInterface = new ArrayList<>();

		for(TbOrderOriginalInfo tbOrderOriginalInfo:tbOrderOriginalInfos){
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
			logisticsInterface.add(singleRouteInfoRequest);
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

		try {
			String result = HttpCaller.doPost(requestURL, API_NAME, version, params, ak, sk);

			if (result != null) {
				logger.info("四级分拣码匹配成功，result："+result);
				Map<String, Object> map = JSONObject.parseObject(result);
				Map<String, Object> body =  (Map<String, Object>) map.get("body");
				if("true".equals(body.get("success"))){
					List<Map<String, Object>> list=(List<Map<String, Object>>)  body.get("result");
                    for(Map<String,Object> resultMap:list){
                    	if("true".equals(resultMap.get("success"))){
                    		if(!"".equals(parseString(resultMap.get("objectId")))){

								TbSortingMatchingInfo tbSortingMatchingInfo=new TbSortingMatchingInfo();
								tbSortingMatchingInfo.setOrderNo(parseString(resultMap.get("objectId")));

								tbSortingMatchingInfo.setSortingStatus("1");
								tbSortingMatchingInfo.setDatoubi(parseString(resultMap.get("datoubi")));
								tbSortingMatchingInfo.setDatoubiCode(parseString(resultMap.get("datoubiCode")));
								tbSortingMatchingInfo.setLevelFourSortingName(parseString(resultMap.get("routeCode")));
								if(resultMap.get("consolidationList")!=null){
									List<Map<String,Object>> conList= (List<Map<String, Object>>) resultMap.get("consolidationList");
									if(conList!=null&&conList.size()>0){
										tbSortingMatchingInfo.setConsolidationCode(parseString(conList.get(0).get("code")));
										tbSortingMatchingInfo.setConsolidationName(parseString(conList.get(0).get("name")));
									}
								}
								tbSortingMatchingInfoMapper.updateByOrderNo(tbSortingMatchingInfo);
							}
						}
					}
					return true;
				}else {
					logger.info("errorCode:"+body.get("errorCode"));
					logger.info("errorMsg:"+body.get("errorMsg"));
					return false;
				}
			} else {
				logger.info("没有任何数据。");
				return false;
			}
		}
		/* } */
		catch (HttpCallerException ie) {
			// 调用异常处理
			ie.printStackTrace();
			return false;
		}
	}

	public String parseString(Object obj){
		if(obj==null){
			return "";
		}else{
			return obj.toString();
		}
	}

}
