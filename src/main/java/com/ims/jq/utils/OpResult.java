package com.ims.jq.utils;

import lombok.Data;

@Data
public class OpResult {

    private boolean success;
    private String code;
    private String msg;
    private Object data;


}
