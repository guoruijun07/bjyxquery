package com.bjyx.utils;

import com.alibaba.excel.util.DateUtils;
import com.alibaba.excel.util.StringUtils;

import java.io.File;
import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

public class CommomUtils {



    public static Date getInvalidDate() {

        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DATE, 1);
        Date invalidDate = calendar.getTime();
        String formatDate = DateUtils.format(new Date(), "yyyy-MM-dd 23:59:59");
        try {
            invalidDate = DateUtils.parseDate(formatDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return invalidDate;
    }

    /**
     * 判断版本号
     */
    public static boolean isValidVersion(String version,String currentVersion){

        if(StringUtils.isEmpty(version)){
            return false;
        }
        if(Double.valueOf(currentVersion) > Double.valueOf(version)){
            return false;
        }
        return true;
    }

    /**
     * 创建目录
     * @param basePath
     * @param fileName
     * @param mobile
     * @return
     */
    public static File MakeLogDir(String basePath, String fileName, String mobile) {

        String dirPath =  basePath + mobile;

        File folder = new File(dirPath);
        if (!folder.exists()) {
            folder.mkdirs();
        }
        File file = new File(basePath + mobile + java.io.File.separator + fileName);
        if (file.exists()) {
            file.delete();
        }
        return file;
    }

    static Random random=new Random();
    //获取订单号
    public static String getOrderNo() {

        int number=random.nextInt(90000)+100000;
        return DateUtils.format(new Date(), DateUtils.DATE_FORMAT_14) +number;
    }
}
