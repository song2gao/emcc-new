package com.gs.domain;

import java.math.BigDecimal;
import java.util.Date;

public class EsmspIndexData {
    private String id;

    private Integer indexCode;

    private String indexName;

    private String indexUnitCode;

    private Integer applicationType;

    private String applicationCode;

    private String indexDate;

    private BigDecimal targetValue2;

    private BigDecimal targetValue;

    private BigDecimal sumValue2;

    private BigDecimal sumValue;

    private BigDecimal forecastValue;

    private BigDecimal highValue;

    private BigDecimal lowerValue;

    private BigDecimal warningValue;

    private BigDecimal upHighValue;

    private BigDecimal downLowerValue;

    private BigDecimal standardValue;

    private BigDecimal evgValue;

    private String calMethod;

    private Date indexPublishtime;

    private String indexPublishperson;

    private Integer indexPublishtag;

    private String keyBackups;

    private Integer indexCation;

    private Date indexCreatime;

    private String indexCreatperson;

    private String getvalueSql;

    private String assessId;

    private Integer dateFlag;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public Integer getIndexCode() {
        return indexCode;
    }

    public void setIndexCode(Integer indexCode) {
        this.indexCode = indexCode;
    }

    public String getIndexName() {
        return indexName;
    }

    public void setIndexName(String indexName) {
        this.indexName = indexName == null ? null : indexName.trim();
    }

    public String getIndexUnitCode() {
        return indexUnitCode;
    }

    public void setIndexUnitCode(String indexUnitCode) {
        this.indexUnitCode = indexUnitCode == null ? null : indexUnitCode.trim();
    }

    public Integer getApplicationType() {
        return applicationType;
    }

    public void setApplicationType(Integer applicationType) {
        this.applicationType = applicationType;
    }

    public String getApplicationCode() {
        return applicationCode;
    }

    public void setApplicationCode(String applicationCode) {
        this.applicationCode = applicationCode == null ? null : applicationCode.trim();
    }

    public String getIndexDate() {
        return indexDate;
    }

    public void setIndexDate(String indexDate) {
        this.indexDate = indexDate == null ? null : indexDate.trim();
    }

    public BigDecimal getTargetValue2() {
        return targetValue2;
    }

    public void setTargetValue2(BigDecimal targetValue2) {
        this.targetValue2 = targetValue2;
    }

    public BigDecimal getTargetValue() {
        return targetValue;
    }

    public void setTargetValue(BigDecimal targetValue) {
        this.targetValue = targetValue;
    }

    public BigDecimal getSumValue2() {
        return sumValue2;
    }

    public void setSumValue2(BigDecimal sumValue2) {
        this.sumValue2 = sumValue2;
    }

    public BigDecimal getSumValue() {
        return sumValue;
    }

    public void setSumValue(BigDecimal sumValue) {
        this.sumValue = sumValue;
    }

    public BigDecimal getForecastValue() {
        return forecastValue;
    }

    public void setForecastValue(BigDecimal forecastValue) {
        this.forecastValue = forecastValue;
    }

    public BigDecimal getHighValue() {
        return highValue;
    }

    public void setHighValue(BigDecimal highValue) {
        this.highValue = highValue;
    }

    public BigDecimal getLowerValue() {
        return lowerValue;
    }

    public void setLowerValue(BigDecimal lowerValue) {
        this.lowerValue = lowerValue;
    }

    public BigDecimal getWarningValue() {
        return warningValue;
    }

    public void setWarningValue(BigDecimal warningValue) {
        this.warningValue = warningValue;
    }

    public BigDecimal getUpHighValue() {
        return upHighValue;
    }

    public void setUpHighValue(BigDecimal upHighValue) {
        this.upHighValue = upHighValue;
    }

    public BigDecimal getDownLowerValue() {
        return downLowerValue;
    }

    public void setDownLowerValue(BigDecimal downLowerValue) {
        this.downLowerValue = downLowerValue;
    }

    public BigDecimal getStandardValue() {
        return standardValue;
    }

    public void setStandardValue(BigDecimal standardValue) {
        this.standardValue = standardValue;
    }

    public BigDecimal getEvgValue() {
        return evgValue;
    }

    public void setEvgValue(BigDecimal evgValue) {
        this.evgValue = evgValue;
    }

    public String getCalMethod() {
        return calMethod;
    }

    public void setCalMethod(String calMethod) {
        this.calMethod = calMethod == null ? null : calMethod.trim();
    }

    public Date getIndexPublishtime() {
        return indexPublishtime;
    }

    public void setIndexPublishtime(Date indexPublishtime) {
        this.indexPublishtime = indexPublishtime;
    }

    public String getIndexPublishperson() {
        return indexPublishperson;
    }

    public void setIndexPublishperson(String indexPublishperson) {
        this.indexPublishperson = indexPublishperson == null ? null : indexPublishperson.trim();
    }

    public Integer getIndexPublishtag() {
        return indexPublishtag;
    }

    public void setIndexPublishtag(Integer indexPublishtag) {
        this.indexPublishtag = indexPublishtag;
    }

    public String getKeyBackups() {
        return keyBackups;
    }

    public void setKeyBackups(String keyBackups) {
        this.keyBackups = keyBackups == null ? null : keyBackups.trim();
    }

    public Integer getIndexCation() {
        return indexCation;
    }

    public void setIndexCation(Integer indexCation) {
        this.indexCation = indexCation;
    }

    public Date getIndexCreatime() {
        return indexCreatime;
    }

    public void setIndexCreatime(Date indexCreatime) {
        this.indexCreatime = indexCreatime;
    }

    public String getIndexCreatperson() {
        return indexCreatperson;
    }

    public void setIndexCreatperson(String indexCreatperson) {
        this.indexCreatperson = indexCreatperson == null ? null : indexCreatperson.trim();
    }

    public String getGetvalueSql() {
        return getvalueSql;
    }

    public void setGetvalueSql(String getvalueSql) {
        this.getvalueSql = getvalueSql == null ? null : getvalueSql.trim();
    }

    public String getAssessId() {
        return assessId;
    }

    public void setAssessId(String assessId) {
        this.assessId = assessId == null ? null : assessId.trim();
    }

    public Integer getDateFlag() {
        return dateFlag;
    }

    public void setDateFlag(Integer dateFlag) {
        this.dateFlag = dateFlag;
    }
}