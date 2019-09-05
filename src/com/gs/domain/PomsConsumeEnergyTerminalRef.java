package com.gs.domain;

public class PomsConsumeEnergyTerminalRef {
    private String id;

    private String calId;

    private String consumeEnergyType;

    private String consumeEnergyId;

    private String cetrBackups;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getCalId() {
        return calId;
    }

    public void setCalId(String calId) {
        this.calId = calId == null ? null : calId.trim();
    }

    public String getConsumeEnergyType() {
        return consumeEnergyType;
    }

    public void setConsumeEnergyType(String consumeEnergyType) {
        this.consumeEnergyType = consumeEnergyType == null ? null : consumeEnergyType.trim();
    }

    public String getConsumeEnergyId() {
        return consumeEnergyId;
    }

    public void setConsumeEnergyId(String consumeEnergyId) {
        this.consumeEnergyId = consumeEnergyId == null ? null : consumeEnergyId.trim();
    }

    public String getCetrBackups() {
        return cetrBackups;
    }

    public void setCetrBackups(String cetrBackups) {
        this.cetrBackups = cetrBackups == null ? null : cetrBackups.trim();
    }
}