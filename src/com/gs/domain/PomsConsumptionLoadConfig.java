package com.gs.domain;

import java.math.BigDecimal;

public class PomsConsumptionLoadConfig {
    private String id;

    private String pclcEuiId;

    private String pclcTerminalName;

    private String pclcLoopName;

    private BigDecimal pclcInitValue;

    private String pclcProductIndustry;

    private String pclcProductionCode;

    private String pclcCheckPeriod;

    private String pclcNextCheckTime;

    private Integer pclcCalculateBand;

    private String pclcModel;

    private Integer pclcIfhas;

    private String pclcEnergyType;

    private String pclcParentId;

    private String pclcBackups;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getPclcEuiId() {
        return pclcEuiId;
    }

    public void setPclcEuiId(String pclcEuiId) {
        this.pclcEuiId = pclcEuiId == null ? null : pclcEuiId.trim();
    }

    public String getPclcTerminalName() {
        return pclcTerminalName;
    }

    public void setPclcTerminalName(String pclcTerminalName) {
        this.pclcTerminalName = pclcTerminalName == null ? null : pclcTerminalName.trim();
    }

    public String getPclcLoopName() {
        return pclcLoopName;
    }

    public void setPclcLoopName(String pclcLoopName) {
        this.pclcLoopName = pclcLoopName == null ? null : pclcLoopName.trim();
    }

    public BigDecimal getPclcInitValue() {
        return pclcInitValue;
    }

    public void setPclcInitValue(BigDecimal pclcInitValue) {
        this.pclcInitValue = pclcInitValue;
    }

    public String getPclcProductIndustry() {
        return pclcProductIndustry;
    }

    public void setPclcProductIndustry(String pclcProductIndustry) {
        this.pclcProductIndustry = pclcProductIndustry == null ? null : pclcProductIndustry.trim();
    }

    public String getPclcProductionCode() {
        return pclcProductionCode;
    }

    public void setPclcProductionCode(String pclcProductionCode) {
        this.pclcProductionCode = pclcProductionCode == null ? null : pclcProductionCode.trim();
    }

    public String getPclcCheckPeriod() {
        return pclcCheckPeriod;
    }

    public void setPclcCheckPeriod(String pclcCheckPeriod) {
        this.pclcCheckPeriod = pclcCheckPeriod == null ? null : pclcCheckPeriod.trim();
    }

    public String getPclcNextCheckTime() {
        return pclcNextCheckTime;
    }

    public void setPclcNextCheckTime(String pclcNextCheckTime) {
        this.pclcNextCheckTime = pclcNextCheckTime == null ? null : pclcNextCheckTime.trim();
    }

    public Integer getPclcCalculateBand() {
        return pclcCalculateBand;
    }

    public void setPclcCalculateBand(Integer pclcCalculateBand) {
        this.pclcCalculateBand = pclcCalculateBand;
    }

    public String getPclcModel() {
        return pclcModel;
    }

    public void setPclcModel(String pclcModel) {
        this.pclcModel = pclcModel == null ? null : pclcModel.trim();
    }

    public Integer getPclcIfhas() {
        return pclcIfhas;
    }

    public void setPclcIfhas(Integer pclcIfhas) {
        this.pclcIfhas = pclcIfhas;
    }

    public String getPclcEnergyType() {
        return pclcEnergyType;
    }

    public void setPclcEnergyType(String pclcEnergyType) {
        this.pclcEnergyType = pclcEnergyType == null ? null : pclcEnergyType.trim();
    }

    public String getPclcParentId() {
        return pclcParentId;
    }

    public void setPclcParentId(String pclcParentId) {
        this.pclcParentId = pclcParentId == null ? null : pclcParentId.trim();
    }

    public String getPclcBackups() {
        return pclcBackups;
    }

    public void setPclcBackups(String pclcBackups) {
        this.pclcBackups = pclcBackups == null ? null : pclcBackups.trim();
    }
}