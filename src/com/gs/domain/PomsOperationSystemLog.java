package com.gs.domain;

public class PomsOperationSystemLog {
    private String id;

    private String oslBugTime;

    private String oslBugContent;

    private String oslBugCodes;

    private String oslBugBand;

    private String oslIssure;

    private String oslBackups;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getOslBugTime() {
        return oslBugTime;
    }

    public void setOslBugTime(String oslBugTime) {
        this.oslBugTime = oslBugTime == null ? null : oslBugTime.trim();
    }

    public String getOslBugContent() {
        return oslBugContent;
    }

    public void setOslBugContent(String oslBugContent) {
        this.oslBugContent = oslBugContent == null ? null : oslBugContent.trim();
    }

    public String getOslBugCodes() {
        return oslBugCodes;
    }

    public void setOslBugCodes(String oslBugCodes) {
        this.oslBugCodes = oslBugCodes == null ? null : oslBugCodes.trim();
    }

    public String getOslBugBand() {
        return oslBugBand;
    }

    public void setOslBugBand(String oslBugBand) {
        this.oslBugBand = oslBugBand == null ? null : oslBugBand.trim();
    }

    public String getOslIssure() {
        return oslIssure;
    }

    public void setOslIssure(String oslIssure) {
        this.oslIssure = oslIssure == null ? null : oslIssure.trim();
    }

    public String getOslBackups() {
        return oslBackups;
    }

    public void setOslBackups(String oslBackups) {
        this.oslBackups = oslBackups == null ? null : oslBackups.trim();
    }
}