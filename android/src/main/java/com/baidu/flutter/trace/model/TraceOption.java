package com.baidu.flutter.trace.model;

import android.app.Notification;

import com.baidu.trace.Trace;

/**
 * Copyright (C) 2019 Baidu, Inc. All Rights Reserved.
 */
public class TraceOption {

    /**
     * 轨迹服务ID
     */
    public long serviceId = 0;

    /**
     * 用户自定义的entity标识，同一serviceId下该字段不允许重复，是entity的唯一标识
     */
    public String entityName = "";

    /**
     * 是否生成一个前台服务通知
     */
    public boolean startNotification = false;

    public Notification notification;

    /**
     * 该entityName只用于数据库升级
     */
    public String dbEntityName = "";

    public Trace toTrace() {
        Trace trace = new Trace();
        trace.setServiceId(serviceId);
        trace.setEntityName(entityName);
        if (startNotification && notification != null) {
            trace.setNotification(notification);
        }

        return trace;
    }
}
