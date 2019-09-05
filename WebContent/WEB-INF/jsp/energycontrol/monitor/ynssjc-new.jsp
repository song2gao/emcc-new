<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>用能实时监测-中惠元景能耗监测平台 1.0</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<script type="text/javascript"
			src="/emcc-new/fusioncharts-xt/js/fusioncharts.js"></script>
		<scirpt type="text/javascript"
			src="/emcc-new/fusioncharts-xt/js/fusioncharts.widgets.js"></scirpt>
		<script type="text/javascript"
			src="/emcc-new/fusioncharts-xt/js/themes/fusioncharts.theme.fint.js"></script>
		<script type="text/javascript" src="/emcc-new/js/jquery-1.8.2.min.js"></script>
		<script>
		var type=1;
		var code="1";
		$(function(){
			BingClickRadio();
			showData();
		});
		
	function showData() {
		$.ajax( {
			url : 'real?code='+code+'&type='+type,
			dataType : 'json',
			success : function(data) {
				data = data.data;
				var revenueChart = new FusionCharts( {
					"type" : "realtimeline",
					"renderAt" : "top",
					"width" : "100%",
					"height" : "100%",
					"dataFormat" : "xml",
					"dataSource" : data
				});
				revenueChart.render();
			}
		});
	}
	//单选按钮事件
function BingClickRadio() {
	var radios = $("[name='rdmmps']");
	$("[name='rdmmps']").bind('click', function() {
		radiosClick(this.id, this.value);
	});
}
//单选按钮单击事件
function radiosClick(id, value) {
	type=value;
	showData();
}
function GetClickData(node) {
	code = node.id;
	showData();
}
</script>
	</head>
	<body>
		<div class="col-sm-2 box-shadow-2"
			style="border: 0px solid yellow; margin-top: 1%; height: 99%; width: 15%; float: left">
			<iframe src="/emcc-new/tree.jsp" width="100%" style="border: 0px"
				height="100%" scrolling="no" frameborder="1"></iframe>
		</div>
		<div class="col-sm-10"
			style="border: 0px solid yellow; margin-top: 1%; height: 99%; width: 84%; float: left">
			<div class="col-sm-10"
				style="border: 0px solid yellow; margin-top: 1%; color: #fff; height: 5%; width: 99%; float: left">
				<div>
					<input type="radio" name="rdmmps" value="1" checked="checked" />
					相电压
					<input type="radio" name="rdmmps" value="2" />
					线电压
					<input type="radio" name="rdmmps" value="3" />
					电流
					<input type="radio" name="rdmmps" value="4" />
					功率
				</div>
			</div>
			<div class="col-sm-10"
				style="border: 0px solid yellow; margin-top: 1%; height: 94%; width: 99%; float: left">
				<div id="top">
					FusionCharts XT will load here!
				</div>
			</div>
		</div>
	</body>
</html>
