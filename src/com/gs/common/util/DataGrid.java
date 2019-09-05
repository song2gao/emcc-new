package com.gs.common.util;
/**
 * @author: gaosong
 * @date:2018-1-18 下午05:11:16
 * @version :1.0.0
 * 
 */
public class DataGrid {
	
	private String title;
	
	private String align;
	
	private int colspan=1;
	
	private int rowspan=1;
	
	private String field;
	
	private int width;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAlign() {
		return align;
	}

	public void setAlign(String align) {
		this.align = align;
	}

	public int getColspan() {
		return colspan;
	}

	public void setColspan(int colspan) {
		this.colspan = colspan;
	}

	public int getRowspan() {
		return rowspan;
	}

	public void setRowspan(int rowspan) {
		this.rowspan = rowspan;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}

}
