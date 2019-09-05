package com.gs.fusioncharts;

import java.math.BigDecimal;

public class Serie {

    private BigDecimal[] data;

    private String type;

    private boolean smooth;

    private String name;

    private ItemStyle itemStyle;

    public BigDecimal[] getData() {
        return data;
    }

    public void setData(BigDecimal[] data) {
        this.data = data;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public boolean isSmooth() {
        return smooth;
    }

    public void setSmooth(boolean smooth) {
        this.smooth = smooth;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public ItemStyle getItemStyle() {
        return itemStyle;
    }

    public void setItemStyle(ItemStyle itemStyle) {
        this.itemStyle = itemStyle;
    }
}
