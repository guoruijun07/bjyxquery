package com.bjyx.enums;

import java.util.Arrays;

public enum EnumPriceCode {

    PC_PRICE(1, "PC单价", "pc"),
    APP_PRICE(2, "APP单价", "app"),
    UNKOWN_ERROR(2, "未知系统错误", "Unknown error");

    private int code;
    private String explainChInfo;
    private String explainEnInfo;

    EnumPriceCode(int code, String explainChInfo, String explainEnInfo) {
        this.code = code;
        this.explainChInfo = explainChInfo;
        this.explainEnInfo = explainEnInfo;
    }

    public String getExplainChInfo() {
        return explainChInfo;
    }

    public String getExplainEnInfo() {
        return explainEnInfo;
    }

    public int getCode() {
        return code;
    }

    public static EnumPriceCode getByCode(int code) {
        EnumPriceCode[] enumResultCodes = EnumPriceCode.values();
        EnumPriceCode result = Arrays.asList(enumResultCodes).stream()
                .filter(enumResCode -> enumResCode.getCode() == code)
                .findFirst().orElse(EnumPriceCode.UNKOWN_ERROR);
        return result;
    }

    public static EnumPriceCode getByCode(String codeStr) {
        int code = 10001;
        try{
            code = Integer.parseInt(codeStr);
        }catch (Exception e){
            return EnumPriceCode.UNKOWN_ERROR;
        }
        return getByCode(code);
    }
}
