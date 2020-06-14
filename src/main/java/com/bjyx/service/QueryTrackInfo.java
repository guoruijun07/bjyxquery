package com.bjyx.service;


import com.alibaba.fastjson.JSON;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import com.bjyx.entity.po.TbDetailTrajectoryOutsideInfo;
import com.bjyx.mapper.TbDetailTrajectoryOutsideInfoMapper;
import org.apache.http.*;
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
import sun.misc.BASE64Encoder;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.*;


/*四级分拣码 通过CSB调用 */
@Service
public class QueryTrackInfo {

    @Autowired
    private TbDetailTrajectoryOutsideInfoMapper tbDetailTrajectoryOutsideInfoMapper;

    private static final Logger logger = LoggerFactory.getLogger(QueryTrackInfo.class);



    public void queryTrackInfo(String mailNo) {

        //mailNo="9892019112608";

        //uuid
        String uuid = UUID.randomUUID().toString().replaceAll("-", "");

        //msgBody
        Map<String,Object> map= new HashMap<>();
        map.put("traceNo",mailNo);
        String traceNo=parseString(JSON.toJSON(map));

        //密钥
        String key = "DBF32C184B55011B";

        //加密并base64转码
        String beforeMD5 = traceNo + key;
        String dataDigest = md5AndBase64(beforeMD5);

        //sendDate
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
        String sendDate = df.format(new Date().getTime());

        // 获取连接客户端工具

        CloseableHttpClient httpClient = HttpClients.createDefault();
        CloseableHttpResponse response = null;
        try {
            // 创建POST请求对象
            HttpPost httpPost = new HttpPost("http://211.156.195.29/querypush-twswn/mailTrack/queryMailTrackWn/plus");

            // 创建请求参数
            List<NameValuePair> list = new LinkedList<>();
            BasicNameValuePair param1 = new BasicNameValuePair("sendID", "DNMN");
            BasicNameValuePair param2 = new BasicNameValuePair("provinceNo", "99");
            BasicNameValuePair param3 = new BasicNameValuePair("msgKind", "DNMN_JDPT_TRACE");
            BasicNameValuePair param4 = new BasicNameValuePair("serialNo", uuid);
            BasicNameValuePair param5 = new BasicNameValuePair("sendDate", sendDate);
            BasicNameValuePair param6 = new BasicNameValuePair("receiveID", "JDPT");
            BasicNameValuePair param7 = new BasicNameValuePair("batchNo", "999");
            BasicNameValuePair param8 = new BasicNameValuePair("dataType", "1");
            BasicNameValuePair param9 = new BasicNameValuePair("dataDigest", dataDigest);
            BasicNameValuePair param10 = new BasicNameValuePair("msgBody", traceNo);

            list.add(param1);
            list.add(param2);
            list.add(param3);
            list.add(param4);
            list.add(param5);
            list.add(param6);
            list.add(param7);
            list.add(param8);
            list.add(param9);
            list.add(param10);
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
                String result = EntityUtils.toString(entity,"UTF-8");
                Map<String, Object> resultMap = JSONObject.parseObject(result);
                List<TbDetailTrajectoryOutsideInfo> conList=new ArrayList<>() ;

                List<JSONObject> dates= (List<JSONObject>) resultMap.get("responseItems");
                for(JSONObject json:dates){
                    conList.add(JSON.parseObject(json.toString(),TbDetailTrajectoryOutsideInfo.class));
                }
                tbDetailTrajectoryOutsideInfoMapper.deleteByMailNo(mailNo);
                tbDetailTrajectoryOutsideInfoMapper.batchInsert(conList);

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
    }


    private String parseString(Object obj) {
        if (obj == null) {
            return "";
        } else {
            return obj.toString();
        }
    }

    private String md5AndBase64(String str){
        //MD5加密
        MessageDigest md = null;
        try {
            md = MessageDigest.getInstance("md5");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        byte[] MD5;
        if(md!=null) {
            MD5 = md.digest(str.getBytes());
        }else{
            return "";
        }
        //转为32位
        int i;
        StringBuilder buf = new StringBuilder();
        for (byte b : MD5) {
            i = b;
            if (i < 0) {
                i += 256;
            }
            if (i < 16) {
                buf.append("0");
            }
            buf.append(Integer.toHexString(i));
        }
        MD5 = buf.toString().getBytes();

        //base64转码
        BASE64Encoder be = new BASE64Encoder();
        str = be.encode(MD5);
        return str;
    }
}
