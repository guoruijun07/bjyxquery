package com.bjyx.service.bindingandremove;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.bjyx.entity.bo.bindingandremove.RemoveRalationBo;
import com.bjyx.entity.po.TbBindingRemoveRalation;
import com.bjyx.mapper.TbBindingRmoveRalationMapper;
import com.bjyx.mapper.TbDetailTrajectoryOutsideInfoMapper;
import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.ParseException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;


/*解绑接口 通过HTTP POST调用 */
@Service
public class RemoveRalation {

    @Autowired
    private TbDetailTrajectoryOutsideInfoMapper tbDetailTrajectoryOutsideInfoMapper;

    @Autowired

    private TbBindingRmoveRalationMapper tbBindingRmoveRalation;

    private static final Logger logger = LoggerFactory.getLogger(RemoveRalation.class);



    public TbBindingRemoveRalation removeRalation(TbBindingRemoveRalation tbBindingRemoveRalation) throws IOException {

        //版本号
        String ver="2.0";
        //消息ID
        String msgid = UUID.randomUUID().toString().replaceAll("-", "");
        //时间戳
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String ts = df.format(new Date().getTime());
        //业务类型
        String service="SafeNumber";
        //消息类型
        String msgtype="remove_Relation";

        //合作伙伴的应用标识
        String appkey="uhxYUGOJ2UMkyTRpsdbABE7a0p0L2LKN5NhjowyqeFNMlsX7vwrIOgE6hAhXmUiV";
        //合作伙伴编号
        String unitID=tbBindingRemoveRalation.getUnitID();
        //安全号码,对应AXB业务中的号码X
        String smbms=tbBindingRemoveRalation.getSmbms();
        //真实号码,对应AXB业务中的号码A
        String regphone=tbBindingRemoveRalation.getRegphone();
        //签名
        String secret="YLxGXJIBMLgv";


        Map<String,String> map=new HashMap<>();
        map.put("ver",ver);
        map.put("msgid",msgid);
        map.put("ts",ts);
        map.put("service",service);
        map.put("msgtype",msgtype);
        map.put("appkey",appkey);
        map.put("unitID",unitID);
        if (regphone != null) {
            map.put("regphone",regphone);
        }
        if(smbms!=null) {
            map.put( "smbms",smbms);
        }
        if(tbBindingRemoveRalation.getUuidinpartner()!=null) {
           map.put("uuidinpartner",tbBindingRemoveRalation.getUuidinpartner());
        }

        String sid=ApiSignUtils.signTopRequest(map,secret,"MD5");
        map.put("sid",sid);
        // 获取连接客户端工具

        CloseableHttpClient httpClient = HttpClients.createDefault();
        CloseableHttpResponse response = null;
        try {
            // 创建POST请求对象
            HttpPost httpPost = new HttpPost("http://123.127.33.35:8089/safenumberservicessm/api/manage/dataManage");

            // 创建请求参数
            List<NameValuePair> list = new LinkedList<>();
            for (Map.Entry<String, String> entry : map.entrySet()) {
                BasicNameValuePair param = new BasicNameValuePair(entry.getKey(),  entry.getValue());
                list.add(param);
            }

            // 使用URL实体转换工具
            UrlEncodedFormEntity entityParam = new UrlEncodedFormEntity(list, "UTF-8");
            httpPost.setEntity(entityParam);
            /*
             * 添加请求头信息
             */
            // 浏览器表示
            httpPost.addHeader("User-Agent", "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.7.6)");
            // 传输的类型
            httpPost.addHeader("Content-Type", "application/x-www-form-urlencoded");

            // 执行请求
            response = httpClient.execute(httpPost);
            // 获得响应的实体对象
            HttpEntity entity = response.getEntity();

            if(entity!=null){
                String str = EntityUtils.toString(entity,"UTF-8");
                Map<String, Object> strMap = JSONObject.parseObject(str);
                TbBindingRemoveRalation result=new TbBindingRemoveRalation();
                //获取异常信息
                if(strMap .get("error_response")!=null) {
                    Map<String, Object> err = JSON.parseObject(parseString(strMap.get("error_response")), Map.class);
                    String errMsg = "";
                    if (err != null) {
                        errMsg = parseString(err.get("sub_msg"));
                        result.setResult(errMsg);
                        System.out.println(errMsg);
                        return result;
                    }
                }
                if(strMap.get("binding_Relation_response")!=null){
                    Map<String, Object> res = JSON.parseObject(parseString(strMap.get("binding_Relation_response")), Map.class);
                    if (res != null) {
                        String msg = parseString(res.get("result"));
                        if(msg.equals("0")){
                            //解绑
                            TbBindingRemoveRalation updateBo=new TbBindingRemoveRalation();
                            updateBo.setDissubts(df.format(new Date().getTime()));
                            updateBo.setStatus("0");
                            updateBo.setModifyTime(new Date());
                            if(tbBindingRemoveRalation.getId()!=0){
                                updateBo.setId(tbBindingRemoveRalation.getId());
                                tbBindingRmoveRalation.update(updateBo);
                            }
                            if(tbBindingRemoveRalation.getRegphone()!=null&&!"".equals(tbBindingRemoveRalation.getRegphone())){
                                updateBo.setRegphone(tbBindingRemoveRalation.getRegphone());
                                updateBo.setPrtms(tbBindingRemoveRalation.getRegphone());
                                tbBindingRmoveRalation.update(updateBo);
                            }
                            if(tbBindingRemoveRalation.getUuidinpartner()!=null&&!"".equals(tbBindingRemoveRalation.getUuidinpartner())){
                                updateBo.setUuidinpartner(tbBindingRemoveRalation.getUuidinpartner());
                                tbBindingRmoveRalation.update(updateBo);

                            }
                            result.setResult("解绑成功");
                            return result;
                        }
                    }
                }



            }

        } catch (ClientProtocolException e) {
            logger.info("Http协议出现问题");
            e.printStackTrace();
        } catch (ParseException e) {
            logger.info("解析错误");
            e.printStackTrace();
        } catch (IOException e) {
            logger.info("IO异常");
            e.printStackTrace();
        } finally {
            // 释放连接
            if (null != response) {
                try {
                    response.close();
                    httpClient.close();
                } catch (IOException e) {
                    logger.info("释放连接出错");
                    e.printStackTrace();
                }
            }
        }
        return null;
    }


    private String parseString(Object obj) {
        if (obj == null) {
            return "";
        } else {
            return obj.toString();
        }
    }


}
