package com.gs.common.util;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 * @author: gaosong
 * @date:2018-1-18 下午06:19:59
 * @version :1.0.0
 * 
 */
public class ExcelsUtils {
	/**
	 * 根据poi导出excel,并根据页面自动创建表头信息
	 * 
	 * @param mergedRegion
	 *            表头格式信息
	 * @param columnNames
	 *            字段信息
	 * @param fileName
	 *            报表名
	 * @return
	 */
	public static XSSFWorkbook createWorkBook(String mergedRegion, int length,
			String fileName, List<String[]> rows) {
		// 创建新的Excel 工作簿
		XSSFWorkbook workbook = new XSSFWorkbook();

		// 设置字体
		XSSFFont font = workbook.createFont();
		font.setBoldweight(XSSFFont.BOLDWEIGHT_BOLD);
		font.setFontHeightInPoints((short) 16);
		font.setFontName("宋体");

		// 设置样式
		XSSFCellStyle cellStyle = workbook.createCellStyle();
		cellStyle.setFont(font);
		cellStyle.setAlignment(XSSFCellStyle.ALIGN_CENTER);
		cellStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);

		XSSFCellStyle cellLeftStyle = workbook.createCellStyle();
		cellLeftStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
		cellLeftStyle.setAlignment(XSSFCellStyle.ALIGN_LEFT);

		XSSFCellStyle cellRightStyle = workbook.createCellStyle();
		cellRightStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
		cellRightStyle.setAlignment(XSSFCellStyle.ALIGN_RIGHT);
		cellRightStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);

		XSSFCellStyle cs = workbook.createCellStyle();
		XSSFFont f = workbook.createFont();
		f.setFontName("宋体");
		//f.setBoldweight(XSSFFont.BOLDWEIGHT_BOLD);
		f.setFontHeightInPoints((short) 10);
		cs.setFont(f);
		cs.setAlignment(CellStyle.ALIGN_CENTER);
		cs.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
		cs.setBorderBottom(XSSFCellStyle.BORDER_THIN); // 下边框
		cs.setBorderLeft(XSSFCellStyle.BORDER_THIN);// 左边框
		cs.setBorderTop(XSSFCellStyle.BORDER_THIN);// 上边框
		cs.setBorderRight(XSSFCellStyle.BORDER_THIN);// 右边框
		cs.setWrapText(true);

		// 获取数据行的列数
		// int length = columnNames.split("\\^\\_\\^").length;

		// 第一行
		// 在索引0的位置创建行（最顶端的行）
		XSSFSheet sheet = workbook.createSheet("报表");
		XSSFRow row = sheet.createRow(0);
		XSSFCell cell;
		// 在索引0的位置创建单元格（左上端）
		for (int i = 0; i < length; i++) {
			cell = row.createCell(i);
			// 定义单元格为字符串类型
			cell.setCellType(XSSFCell.CELL_TYPE_STRING);
			cell.setCellStyle(cellStyle);
		}
		cell=row.getCell(0);
		// 在单元格中输入一些内容
		cell.setCellValue(fileName + "报表");
		CellRangeAddress cellRangeAddress = new CellRangeAddress(0, 0, 0,
				length - 1);
		sheet.addMergedRegion(cellRangeAddress);

		// 第二行
		row = sheet.createRow(1);
		cellRangeAddress = new CellRangeAddress(1, 1, 0, length - 1);
		sheet.addMergedRegion(cellRangeAddress);
		cell = row.createCell(0);
		cell.setCellStyle(cellRightStyle);
		cell.setCellValue("制表时间："
				+ new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()));

		// 处理表头，第三行开始
		String[] mergedRegions = mergedRegion.split(";");
		// 创建一个虚拟表头，并使用false标识这个单元格没有被占用
		List<Map<Integer, Boolean>> headerLists = new ArrayList<Map<Integer, Boolean>>();
		for (int i = 0; i <= mergedRegions.length + 1; i++) {
			Map<Integer, Boolean> headerMap = new HashMap<Integer, Boolean>();
			for (int j = 0; j < length; j++) {
				headerMap.put(j, false);
				if (i == 0) {
					sheet.setColumnWidth(j, (short) (16 * 256));
				}
			}
			headerLists.add(headerMap);
		}
		for (int i = 0; i < mergedRegions.length; i++) {
			String mergedRegionss = mergedRegions[i];
			int x = 2 + i;
			int y = 2 + i;
			int m = 0;
			int n = 0;
			row = sheet.createRow(2 + i);
			row.setHeight((short) (2 * 256));
			for(int in=0;in<length;in++){
				cell=row.createCell(in);
				cell.setCellStyle(cs);
			}
			String[] _mergedRegionss = mergedRegionss.split(":");
			for (int j = 0; j < _mergedRegionss.length; j++) {
				String mergedRegionsss = _mergedRegionss[j];
				String[] _mergedRegionsss = mergedRegionsss.split(",");
				// 获取最小行中未被占用的单元格
				List<Integer> cellNum = new ArrayList<Integer>();
				for (int mm = 0; mm < headerLists.size(); mm++) {
					Map<Integer, Boolean> headerMap = headerLists.get(mm);
					for (Integer key : headerLists.get(mm).keySet()) {
						if (!headerMap.get(key)) {
							cellNum.add(key);
						}
					}
					if (cellNum.size() > 0) {
						break;
					}
				}
				Collections.sort(cellNum);
				m = cellNum.get(0);
				int _y = y + (Integer.parseInt(_mergedRegionsss[1])) - 1;
				if (Integer.parseInt(_mergedRegionsss[1]) == 0) {
					_y = y;
				}
				n = m + (Integer.parseInt(_mergedRegionsss[2])) - 1;
				if (Integer.parseInt(_mergedRegionsss[2]) == 0) {
					n = m;
				}
				// String cra = x + ", " + _y + ", " + m + ", " + n;
				for (int t = x - 2; t <= _y - 2; t++) {
					for (int k = m; k <= n; k++) {
						headerLists.get(t).put(k, true);
					}
				}
				cell = row.getCell(m);
				cell.setCellStyle(cs);
				cell.setCellValue(_mergedRegionsss[0]);
				sheet.setColumnWidth(m,pixel2PoiWidth(f,_mergedRegionss[3]));
				if (x != _y || m != n) {
					cellRangeAddress = new CellRangeAddress(x, _y, m, n);
					sheet.addMergedRegion(cellRangeAddress);
				}
				// m = n + 1;
			}
		}
		for (int i = 0; i < rows.size(); i++) {
			row = sheet.createRow(i + 2 + mergedRegions.length);
			for (int k = 0; k < rows.get(i).length; k++) {
				cell = row.createCell(k);
				cell.setCellValue(rows.get(i)[k]);
				cell.setCellStyle(cs);
			}
		}
		return workbook;
	}
	//像素转poi宽度  
    public static int pixel2PoiWidth(XSSFFont fontInfo, String pixel) {  
    	int a=fontInfo.getCharSet();
//        double numChars = pixel2Character(fontInfo, pixel);  
//        numChars *= fontInfo.charWidth;  
//        numChars += fontInfo.spacing;  
//        numChars /= fontInfo.charWidth;  
//        numChars *= 256;  
//        return (int)numChars; 
    	return 15*256;
    }  
}
