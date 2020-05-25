package com.bjyx.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

@EqualsAndHashCode
@Data
public class DemoData {
    private String string;
    private Date date;
    private Double doubleData;
}
