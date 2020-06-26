package com.bjyx.service.bindingandremove;

import org.apache.commons.lang.StringUtils;


import javax.crypto.Mac;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.security.MessageDigest;
import java.util.*;

/**
 * @decription ApiSignUtils
 * <p>安全号api调用接口签名计算</p>
 * @author Yampery
 * @date 2018/3/12 9:20
 */
public class ApiSignUtils {
	public static String signTopRequest(Map<String, String> params, String secret, String signMethod)
			throws IOException {
		// 第一步：检查参数是否已经排序
		String[] keys = params.keySet().toArray(new String[0]);
		Arrays.sort(keys);

		// 第二步：把所有参数名和参数值串在一起
		StringBuilder query = new StringBuilder();
		if (signMethod.equals("MD5")) {
			query.append(secret);
		}
		for (String key : keys) {
			String value = params.get(key);
			if (StringUtils
					.isNotBlank(key) /* && StringUtils.isNotBlank(value) */ ) { //改为允许value为空
				query.append(key).append(value);
			}
		}

		// 第三步：使用MD5/HMAC加密
		byte[] bytes;
		if (signMethod.equals("HMAC")) {
			bytes = encryptHMAC(query.toString(), secret);
		} else {
			query.append(secret);
			// System.out.println(query.toString());
			bytes = encryptMD5(query.toString());
		}

		// 第四步：把二进制转化为大写的十六进制
		return byte2hex(bytes);
	}

	public static byte[] encryptHMAC(String data, String secret) throws IOException {
		byte[] bytes = null;
		try {
			SecretKey secretKey = new SecretKeySpec(secret.getBytes("UTF-8"), "HmacMD5");
			Mac mac = Mac.getInstance(secretKey.getAlgorithm());
			mac.init(secretKey);
			bytes = mac.doFinal(data.getBytes("UTF-8"));
		} catch (GeneralSecurityException gse) {
			throw new IOException(gse.toString());
		}
		return bytes;
	}

	public static byte[] encryptMD5(String data) throws IOException {
		byte[] bytes = null;
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			bytes = md.digest(data.getBytes("UTF-8"));
		} catch (GeneralSecurityException gse) {
			throw new IOException(gse.toString());
		}
		return bytes;
	}

	public static String byte2hex(byte[] bytes) {
		StringBuilder sign = new StringBuilder();
		for (int i = 0; i < bytes.length; i++) {
			String hex = Integer.toHexString(bytes[i] & 0xFF);
			if (hex.length() == 1) {
				sign.append("0");
			}
			sign.append(hex.toUpperCase());
		}
		return sign.toString();
	}

	public static void main(String[] args) {

		String  str="msgtype=binding_Relation&unitID=10000000064&prtms=18745163068&uidType=0&appkey=jsC9UBMTYLFpvjMWIT2X0E6BtHQzXjos8MvnQpJKPo1KzVPQehRB8cQsXxJUDEWq&msgid=1a8bf89c-5b49-4ffd-9943-6db477573c7c&service=SafeNumber&ver=2.0&ts=2018-06-01 19:00:00";
		String [ ]s=str.split("&");
		Map<String,String> map=new HashMap<>();
		for(String s1:s){
			String[] keys=s1.split("=");
			map.put(keys[0],keys[1]);
		}
		try {
			System.out.println(signTopRequest(map,"4Xmou6i2W3CA","MD5"));
		} catch (IOException e) {
			e.printStackTrace();
		}


	}


}
