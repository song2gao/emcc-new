package com.gs.fusioncharts;

public class XAxis {

    private boolean boundaryGap;

    private SplitLine splitLine;

    private AxisLine axisLine;

    private AxisTick axisTick;

    private String[] data;

    public boolean isBoundaryGap() {
        return boundaryGap;
    }

    public void setBoundaryGap(boolean boundaryGap) {
        this.boundaryGap = boundaryGap;
    }

    public SplitLine getSplitLine() {
        return splitLine;
    }

    public void setSplitLine(SplitLine splitLine) {
        this.splitLine = splitLine;
    }

    public AxisLine getAxisLine() {
        return axisLine;
    }

    public void setAxisLine(AxisLine axisLine) {
        this.axisLine = axisLine;
    }

    public AxisTick getAxisTick() {
        return axisTick;
    }

    public void setAxisTick(AxisTick axisTick) {
        this.axisTick = axisTick;
    }

    public String[] getData() {
        return data;
    }

    public void setData(String[] data) {
        this.data = data;
    }
}
