package com.gs.domain;

public class PomsRoleCalculateTerminalRelationship {
    private String id;

    private String raId;

    private String ctdId;

    private String rctrBackups;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getRaId() {
        return raId;
    }

    public void setRaId(String raId) {
        this.raId = raId == null ? null : raId.trim();
    }

    public String getCtdId() {
        return ctdId;
    }

    public void setCtdId(String ctdId) {
        this.ctdId = ctdId == null ? null : ctdId.trim();
    }

    public String getRctrBackups() {
        return rctrBackups;
    }

    public void setRctrBackups(String rctrBackups) {
        this.rctrBackups = rctrBackups == null ? null : rctrBackups.trim();
    }
}