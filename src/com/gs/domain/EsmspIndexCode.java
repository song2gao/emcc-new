package com.gs.domain;

import java.math.BigDecimal;

public class EsmspIndexCode {
    private Integer indexCode;

    private String id;

    private Integer indexType;

    private Integer indexCat;

    private String indexName;

    private String indexFullname;

    private String indexUnitCode;

    private String surveyCycle;

    private String calMethod;

    private BigDecimal standardValue;

    private BigDecimal warningValue;

    private BigDecimal targetValue;

    private BigDecimal lowerValue;

    private BigDecimal highValue;

    private Integer indexEnable;

    private String indexNote;

    private String euiCode;

    private String indexCreatime;

    private String indexCreatperson;

    private String parentId;

    public Integer getIndexCode() {
        return indexCode;
    }

    public void setIndexCode(Integer indexCode) {
        this.indexCode = indexCode;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public Integer getIndexType() {
        return indexType;
    }

    public void setIndexType(Integer indexType) {
        this.indexType = indexType;
    }

    public Integer getIndexCat() {
        return indexCat;
    }

    public void setIndexCat(Integer indexCat) {
        this.indexCat = indexCat;
    }

    public String getIndexName() {
        return indexName;
    }

    public void setIndexName(String indexName) {
        this.indexName = indexName == null ? null : indexName.trim();
    }

    public String getIndexFullname() {
        return indexFullname;
    }

    public void setIndexFullname(String indexFullname) {
        this.indexFullname = indexFullname == null ? null : indexFullname.trim();
    }

    public String getIndexUnitCode() {
        return indexUnitCode;
    }

    public void setIndexUnitCode(String indexUnitCode) {
        this.indexUnitCode = indexUnitCode == null ? null : indexUnitCode.trim();
    }

    public String getSurveyCycle() {
        return surveyCycle;
    }

    public void setSurveyCycle(String surveyCycle) {
        this.surveyCycle = surveyCycle == null ? null : surveyCycle.trim();
    }

    public String getCalMethod() {
        return calMethod;
    }

    public void setCalMethod(String calMethod) {
        this.calMethod = calMethod == null ? null : calMethod.trim();
    }

    public BigDecimal getStandardValue() {
        return standardValue;
    }

    public void setStandardValue(BigDecimal standardValue) {
        this.standardValue = standardValue;
    }

    public BigDecimal getWarningValue() {
        return warningValue;
    }

    public void setWarningValue(BigDecimal warningValue) {
        this.warningValue = warningValue;
    }

    public BigDecimal getTargetValue() {
        return targetValue;
    }

    public void setTargetValue(BigDecimal targetValue) {
        this.targetValue = targetValue;
    }

    public BigDecimal getLowerValue() {
        return lowerValue;
    }

    public void setLowerValue(BigDecimal lowerValue) {
        this.lowerValue = lowerValue;
    }

    public BigDecimal getHighValue() {
        return highValue;
    }

    public void setHighValue(BigDecimal highValue) {
        this.highValue = highValue;
    }

    public Integer getIndexEnable() {
        return indexEnable;
    }

    public void setIndexEnable(Integer indexEnable) {
        this.indexEnable = indexEnable;
    }

    public String getIndexNote() {
        return indexNote;
    }

    public void setIndexNote(String indexNote) {
        this.indexNote = indexNote == null ? null : indexNote.trim();
    }

    public String getEuiCode() {
        return euiCode;
    }

    public void setEuiCode(String euiCode) {
        this.euiCode = euiCode == null ? null : euiCode.trim();
    }

    public String getIndexCreatime() {
        return indexCreatime;
    }

    public void setIndexCreatime(String indexCreatime) {
        this.indexCreatime = indexCreatime == null ? null : indexCreatime.trim();
    }

    public String getIndexCreatperson() {
        return indexCreatperson;
    }

    public void setIndexCreatperson(String indexCreatperson) {
        this.indexCreatperson = indexCreatperson == null ? null : indexCreatperson.trim();
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId == null ? null : parentId.trim();
    }
}