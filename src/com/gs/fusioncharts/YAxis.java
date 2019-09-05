package com.gs.fusioncharts;

public class YAxis {

    private String type;

    private AxisLine axisLine;

    private SplitLine splitLine;

    private AxisTick axisTick;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public AxisLine getAxisLine() {
        return axisLine;
    }

    public void setAxisLine(AxisLine axisLine) {
        this.axisLine = axisLine;
    }

    public SplitLine getSplitLine() {
        return splitLine;
    }

    public void setSplitLine(SplitLine splitLine) {
        this.splitLine = splitLine;
    }

    public AxisTick getAxisTick() {
        return axisTick;
    }

    public void setAxisTick(AxisTick axisTick) {
        this.axisTick = axisTick;
    }
}
