package com.gs.domain;

public class PreChannelInfo {
    private String id;

    private String chaNumber;

    private String chaProtocolcode;

    private String chaAddressport;

    private Integer chaUsemark;

    private String chaDetectionmark;

    private String chaCommmode;

    private String chaReservechannel;

    private String chaRunstatus;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getChaNumber() {
        return chaNumber;
    }

    public void setChaNumber(String chaNumber) {
        this.chaNumber = chaNumber == null ? null : chaNumber.trim();
    }

    public String getChaProtocolcode() {
        return chaProtocolcode;
    }

    public void setChaProtocolcode(String chaProtocolcode) {
        this.chaProtocolcode = chaProtocolcode == null ? null : chaProtocolcode.trim();
    }

    public String getChaAddressport() {
        return chaAddressport;
    }

    public void setChaAddressport(String chaAddressport) {
        this.chaAddressport = chaAddressport == null ? null : chaAddressport.trim();
    }

    public Integer getChaUsemark() {
        return chaUsemark;
    }

    public void setChaUsemark(Integer chaUsemark) {
        this.chaUsemark = chaUsemark;
    }

    public String getChaDetectionmark() {
        return chaDetectionmark;
    }

    public void setChaDetectionmark(String chaDetectionmark) {
        this.chaDetectionmark = chaDetectionmark == null ? null : chaDetectionmark.trim();
    }

    public String getChaCommmode() {
        return chaCommmode;
    }

    public void setChaCommmode(String chaCommmode) {
        this.chaCommmode = chaCommmode == null ? null : chaCommmode.trim();
    }

    public String getChaReservechannel() {
        return chaReservechannel;
    }

    public void setChaReservechannel(String chaReservechannel) {
        this.chaReservechannel = chaReservechannel == null ? null : chaReservechannel.trim();
    }

    public String getChaRunstatus() {
        return chaRunstatus;
    }

    public void setChaRunstatus(String chaRunstatus) {
        this.chaRunstatus = chaRunstatus == null ? null : chaRunstatus.trim();
    }
}