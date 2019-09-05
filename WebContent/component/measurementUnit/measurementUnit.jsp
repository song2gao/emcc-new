<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>计量单位通用组件</title>
<jsp:include page="/component/common/importEasyui.jsp"></jsp:include>
<script type="text/javascript" src="/emcc-web/js/measurementUnit.js" charset="UTF-8"></script>
<script type="text/javascript">
	$(function(){
		initMeasurementUnit();
	});
</script>
</head>
<body>
	<input type="text" readonly="readonly" value="计量单位选择" class="measurementUnitButton" 
		 uniqueDataId="userHeader" val="1" isNotNull="true"/>
		
	<input type="button" value="计量单位选择" class="measurementUnitButton" 
		 uniqueDataId="userHeader" val="2" isNotNull="true"/>
		
	<input type="button" value="计量单位选择" class="measurementUnitButton" 
		 uniqueDataId="userHeader" val=""/>
	
	<input type="button" value="提交" onclick="if(checkMeasurementUnit()){submitMeasurementUnit(); alert('提交完成');}" />
	
	<div id="measurementUnitDialog">
		<div>
			计量单位：<input type="text" id="measurementUnitSearchText" />
			<input type="button" id="measurementUnitSearchButton" value="搜索"/>
			<input name="measurementUnit" type="radio" value=",计量单位选择" /> 无 
		</div>
		<div id="measurementUnitDiv"></div>
	</div>
</body>
</html>