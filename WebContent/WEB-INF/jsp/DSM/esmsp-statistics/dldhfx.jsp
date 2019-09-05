<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
	<head>
		<meta>
		<title>电力电耗查询-中惠元景能耗监测平台</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<!-- Le styles -->
		<link rel="stylesheet" href="/emcc-new/css/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css"
			href="/emcc-new/css/icon.css"></link>
		<script type="text/javascript"
			src="/emcc-new/js/jquery-1.8.2.min.js">
		</script>
		<script type="text/javascript"
			src="/emcc-new/js/jquery.easyui.min.js">
		</script>
		<script type="text/javascript" src="/emcc-new/js/page.js"></script>
		<script type="text/javascript" src="/emcc-new/js/jsonToTime.js"></script>
		<script type="text/javascript" src="/emcc-new/js/time.js"></script>
						<script type="text/javascript"
			src="/emcc-new/fusioncharts-xt/js/fusioncharts.js"></script>
		<script type="text/javascript"
			src="/emcc-new/fusioncharts-xt/js/themes/fusioncharts.theme.fint.js"></script>
<script>
var id="";
var mydate="";
var type="3";
$(function(){
	var d = new Date();
	daynum = -1;
	var str = myformatter(d);
	daynum=0;
	$("#zhOperateDate").datebox('setValue', str);
	mydate=str;
	freshPage();
	});
function onChangeDate(){
	mydate=$("#zhOperateDate").datebox('getValue');
	freshPage();
}
//单击加载图标数据
function freshPage() {
	$.ajax({
		url:"dldhdata?id="+id+"&type="+type+"&date="+mydate,
		dataType:"json",
		success:function(data){
			$("#fvalue").val(data.model.fvalue);
			$("#pvalue").val(data.model.pvalue);
			$("#gvalue").val(data.model.gvalue);
			$("#sumprice").val(data.model.sumprice);
			$("#fprice").val(data.model.fprice);
			$("#pprice").val(data.model.pprice);
			$("#gprice").val(data.model.gprice);
			$("#fgpcom").val(data.model.fgpcom);
			$("#sumvalue").val(data.model.sumvalue);
			var charts=data.charts;
			console.info(charts);
			var revenueChart = new FusionCharts( {
					"type" : charts[0].type,
					"renderAt" : "dlqs",
					"width" : '100%',
					"height" :"100%",
					"dataFormat" : "xml",
					"dataSource" : charts[0].data
				});
				revenueChart.render();
				revenueChart = new FusionCharts( {
					"type" : charts[1].type,
					"renderAt" : "dlpie",
					"width" : '100%',
					"height" :"100%",
					"dataFormat" : "xml",
					"dataSource" : charts[1].data
				});
				revenueChart.render();
				revenueChart = new FusionCharts( {
					"type" : charts[2].type,
					"renderAt" : "dfqs",
					"width" : '100%',
					"height" :"100%",
					"dataFormat" : "xml",
					"dataSource" : charts[2].data
				});
				revenueChart.render();
				revenueChart = new FusionCharts( {
					"type" : charts[3].type,
					"renderAt" : "dfpie",
					"width" : '100%',
					"height" :"100%",
					"dataFormat" : "xml",
					"dataSource" : charts[3].data
				});
				revenueChart.render();
		}
	})
}
//单选按钮单击事件
function radiosClick(id, value) {
	type=value;
	freshPage();
}
//单选按钮事件
function BingClickRadio() {
	var radios = $("[name='rdmmps']");
	$("[name='rdmmps']").bind('click', function() {
		radiosClick(this.id, this.value);
	});
}
function GetClickData(node) {
	id = node.id;
	freshPage();
}
</script>
<STYLE type="text/css">
.box-shadow-2 {
	-webkit-box-shadow: 0 0 10px #1d1f24;
	-moz-box-shadow: 0 0 10px #1d1f24;
	box-shadow: 0 0 10px #1d1f24;
}

.box-shadow-2 table {
	width: 100%;
	border-collapse: separate;
	border-spacing: 0px 10px;
	font-family: 华文中宋;
	color: #FFFFFF;
}

.box-shadow-2 table tr {
	border: 1px solid;
	margin: 4px 0; /*设置tr间距为2px*/
	height: 38px;
	padding: 0px;
	background: #383e54;
	font-size: 14px;
}

.box-shadow-2 table tr td {
	width: 10%;
	text-align: center;
}
.box-shadow-2 input{
	font-family: 华文中宋;
	color: black;
	font-size: 12;
}
</style>
	</head>
	<body>
		<!--  电力电耗查询 -->
		<div class="wrap-fluid">
			<div class="container-fluid paper-wrap bevel tlbr">
				<!-- 内容板块 -->
				<div class="content-wrap" style="border: 0px solid green;padding:0px;">
					<div class="row" style="border: 0px solid green;margin-left:0.2%;">
						<!-- 左边 tree -->
						<div class="col-sm-2 box-shadow-2" style="border: 0px solid yellow;margin-top: 1%;height: 97%;width: 15%;float:left">
							<iframe src="/emcc-new/tree.jsp" width="100%" style="border: 0px"
								height="100%" scrolling="no" frameborder="1"></iframe>
						</div>
						<!-- 右板块 -->
						<div class="col-sm-10"
							style="float:left;width:83.5%;border: 0px solid red ;padding-left:10px;padding-right:5px;margin-top: 1%;height:97%;">
							<!--导航 -->
							<div class="col-xs-3 box-shadow-2" style="float:left;width: 99%;height: 10%;padding:15px 0 0 15px;color:gray">
								<input type="radio" name="rdmmps" value="3" checked="checked" />逐日查询
								<input type="radio" name="rdmmps" value="2"  />月份查询
								<input type="radio" name="rdmmps" style="margin-left:50px" value="1"/>年份查询
								<span style="margin-left:50px">日期</span>&nbsp;
								<input name="zhOperateDate" id="zhOperateDate" value="2013-10-01"
									class="easyui-datebox"
									data-options="formatter:myformatter,parser:myparser,onSelect:onChangeDate"
									style="width: 100px;height:10px;float:right" />
							</div>
						<div class="col-xs-4" style="border: 0px solid; width:62%; height: 90%;margin-top: 1%;padding:0px;float:left">
								<div class="col-xs-4 box-shadow-2" style="border: 0px solid;width:100%;height: 48.1%;;">
									<div style="height: 90%; width: 49%;float:left" id="dlqs">
									</div>
									<div style="height: 90%; width: 49%;float:left" id="dlpie">
									</div>
								</div>
								<div class="col-xs-4 box-shadow-2" style="border: 0px solid;width:100%;height: 48.2%;margin-top: 1.5%;">
								<div style="height: 90%; width: 49%;float:left" id="dfqs">
									</div>
									<div style="height: 90%; width: 49%;float:left" id="dfpie">
									</div>
								</div>
						</div>
							<div class="col-xs-4 box-shadow-2" style="border:0px solid red; margin-top: 1%;margin-left: 1%;width:37%; height: 88%;float:left">
								<!--内部导航 -->
								<table style="margin-top:10px;">
											<tr>
												<td>
													总电量
												</td>
												<td>
													<INPUT id="sumvalue" type="text" width="10px;" disabled="disabled" value="" style="color:gray;"/>
												</td>
												<td>
													kWh
												</td>
											</tr>
											<tr>
												<td>
													峰电量
												</td>
												<td>
													<INPUT id="fvalue" type="text" width="10px;" disabled="disabled" value="" style="color:gray;"/>
												</td>
												<td>
													kWh
												</td>
											</tr>
											<tr>
												<td>
													平电量
												</td>
												<td>
													<INPUT id="pvalue" type="text" width="10px;" disabled="disabled" value="" style="color:gray;"/>
												</td>
												<td>
													kWh
												</td>
											</tr>
											<tr>
												<td>
													谷电量
												</td>
												<td>
													<INPUT id="gvalue" type="text" width="10px;" disabled="disabled" value="" style="color:gray;"/>
												</td>
												<td>
													kWh
												</td>
											</tr>
											<tr>
												<td>
													总电费
												</td>
												<td>
													<INPUT id="sumprice" type="text" width="10px;" disabled="disabled" value="" style="color:gray;"/>
												</td>
												<td>
												￥
												</td>
											</tr>
												<tr>
												<td>
													峰电费
												</td>
												<td>
													<INPUT id="fprice" type="text" width="10px;" disabled="disabled" value="" style="color:gray;"/>
												</td>
												<td>
													￥
												</td>
											</tr>
												<tr>
												<td>
													平电费
												</td>
												<td>
													<INPUT id="pprice" type="text" width="10px;" disabled="disabled" value="" style="color:gray;"/>
												</td>
												<td>
													￥
												</td>
											</tr>
												<tr>
												<td>
													谷电费
												</td>
												<td>
													<INPUT id="gprice" type="text" width="10px;" disabled="disabled" value="" style="color:gray;"/>
												</td>
												<td>
													￥
												</td>
											</tr>
												<tr>
												<td>
													峰谷平比
												</td>
												<td>
													<INPUT id="fgpcom" type="text" width="10px;" disabled="disabled" value="" style="color:gray;"/>
												</td>
												<td>
													
												</td>
											</tr>
								</table>
							</div>
							</div>
						</div>
				</div>
			</div>
		</div>
	</body>
</html>
