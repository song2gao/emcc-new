package com.gs.domain;

public class PomsModuleAction {
    private String id;

    private String actionName;

    private String actionBackups;

    private String actionDescription;

    private String actionFieldOne;

    private String actionFieldTwo;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getActionName() {
        return actionName;
    }

    public void setActionName(String actionName) {
        this.actionName = actionName == null ? null : actionName.trim();
    }

    public String getActionBackups() {
        return actionBackups;
    }

    public void setActionBackups(String actionBackups) {
        this.actionBackups = actionBackups == null ? null : actionBackups.trim();
    }

    public String getActionDescription() {
        return actionDescription;
    }

    public void setActionDescription(String actionDescription) {
        this.actionDescription = actionDescription == null ? null : actionDescription.trim();
    }

    public String getActionFieldOne() {
        return actionFieldOne;
    }

    public void setActionFieldOne(String actionFieldOne) {
        this.actionFieldOne = actionFieldOne == null ? null : actionFieldOne.trim();
    }

    public String getActionFieldTwo() {
        return actionFieldTwo;
    }

    public void setActionFieldTwo(String actionFieldTwo) {
        this.actionFieldTwo = actionFieldTwo == null ? null : actionFieldTwo.trim();
    }
}