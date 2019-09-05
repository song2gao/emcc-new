package com.gs.domain;

public class PomsMaintenanceInfoPublish {
    private String id;

    private String umId;

    private String mipTitle;

    private String mipEdittime;

    private String mipContent;

    private String mipModules;

    private String mipIspublished;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getUmId() {
        return umId;
    }

    public void setUmId(String umId) {
        this.umId = umId == null ? null : umId.trim();
    }

    public String getMipTitle() {
        return mipTitle;
    }

    public void setMipTitle(String mipTitle) {
        this.mipTitle = mipTitle == null ? null : mipTitle.trim();
    }

    public String getMipEdittime() {
        return mipEdittime;
    }

    public void setMipEdittime(String mipEdittime) {
        this.mipEdittime = mipEdittime == null ? null : mipEdittime.trim();
    }

    public String getMipContent() {
        return mipContent;
    }

    public void setMipContent(String mipContent) {
        this.mipContent = mipContent == null ? null : mipContent.trim();
    }

    public String getMipModules() {
        return mipModules;
    }

    public void setMipModules(String mipModules) {
        this.mipModules = mipModules == null ? null : mipModules.trim();
    }

    public String getMipIspublished() {
        return mipIspublished;
    }

    public void setMipIspublished(String mipIspublished) {
        this.mipIspublished = mipIspublished == null ? null : mipIspublished.trim();
    }
}