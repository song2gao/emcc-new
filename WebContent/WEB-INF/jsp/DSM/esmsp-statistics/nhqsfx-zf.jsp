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
		<link rel="stylesheet" type="text/css" href="/emcc-new/css/icon.css"></link>
		<script type="text/javascript" src="/emcc-new/js/jquery-1.8.2.min.js">
		</script>
		<script type="text/javascript" src="/emcc-new/js/jquery.easyui.min.js">
		</script>
		<script type="text/javascript" src="/emcc-new/js/page.js"></script>
		<script type="text/javascript" src="/emcc-new/js/jsonToTime.js"></script>
		<script type="text/javascript" src="/emcc-new/js/time.js"></script>
		<link rel="stylesheet" href="/emcc-new/js/layui/css/layui.css">
		<script type="text/javascript" src="/emcc-new/js/layui/layui.all.js"></script>
						<script type="text/javascript"
			src="/emcc-new/fusioncharts-xt/js/fusioncharts.js"></script>
		<script type="text/javascript"
			src="/emcc-new/fusioncharts-xt/js/themes/fusioncharts.theme.fint.js"></script>
		<script>
var id = "4";
var mybegindate = "";
var myenddate = "";
var type=3;
$(function() {
	var d = new Date();
		daynum = -1;
		var str = myformatter(d);
		$("#begindate").datebox('setValue', str);
		mybegindate = str;
		daynum=-2;
		str = myformatter(d);
		$("#enddate").datebox('setValue', str);
		myenddate = str;
		daynum=0;
		BingClickRadio();
		freshPage();
		
});
function GetClickData(node) {
	id = node.id;
	freshPage();
}
function onChangeBeginDate(date) {
		mybegindate = myformatter(date);
	}
	function onChangeEndDate(date) {
		myenddate = myformatter(date);
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
		type = value;
	}
//单击加载图标数据
function freshPage() {
	$.ajax({
		url:"nhqsdata?id="+id+"&dateBeginCode="+mybegindate+"&dateEndCode="+myenddate+"&type="+type,
		dataType:'json',
		type:'post',
		success:function(data){
		console.info(data);
		var revenueChart = new FusionCharts( {
					"type" : data.data.type,
					"renderAt" : "fusion",
					"width" : data.data.width,
					"height" :"90%",
					"dataFormat" : "xml",
					"dataSource" : data.data.data
				});
				revenueChart.render();
				}
	});
	//GetData();
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
		//{ title: '日期', field: 'dateCode',align:'center', width: 80},
				{
					title : '测点名称',
					field : 'mmpCode',
					align : 'center',
					width : 100
				},
				{
					title : '最大值',
					field : 'maxValue',
					align : 'center',
					width : 100
				} ,
				{
					title : '最大值时间',
					field : 'maxDate',
					align : 'center',
					width : 200
				},
				{
					title : '最小值',
					field : 'minValue',
					align : 'center',
					width : 100
				},
				{
					title : '最小值时间',
					field : 'minDate',
					align : 'center',
					width : 200
				},
				{
					title : '平均值',
					field : 'avgValue',
					align : 'center',
					width : 100
				}] ],
		striped : true
	});
}

</script>
		<STYLE type="text/css">
.box-shadow-2 {
	-webkit-box-shadow: 0 0 10px #1d1f24;
	-moz-box-shadow: 0 0 10px #1d1f24;
	box-shadow: 0 0 10px #1d1f24;
}
</style>
	</head>
	<body>
		<!--  用能负荷监测内容 -->
		<div class="wrap-fluid">
			<div class="container-fluid paper-wrap bevel tlbr"
				style="width: 100%">
				<!-- 内容板块 -->
				<div class="content-wrap"
					style="border: 0px solid green; padding: 0px;">
					<div class="row"
						style="border: 0px solid green; margin-left: 0.2%;">
						<!-- 左边 tree -->
						<div class="col-sm-2 box-shadow-2"
							style="border: 0px solid yellow; margin-top: 1%; height: 95%; width: 15%;">
							<iframe src="/emcc-new/tree.jsp" width="100%" style="border: 0px"
								height="100%" scrolling="no" frameborder="1"></iframe>
						</div>
						<!--右边面板 -->
						<div class="col-sm-10"
							style="float: left; width: 83.0%; border: 0px solid red; padding-left: 10px; margin-top: 1%; height: 87%;">
							<!-- 有功电能 -->
							<div class="col-xs-3 box-shadow-2"
								style="float: left; width: 99%; height: 10%; padding: 15px 0 0 15px">
								<input type="radio" name="rdmmps" value="1" checked="checked" />
								年
								<input type="radio" name="rdmmps" value="2" />
								月
								<input type="radio" name="rdmmps" value="3" />
								日
								<span>开始日期</span>&nbsp;
									<input name="begindate" id="begindate"
										value="2013-10-01" class="easyui-datebox"
										data-options="formatter:myformatter,parser:myparser,onSelect:onChangeBeginDate"
										style="width: 100px; height: 10px" />
									<span>对比日期</span>&nbsp;
									<input name="enddate" id="enddate"
										value="2013-10-01" class="easyui-datebox"
										data-options="formatter:myformatter,parser:myparser,onSelect:onChangeEndDate"
										style="width: 100px; height: 10px" />
									<button onclick="freshPage()" style="width:130px;height:35px;color:#ffffff;background-color: #008CBA;border: 0px solid red">查询</button>
							</div>
							<div class="layui-tab layui-tab-brief"
								style="float: right; height: 40px; right: 20px; margin-top: 0px; padding: 0px;"
								lay-filter="docDemoTabBrief">
								<ul class="layui-tab-title" style="color: #528B8B">
									<li class="layui-this" onclick="showfusion()">
										趋势
									</li>
									<li onclick="showtable()">
										占比
									</li>
								</ul>
							</div>
							<div class="col-xs-4 box-shadow-2"
								style="height: 100%; border: 0px solid yellow; width: 99%; background-color: #2c3240; padding-top:1%">
								<!-- 图表数据 -->
								<div class="nest" id="fusion">

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
