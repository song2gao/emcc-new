package com.gs.domain;

public class PomsOperationMaintenanceLog {
    private String id;

    private String umId;

    private String omlOperateTime;

    private String omlOperateContent;

    private String omlBankups;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getUmId() {
        return umId;
    }

    public void setUmId(String umId) {
        this.umId = umId == null ? null : umId.trim();
    }

    public String getOmlOperateTime() {
        return omlOperateTime;
    }

    public void setOmlOperateTime(String omlOperateTime) {
        this.omlOperateTime = omlOperateTime == null ? null : omlOperateTime.trim();
    }

    public String getOmlOperateContent() {
        return omlOperateContent;
    }

    public void setOmlOperateContent(String omlOperateContent) {
        this.omlOperateContent = omlOperateContent == null ? null : omlOperateContent.trim();
    }

    public String getOmlBankups() {
        return omlBankups;
    }

    public void setOmlBankups(String omlBankups) {
        this.omlBankups = omlBankups == null ? null : omlBankups.trim();
    }
}