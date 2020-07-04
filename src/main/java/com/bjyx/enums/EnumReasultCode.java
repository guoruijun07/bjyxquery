package com.bjyx.enums;

import java.util.Arrays;

public enum  EnumReasultCode {
//   TEST(1001,"","");
    SUCCESS(1, "成功", "Success"),
    FAILURE(0, "失败", "FAILURE"),
    UNKOWN_ERROR(2, "未知系统错误", "Unknown error");

    private int code;
    private String explainChInfo;
    private String explainEnInfo;

    EnumReasultCode(int code, String explainChInfo, String explainEnInfo) {
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

    public static EnumReasultCode getByCode(int code) {
        EnumReasultCode[] enumResultCodes = EnumReasultCode.values();
        EnumReasultCode result = Arrays.asList(enumResultCodes).stream()
                .filter(enumResCode -> enumResCode.getCode() == code)
                .findFirst().orElse(EnumReasultCode.UNKOWN_ERROR);
        return result;
    }

    public static EnumReasultCode getByCode(String codeStr) {
        int code = 10001;
        try{
            code = Integer.parseInt(codeStr);
        }catch (Exception e){
            return EnumReasultCode.UNKOWN_ERROR;
        }
        return getByCode(code);
    }
}
