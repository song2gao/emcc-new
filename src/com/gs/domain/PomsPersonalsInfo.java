package com.gs.domain;

public class PomsPersonalsInfo {
    private String id;

    private String euiId;

    private String piCodes;

    private String piName;

    private String piSex;

    private Long piAge;

    private String piIdcards;

    private String piEmail;

    private String piMobile;

    private String plLocation;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getEuiId() {
        return euiId;
    }

    public void setEuiId(String euiId) {
        this.euiId = euiId == null ? null : euiId.trim();
    }

    public String getPiCodes() {
        return piCodes;
    }

    public void setPiCodes(String piCodes) {
        this.piCodes = piCodes == null ? null : piCodes.trim();
    }

    public String getPiName() {
        return piName;
    }

    public void setPiName(String piName) {
        this.piName = piName == null ? null : piName.trim();
    }

    public String getPiSex() {
        return piSex;
    }

    public void setPiSex(String piSex) {
        this.piSex = piSex == null ? null : piSex.trim();
    }

    public Long getPiAge() {
        return piAge;
    }

    public void setPiAge(Long piAge) {
        this.piAge = piAge;
    }

    public String getPiIdcards() {
        return piIdcards;
    }

    public void setPiIdcards(String piIdcards) {
        this.piIdcards = piIdcards == null ? null : piIdcards.trim();
    }

    public String getPiEmail() {
        return piEmail;
    }

    public void setPiEmail(String piEmail) {
        this.piEmail = piEmail == null ? null : piEmail.trim();
    }

    public String getPiMobile() {
        return piMobile;
    }

    public void setPiMobile(String piMobile) {
        this.piMobile = piMobile == null ? null : piMobile.trim();
    }

    public String getPlLocation() {
        return plLocation;
    }

    public void setPlLocation(String plLocation) {
        this.plLocation = plLocation == null ? null : plLocation.trim();
    }
}