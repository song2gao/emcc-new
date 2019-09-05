package com.gs.domain;

import java.math.BigDecimal;

public class PomsDeviceMeasurPoint {
    private Integer id;

    private String calId;

    private String mmpCodes;

    private String mmpNames;

    private String modAddress;

    private Integer mmpLength;

    private String mmpSymbols;

    private String mmpUnits;

    private String mmpFormular;

    private Integer mmpIssave;

    private String mmpType;

    private String mmpSaveInterval;

    private String mmpSaveStyle;

    private String mmpStatisticType;

    private BigDecimal mmpUpValue;

    private BigDecimal mmpUperLine;

    private BigDecimal mmpDownValue;

    private BigDecimal mmpDownerLine;

    private BigDecimal mmpStandardVal;

    private String mmpBackups;

    private Integer mmpIsct;

    private Integer mmpIspt;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCalId() {
        return calId;
    }

    public void setCalId(String calId) {
        this.calId = calId == null ? null : calId.trim();
    }

    public String getMmpCodes() {
        return mmpCodes;
    }

    public void setMmpCodes(String mmpCodes) {
        this.mmpCodes = mmpCodes == null ? null : mmpCodes.trim();
    }

    public String getMmpNames() {
        return mmpNames;
    }

    public void setMmpNames(String mmpNames) {
        this.mmpNames = mmpNames == null ? null : mmpNames.trim();
    }

    public String getModAddress() {
        return modAddress;
    }

    public void setModAddress(String modAddress) {
        this.modAddress = modAddress == null ? null : modAddress.trim();
    }

    public Integer getMmpLength() {
        return mmpLength;
    }

    public void setMmpLength(Integer mmpLength) {
        this.mmpLength = mmpLength;
    }

    public String getMmpSymbols() {
        return mmpSymbols;
    }

    public void setMmpSymbols(String mmpSymbols) {
        this.mmpSymbols = mmpSymbols == null ? null : mmpSymbols.trim();
    }

    public String getMmpUnits() {
        return mmpUnits;
    }

    public void setMmpUnits(String mmpUnits) {
        this.mmpUnits = mmpUnits == null ? null : mmpUnits.trim();
    }

    public String getMmpFormular() {
        return mmpFormular;
    }

    public void setMmpFormular(String mmpFormular) {
        this.mmpFormular = mmpFormular == null ? null : mmpFormular.trim();
    }

    public Integer getMmpIssave() {
        return mmpIssave;
    }

    public void setMmpIssave(Integer mmpIssave) {
        this.mmpIssave = mmpIssave;
    }

    public String getMmpType() {
        return mmpType;
    }

    public void setMmpType(String mmpType) {
        this.mmpType = mmpType == null ? null : mmpType.trim();
    }

    public String getMmpSaveInterval() {
        return mmpSaveInterval;
    }

    public void setMmpSaveInterval(String mmpSaveInterval) {
        this.mmpSaveInterval = mmpSaveInterval == null ? null : mmpSaveInterval.trim();
    }

    public String getMmpSaveStyle() {
        return mmpSaveStyle;
    }

    public void setMmpSaveStyle(String mmpSaveStyle) {
        this.mmpSaveStyle = mmpSaveStyle == null ? null : mmpSaveStyle.trim();
    }

    public String getMmpStatisticType() {
        return mmpStatisticType;
    }

    public void setMmpStatisticType(String mmpStatisticType) {
        this.mmpStatisticType = mmpStatisticType == null ? null : mmpStatisticType.trim();
    }

    public BigDecimal getMmpUpValue() {
        return mmpUpValue;
    }

    public void setMmpUpValue(BigDecimal mmpUpValue) {
        this.mmpUpValue = mmpUpValue;
    }

    public BigDecimal getMmpUperLine() {
        return mmpUperLine;
    }

    public void setMmpUperLine(BigDecimal mmpUperLine) {
        this.mmpUperLine = mmpUperLine;
    }

    public BigDecimal getMmpDownValue() {
        return mmpDownValue;
    }

    public void setMmpDownValue(BigDecimal mmpDownValue) {
        this.mmpDownValue = mmpDownValue;
    }

    public BigDecimal getMmpDownerLine() {
        return mmpDownerLine;
    }

    public void setMmpDownerLine(BigDecimal mmpDownerLine) {
        this.mmpDownerLine = mmpDownerLine;
    }

    public BigDecimal getMmpStandardVal() {
        return mmpStandardVal;
    }

    public void setMmpStandardVal(BigDecimal mmpStandardVal) {
        this.mmpStandardVal = mmpStandardVal;
    }

    public String getMmpBackups() {
        return mmpBackups;
    }

    public void setMmpBackups(String mmpBackups) {
        this.mmpBackups = mmpBackups == null ? null : mmpBackups.trim();
    }

    public Integer getMmpIsct() {
        return mmpIsct;
    }

    public void setMmpIsct(Integer mmpIsct) {
        this.mmpIsct = mmpIsct;
    }

    public Integer getMmpIspt() {
        return mmpIspt;
    }

    public void setMmpIspt(Integer mmpIspt) {
        this.mmpIspt = mmpIspt;
    }
}