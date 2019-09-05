package com.gs.domain;

public class PomsFrontProcessorConfig {
    private String id;

    private String frontProcessorIp;

    private String frontProcessorPort;

    private String communicateProtocal;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getFrontProcessorIp() {
        return frontProcessorIp;
    }

    public void setFrontProcessorIp(String frontProcessorIp) {
        this.frontProcessorIp = frontProcessorIp == null ? null : frontProcessorIp.trim();
    }

    public String getFrontProcessorPort() {
        return frontProcessorPort;
    }

    public void setFrontProcessorPort(String frontProcessorPort) {
        this.frontProcessorPort = frontProcessorPort == null ? null : frontProcessorPort.trim();
    }

    public String getCommunicateProtocal() {
        return communicateProtocal;
    }

    public void setCommunicateProtocal(String communicateProtocal) {
        this.communicateProtocal = communicateProtocal == null ? null : communicateProtocal.trim();
    }
}