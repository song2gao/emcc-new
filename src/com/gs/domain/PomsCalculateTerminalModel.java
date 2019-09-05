package com.gs.domain;

public class PomsCalculateTerminalModel {
    private String id;

    private String ctmCodes;

    private String ctmNames;

    private String ctmEnergyType;

    private String ctmProtocalFunCode;

    private String ctmProtocalSecFunCode;

    private String ctmProtocalSecdayFunCode;

    private String ctmProtocalSecmonFunCode;

    private String ctmBackups;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getCtmCodes() {
        return ctmCodes;
    }

    public void setCtmCodes(String ctmCodes) {
        this.ctmCodes = ctmCodes == null ? null : ctmCodes.trim();
    }

    public String getCtmNames() {
        return ctmNames;
    }

    public void setCtmNames(String ctmNames) {
        this.ctmNames = ctmNames == null ? null : ctmNames.trim();
    }

    public String getCtmEnergyType() {
        return ctmEnergyType;
    }

    public void setCtmEnergyType(String ctmEnergyType) {
        this.ctmEnergyType = ctmEnergyType == null ? null : ctmEnergyType.trim();
    }

    public String getCtmProtocalFunCode() {
        return ctmProtocalFunCode;
    }

    public void setCtmProtocalFunCode(String ctmProtocalFunCode) {
        this.ctmProtocalFunCode = ctmProtocalFunCode == null ? null : ctmProtocalFunCode.trim();
    }

    public String getCtmProtocalSecFunCode() {
        return ctmProtocalSecFunCode;
    }

    public void setCtmProtocalSecFunCode(String ctmProtocalSecFunCode) {
        this.ctmProtocalSecFunCode = ctmProtocalSecFunCode == null ? null : ctmProtocalSecFunCode.trim();
    }

    public String getCtmProtocalSecdayFunCode() {
        return ctmProtocalSecdayFunCode;
    }

    public void setCtmProtocalSecdayFunCode(String ctmProtocalSecdayFunCode) {
        this.ctmProtocalSecdayFunCode = ctmProtocalSecdayFunCode == null ? null : ctmProtocalSecdayFunCode.trim();
    }

    public String getCtmProtocalSecmonFunCode() {
        return ctmProtocalSecmonFunCode;
    }

    public void setCtmProtocalSecmonFunCode(String ctmProtocalSecmonFunCode) {
        this.ctmProtocalSecmonFunCode = ctmProtocalSecmonFunCode == null ? null : ctmProtocalSecmonFunCode.trim();
    }

    public String getCtmBackups() {
        return ctmBackups;
    }

    public void setCtmBackups(String ctmBackups) {
        this.ctmBackups = ctmBackups == null ? null : ctmBackups.trim();
    }
}