package com.gs.domain;

import java.math.BigDecimal;

public class EsmspIndexStandard {
    private String id;

    private Integer indexCode;

    private String indexName;

    private String indexUnitCode;

    private Integer applicationType;

    private String applicationCode;

    private BigDecimal standardValue1;

    private BigDecimal standardValue2;

    private BigDecimal standardValue3;

    private BigDecimal standardValue4;

    private BigDecimal standardValue5;

    private String indexPublishtime;

    private String indexPublishperson;

    private Integer indexPublishtag;

    private String keyBackups;

    private String indexCreatime;

    private String indexCreatperson;

    private String getvalueSql;

    private Integer standardLevel;

    private String assessId;

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

    public BigDecimal getStandardValue1() {
        return standardValue1;
    }

    public void setStandardValue1(BigDecimal standardValue1) {
        this.standardValue1 = standardValue1;
    }

    public BigDecimal getStandardValue2() {
        return standardValue2;
    }

    public void setStandardValue2(BigDecimal standardValue2) {
        this.standardValue2 = standardValue2;
    }

    public BigDecimal getStandardValue3() {
        return standardValue3;
    }

    public void setStandardValue3(BigDecimal standardValue3) {
        this.standardValue3 = standardValue3;
    }

    public BigDecimal getStandardValue4() {
        return standardValue4;
    }

    public void setStandardValue4(BigDecimal standardValue4) {
        this.standardValue4 = standardValue4;
    }

    public BigDecimal getStandardValue5() {
        return standardValue5;
    }

    public void setStandardValue5(BigDecimal standardValue5) {
        this.standardValue5 = standardValue5;
    }

    public String getIndexPublishtime() {
        return indexPublishtime;
    }

    public void setIndexPublishtime(String indexPublishtime) {
        this.indexPublishtime = indexPublishtime == null ? null : indexPublishtime.trim();
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

    public String getGetvalueSql() {
        return getvalueSql;
    }

    public void setGetvalueSql(String getvalueSql) {
        this.getvalueSql = getvalueSql == null ? null : getvalueSql.trim();
    }

    public Integer getStandardLevel() {
        return standardLevel;
    }

    public void setStandardLevel(Integer standardLevel) {
        this.standardLevel = standardLevel;
    }

    public String getAssessId() {
        return assessId;
    }

    public void setAssessId(String assessId) {
        this.assessId = assessId == null ? null : assessId.trim();
    }
}