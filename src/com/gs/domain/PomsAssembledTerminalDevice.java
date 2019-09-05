package com.gs.domain;

public class PomsAssembledTerminalDevice {
    private String id;

    private String asstdEnterpriseid;

    private String asstdCode;

    private String asstdNames;

    private String asstdRunStatus;

    private String asstdProduction;

    private String froId;

    private String asstdAssembleIp;

    private String crcCommunicateType;

    private String crcCommunicateSerial;

    private String asstdBackups;

    private String channelId;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getAsstdEnterpriseid() {
        return asstdEnterpriseid;
    }

    public void setAsstdEnterpriseid(String asstdEnterpriseid) {
        this.asstdEnterpriseid = asstdEnterpriseid == null ? null : asstdEnterpriseid.trim();
    }

    public String getAsstdCode() {
        return asstdCode;
    }

    public void setAsstdCode(String asstdCode) {
        this.asstdCode = asstdCode == null ? null : asstdCode.trim();
    }

    public String getAsstdNames() {
        return asstdNames;
    }

    public void setAsstdNames(String asstdNames) {
        this.asstdNames = asstdNames == null ? null : asstdNames.trim();
    }

    public String getAsstdRunStatus() {
        return asstdRunStatus;
    }

    public void setAsstdRunStatus(String asstdRunStatus) {
        this.asstdRunStatus = asstdRunStatus == null ? null : asstdRunStatus.trim();
    }

    public String getAsstdProduction() {
        return asstdProduction;
    }

    public void setAsstdProduction(String asstdProduction) {
        this.asstdProduction = asstdProduction == null ? null : asstdProduction.trim();
    }

    public String getFroId() {
        return froId;
    }

    public void setFroId(String froId) {
        this.froId = froId == null ? null : froId.trim();
    }

    public String getAsstdAssembleIp() {
        return asstdAssembleIp;
    }

    public void setAsstdAssembleIp(String asstdAssembleIp) {
        this.asstdAssembleIp = asstdAssembleIp == null ? null : asstdAssembleIp.trim();
    }

    public String getCrcCommunicateType() {
        return crcCommunicateType;
    }

    public void setCrcCommunicateType(String crcCommunicateType) {
        this.crcCommunicateType = crcCommunicateType == null ? null : crcCommunicateType.trim();
    }

    public String getCrcCommunicateSerial() {
        return crcCommunicateSerial;
    }

    public void setCrcCommunicateSerial(String crcCommunicateSerial) {
        this.crcCommunicateSerial = crcCommunicateSerial == null ? null : crcCommunicateSerial.trim();
    }

    public String getAsstdBackups() {
        return asstdBackups;
    }

    public void setAsstdBackups(String asstdBackups) {
        this.asstdBackups = asstdBackups == null ? null : asstdBackups.trim();
    }

    public String getChannelId() {
        return channelId;
    }

    public void setChannelId(String channelId) {
        this.channelId = channelId == null ? null : channelId.trim();
    }
}