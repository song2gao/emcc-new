<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
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
<link rel="stylesheet" type="text/css" href="/emcc-new/css/icon.css"></link>
<link rel="stylesheet" type="text/css" href="/emcc-new/css/jedate.css">
<script type="text/javascript" src="/emcc-new/js/jquery-1.8.2.min.js">
	
</script>
<script type="text/javascript" src="/emcc-new/js/jquery.easyui.min.js">
	
</script>
<script type="text/javascript" src="/emcc-new/js/layui/layui.all.js"></script>
<script type="text/javascript" src="/emcc-new/js/jquery.jedate.js"></script>
<script type="text/javascript" src="/emcc-new/js/page.js"></script>
<script type="text/javascript" src="/emcc-new/js/jsonToTime.js"></script>
<script type="text/javascript" src="/emcc-new/js/time.js"></script>
<script type="text/javascript" src="/emcc-new/js/coolsystem/export.js"></script>
<script type="text/javascript"
	src="/emcc-new/js/datagrid-transposedview.js"></script>
<script>
	var id = "";
	var mydate = "";
	var type = "2";//类型标识 
	$(function() {
		$("#indate").jeDate({
			format : "YYYY-MM-DD hh:mm:ss",
			isinitVal : true
		});
		mydate = $("#indate").val();
		InifhTable();
		GetData();
		BingClickRadio();
	});
	//加载表格数据
	function GetData() {
		var args = {};
		mydate = $("#indate").val();
		BingData("#fhtb", args, 'newTable?type=' + type + '&date=' + mydate,
				null);
	}
</script>
<!-- 表格展示 -->
<script>
	function InifhTable() {
		//初始化table	
		$('#fhtb').datagrid({
			fit : true,
			view : transposedview,
			headerTextAlign : "center",
			nowrap : false,
			headerWidth : 100,
			itemWidth : 180,
			itemHeight : 100,
			height : "50px",
			title : "热力管理部西站供暖（65度）超声波计量表",
			fitColumns : false,
			border : true,
			singleSelect : true,
			collapsible : false,
			scrollbarSize : 0,
			method : 'get',
			columns : [ [ {
				title : '计量点名称',
				field : 'ctdName',
				align : 'center',
				width : fixWidth(0.2),
				styler : function(value, row, index) {
					return 'border:1px solid #fff;';
				}
			}, {
				title : '计量点名称',
				field : 'ctdName',
				align : 'center',
				width : fixWidth(0.2),
				styler : function(value, row, index) {
					return 'border:1px solid #fff;';
				}
			}, {
				title : '参数名称',
				field : 'mmpName',
				align : 'center',
				width : fixWidth(0.1),
				styler : function(value, row, index) {
					return 'border:1px solid #fff;';
				}
			}, {
				title : '日期',
				field : 'dateCode',
				align : 'center',
				width : fixWidth(0.12),
				styler : function(value, row, index) {
					return 'border:1px solid #fff;';
				}
			}, {
				title : '时间',
				field : 'timeCode',
				align : 'center',
				width : fixWidth(0.12),
				styler : function(value, row, index) {
					return 'border:1px solid #fff;';
				}
			}, {
				title : '表读数',
				field : 'calValue',
				align : 'center',
				width : fixWidth(0.2),
				styler : function(value, row, index) {
					return 'border:1px solid #fff;';
				}
			}, {
				title : '日累计值',
				field : 'sumValue',
				align : 'center',
				width : fixWidth(0.1),
				styler : function(value, row, index) {
					return 'border:1px solid #fff;';
				}
			}, {
				title : '单位',
				field : 'unit',
				align : 'center',
				width : fixWidth(0.1),
				styler : function(value, row, index) {
					return 'border:1px solid #fff;';
				}
			} ] ],
			striped : true
		});
	}
	//单选按钮事件
	function BingClickRadio() {
		var radios = $("[name='rdmmps']");
		$("[name='rdmmps']").bind('click', function() {
			type = this.value;
		});
	}
	function fixWidth(percent) {
		return $("#table").width() * percent;
	}
</script>
<script>
	function exportExcel() {
		var loc = "东站";
		if (type == "1") {
			loc = "东站";
		} else {
			loc = "西站";
		}
		var temp = "电表";
		if (flag == "1") {
			temp = "电表";
		} else if (flag == "2") {
			temp = "水表";
		} else if (flag == "3,4") {
			temp = "温度压力";
		} else if (flag == "4") {
			temp = "冷热量";
		}
		var name = loc + temp + "参数";
		expt($("#fhtb"), name);
	}
</script>
<STYLE type="text/css">
.box-shadow-2 {
	-webkit-box-shadow: 0 0 10px #1d1f24;
	-moz-box-shadow: 0 0 10px #1d1f24;
	box-shadow: 0 0 10px #1d1f24;
}

.dropdown-toggle {
	cursor: pointer;
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
		<div class="container-fluid paper-wrap bevel tlbr" style="width: 100%">
			<!-- 内容板块 -->
			<div class="content-wrap"
				style="border: 0px solid green; padding: 0px;">
				<div class="row" style="border: 0px solid green; margin-left: 0.2%;">
					<div class="col-sm-10"
						style="float: left; width: 100.0%; border: 0px solid red; padding-left: 10px; margin-top: 1%; height: 87%;">
						<!-- 有功电能 -->

						<div class="col-xs-3 box-shadow-2"
							style="float: left; width: 99%; height: 10%; padding: 15px 0 0 15px">
							<input type="radio" name="rdmmps" checked="" value="1" />热力管理部西站供暖（65度）超声波计量表
							<input type="radio" name="rdmmps" checked="" value="2" />热力管理部西站供暖（95度）超声波计量表
							<input class="datainp" id="indate" type="text"
								placeholder="YYYY-MM-DD hh:mm:ss" style="color: black" readonly>
							<input type="button" class="button"
								style="margin-left: 1%; background-color: #008CBA;"
								onclick="GetData()" value="查询" /> <input type="button"
								id="btnExport" class="button"
								style="margin-left: 1%; background-color: #008CBA;"
								onclick="exportExcel()" value="导出" />
						</div>
						<!-- 数据列表 -->
						<div class="col-xs-4 box-shadow-2" id="table"
							style="border: 0px solid; width: 100%; height: 99%; margin-top: 1%;">
							<table id="fhtb" class="easyui-datagrid"
								style="width: 100%;; height: 100%; background-color: black"
								toolbar="#toolbar">
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
