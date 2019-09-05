<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta>
		<title>用能负荷监测-中惠元景能耗监测平台</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<!-- Le styles -->
		<link rel="stylesheet" href="/emcc-new/assets/css/style.css">
		<link rel="stylesheet" href="/emcc-new/assets/css/bootstrap.css">
		<link rel="stylesheet" href="/emcc-new/css/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css"
			href="/emcc-new/css/icon.css"></link>
		<link rel="stylesheet" type="text/css" href="/emcc-new/css/jedate.css">
		<script type="text/javascript"
			src="/emcc-new/js/jquery-1.8.2.min.js">
		</script>
		<script type="text/javascript"
			src="/emcc-new/js/jquery.easyui.min.js">
		</script>
		<script type="text/javascript" src="/emcc-new/js/jquery.jedate.js"></script>
		<script type="text/javascript" src="/emcc-new/js/page.js"></script>
		<script type="text/javascript" src="/emcc-new/js/jsonToTime.js"></script>
		<script type="text/javascript" src="/emcc-new/js/time.js"></script>
		<script>
var ctdCode="1";
$(function() {
	InifhTable();
	GetData();
});
//加载表格数据
function GetData() {
	var args = {};
	BingData("#fhtb", args, 'realAll?ctdCode='+ctdCode,null);
}
</script>
<!-- 表格展示 -->
<script>
function InifhTable() {
	//初始化table	
	$('#fhtb').datagrid( {
		fitColumns : false, //自适应列的大小
		singleSelect : true,
		fit : true,
		rownumbers :false,
		columns : [ [
				{
					title : '参数名称',
					field : 'name',
					align : 'center',
					width : fixWidth(0.5),
					styler : function(value, row, index) {  
                    		return 'border:1px solid #fff;';  
                	} 
				},
				{
					title : '表读数',
					field : 'value',
					align : 'center',
					width : fixWidth(0.2),
					styler : function(value, row, index) {  
                    		return 'border:1px solid #fff;';  
                	} 
				},
				{
					title : '单位',
					field : 'units',
					align : 'center',
					width : fixWidth(0.1),
					styler : function(value, row, index) {  
                    		return 'border:1px solid #fff;';  
                	} 
				} ,
				{
					title : '更新时间',
					field : 'time',
					align : 'center',
					width : fixWidth(0.12),
					styler : function(value, row, index) {  
                    		return 'border:1px solid #fff;';  
                	} 
				}]],
		striped : true
	});
}
function fixWidth(percent){
		return $("#table").width()*percent;
	}
	function GetClickData(node) {
	ctdCode= node.id;
	GetData();
}
</script>
<STYLE type="text/css">
.box-shadow-2 {
	-webkit-box-shadow: 0 0 10px #1d1f24;
	-moz-box-shadow: 0 0 10px #1d1f24;
	box-shadow: 0 0 10px #1d1f24;
}
.dropdown-toggle{
			cursor:pointer;
		}
		.button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 5px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
}
</style>
	</head>
	<body>
		<!--  用能负荷监测内容 -->
		<div class="wrap-fluid">
			<div class="container-fluid paper-wrap bevel tlbr" style="width:100%">
				<!-- 内容板块 -->
				<div class="content-wrap" style="border: 0px solid green;padding:0px;">
					<div class="row" style="border: 0px solid green;margin-left:0.2%;">
					<!-- 左边 tree -->
						<div class="col-sm-2 box-shadow-2" style="border: 0px solid yellow;margin-top: 1%;height: 86.8%;width: 15%;">
							<iframe src="/emcc-new/tree.jsp" width="100%" style="border: 0px"
								height="100%" scrolling="no" frameborder="1"></iframe>
						</div>
					<div class="col-sm-10" style="float:left;width:85.0%;border: 0px solid red ;padding-left:10px;margin-top: 1%;height:87%;">
						<!-- 数据列表 -->
							<div class="col-xs-4 box-shadow-2" id="table" style="border:0px solid;width:100%;height: 99%;margin-top: 1%;">
								<table id="fhtb" class="easyui-datagrid" style="width: 100%;; height: 100%;background-color:black" toolbar="#toolbar" >
								</table> 
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
