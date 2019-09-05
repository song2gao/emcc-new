package com.gs.domain;

public class PomsJobSheetProcessing {
    private String id;

    private String jobSheetId;

    private String jobSheetProcessor;

    private String jobSheetProcedure;

    private String jobSheetIscomplete;

    private String jobSheetDealtime;

    private String jobSheetBackup;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getJobSheetId() {
        return jobSheetId;
    }

    public void setJobSheetId(String jobSheetId) {
        this.jobSheetId = jobSheetId == null ? null : jobSheetId.trim();
    }

    public String getJobSheetProcessor() {
        return jobSheetProcessor;
    }

    public void setJobSheetProcessor(String jobSheetProcessor) {
        this.jobSheetProcessor = jobSheetProcessor == null ? null : jobSheetProcessor.trim();
    }

    public String getJobSheetProcedure() {
        return jobSheetProcedure;
    }

    public void setJobSheetProcedure(String jobSheetProcedure) {
        this.jobSheetProcedure = jobSheetProcedure == null ? null : jobSheetProcedure.trim();
    }

    public String getJobSheetIscomplete() {
        return jobSheetIscomplete;
    }

    public void setJobSheetIscomplete(String jobSheetIscomplete) {
        this.jobSheetIscomplete = jobSheetIscomplete == null ? null : jobSheetIscomplete.trim();
    }

    public String getJobSheetDealtime() {
        return jobSheetDealtime;
    }

    public void setJobSheetDealtime(String jobSheetDealtime) {
        this.jobSheetDealtime = jobSheetDealtime == null ? null : jobSheetDealtime.trim();
    }

    public String getJobSheetBackup() {
        return jobSheetBackup;
    }

    public void setJobSheetBackup(String jobSheetBackup) {
        this.jobSheetBackup = jobSheetBackup == null ? null : jobSheetBackup.trim();
    }
}