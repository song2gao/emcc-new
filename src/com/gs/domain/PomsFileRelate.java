package com.gs.domain;

public class PomsFileRelate {
    private String id;

    private String tableName;

    private String tableFieldName;

    private String tableFieldValue;

    private String columnName;

    private String fileTypeCode;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName == null ? null : tableName.trim();
    }

    public String getTableFieldName() {
        return tableFieldName;
    }

    public void setTableFieldName(String tableFieldName) {
        this.tableFieldName = tableFieldName == null ? null : tableFieldName.trim();
    }

    public String getTableFieldValue() {
        return tableFieldValue;
    }

    public void setTableFieldValue(String tableFieldValue) {
        this.tableFieldValue = tableFieldValue == null ? null : tableFieldValue.trim();
    }

    public String getColumnName() {
        return columnName;
    }

    public void setColumnName(String columnName) {
        this.columnName = columnName == null ? null : columnName.trim();
    }

    public String getFileTypeCode() {
        return fileTypeCode;
    }

    public void setFileTypeCode(String fileTypeCode) {
        this.fileTypeCode = fileTypeCode == null ? null : fileTypeCode.trim();
    }
}