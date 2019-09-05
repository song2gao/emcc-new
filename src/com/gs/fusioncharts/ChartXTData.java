package com.gs.fusioncharts;

import java.math.BigDecimal;
import java.util.Map;

import com.gs.common.util.DateUtils;
import com.gs.common.util.StringUtils;

public class ChartXTData {
	private String type = "";
	private String data;
	private String height;
	private String width;
	private String[] color = new String[] { "#4EE5FF", "#FF1A87", "#00B2D7",
			"#0085D1", "#FFB815", "#06985B", "#C0C0C0", "#7FFFD4", "#FF00FF",
			"#0085D1", "#FFB815", "#06985B", "#4EE5FF", "#FF1A87", "#00B2D7",
			"#0085D1", "#FFB815", "#06985B", "#4EE5FF", "#FF1A87", "#00B2D7",
			"#0085D1", "#FFB815", "#06985B", "#4EE5FF", "#FF1A87", "#00B2D7",
			"#0085D1", "#FFB815", "#06985B", "#4EE5FF", "#FF1A87", "#00B2D7",
			"#0085D1", "#FFB815", "#06985B" };

	// 1. 功能特性
	private String animation = "1";// [bool]是否动画显示数据，默认为1(True)
	private String palette = "";// [number]使用默认的调色板(1-5)
	private String showNames = ""; // [bool]是否显示横向坐标轴(x轴)标签名称
	private String showLables = ""; // [bool]是否显示标签，默认为1(True)显示(set中有lable属性时)
	private String rotateNames = ""; // [bool]是否旋转显示标签(name)，默认为0(False):横向显示
	private String rotateLabels = ""; // [bool]设置x轴上的lable显示方式，默认为0横向显示
	private String showValues = ""; // [bool]是否在图表显示对应的数据值，默认为1(True)
	private String yAxisMinValue = ""; // [number]指定纵轴(y轴)最小值，数字
	private String yAxisMaxValue = ""; // [number] 指定纵轴(y轴)最小值，数字
	private String showLimits = ""; // [bool]是否显示图表限值(y轴最大、最小值)，默认为1(True)
	private String labelDisplay = ""; // [string
	// ]标签的呈现方式[“WRAP”,”STAGGER”,”ROTATE”,
	// “NONE”]（超长屏蔽、折行、倾斜、不显示）
	private String staggerLines = ""; // [number]多少个字符后折行（labelDisplay=’stagger’）
	private String rotateValues = ""; // [bool]是否滚动显示值 （showValues=’1’）
	private String showYAxisValues = "";// [bool]是否显示y轴数据
	private String yAxisValuesStep = ""; // [number]y轴标记的显示间隔
	private String adjustDiv = ""; // …[bool]自动调整divlines
	private String clickURL = ""; // …[string]图表的焦点链接地址
	private String defaultAnimation = ""; // [bool]是否开启默认动画
	private String connectNullData = ""; // [bool]是否呈现空值（?）
	private String slantLabels = ""; // [bool]
	// private String showDivLineValues=""; //[bool]
	private String rotateYAxisName = ""; // [bool]
	private String yAxisNameWidth = ""; // [number] (In Pixels)
	private String labelStep = ""; // [number] (1 or above)

	// 2. 图表标题和轴名称
	private String caption = "";// [string]图表主标题
	private String subCaption = "";// ;//…[string] 图表副标题
	private String xAxisName = "";// ;// [string]横向坐标轴(x轴)名称
	private String yAxisName = "";// ;//[string] 纵向坐标轴(y轴)名称

	;// 3. 图表和画布的样式
	private String bgColor = "";// ;//[color]图表背景色，可以使用逗号分割多个颜色值 6位16进制颜色值
	private String bgRatio = "";// ;//…[number]多个颜色值所占的比率，[0-100]
	private String bgAngle = "";// ;//…[number]角度，[0-360]
	private String bgSWF = "";// ;//… [string] 设置一个外部的Flash 为flash的背景(须在同一个域下)
	private String bgSWFAlpha = "";// ………[number] 背景flash透明度，[0-100]
	private String bgAlpha = "";// ;//… [number]设置图表背景透明度，[0-100]
	private String shadowAlpha = "";// ………[number]投影透明度，[0-100]
	private String canvasBgColor = "";// ………[color]画布背景色，6位16进制颜色值
	private String canvasBgAlpha = "";// ………[number]画布透明度，[0-100] 0为不透明
	private String canvasBorderColor = "";// … [color]画布边框颜色，6位16进制颜色值
	private String canvasBorderThickness = "";// [number]画布边框厚度，[0-100]
	private String canvasBaseColor = "";// …… [color]设置图表基部的颜色，6位16进制颜色值
	private String canvasBaseDepth = "";// …… [number]设置图表基部的高度
	private String canvasBgDepth = "";// ………[number]设置图表背景的深度
	private String showCanvasBg = "";// ………[bool]设置是否显示图表背景
	private String showBorder = "";// ="";// [bool]画布透明度，默认为1显示
	private String showCanvasBase = "";// ……[bool]设置是否显示图表基部
	private String pieFillAlpha = "";// ="";//[number]各色块填充颜色的深度
	private String pieSliceDepth = "";// ………[bool]设置各个色块间隔线的宽度(不能与pieBorderAlpha同用)
	private String useRoundEdges = "";// …… [bool]设置图表图形边角是否是为圆角，默认为0不是
	private String chartLeftMargin = "";// …… [number]设置图表左边距，像素
	private String chartRightMargin = "";// ……[number]设置图表右边距，像素
	private String chartTopMargin = "";// …… [number]设置图表上边距，像素
	private String chartBottomMargin = "";// …[number]设置图表下边距，像素

	;// 4. 字体属性
	private String baseFont = "";// ;//…[string]图表字体样式，如“宋体”、“黑体”
	private String baseFontSize = "";// ……… [number]图表字体大小
	private String baseFontColor = "";// ………[color]图表字体颜色，6位16进制颜色值
	private String outCnvBaseFont = "";// ……[string]图表画布以外的字体样式
	private String outCnvBaseFontSize = "";// [number]图表画布以外的字体大小
	private String outCnvBaseFontColor = "";// ……… [color]图表画布以外的字体颜色，6位16进制颜色值

	;// 5. 分区线和网格
	private String numDivLines = "";// ;//[string]画布内部水平分区线条数，数字
	private String divLineColor = "";// ;//[string]水平分区线颜色，6位16进制颜色值
	private String divLineThickness = "";// …… [string]水平分区线厚度，[1-5]
	private String divLineAlpha;// ="";//[string]水平分区线透明度，[0-100]
	private String showAlternateHGridColor = "";// ………[string]是否在横向网格带交替的颜色，默认为0(False)
	private String alternateHGridColor = "";// …[string]横向网格带交替的颜色，6位16进制颜色值
	private String alternateHGridAlpha = "";// …[string]横向网格带的透明度，[0-100]
	private String showDivLineValues = "";// … [string]是否显示Div行的值，默认？？
	private String numVDivLines = "";// ……… [string]画布内部垂直分区线条数，数字
	private String vDivLineColor = "";// ……… [string]垂直分区线颜色，6位16进制颜色值
	private String vDivLineThickness = "";// ……[string]垂直分区线厚度，[1-5]
	private String vDivLineAlpha = "";// ;//[string]垂直分区线透明度，[0-100]
	private String showAlternateVGridColor = "";// ………[string]是否在纵向网格带交替的颜色，默认为0(False)
	private String alternateVGridColor = "";// … [string]纵向网格带交替的颜色，6位16进制颜色值
	private String alternateVGridAlpha = "";// … [string]纵向网格带的透明度，[0-100]
	private String plotGradientColor = "";// ……[color]渐变颜色，6位16进制颜色值
	private String plotBorderDashed = "";// ……[string]bool 是否使用虚线（柱形图边界线）
	private String divLineIsDashed = "";// …… [bool]画布背景线条是否为虚线
	private String showPlotBorder = "";// ………[bool]
	private String plotBorderColor = "";// ………[color]
	private String plotBorderThickness = "";// …[number][0-5]
	private String plotBorderAlpha = "";// ………[number]
	private String plotBorderDashLen = "";// …[number] pixels
	private String plotBorderDashGap = "";// …[number] pixels
	private String plotFillAngle = "";// ……… [number] [0-360]
	private String plotFillRatio = "";// ;//[number] [0-100]
	private String plotFillAlpha = "";// ;//[number]
	private String showShadow = "";// ;//[bool]是否显示阴影
	private String plotFillColor = "";// ;//[color]
	private String Anchors = "";// [?]
	private String drawAnchors = "";// ;//[bool]
	private String anchorSides = "";// ;//[number]边数[3-20]
	private String anchorRadius = "";// ……… [number] pixels 半径
	private String anchorBorderColor = "";// … [color]
	private String anchorBorderThickness = "";// [number]
	private String anchorBgColor = "";// …… [string]
	private String anchorAlpha = "";// ;//[number]
	private String anchorBgAlpha = "";// ………[number]
	private String divLineDashLen = "";// …… [?]
	private String divLineDashGap = "";// …… [?]
	private String zeroPlaneColor = "";// ………[color]
	private String zeroPlaneThickness = "";// …[number]
	private String zeroPlaneAlpha = "";// ………[number]
	private String vDivLineIsDashed = "";// ……[?]
	private String vDivLineDashLen = "";// ……[?]
	private String vDivLineDashGap = "";// ……[?]

	// 6. 数字格式
	private String numberPrefix = "";// [string]增加数字前缀
	private String numberSuffix = "";// [string]增加数字后缀
	private String formatNumberScale = "";// [bool]是否格式化数字,默认为1(True),自动的给你的数字加上K（千）或M（百万）；若取0,则不加K或M
	private String decimalPrecision = "";// [number]指定小数位的位数，[0-10] 例如：='0' 取整
	private String divLineDecimalPrecision = "";// [number]指定水平分区线的值小数位的位数，[0-10]
	private String limitsDecimalPrecision = "";// [number]指定y轴最大、最小值的小数位的位数，[0-10]
	private String formatNumber = "";// [number]逗号来分隔数字(千位，百万位),默认为1(True)；若取0,则不加分隔符
	private String decimalSeparator = "";// [number]指定小数分隔符,默认为'.'
	private String thousandSeparator = "";// [number]指定千分位分隔符,默认为','
	private String thousandSeparato = "";// [number]用指定的字符来代替千位分隔符
	private String decimals = "";// [number]设置鼠标悬停在图表上显示百分比的精确度[0-10](不能与formatNumberScale='0'
	// formatNumber='0'同用)
	private String defaultNumberScale = "";// … [string]
	private String numberScaleUnit = "";// [string]
	private String numberScaleValue = "";// [string]
	private String inDecimalSeparator = "";// … [string]
	private String inThousandSeparator = "";// …[string]
	private String forceDecimals = "";// …[bool]
	private String yAxisValueDecimals = "";// …[number] [0-10]

	// 图例
	private String showLegend = ""; // 是否显示图例
	private String legendPosition = ""; // 图例位置
	private String legendCaption = ""; // 图例说明
	private String legendIconScale = ""; // 图例图标0-5(图例图标大小)
	private String legendBgColor = ""; // 图例背景色
	private String legendBgAlpha = ""; // 图例透明度
	private String legendBorderColor = ""; // 图例边框颜色
	private String legendBorderThickness = ""; // 图例边框粗细
	private String legendBorderAlpha = ""; // 图例边框透明度
	private String legendShadow = ""; // 图例阴影
	private String legendAllowDrag = ""; // 是否允许拖动图例
	private String legendScrollBgColor = ""; // 图例滚动条背景色
	private String legendScrollBarColor = ""; // 图例滚动条颜色
	private String legendScrollBtnColor = ""; // 图例滚动条按钮颜
	private String reverseLegend = ""; // 反转图例
	private String interactiveLegend = ""; // 图例交互(是否可点击)
	private String legendNumColumns = ""; // 设置图例的列数(如果设置不当会自动设置,如果legendPosition设置为右面该属性自动设置为1)
	private String minimiseWrappingInLegend = ""; // 

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public String getAnimation() {
		return animation;
	}

	public void setAnimation(String animation) {
		this.animation = animation;
	}

	public String getPalette() {
		return palette;
	}

	public void setPalette(String palette) {
		this.palette = palette;
	}

	public String getShowNames() {
		return showNames;
	}

	public void setShowNames(String showNames) {
		this.showNames = showNames;
	}

	public String getShowLables() {
		return showLables;
	}

	public void setShowLables(String showLables) {
		this.showLables = showLables;
	}

	public String getRotateNames() {
		return rotateNames;
	}

	public void setRotateNames(String rotateNames) {
		this.rotateNames = rotateNames;
	}

	public String getRotateLabels() {
		return rotateLabels;
	}

	public void setRotateLabels(String rotateLabels) {
		this.rotateLabels = rotateLabels;
	}

	public String getShowValues() {
		return showValues;
	}

	public void setShowValues(String showValues) {
		this.showValues = showValues;
	}

	public String getyAxisMinValue() {
		return yAxisMinValue;
	}

	public void setyAxisMinValue(String yAxisMinValue) {
		this.yAxisMinValue = yAxisMinValue;
	}

	public String getyAxisMaxValue() {
		return yAxisMaxValue;
	}

	public void setyAxisMaxValue(String yAxisMaxValue) {
		this.yAxisMaxValue = yAxisMaxValue;
	}

	public String getShowLimits() {
		return showLimits;
	}

	public void setShowLimits(String showLimits) {
		this.showLimits = showLimits;
	}

	public String getLabelDisplay() {
		return labelDisplay;
	}

	public void setLabelDisplay(String labelDisplay) {
		this.labelDisplay = labelDisplay;
	}

	public String getStaggerLines() {
		return staggerLines;
	}

	public void setStaggerLines(String staggerLines) {
		this.staggerLines = staggerLines;
	}

	public String getRotateValues() {
		return rotateValues;
	}

	public void setRotateValues(String rotateValues) {
		this.rotateValues = rotateValues;
	}

	public String getShowYAxisValues() {
		return showYAxisValues;
	}

	public void setShowYAxisValues(String showYAxisValues) {
		this.showYAxisValues = showYAxisValues;
	}

	public String getyAxisValuesStep() {
		return yAxisValuesStep;
	}

	public void setyAxisValuesStep(String yAxisValuesStep) {
		this.yAxisValuesStep = yAxisValuesStep;
	}

	public String getAdjustDiv() {
		return adjustDiv;
	}

	public void setAdjustDiv(String adjustDiv) {
		this.adjustDiv = adjustDiv;
	}

	public String getClickURL() {
		return clickURL;
	}

	public void setClickURL(String clickURL) {
		this.clickURL = clickURL;
	}

	public String getDefaultAnimation() {
		return defaultAnimation;
	}

	public void setDefaultAnimation(String defaultAnimation) {
		this.defaultAnimation = defaultAnimation;
	}

	public String getConnectNullData() {
		return connectNullData;
	}

	public void setConnectNullData(String connectNullData) {
		this.connectNullData = connectNullData;
	}

	public String getSlantLabels() {
		return slantLabels;
	}

	public void setSlantLabels(String slantLabels) {
		this.slantLabels = slantLabels;
	}

	public String getRotateYAxisName() {
		return rotateYAxisName;
	}

	public void setRotateYAxisName(String rotateYAxisName) {
		this.rotateYAxisName = rotateYAxisName;
	}

	public String getyAxisNameWidth() {
		return yAxisNameWidth;
	}

	public void setyAxisNameWidth(String yAxisNameWidth) {
		this.yAxisNameWidth = yAxisNameWidth;
	}

	public String getLabelStep() {
		return labelStep;
	}

	public void setLabelStep(String labelStep) {
		this.labelStep = labelStep;
	}

	public String getCaption() {
		return caption;
	}

	public void setCaption(String caption) {
		this.caption = caption;
	}

	public String getSubCaption() {
		return subCaption;
	}

	public void setSubCaption(String subCaption) {
		this.subCaption = subCaption;
	}

	public String getxAxisName() {
		return xAxisName;
	}

	public void setxAxisName(String xAxisName) {
		this.xAxisName = xAxisName;
	}

	public String getyAxisName() {
		return yAxisName;
	}

	public void setyAxisName(String yAxisName) {
		this.yAxisName = yAxisName;
	}

	public String getBgColor() {
		return bgColor;
	}

	public void setBgColor(String bgColor) {
		this.bgColor = bgColor;
	}

	public String getBgRatio() {
		return bgRatio;
	}

	public void setBgRatio(String bgRatio) {
		this.bgRatio = bgRatio;
	}

	public String getBgAngle() {
		return bgAngle;
	}

	public void setBgAngle(String bgAngle) {
		this.bgAngle = bgAngle;
	}

	public String getBgSWF() {
		return bgSWF;
	}

	public void setBgSWF(String bgSWF) {
		this.bgSWF = bgSWF;
	}

	public String getBgSWFAlpha() {
		return bgSWFAlpha;
	}

	public void setBgSWFAlpha(String bgSWFAlpha) {
		this.bgSWFAlpha = bgSWFAlpha;
	}

	public String getBgAlpha() {
		return bgAlpha;
	}

	public void setBgAlpha(String bgAlpha) {
		this.bgAlpha = bgAlpha;
	}

	public String getShadowAlpha() {
		return shadowAlpha;
	}

	public void setShadowAlpha(String shadowAlpha) {
		this.shadowAlpha = shadowAlpha;
	}

	public String getShowLegend() {
		return showLegend;
	}

	public void setShowLegend(String showLegend) {
		this.showLegend = showLegend;
	}

	public String getCanvasBgColor() {
		return canvasBgColor;
	}

	public void setCanvasBgColor(String canvasBgColor) {
		this.canvasBgColor = canvasBgColor;
	}

	public String getCanvasBgAlpha() {
		return canvasBgAlpha;
	}

	public void setCanvasBgAlpha(String canvasBgAlpha) {
		this.canvasBgAlpha = canvasBgAlpha;
	}

	public String getCanvasBorderColor() {
		return canvasBorderColor;
	}

	public void setCanvasBorderColor(String canvasBorderColor) {
		this.canvasBorderColor = canvasBorderColor;
	}

	public String getCanvasBorderThickness() {
		return canvasBorderThickness;
	}

	public void setCanvasBorderThickness(String canvasBorderThickness) {
		this.canvasBorderThickness = canvasBorderThickness;
	}

	public String getCanvasBaseColor() {
		return canvasBaseColor;
	}

	public void setCanvasBaseColor(String canvasBaseColor) {
		this.canvasBaseColor = canvasBaseColor;
	}

	public String getCanvasBaseDepth() {
		return canvasBaseDepth;
	}

	public void setCanvasBaseDepth(String canvasBaseDepth) {
		this.canvasBaseDepth = canvasBaseDepth;
	}

	public String getCanvasBgDepth() {
		return canvasBgDepth;
	}

	public void setCanvasBgDepth(String canvasBgDepth) {
		this.canvasBgDepth = canvasBgDepth;
	}

	public String getShowCanvasBg() {
		return showCanvasBg;
	}

	public void setShowCanvasBg(String showCanvasBg) {
		this.showCanvasBg = showCanvasBg;
	}

	public String getShowBorder() {
		return showBorder;
	}

	public void setShowBorder(String showBorder) {
		this.showBorder = showBorder;
	}

	public String getShowCanvasBase() {
		return showCanvasBase;
	}

	public void setShowCanvasBase(String showCanvasBase) {
		this.showCanvasBase = showCanvasBase;
	}

	public String getPieFillAlpha() {
		return pieFillAlpha;
	}

	public void setPieFillAlpha(String pieFillAlpha) {
		this.pieFillAlpha = pieFillAlpha;
	}

	public String getPieSliceDepth() {
		return pieSliceDepth;
	}

	public void setPieSliceDepth(String pieSliceDepth) {
		this.pieSliceDepth = pieSliceDepth;
	}

	public String getUseRoundEdges() {
		return useRoundEdges;
	}

	public void setUseRoundEdges(String useRoundEdges) {
		this.useRoundEdges = useRoundEdges;
	}

	public String getChartLeftMargin() {
		return chartLeftMargin;
	}

	public void setChartLeftMargin(String chartLeftMargin) {
		this.chartLeftMargin = chartLeftMargin;
	}

	public String getChartRightMargin() {
		return chartRightMargin;
	}

	public void setChartRightMargin(String chartRightMargin) {
		this.chartRightMargin = chartRightMargin;
	}

	public String getChartTopMargin() {
		return chartTopMargin;
	}

	public void setChartTopMargin(String chartTopMargin) {
		this.chartTopMargin = chartTopMargin;
	}

	public String getChartBottomMargin() {
		return chartBottomMargin;
	}

	public void setChartBottomMargin(String chartBottomMargin) {
		this.chartBottomMargin = chartBottomMargin;
	}

	public String getBaseFont() {
		return baseFont;
	}

	public void setBaseFont(String baseFont) {
		this.baseFont = baseFont;
	}

	public String getBaseFontSize() {
		return baseFontSize;
	}

	public void setBaseFontSize(String baseFontSize) {
		this.baseFontSize = baseFontSize;
	}

	public String getBaseFontColor() {
		return baseFontColor;
	}

	public void setBaseFontColor(String baseFontColor) {
		this.baseFontColor = baseFontColor;
	}

	public String getOutCnvBaseFont() {
		return outCnvBaseFont;
	}

	public void setOutCnvBaseFont(String outCnvBaseFont) {
		this.outCnvBaseFont = outCnvBaseFont;
	}

	public String getOutCnvBaseFontSize() {
		return outCnvBaseFontSize;
	}

	public void setOutCnvBaseFontSize(String outCnvBaseFontSize) {
		this.outCnvBaseFontSize = outCnvBaseFontSize;
	}

	public String getOutCnvBaseFontColor() {
		return outCnvBaseFontColor;
	}

	public void setOutCnvBaseFontColor(String outCnvBaseFontColor) {
		this.outCnvBaseFontColor = outCnvBaseFontColor;
	}

	public String getNumDivLines() {
		return numDivLines;
	}

	public void setNumDivLines(String numDivLines) {
		this.numDivLines = numDivLines;
	}

	public String getDivLineColor() {
		return divLineColor;
	}

	public void setDivLineColor(String divLineColor) {
		this.divLineColor = divLineColor;
	}

	public String getDivLineThickness() {
		return divLineThickness;
	}

	public void setDivLineThickness(String divLineThickness) {
		this.divLineThickness = divLineThickness;
	}

	public String getDivLineAlpha() {
		return divLineAlpha;
	}

	public void setDivLineAlpha(String divLineAlpha) {
		this.divLineAlpha = divLineAlpha;
	}

	public String getShowAlternateHGridColor() {
		return showAlternateHGridColor;
	}

	public void setShowAlternateHGridColor(String showAlternateHGridColor) {
		this.showAlternateHGridColor = showAlternateHGridColor;
	}

	public String getAlternateHGridColor() {
		return alternateHGridColor;
	}

	public void setAlternateHGridColor(String alternateHGridColor) {
		this.alternateHGridColor = alternateHGridColor;
	}

	public String getAlternateHGridAlpha() {
		return alternateHGridAlpha;
	}

	public void setAlternateHGridAlpha(String alternateHGridAlpha) {
		this.alternateHGridAlpha = alternateHGridAlpha;
	}

	public String getShowDivLineValues() {
		return showDivLineValues;
	}

	public void setShowDivLineValues(String showDivLineValues) {
		this.showDivLineValues = showDivLineValues;
	}

	public String getNumVDivLines() {
		return numVDivLines;
	}

	public void setNumVDivLines(String numVDivLines) {
		this.numVDivLines = numVDivLines;
	}

	public String getvDivLineColor() {
		return vDivLineColor;
	}

	public void setvDivLineColor(String vDivLineColor) {
		this.vDivLineColor = vDivLineColor;
	}

	public String getvDivLineThickness() {
		return vDivLineThickness;
	}

	public void setvDivLineThickness(String vDivLineThickness) {
		this.vDivLineThickness = vDivLineThickness;
	}

	public String getvDivLineAlpha() {
		return vDivLineAlpha;
	}

	public void setvDivLineAlpha(String vDivLineAlpha) {
		this.vDivLineAlpha = vDivLineAlpha;
	}

	public String getShowAlternateVGridColor() {
		return showAlternateVGridColor;
	}

	public void setShowAlternateVGridColor(String showAlternateVGridColor) {
		this.showAlternateVGridColor = showAlternateVGridColor;
	}

	public String getAlternateVGridColor() {
		return alternateVGridColor;
	}

	public void setAlternateVGridColor(String alternateVGridColor) {
		this.alternateVGridColor = alternateVGridColor;
	}

	public String getAlternateVGridAlpha() {
		return alternateVGridAlpha;
	}

	public void setAlternateVGridAlpha(String alternateVGridAlpha) {
		this.alternateVGridAlpha = alternateVGridAlpha;
	}

	public String getPlotGradientColor() {
		return plotGradientColor;
	}

	public void setPlotGradientColor(String plotGradientColor) {
		this.plotGradientColor = plotGradientColor;
	}

	public String getPlotBorderDashed() {
		return plotBorderDashed;
	}

	public void setPlotBorderDashed(String plotBorderDashed) {
		this.plotBorderDashed = plotBorderDashed;
	}

	public String getDivLineIsDashed() {
		return divLineIsDashed;
	}

	public void setDivLineIsDashed(String divLineIsDashed) {
		this.divLineIsDashed = divLineIsDashed;
	}

	public String getShowPlotBorder() {
		return showPlotBorder;
	}

	public void setShowPlotBorder(String showPlotBorder) {
		this.showPlotBorder = showPlotBorder;
	}

	public String getPlotBorderColor() {
		return plotBorderColor;
	}

	public void setPlotBorderColor(String plotBorderColor) {
		this.plotBorderColor = plotBorderColor;
	}

	public String getPlotBorderThickness() {
		return plotBorderThickness;
	}

	public void setPlotBorderThickness(String plotBorderThickness) {
		this.plotBorderThickness = plotBorderThickness;
	}

	public String getPlotBorderAlpha() {
		return plotBorderAlpha;
	}

	public void setPlotBorderAlpha(String plotBorderAlpha) {
		this.plotBorderAlpha = plotBorderAlpha;
	}

	public String getPlotBorderDashLen() {
		return plotBorderDashLen;
	}

	public void setPlotBorderDashLen(String plotBorderDashLen) {
		this.plotBorderDashLen = plotBorderDashLen;
	}

	public String getPlotBorderDashGap() {
		return plotBorderDashGap;
	}

	public void setPlotBorderDashGap(String plotBorderDashGap) {
		this.plotBorderDashGap = plotBorderDashGap;
	}

	public String getPlotFillAngle() {
		return plotFillAngle;
	}

	public void setPlotFillAngle(String plotFillAngle) {
		this.plotFillAngle = plotFillAngle;
	}

	public String getPlotFillRatio() {
		return plotFillRatio;
	}

	public void setPlotFillRatio(String plotFillRatio) {
		this.plotFillRatio = plotFillRatio;
	}

	public String getPlotFillAlpha() {
		return plotFillAlpha;
	}

	public void setPlotFillAlpha(String plotFillAlpha) {
		this.plotFillAlpha = plotFillAlpha;
	}

	public String getShowShadow() {
		return showShadow;
	}

	public void setShowShadow(String showShadow) {
		this.showShadow = showShadow;
	}

	public String getPlotFillColor() {
		return plotFillColor;
	}

	public void setPlotFillColor(String plotFillColor) {
		this.plotFillColor = plotFillColor;
	}

	public String getAnchors() {
		return Anchors;
	}

	public void setAnchors(String anchors) {
		Anchors = anchors;
	}

	public String getDrawAnchors() {
		return drawAnchors;
	}

	public void setDrawAnchors(String drawAnchors) {
		this.drawAnchors = drawAnchors;
	}

	public String getAnchorSides() {
		return anchorSides;
	}

	public void setAnchorSides(String anchorSides) {
		this.anchorSides = anchorSides;
	}

	public String getAnchorRadius() {
		return anchorRadius;
	}

	public void setAnchorRadius(String anchorRadius) {
		this.anchorRadius = anchorRadius;
	}

	public String getAnchorBorderColor() {
		return anchorBorderColor;
	}

	public void setAnchorBorderColor(String anchorBorderColor) {
		this.anchorBorderColor = anchorBorderColor;
	}

	public String getAnchorBorderThickness() {
		return anchorBorderThickness;
	}

	public void setAnchorBorderThickness(String anchorBorderThickness) {
		this.anchorBorderThickness = anchorBorderThickness;
	}

	public String getAnchorBgColor() {
		return anchorBgColor;
	}

	public void setAnchorBgColor(String anchorBgColor) {
		this.anchorBgColor = anchorBgColor;
	}

	public String getAnchorAlpha() {
		return anchorAlpha;
	}

	public void setAnchorAlpha(String anchorAlpha) {
		this.anchorAlpha = anchorAlpha;
	}

	public String getAnchorBgAlpha() {
		return anchorBgAlpha;
	}

	public void setAnchorBgAlpha(String anchorBgAlpha) {
		this.anchorBgAlpha = anchorBgAlpha;
	}

	public String getDivLineDashLen() {
		return divLineDashLen;
	}

	public void setDivLineDashLen(String divLineDashLen) {
		this.divLineDashLen = divLineDashLen;
	}

	public String getDivLineDashGap() {
		return divLineDashGap;
	}

	public void setDivLineDashGap(String divLineDashGap) {
		this.divLineDashGap = divLineDashGap;
	}

	public String getZeroPlaneColor() {
		return zeroPlaneColor;
	}

	public void setZeroPlaneColor(String zeroPlaneColor) {
		this.zeroPlaneColor = zeroPlaneColor;
	}

	public String getZeroPlaneThickness() {
		return zeroPlaneThickness;
	}

	public void setZeroPlaneThickness(String zeroPlaneThickness) {
		this.zeroPlaneThickness = zeroPlaneThickness;
	}

	public String getZeroPlaneAlpha() {
		return zeroPlaneAlpha;
	}

	public void setZeroPlaneAlpha(String zeroPlaneAlpha) {
		this.zeroPlaneAlpha = zeroPlaneAlpha;
	}

	public String getvDivLineIsDashed() {
		return vDivLineIsDashed;
	}

	public void setvDivLineIsDashed(String vDivLineIsDashed) {
		this.vDivLineIsDashed = vDivLineIsDashed;
	}

	public String getvDivLineDashLen() {
		return vDivLineDashLen;
	}

	public void setvDivLineDashLen(String vDivLineDashLen) {
		this.vDivLineDashLen = vDivLineDashLen;
	}

	public String getvDivLineDashGap() {
		return vDivLineDashGap;
	}

	public void setvDivLineDashGap(String vDivLineDashGap) {
		this.vDivLineDashGap = vDivLineDashGap;
	}

	public String getNumberPrefix() {
		return numberPrefix;
	}

	public void setNumberPrefix(String numberPrefix) {
		this.numberPrefix = numberPrefix;
	}

	public String getNumberSuffix() {
		return numberSuffix;
	}

	public void setNumberSuffix(String numberSuffix) {
		this.numberSuffix = numberSuffix;
	}

	public String getFormatNumberScale() {
		return formatNumberScale;
	}

	public void setFormatNumberScale(String formatNumberScale) {
		this.formatNumberScale = formatNumberScale;
	}

	public String getDecimalPrecision() {
		return decimalPrecision;
	}

	public void setDecimalPrecision(String decimalPrecision) {
		this.decimalPrecision = decimalPrecision;
	}

	public String getDivLineDecimalPrecision() {
		return divLineDecimalPrecision;
	}

	public void setDivLineDecimalPrecision(String divLineDecimalPrecision) {
		this.divLineDecimalPrecision = divLineDecimalPrecision;
	}

	public String getLimitsDecimalPrecision() {
		return limitsDecimalPrecision;
	}

	public void setLimitsDecimalPrecision(String limitsDecimalPrecision) {
		this.limitsDecimalPrecision = limitsDecimalPrecision;
	}

	public String getFormatNumber() {
		return formatNumber;
	}

	public void setFormatNumber(String formatNumber) {
		this.formatNumber = formatNumber;
	}

	public String getDecimalSeparator() {
		return decimalSeparator;
	}

	public void setDecimalSeparator(String decimalSeparator) {
		this.decimalSeparator = decimalSeparator;
	}

	public String getThousandSeparator() {
		return thousandSeparator;
	}

	public void setThousandSeparator(String thousandSeparator) {
		this.thousandSeparator = thousandSeparator;
	}

	public String getThousandSeparato() {
		return thousandSeparato;
	}

	public void setThousandSeparato(String thousandSeparato) {
		this.thousandSeparato = thousandSeparato;
	}

	public String getDecimals() {
		return decimals;
	}

	public void setDecimals(String decimals) {
		this.decimals = decimals;
	}

	public String getDefaultNumberScale() {
		return defaultNumberScale;
	}

	public void setDefaultNumberScale(String defaultNumberScale) {
		this.defaultNumberScale = defaultNumberScale;
	}

	public String getNumberScaleUnit() {
		return numberScaleUnit;
	}

	public void setNumberScaleUnit(String numberScaleUnit) {
		this.numberScaleUnit = numberScaleUnit;
	}

	public String getNumberScaleValue() {
		return numberScaleValue;
	}

	public void setNumberScaleValue(String numberScaleValue) {
		this.numberScaleValue = numberScaleValue;
	}

	public String getInDecimalSeparator() {
		return inDecimalSeparator;
	}

	public void setInDecimalSeparator(String inDecimalSeparator) {
		this.inDecimalSeparator = inDecimalSeparator;
	}

	public String getInThousandSeparator() {
		return inThousandSeparator;
	}

	public void setInThousandSeparator(String inThousandSeparator) {
		this.inThousandSeparator = inThousandSeparator;
	}

	public String getForceDecimals() {
		return forceDecimals;
	}

	public void setForceDecimals(String forceDecimals) {
		this.forceDecimals = forceDecimals;
	}

	public String getyAxisValueDecimals() {
		return yAxisValueDecimals;
	}

	public void setyAxisValueDecimals(String yAxisValueDecimals) {
		this.yAxisValueDecimals = yAxisValueDecimals;
	}

	/**
	 * 纵向柱状图
	 * 
	 * @param map
	 */
	public void getAreaBarData(Map<String, BigDecimal> map) {
		String str = "<chart caption='"
				+ this.getCaption()
				+ "' "
				+ "subcaption='' baseFontColor='ffffff' yaxisname='"
				+ this.getyAxisName()
				+ "' xAxisName='"
				+ this.getxAxisName()
				+ "' formatnumberscale='1'"
				+ " plotgradientcolor='"
				+ this.getPlotGradientColor()
				+ "'"
				+ " bgAlpha='100' "
				+ "bgcolor='"
				+ this.getBgColor()
				+ "' "
				+ "showalternatehgridcolor='0' "
				+ "showplotborder='0' showvalues='0' "
				+ "labeldisplay='WRAP'"
				+ " divlinecolor='CCCCCC' "
				+ "suseroundedges='1' "
				+ "showcanvasborder='0' "
				+ "canvasbgcolor='"
				+ this.getCanvasBgColor()
				+ "' "
				+ "defaultnumberscale='' "
				+ "numberscalevalue='1024,1024' "
				+ "numberscaleunit='' "
				+ "palettecolors='#2B3745' showborder='0' tooltipBgColor='2c3240'>";
		for (String key : map.keySet()) {
			str += "<set label='" + key + "' value='" + map.get(key)
					+ "' stepskipped='false' labeltooltext='' />";
		}
		str += "</chart>";
		this.data = str;
	}

	/**
	 * 饼图
	 * 
	 * @param map
	 */
	public void getPieData(Map<String, Object> map) {
		String str = "<chart caption='"
				+ this.getCaption()
				+ "' "
				+ "subcaption='' baseFontColor='ffffff' yaxisname='"
				+ this.getyAxisName()
				+ "' xAxisName='"
				+ this.getxAxisName()
				+ "' formatnumberscale='1'"
				+ " plotgradientcolor='"
				+ this.getPlotGradientColor()
				+ "'"
				+ " bgAlpha='100' "
				+ "bgcolor='"
				+ this.getBgColor()
				+ "' "
				+ "showalternatehgridcolor='0' showZeroPies='0' "
				+ "showplotborder='0' showvalues='1' "
				+ "labeldisplay='WRAP' showpercentvalues='0'"
				+ " "
				+ " divlinecolor='CCCCCC' "
				+ "suseroundedges='1' "
				+ "showcanvasborder='0' "
				+ "canvasbgcolor='"
				+ this.getCanvasBgColor()
				+ "' "
				+ "defaultnumberscale='' "
				+ "numberscalevalue='1024,1024' "
				+ "numberscaleunit='k' "
				+ "palettecolors='#2B3745' showborder='0'  tooltipBgColor='2c3240'>";
		int i = 0;
		for (String key : map.keySet()) {
			str += "<set label='" + key + "' value='" + map.get(key)
					+ "' stepskipped='false' color='" + color[i]
					+ "' labeltooltext='' />";
			i++;
		}
		str += "</chart>";
		this.data = str;
	}

	/**
	 * 折线或3D图等 zoom图
	 * 
	 * @param cate
	 * @param seriesName
	 * @param datavalue
	 */
	public void setData(String[] cate, String[] seriesName, String[][] datavalue) {
		String today = DateUtils.getToday();
		// zoomindex假如是zoomindex模式的图形则加下面代码，下面代码用于将图形的按钮改成中文
		String data = "<chart caption='" + this.getCaption() + "' "
				+ "subcaption='' xaxisname='" + this.getxAxisName() + "' "
				+ "yaxisname='" + this.getyAxisName()
				+ "' palette='3' bgAlpha='100' " + "bgcolor='"
				+ this.getBgColor() + "' canvasbgcolor='"
				+ this.getCanvasBgColor() + "' canvasbgalpha='100' "
				+ "canvasborderthickness='1'  "
				+ "canvasborderalpha='20' legendshadow='0' " + "numbersuffix='"
				+ this.getNumberSuffix() + "' numberprefix='"
				+ this.getNumberPrefix() + "' "
				+ "showvalues='"+this.getShowValues()+"' alternatehgridcolor='2c3240' "
				+ "alternatehgridalpha='100' showborder='0' "
				+ "legendborderalpha='0' "
				+ "legendiconscale='1.5' divlineisdashed='1' "
				+ "legendBgColor='#2c3240' " + "baseFontColor='ffffff' "
				+ "tooltipBgColor='2c3240' " + "usePlotGradientColor='0'>";
		data += "<categories>";
		if (cate.length == 0) {
			data += "<category label='" + today + "' />";
		} else {
			for (int i = 0; i < cate.length; i++) {
				data += "<category label='" + cate[i] + "' />";
			}
		}
		data += "</categories>";
		for (int m = 0; m < seriesName.length; m++) {
			data += "<dataset seriesName='" + seriesName[m] + "' color='"
					+ color[m] + "'>";
			for (int n = 0; n < datavalue.length; n++) {
				String mydate = seriesName[m]
						+ StringUtils.padLeftStr(cate[n], 2);
				data += "<set value='" + datavalue[n][m] + "' link='j-test-"
						+ mydate + "'/>";
			}
			data += "</dataset>";
		}
		data += "<styles><definition><style name='captionFont'  type='font' size='15' />"
				+ "</definition><application><apply toobject='caption'styles='captionfont' />"
				+ "</application>" + "</styles>";

		data += "</chart>";
		// System.out.println("1111==== "+data);
		this.data = data;
	}

	/***
	 * 
	 * @param value
	 * @param greenvalue
	 * @param yellowvalue
	 * @param redvalue
	 * @param upperlimit
	 * @param lowerlimit
	 */
	public void setGaugeData(double value, double yellowvalue, double redvalue,
			double upperlimit, double lowerlimit) {
		String data = "<chart manageresize='1' origw='400' origh='250'"
				+ " managevalueoverlapping='1' autoaligntickvalues='1' "
				+ "caption='"
				+ this.getCaption()
				+ "' baseFontColor='ffffff' tooltipBgColor='2c3240'"
				+ "  plotgradientcolor='"
				+ this.getPlotGradientColor()
				+ "'"
				+ " bgAlpha='100' "
				+ "bgcolor='"
				+ this.getBgColor()
				+ "'  canvasbgcolor='"
				+ this.getCanvasBgColor()
				+ "' canvasbgalpha='100' fillangle='45' upperlimit='"
				+ upperlimit
				+ "' "
				+ "lowerlimit='"
				+ lowerlimit
				+ "' majortmnumber='10' majortmheight='8' "
				+ "showgaugeborder='0' gaugeouterradius='140' gaugeoriginx='205' "
				+ "gaugeoriginy='206' gaugeinnerradius='2' formatnumberscale='1' "
				+ "numberprefix='' decmials='2' tickmarkdecimals='1' pivotradius='17' "
				+ "showpivotborder='1' pivotbordercolor='000000' pivotborderthickness='5'"
				+ " pivotfillmix='FFFFFF,000000' tickvaluedistance='10' showborder='0'>"
				+ "<colorrange>"
				+ "<color minvalue='1' maxvalue='"
				+ yellowvalue
				+ "' code='399E38' />"
				+ "<color minvalue='"
				+ yellowvalue
				+ "' maxvalue='"
				+ redvalue
				+ "' code='E48739' />"
				+ "<color minvalue='"
				+ redvalue
				+ "' maxvalue='' code='B41527' />"
				+ "</colorrange>"
				+ "<dials>"
				+ "<dial value='"
				+ value
				+ "' borderalpha='0' bgcolor='000000' basewidth='28' topwidth='1' radius='130' />"
				+ "</dials>"
				+ "<annotations>"
				+ "<annotationgroup x='205' y='207.5'>"
				+ "<annotation type='circle' x='0' y='2.5' radius='150' startangle='0' "
				+ "endangle='180' fillpattern='linear' fillasgradient='1' "
				+ "fillcolor='dddddd,666666' fillalpha='100,100' fillratio='50,50' "
				+ "fillangle='0' showborder='1' bordercolor='444444' borderthickness='2' />"
				+ "<annotation type='circle' x='0' y='0' radius='145' startangle='0' endangle='180' "
				+ "fillpattern='linear' fillasgradient='1' fillcolor='666666,ffffff' fillalpha='100,100' "
				+ "fillratio='50,50' fillangle='0' />"
				+ "</annotationgroup>"
				+ "</annotations>" + "</chart>";
		this.data = data;
	}

}
