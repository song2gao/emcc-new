<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>通讯路由配置</title>
</head>
<link href="/emcc-new/css/poms-system/xtqygl.css" rel="stylesheet"
	type="text/css" />

<link href="/emcc-new/css/poms-system/bdcss.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" type="text/css"
	href="/emcc-new/css/themes/easyui.css">
<link rel="stylesheet" type="text/css" href="/emcc-new/css/icon.css">
<link rel="stylesheet" type="text/css"
	href="/emcc-new/css/themes/demo.css">
<script type="text/javascript" src="/emcc-new/css/themes/jquery.min.js"></script>
<script type="text/javascript" src="/emcc-new/css/themes/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/emcc-new/js/page.js"></script>
<script type="text/javascript" src="/emcc-new/js/poms-unit/communication-index.js"></script>
<script type="text/javascript" src="/emcc-new/js/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript"> 
 	
     </script>
<body>
<div id="main" class="xtqygl_main">
			<div id="yhgl_left">
				<div class="yhgltreeDiv" align="left">
					<ul class="easyui-tree" style="margin-left: 3px" id="MyTree">
					</ul>
				</div>
			</div>
			<div id="yhgl_right" style="width: 1040px;">
				<div id="yhgl_right_top" align="left">
					<br />
						<font class="font_cg">&nbsp;&nbsp;
						企业: <input type="text" id="" name="qy" />&nbsp;&nbsp;
						前置机: <input type="text" id="qzj" name="qzj" />
						</font>
					<input type="button" value="查询" class="btnClass" id="search"/>
					<span style="width: 40px;"></span>
					<input type="button" value="增加" class="btnClass" />
					<input type="button" value="修改" class="btnClass" />
					<input type="button" value="删除" class="delClass" />
				</div>
				<table id="cc" style="height: 480px"></table>
			</div>
		</div>
</body>
<script type="text/javascript">
	function GetData(){
		var args={};
		args.gdType=$("#piName").val();
		args.gdState=$("#piCodes").val();
		args.pageIndex=1;//页索引
		args.pageSize=10;//页容量
		BingData("#cc",args,"connRouteConfig.action?m=toSearchRouteConfig",null);
	}
	$('#cc').datagrid( {
		title : '通讯路由配置表',
		striped : true,
		fitColumns: true, //自适应列的大小
		pagination: true,
		rownumbers: true,
		singleSelect:true,//设置单选、多选。true单选，false 多选。
		columns : [ [ {field : 'crcEnterpriseId',title : '企业',width : 100},
					  {field : 'pomsFrontProcessorConfig',title : '前置机编号',width : 100,formatter: function(value, rowData, rowIndex){return value.communicateProtocal}},
					  {field : 'crcAssembleId',title : '采集器名称',width : 100},
					  {field : 'crcAssembleIp',title : '采集终端IP',width : 100},
					  {field : 'crcCommunicateSerial',title : '采集器序号',width : 100},
					  {field : 'crcCommunicateType',title : '通讯类型',width : 100},
					  {field : 'crcBackups',title : '备注',width : 100} 
					  
				  ] ]
	});
	//点击查询按钮时，根据条件查询信息
	$("#search").click(function(){
		//获取后台数据
		//$("#tt").datagrid("loadData",[]); 
		GetData();
	}); 
</script>
</html>