package com.gs.domain;

public class PomsMeasurDeviceConfig {
    private String id;

    private String mdcUnitsid;

    private String mdcAssembleid;

    private String mdcTerminalDeviceid;

    private String mdcModuleName;

    private String calculateTerminalSerial;

    private String communicateFunctionCode;

    private String mdcBackups;

    private String communicateFunSecCode;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getMdcUnitsid() {
        return mdcUnitsid;
    }

    public void setMdcUnitsid(String mdcUnitsid) {
        this.mdcUnitsid = mdcUnitsid == null ? null : mdcUnitsid.trim();
    }

    public String getMdcAssembleid() {
        return mdcAssembleid;
    }

    public void setMdcAssembleid(String mdcAssembleid) {
        this.mdcAssembleid = mdcAssembleid == null ? null : mdcAssembleid.trim();
    }

    public String getMdcTerminalDeviceid() {
        return mdcTerminalDeviceid;
    }

    public void setMdcTerminalDeviceid(String mdcTerminalDeviceid) {
        this.mdcTerminalDeviceid = mdcTerminalDeviceid == null ? null : mdcTerminalDeviceid.trim();
    }

    public String getMdcModuleName() {
        return mdcModuleName;
    }

    public void setMdcModuleName(String mdcModuleName) {
        this.mdcModuleName = mdcModuleName == null ? null : mdcModuleName.trim();
    }

    public String getCalculateTerminalSerial() {
        return calculateTerminalSerial;
    }

    public void setCalculateTerminalSerial(String calculateTerminalSerial) {
        this.calculateTerminalSerial = calculateTerminalSerial == null ? null : calculateTerminalSerial.trim();
    }

    public String getCommunicateFunctionCode() {
        return communicateFunctionCode;
    }

    public void setCommunicateFunctionCode(String communicateFunctionCode) {
        this.communicateFunctionCode = communicateFunctionCode == null ? null : communicateFunctionCode.trim();
    }

    public String getMdcBackups() {
        return mdcBackups;
    }

    public void setMdcBackups(String mdcBackups) {
        this.mdcBackups = mdcBackups == null ? null : mdcBackups.trim();
    }

    public String getCommunicateFunSecCode() {
        return communicateFunSecCode;
    }

    public void setCommunicateFunSecCode(String communicateFunSecCode) {
        this.communicateFunSecCode = communicateFunSecCode == null ? null : communicateFunSecCode.trim();
    }
}