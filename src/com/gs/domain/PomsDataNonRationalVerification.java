package com.gs.domain;

public class PomsDataNonRationalVerification {
    private String id;

    private String verificationCode;

    private String verificationName;

    private String dnrvDescription;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getVerificationCode() {
        return verificationCode;
    }

    public void setVerificationCode(String verificationCode) {
        this.verificationCode = verificationCode == null ? null : verificationCode.trim();
    }

    public String getVerificationName() {
        return verificationName;
    }

    public void setVerificationName(String verificationName) {
        this.verificationName = verificationName == null ? null : verificationName.trim();
    }

    public String getDnrvDescription() {
        return dnrvDescription;
    }

    public void setDnrvDescription(String dnrvDescription) {
        this.dnrvDescription = dnrvDescription == null ? null : dnrvDescription.trim();
    }
}