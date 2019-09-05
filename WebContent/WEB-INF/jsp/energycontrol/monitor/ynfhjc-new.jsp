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
		<script type="text/javascript"
			src="/emcc-new/js/jquery-1.8.2.min.js">
		</script>
		<script type="text/javascript"
			src="/emcc-new/js/jquery.easyui.min.js">
		</script>
		<script type="text/javascript"
			src="/emcc-new/fusioncharts-xt/js/fusioncharts.js"></script>
		<script type="text/javascript"
			src="/emcc-new/fusioncharts-xt/js/themes/fusioncharts.theme.fint.js"></script>
		<script type="text/javascript" src="/emcc-new/js/page.js"></script>
		<script>
var id = "1";
var name="总有功电能";
$(function() {
	//setInterval(freshData, 1000 * 30);
	InifhTable();
	freshPage();
	BingClickRadio();
	BindSelect();
});
function freshData() {
	var date = new Date();
	var m = date.getMinutes();
	if (m % 15 == 1) {
		freshPage();
	}
}
function GetClickData(node) {
	id = node.id;
	freshPage();
}
//单选按钮事件
function BingClickRadio() {
	var radios = $("[name='rdmmps']");
	$("[name='rdmmps']").bind('click', function() {
		radiosClick(this.id, this.value);
	});
}
function BindSelect(){
	$("#selmmp").change(function(){
		mmpName=this.value;
		freshPage();
	});
}
//单选按钮单击事件
function radiosClick(id, value) {
	if(value=="谐波"){
		$("#selmmp").removeAttr("disabled");
		$("#selmmp").attr("style","");
		$("#selmmp").attr("style","color:black");
		mmpName=$("#selmmp").val();
	}else{
		$("#selmmp").attr("disabled","true");
		$("#selmmp").attr("style","");
		$("#selmmp").attr("style","color:gray");
		name=value;
	}
	freshPage();
}
//单击加载图标数据
function freshPage() {
	//单击加载图标数据
	//var iframe=$("#fushionchartsIframe");
	//iframe.attr("src","dayline?id="+id+"&mmpName="+name);
	GetData();
}//加载表格数据
function GetData() {
	var args = {};
	//BingData("#fhtb", args, 'yearmonthday?id='+id, null);
	$.ajax({
		url:'../monitor/test?id='+id+'&mmpName='+name,
		dataType:'json',
		type:'post',
		success:function(data){
			$("#fhtb").datagrid("loadData",data.list);
			var revenueChart = new FusionCharts( {
					"type" : "msline",
					"renderAt" : "fusion",
					"width" : "100%",
					"height" : "100%",
					"dataFormat" : "xml",
					"dataSource" : data.data.data
				});
				revenueChart.render();
		}
	});
	//BingData("#fhtb", args, 'daytable?id='+id+'&mmpName='+name, null);
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
					field : 'mmpName',
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
.dropdown-toggle{
			cursor:pointer;
		}
</style>
	<script>
	$(function() {
			//$("#top").css("color","#3F3F3F");
			$(".dropdown-toggle").css("font-size","24px");
			$(".dropdown-toggle").css("font-family","华文中宋");
			$(".dropdown-toggle").css("line-height","20px");
			$(".col-sm-3").css("padding-left","6px");
			var aLi = document.querySelectorAll('.dropdown-toggle');
		    for (var i = 0; i < aLi.length; i++) {
		        aLi[i].addEventListener('click', function(e){
		        	$(".dropdown-toggle").css("color","white");
		        	if(e.target.className=="dropdown-toggle"){
		        		$(this).css("color","#3F3F3F");
		        	}else{
		        		$(".dropdown-toggle").css("color","white");
		        	}
		        });
		    }
	});
	</script>
	</head>
	<body>

		<!--  用能负荷监测内容 -->
		<div class="wrap-fluid">
			<div class="container-fluid paper-wrap bevel tlbr" style="width:100%">
				<!--首页导航 -->
		<div class="body-nest col-md-12 box-shadow-2"
			style="background-color: #1f95ef; border: 0px solid; margin-left: -5px;height:55px;;">
			<div class="col-sm-7" style="color: white;border: 0px solid; margin-top: -0.6%;font-family: 华文中宋;font-style:normal;">
				<div class="col-sm-3" style="border: 0px solid;">
					<h4>
						<p data-toggle="dropdown" class="dropdown-toggle" id="top" type="button" >
							<i style="font-style:normal;" class="entypo-home" ></i>总能耗
							<span class="caret"></span>
						</p>
					</h4>
				</div>
				<div class="col-sm-3">
					<h4>
						<p data-toggle="dropdown" class="dropdown-toggle" type="button">
							<i style="font-style:normal;" class="entypo-droplet"></i>用水能耗
							<span class="caret"></span>
						</p>
					</h4>
				</div>
				<div class="col-sm-3">
					<h4>
						<p data-toggle="dropdown" class="dropdown-toggle" style="color:#3F3F3F" type="button">
							<i style="font-style:normal;" class="entypo-lamp"></i>用电能耗
							<span class="caret"></span>
						</p>
					</h4>
				</div>
				<div class="col-sm-3">
					<h4>
						<p data-toggle="dropdown" class="dropdown-toggle" type="button">
							<i style="font-size: 22px;font-style:normal;" class="entypo-network"></i>用气能耗
							<span class="caret"></span>
						</p>
					</h4>
				</div>
			</div>
		</div>
				<!-- 内容板块 -->
				<div class="content-wrap" style="border: 0px solid green;padding:0px;">
					<div class="row" style="border: 0px solid green;margin-left:0.2%;">
						<!-- 左边 tree -->
						<div class="col-sm-2 box-shadow-2" style="border: 0px solid yellow;margin-top: 1%;height: 86.8%;width: 15%;">
							<iframe src="/emcc-new/tree.jsp" width="100%" style="border: 0px"
								height="100%" scrolling="no" frameborder="1"></iframe>
						</div>
					<!--右边面板 -->
					<div class="col-sm-10" style="float:left;width:85.0%;border: 0px solid red ;padding-left:10px;margin-top: 1%;height:87%;">
				         <!-- 有功电能 -->
						<div class="col-xs-3 box-shadow-2" style="float:left;width: 99%;height: 10%;padding:15px 0 0 15px">
							<input type="radio" name="rdmmps" value="总有功电能" checked="checked" />有功电能
							<input type="radio" name="rdmmps" value="视在功率"/>视在功率
							<input type="radio" name="rdmmps" value="有功功率"/>有功功率
							<input type="radio" name="rdmmps" value="无功功率"/>无功功率
							<input type="radio" name="rdmmps" value="电流"/>电流
							<input type="radio" name="rdmmps" value="电压"/>电压
							<input type="radio" name="rdmmps" value="电流不平衡度"/>电流不平衡度
							<input type="radio" name="rdmmps" value="电压不平衡度"/>电压不平衡度
							<input type="radio" name="rdmmps" value="频率"/>频率
							<input type="radio" name="rdmmps" value="谐波"/>谐波
							<select id="selmmp" disabled="true">
								<option value="A相电压谐波含有率">
														A相电压谐波含有率
													</option>
													<option value="A相电流谐波含有率">
														A相电流谐波含有率
													</option>
													<option value="B相电压谐波含有率">
														B相电压谐波含有率
													</option>
													<option value="B相电流谐波含有率">
														B相电流谐波含有率
													</option>
													<option value="C相电压谐波含有率">
														C相电压谐波含有率
													</option>
													<option value="C相电流谐波含有率">
														C相电流谐波含有率
													</option>
													<option value="电压谐波畸变率">
														电压谐波畸变率
													</option>
													<option value="电流谐波畸变率">
														电流谐波畸变率
													</option>
							</select>
						</div>
				         <div class="col-xs-4 box-shadow-2" style="height: 50%;border: 0px solid yellow ;width:99%;background-color:#2c3240;margin-top:10px">
							<!-- 图表数据 -->
							<div class="nest" id="fusion">
								
							</div>
						</div>
						<!-- 数据列表 -->
							<div class="col-xs-4 box-shadow-2" style="border:0px solid;width:100%;height: 52%;margin-top: 1%;">
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
