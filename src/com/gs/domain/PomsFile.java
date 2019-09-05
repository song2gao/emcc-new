package com.gs.domain;

import java.util.Date;

public class PomsFile {
    private String id;

    private String fileRelateId;

    private String fileName;

    private String filePath;

    private String description;

    private Short isChoose;

    private Date addTime;

    private String reportId;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getFileRelateId() {
        return fileRelateId;
    }

    public void setFileRelateId(String fileRelateId) {
        this.fileRelateId = fileRelateId == null ? null : fileRelateId.trim();
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName == null ? null : fileName.trim();
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath == null ? null : filePath.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public Short getIsChoose() {
        return isChoose;
    }

    public void setIsChoose(Short isChoose) {
        this.isChoose = isChoose;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public String getReportId() {
        return reportId;
    }

    public void setReportId(String reportId) {
        this.reportId = reportId == null ? null : reportId.trim();
    }
}