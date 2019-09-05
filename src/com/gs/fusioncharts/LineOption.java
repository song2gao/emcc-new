package com.gs.fusioncharts;

public class LineOption {

    private Lengend lengend;

    private Grid grid;

    private Tooltip tooltip;

    private YAxis yAxis;

    private XAxis xAxis;

    private Serie[] series;

    public Lengend getLengend() {
        return lengend;
    }

    public void setLengend(Lengend lengend) {
        this.lengend = lengend;
    }

    public Grid getGrid() {
        return grid;
    }

    public void setGrid(Grid grid) {
        this.grid = grid;
    }

    public Tooltip getTooltip() {
        return tooltip;
    }

    public void setTooltip(Tooltip tooltip) {
        this.tooltip = tooltip;
    }

    public YAxis getyAxis() {
        return yAxis;
    }

    public void setyAxis(YAxis yAxis) {
        this.yAxis = yAxis;
    }

    public XAxis getxAxis() {
        return xAxis;
    }

    public void setxAxis(XAxis xAxis) {
        this.xAxis = xAxis;
    }

    public Serie[] getSeries() {
        return series;
    }

    public void setSeries(Serie[] series) {
        this.series = series;
    }
}
