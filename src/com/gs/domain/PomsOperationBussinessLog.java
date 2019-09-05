package com.gs.domain;

public class PomsOperationBussinessLog {
    private String id;

    private String umId;

    private String oblOperateTime;

    private String oblOperateContent;

    private String oblOperateType;

    private String oblBackups;

    private String oblSystemFlag;

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

    public String getOblOperateTime() {
        return oblOperateTime;
    }

    public void setOblOperateTime(String oblOperateTime) {
        this.oblOperateTime = oblOperateTime == null ? null : oblOperateTime.trim();
    }

    public String getOblOperateContent() {
        return oblOperateContent;
    }

    public void setOblOperateContent(String oblOperateContent) {
        this.oblOperateContent = oblOperateContent == null ? null : oblOperateContent.trim();
    }

    public String getOblOperateType() {
        return oblOperateType;
    }

    public void setOblOperateType(String oblOperateType) {
        this.oblOperateType = oblOperateType == null ? null : oblOperateType.trim();
    }

    public String getOblBackups() {
        return oblBackups;
    }

    public void setOblBackups(String oblBackups) {
        this.oblBackups = oblBackups == null ? null : oblBackups.trim();
    }

    public String getOblSystemFlag() {
        return oblSystemFlag;
    }

    public void setOblSystemFlag(String oblSystemFlag) {
        this.oblSystemFlag = oblSystemFlag == null ? null : oblSystemFlag.trim();
    }
}