package com.gs.domain;

import java.math.BigDecimal;

public class PomsCalculateTerminalDevice {
    private String id;

    private String ctmId;

    private String cdtAssembleid;

    private String ctdAddr;

    private String cdtCorporateId;

    private String ctdCodes;

    private String cdtTerminalStatus;

    private String cdtMeasureLoop;

    private BigDecimal cdtInitValue;

    private String cdtTerminalName;

    private String cdtTerminalIndustry;

    private String cdtProductionCode;

    private String cdtCheckPeriod;

    private String cdtNextCheckTime;

    private String cdtAddTime;

    private BigDecimal cdtScale;

    private String cdtIsinvented;

    private String cdtFormular;//电流比例

    private String cdtFormularid;//电压比例

    private String cdtBackups;

    private String cdtProtocalFunCode;

    private String cdtProtocalSecFunCode;

    private String cdtProtocalSecdayFunCode;

    private String cdtProtocalSecmonFunCode;

    private String pclcParentId;

    private Integer pclcCalculateBand;

    private String pclcEnergyType;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getCtmId() {
        return ctmId;
    }

    public void setCtmId(String ctmId) {
        this.ctmId = ctmId == null ? null : ctmId.trim();
    }

    public String getCdtAssembleid() {
        return cdtAssembleid;
    }

    public void setCdtAssembleid(String cdtAssembleid) {
        this.cdtAssembleid = cdtAssembleid == null ? null : cdtAssembleid.trim();
    }

    public String getCtdAddr() {
        return ctdAddr;
    }

    public void setCtdAddr(String ctdAddr) {
        this.ctdAddr = ctdAddr == null ? null : ctdAddr.trim();
    }

    public String getCdtCorporateId() {
        return cdtCorporateId;
    }

    public void setCdtCorporateId(String cdtCorporateId) {
        this.cdtCorporateId = cdtCorporateId == null ? null : cdtCorporateId.trim();
    }

    public String getCtdCodes() {
        return ctdCodes;
    }

    public void setCtdCodes(String ctdCodes) {
        this.ctdCodes = ctdCodes == null ? null : ctdCodes.trim();
    }

    public String getCdtTerminalStatus() {
        return cdtTerminalStatus;
    }

    public void setCdtTerminalStatus(String cdtTerminalStatus) {
        this.cdtTerminalStatus = cdtTerminalStatus == null ? null : cdtTerminalStatus.trim();
    }

    public String getCdtMeasureLoop() {
        return cdtMeasureLoop;
    }

    public void setCdtMeasureLoop(String cdtMeasureLoop) {
        this.cdtMeasureLoop = cdtMeasureLoop == null ? null : cdtMeasureLoop.trim();
    }

    public BigDecimal getCdtInitValue() {
        return cdtInitValue;
    }

    public void setCdtInitValue(BigDecimal cdtInitValue) {
        this.cdtInitValue = cdtInitValue;
    }

    public String getCdtTerminalName() {
        return cdtTerminalName;
    }

    public void setCdtTerminalName(String cdtTerminalName) {
        this.cdtTerminalName = cdtTerminalName == null ? null : cdtTerminalName.trim();
    }

    public String getCdtTerminalIndustry() {
        return cdtTerminalIndustry;
    }

    public void setCdtTerminalIndustry(String cdtTerminalIndustry) {
        this.cdtTerminalIndustry = cdtTerminalIndustry == null ? null : cdtTerminalIndustry.trim();
    }

    public String getCdtProductionCode() {
        return cdtProductionCode;
    }

    public void setCdtProductionCode(String cdtProductionCode) {
        this.cdtProductionCode = cdtProductionCode == null ? null : cdtProductionCode.trim();
    }

    public String getCdtCheckPeriod() {
        return cdtCheckPeriod;
    }

    public void setCdtCheckPeriod(String cdtCheckPeriod) {
        this.cdtCheckPeriod = cdtCheckPeriod == null ? null : cdtCheckPeriod.trim();
    }

    public String getCdtNextCheckTime() {
        return cdtNextCheckTime;
    }

    public void setCdtNextCheckTime(String cdtNextCheckTime) {
        this.cdtNextCheckTime = cdtNextCheckTime == null ? null : cdtNextCheckTime.trim();
    }

    public String getCdtAddTime() {
        return cdtAddTime;
    }

    public void setCdtAddTime(String cdtAddTime) {
        this.cdtAddTime = cdtAddTime == null ? null : cdtAddTime.trim();
    }

    public BigDecimal getCdtScale() {
        return cdtScale;
    }

    public void setCdtScale(BigDecimal cdtScale) {
        this.cdtScale = cdtScale;
    }

    public String getCdtIsinvented() {
        return cdtIsinvented;
    }

    public void setCdtIsinvented(String cdtIsinvented) {
        this.cdtIsinvented = cdtIsinvented == null ? null : cdtIsinvented.trim();
    }

    public String getCdtFormular() {
        return cdtFormular;
    }

    public void setCdtFormular(String cdtFormular) {
        this.cdtFormular = cdtFormular == null ? null : cdtFormular.trim();
    }

    public String getCdtFormularid() {
        return cdtFormularid;
    }

    public void setCdtFormularid(String cdtFormularid) {
        this.cdtFormularid = cdtFormularid == null ? null : cdtFormularid.trim();
    }

    public String getCdtBackups() {
        return cdtBackups;
    }

    public void setCdtBackups(String cdtBackups) {
        this.cdtBackups = cdtBackups == null ? null : cdtBackups.trim();
    }

    public String getCdtProtocalFunCode() {
        return cdtProtocalFunCode;
    }

    public void setCdtProtocalFunCode(String cdtProtocalFunCode) {
        this.cdtProtocalFunCode = cdtProtocalFunCode == null ? null : cdtProtocalFunCode.trim();
    }

    public String getCdtProtocalSecFunCode() {
        return cdtProtocalSecFunCode;
    }

    public void setCdtProtocalSecFunCode(String cdtProtocalSecFunCode) {
        this.cdtProtocalSecFunCode = cdtProtocalSecFunCode == null ? null : cdtProtocalSecFunCode.trim();
    }

    public String getCdtProtocalSecdayFunCode() {
        return cdtProtocalSecdayFunCode;
    }

    public void setCdtProtocalSecdayFunCode(String cdtProtocalSecdayFunCode) {
        this.cdtProtocalSecdayFunCode = cdtProtocalSecdayFunCode == null ? null : cdtProtocalSecdayFunCode.trim();
    }

    public String getCdtProtocalSecmonFunCode() {
        return cdtProtocalSecmonFunCode;
    }

    public void setCdtProtocalSecmonFunCode(String cdtProtocalSecmonFunCode) {
        this.cdtProtocalSecmonFunCode = cdtProtocalSecmonFunCode == null ? null : cdtProtocalSecmonFunCode.trim();
    }

    public String getPclcParentId() {
        return pclcParentId;
    }

    public void setPclcParentId(String pclcParentId) {
        this.pclcParentId = pclcParentId == null ? null : pclcParentId.trim();
    }

    public Integer getPclcCalculateBand() {
        return pclcCalculateBand;
    }

    public void setPclcCalculateBand(Integer pclcCalculateBand) {
        this.pclcCalculateBand = pclcCalculateBand;
    }

    public String getPclcEnergyType() {
        return pclcEnergyType;
    }

    public void setPclcEnergyType(String pclcEnergyType) {
        this.pclcEnergyType = pclcEnergyType == null ? null : pclcEnergyType.trim();
    }
}