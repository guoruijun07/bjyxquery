package com.bjyx.utils;

import com.bjyx.enumeration.EnumReasultCode;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

public class SysResult {

    private Integer code;

    private String msg;

    private Double cost;

    private Object data;

    public SysResult() {

    }

    public SysResult(Integer code, String msg, Object data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public SysResult(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public SysResult(Integer code, String msg,Double cost, Object data) {
        this.code = code;
        this.msg = msg;
        this.cost = cost;
        this.data = data;
    }

    public SysResult(Integer code, String msg,List list) {
        this.code = code;
        this.msg = msg;
        this.data = list;
    }


    public SysResult(EnumReasultCode enumReasultCode) {
        this.code = enumReasultCode.getCode();
        this.msg = enumReasultCode.getExplainChInfo();
    }

    public SysResult(EnumReasultCode enumReasultCode, List list, long total) {
        this.code = enumReasultCode.getCode();
        this.msg = enumReasultCode.getExplainChInfo();
        Map<String, Object> data = new HashMap<>();
        data.put("data", list);
        data.put("total", total);
        this.data = data;
    }

    public SysResult(EnumReasultCode enumReasultCode, Object data) {
        this.code = enumReasultCode.getCode();
        this.msg = enumReasultCode.getExplainChInfo();
        this.data = data;
    }

    public SysResult(Object data) {
        this.data = data;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public Double getCost() {
        return cost;
    }

    public void setCost(Double cost) {
        this.cost = cost;
    }

    public void setEnumAndObj(EnumReasultCode enumReasultCode, Object data) {
        this.data = data;
        this.code = enumReasultCode.getCode();
        this.msg = enumReasultCode.getExplainChInfo();
    }

    public void setEnum(EnumReasultCode enumReasultCode) {
        this.code = enumReasultCode.getCode();
        this.msg = enumReasultCode.getExplainChInfo();
    }

    @Override
    public String toString() {
        return "SysResult {code=" + code + ", msg='" + msg +"cost="+cost+ '\'' + ", data=" + data + '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        SysResult resultParam = (SysResult) o;
        return Objects.equals(code, resultParam.code) &&
                Objects.equals(msg, resultParam.msg) &&
                Objects.equals(cost, resultParam.cost) &&
                Objects.equals(data, resultParam.data);
    }

    @Override
    public int hashCode() {
        return Objects.hash(code, msg,cost, data);
    }
}
