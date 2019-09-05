package com.gs.domain;

import java.util.Date;

public class EsmspIndexAssess {
    private String assessId;

    private Integer applicationType;

    private String applicationCode;

    private String assessTime;

    private Date assessTimestart;

    private Date assessTimeend;

    private String assessResult;

    private String assessMemo;

    private Date indexCreatime;

    private String indexCreatperson;

    public String getAssessId() {
        return assessId;
    }

    public void setAssessId(String assessId) {
        this.assessId = assessId == null ? null : assessId.trim();
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

    public String getAssessTime() {
        return assessTime;
    }

    public void setAssessTime(String assessTime) {
        this.assessTime = assessTime == null ? null : assessTime.trim();
    }

    public Date getAssessTimestart() {
        return assessTimestart;
    }

    public void setAssessTimestart(Date assessTimestart) {
        this.assessTimestart = assessTimestart;
    }

    public Date getAssessTimeend() {
        return assessTimeend;
    }

    public void setAssessTimeend(Date assessTimeend) {
        this.assessTimeend = assessTimeend;
    }

    public String getAssessResult() {
        return assessResult;
    }

    public void setAssessResult(String assessResult) {
        this.assessResult = assessResult == null ? null : assessResult.trim();
    }

    public String getAssessMemo() {
        return assessMemo;
    }

    public void setAssessMemo(String assessMemo) {
        this.assessMemo = assessMemo == null ? null : assessMemo.trim();
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
}