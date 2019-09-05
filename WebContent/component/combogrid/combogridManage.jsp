<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>选择框通用组件</title>
<jsp:include page="/component/common/importEasyui.jsp"></jsp:include>
<script type="text/javascript" src="/emcc-web/js/combogridManage.js" charset="UTF-8"></script>
<script type="text/javascript">
$(function(){
	var args = {};
	args.properties = 'pomsEnergyUnitInfo.id';
	args['pomsEnergyUnitInfo.id'] = '00000001400141e3fc34a2';
	loadCombogridManage('dd', '/emcc-web/toPomsEnergyUsingSystem.action?m=searchDataGridByCondition', args, null);
});
</script>
</head>
<body>
	<input id="dd" type="text" class="easyui-combogrid" data-options="
		panelWidth:450,
		panelHeight:300,
		fitColumns:true,
		fit:true,
		idField:'id',
		textField:'eusNames',
		pagination: true,
		pageSize : 10,
		pageList : [ 10, 20],
		columns:[[
			{field:'id', title:'编号', hidden:true},
			{field:'eusNames', title:'设备名称',width:100}
		]]"
	/>
	<input type="button" value="搜索" onclick="" />
	<input type="button" value="重置" onclick=""  />
</body>
</html>