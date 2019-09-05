package com.gs.domain;

public class PomsCommunicationRoutingConfig {
    private String id;

    private String froId;

    private String crcEnterpriseId;

    private String crcAssembleId;

    private String crcAssembleIp;

    private String crcCommunicateType;

    private String crcCommunicateSerial;

    private String crcBackups;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getFroId() {
        return froId;
    }

    public void setFroId(String froId) {
        this.froId = froId == null ? null : froId.trim();
    }

    public String getCrcEnterpriseId() {
        return crcEnterpriseId;
    }

    public void setCrcEnterpriseId(String crcEnterpriseId) {
        this.crcEnterpriseId = crcEnterpriseId == null ? null : crcEnterpriseId.trim();
    }

    public String getCrcAssembleId() {
        return crcAssembleId;
    }

    public void setCrcAssembleId(String crcAssembleId) {
        this.crcAssembleId = crcAssembleId == null ? null : crcAssembleId.trim();
    }

    public String getCrcAssembleIp() {
        return crcAssembleIp;
    }

    public void setCrcAssembleIp(String crcAssembleIp) {
        this.crcAssembleIp = crcAssembleIp == null ? null : crcAssembleIp.trim();
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

    public String getCrcBackups() {
        return crcBackups;
    }

    public void setCrcBackups(String crcBackups) {
        this.crcBackups = crcBackups == null ? null : crcBackups.trim();
    }
}