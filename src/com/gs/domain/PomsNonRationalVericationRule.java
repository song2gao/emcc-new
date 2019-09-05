package com.gs.domain;

public class PomsNonRationalVericationRule {
    private String id;

    private String pomId;

    private String porvrExpression;

    private String porvrRelationSymbol;

    private Long porvrExpectValue;

    private String porvrLogicSymbol;

    private Integer porvrOrder;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getPomId() {
        return pomId;
    }

    public void setPomId(String pomId) {
        this.pomId = pomId == null ? null : pomId.trim();
    }

    public String getPorvrExpression() {
        return porvrExpression;
    }

    public void setPorvrExpression(String porvrExpression) {
        this.porvrExpression = porvrExpression == null ? null : porvrExpression.trim();
    }

    public String getPorvrRelationSymbol() {
        return porvrRelationSymbol;
    }

    public void setPorvrRelationSymbol(String porvrRelationSymbol) {
        this.porvrRelationSymbol = porvrRelationSymbol == null ? null : porvrRelationSymbol.trim();
    }

    public Long getPorvrExpectValue() {
        return porvrExpectValue;
    }

    public void setPorvrExpectValue(Long porvrExpectValue) {
        this.porvrExpectValue = porvrExpectValue;
    }

    public String getPorvrLogicSymbol() {
        return porvrLogicSymbol;
    }

    public void setPorvrLogicSymbol(String porvrLogicSymbol) {
        this.porvrLogicSymbol = porvrLogicSymbol == null ? null : porvrLogicSymbol.trim();
    }

    public Integer getPorvrOrder() {
        return porvrOrder;
    }

    public void setPorvrOrder(Integer porvrOrder) {
        this.porvrOrder = porvrOrder;
    }
}