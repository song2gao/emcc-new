package com.gs.domain;

public class PomsCalculateDeviceStatusAlter {
    private String id;

    private String statusDeviceId;

    private String statusAlterTime;

    private String statusAlterUserid;

    private String statusAlterReason;

    private String statusBackups;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getStatusDeviceId() {
        return statusDeviceId;
    }

    public void setStatusDeviceId(String statusDeviceId) {
        this.statusDeviceId = statusDeviceId == null ? null : statusDeviceId.trim();
    }

    public String getStatusAlterTime() {
        return statusAlterTime;
    }

    public void setStatusAlterTime(String statusAlterTime) {
        this.statusAlterTime = statusAlterTime == null ? null : statusAlterTime.trim();
    }

    public String getStatusAlterUserid() {
        return statusAlterUserid;
    }

    public void setStatusAlterUserid(String statusAlterUserid) {
        this.statusAlterUserid = statusAlterUserid == null ? null : statusAlterUserid.trim();
    }

    public String getStatusAlterReason() {
        return statusAlterReason;
    }

    public void setStatusAlterReason(String statusAlterReason) {
        this.statusAlterReason = statusAlterReason == null ? null : statusAlterReason.trim();
    }

    public String getStatusBackups() {
        return statusBackups;
    }

    public void setStatusBackups(String statusBackups) {
        this.statusBackups = statusBackups == null ? null : statusBackups.trim();
    }
}