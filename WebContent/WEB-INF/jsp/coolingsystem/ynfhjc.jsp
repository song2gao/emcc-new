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
		<link rel="stylesheet" href="/emcc-new/js/layui/css/layui.css">
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
var id = "";
var name="总有功电能";
var begindate="";
var enddate="";
$(function() {
	$("#begindate").jeDate({
        format: "YYYY-MM-DD hh:mm:ss",
        isinitVal:true
    });
    begindate=$("#begindate").val();
    $("#enddate").jeDate({
        format: "YYYY-MM-DD hh:mm:ss",
        isinitVal:true
    });
    enddate=$("#enddate").val();
    BingClickRadio();
	InifhTable();
	GetData();
});

//加载表格数据
function GetData() {
	var args = {};
	begindate=$("#begindate").val();
	enddate=$("#enddate").val();
	args.begindate=begindate;
	args.enddate=enddate;
	args.mmpCode=mmpCode;
	BingClickRadio();
	//BingData("#fhtb", args, 'yearmonthday?id='+id, null);
	BingData("#fhtb", args, 'dataTable', null);
}
</script>
<!-- 表格展示 -->
<script>
var mmpCode="31_";
function InifhTable() {
	//初始化table	
	$('#fhtb').datagrid( {
		fitColumns : false, //自适应列的大小
		singleSelect : true,
		fit : true,
		rownumbers :false,
		columns : [ [
				{
					title : '计量点名称',
					field : 'ctdName',
					align : 'center',
					width : 200,
					styler : function(value, row, index) {
						return 'border:1px solid #528B8B;';
					}
				},
				{
					title : '开始读数',
					field : 'beginValue',
					align : 'center',
					width : 200,
					styler : function(value, row, index) {
						return 'border:1px solid #528B8B;';
					}
				} ,
				{
					title : '终止读数',
					field : 'endValue',
					align : 'center',
					width : 200,
					styler : function(value, row, index) {
						return 'border:1px solid #528B8B;';
					}
				},
				{
					title : '用能量',
					field : 'value',
					align : 'center',
					width : 200,
					styler : function(value, row, index) {
						return 'border:1px solid #528B8B;';
					}
				},
				{
					title : '单位',
					field : 'unit',
					align : 'center',
					width : 200,
					styler : function(value, row, index) {
						return 'border:1px solid #528B8B;';
					}
				}]],
		striped : true
	});
}
//单选按钮事件
function BingClickRadio() {
	var radios = $("[name='rdmmps']");
	$("[name='rdmmps']").bind('click', function() {
		mmpCode=this.value;
	});
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
					<div class="col-sm-10" style="float:left;width:100.0%;border: 0px solid red ;padding-left:10px;margin-top: 1%;height:87%;">
				         <!-- 有功电能 -->
				        
						<div class="col-xs-3 box-shadow-2" style="float:left;width: 99%;height: 10%;padding:15px 0 0 15px;color: #528B8B">
						<input type="radio" name="rdmmps" checked="checked" value="31_"/>用电
						<input type="radio" name="rdmmps" value="64_"/>用水
						<input type="radio" name="rdmmps" value="66_"/>冷热量
						<input type="radio" name="rdmmps" value="65_"/>热量
							<input type="radio" name="rdmmps" value="1031_"/>蒸汽
							&nbsp;&nbsp;<span>开始日期</span>&nbsp;
						<input class="datainp" id="begindate" type="text" placeholder="YYYY-MM-DD hh:mm:ss" style="color:black"  readonly>
								<span>结束日期</span>&nbsp;
						<input class="datainp" id="enddate" type="text" placeholder="YYYY-MM-DD hh:mm:ss" style="color:black"  readonly>
						<input type="button" onclick="GetData()" class="button" style="margin-left:1%;background-color: #008CBA;" value="查询"/>
						</div>
						<!-- 数据列表 -->
							<div class="col-xs-4 box-shadow-2" style="border:0px solid;width:100%;height: 92%;margin-top: 1%;">
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
