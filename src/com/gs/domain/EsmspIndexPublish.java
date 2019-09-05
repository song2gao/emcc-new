package com.gs.domain;

import java.math.BigDecimal;
import java.util.Date;

public class EsmspIndexPublish {
    private String id;

    private String governmentDistrictCode;

    private String euiBelongIndustry;

    private String euiCode;

    private String indexDate;

    private Integer indexCode;

    private String indexName;

    private String indexUnitCode;

    private BigDecimal publishValue;

    private Integer indexSort;

    private BigDecimal standardValue1;

    private BigDecimal standardValue2;

    private BigDecimal standardValue3;

    private BigDecimal standardValue4;

    private BigDecimal standardValue5;

    private Date indexPublishtime;

    private String indexPublishperson;

    private Integer indexPublishtag;

    private String keyBackups;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getGovernmentDistrictCode() {
        return governmentDistrictCode;
    }

    public void setGovernmentDistrictCode(String governmentDistrictCode) {
        this.governmentDistrictCode = governmentDistrictCode == null ? null : governmentDistrictCode.trim();
    }

    public String getEuiBelongIndustry() {
        return euiBelongIndustry;
    }

    public void setEuiBelongIndustry(String euiBelongIndustry) {
        this.euiBelongIndustry = euiBelongIndustry == null ? null : euiBelongIndustry.trim();
    }

    public String getEuiCode() {
        return euiCode;
    }

    public void setEuiCode(String euiCode) {
        this.euiCode = euiCode == null ? null : euiCode.trim();
    }

    public String getIndexDate() {
        return indexDate;
    }

    public void setIndexDate(String indexDate) {
        this.indexDate = indexDate == null ? null : indexDate.trim();
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

    public BigDecimal getPublishValue() {
        return publishValue;
    }

    public void setPublishValue(BigDecimal publishValue) {
        this.publishValue = publishValue;
    }

    public Integer getIndexSort() {
        return indexSort;
    }

    public void setIndexSort(Integer indexSort) {
        this.indexSort = indexSort;
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
}