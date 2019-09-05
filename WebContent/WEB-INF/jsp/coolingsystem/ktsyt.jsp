<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<meta>
<title>空调系统管理-中惠元景能耗监测平台</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" href="/emcc-new/assets/css/style.css">
<link rel="stylesheet" href="/emcc-new/assets/css/loader-style.css">
<link rel="stylesheet" href="/emcc-new/assets/css/bootstrap.css">
<link rel="shortcut icon" href="/emcc-new/assets/ico/minus.png">
<link rel="stylesheet" href="/emcc-new/js/layui/css/layui.css">
<script type="text/javascript" src="/emcc-new/js/layui/layui.all.js"></script>
<link href="/emcc-new/assets/js/tabs/acc-wizard.min.css"
	rel="stylesheet">
<script type="text/javascript" src="/emcc-new/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/coolsystem/realdata.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/coolsystem/alarm.js"></script>
<!--<script type="text/javascript" src="/emcc-new/js/layer.js"></script> -->
<script type="text/javascript">
	function findWeather() {
		var cityUrl = 'http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js';
		$
				.getScript(
						cityUrl,
						function(script, textStatus, jqXHR) {
							var citytq = remote_ip_info.city; // 获取城市
							var url = "http://php.weather.sina.com.cn/iframe/index/w_cl.php?code=js&city="
									+ citytq + "&day=0&dfc=3";
							$
									.ajax({
										url : url,
										dataType : "script",
										scriptCharset : "gbk",
										success : function(data) {
											var _w = window.SWther.w[citytq][0];
											var _f = _w.f1 + "_0.png";
											if (new Date().getHours() > 17) {
												_f = _w.f2 + "_1.png";
											}
											var img = "<img width='16px' height='16px' src='http://i2.sinaimg.cn/dy/main/weather/weatherplugin/wthIco/20_20/" + _f +
								"' />";
											var tq = "当前城市：" + citytq + " "
													+ img + " " + _w.s1;
											var tq2 = "今天温度：" + _w.t1 + "℃～"
													+ _w.t2 + "℃ ";

											$('#weather').html(tq);
											$('#weather2').html(tq2);
										}
									});
						});
	}

	findWeather();
</script>
<script type="text/javascript">
	$(function() {
	});
	//一号主机参数显示
	function clickZJ(value) {

		var title = "";
		var ctdCode="";
		if (value == 1) {
			title = "一号制冷机";
			ctdCode='160';
		}
		if (value == 2) {
			title = "二号制冷机";
            ctdCode='161';
		}
		if (value == 3) {
			title = "三号制冷机";
            ctdCode='162';
		}
		var layerContent='<div class="layui-tab layui-tab-brief" style="border:0px solid red;height:95%;" lay-filter="docDemoTabBrief"><ul class="layui-tab-title">'
            + '<li class="layui-this">运行参数</li><li>机型参数</li></ul>'
            + '<div class="layui-tab-content" style="border:0px solid blue;height:90%;">'
            + '<div class="layui-tab-item layui-show">'
            + '<table class="layui-table" lay-size="sm" style="width:100%;">'
            + '<colgroup><col width="30px"><col width="40px"></colgroup>'
            + '<thead><tr><th>参数类别</th><th>参数值</th></tr></thead>'
            + '<tbody>';
		$.ajax({
            url:'realbyCtdCode?ctdCode='+ctdCode,
            dataType:'json',
			async:false,
            success:function(data){
				for(var i=0;i<data.list.length;i++){
				    var point=data.list[i];
				    var value=point.value;
				    var showvalue="";
				    var mmpCode=point.code;
					if(mmpCode=="10002"){
						if(value==4){
						    showvalue="运行";
						}else{
						    showvalue="停止";
						}
					}else{
					    showvalue=point.value;
					}
				    layerContent+='<tr><td>'+point.name+'：</td><td>'+showvalue+point.units+'</td></tr>';
				}
			}
		});
		layerContent+='</tbody></table>'
            + '</div>'
            + '<div class="layui-tab-item">'
            + '<table class="layui-table" lay-size="sm" style="width:100%;">'
            + '<colgroup><col width="20px"><col width="40px"></colgroup>'
            + '<thead><tr><th>参数类别</th><th>参数值</th></tr></thead>'
            + '<tbody><tr><td>制冷量：</td><td>2462kW</td></tr><tr><td>产地：</td><td>上海</td></tr><tr><td>售后服务：</td><td>一年保修</td>'
            + '</tr><tr><td>执行质量标准：</td><td>国标</td></tr><tr><td>冷暖类型：</td><td>单冷型</td>'
            + '</tr><tr><td>品牌：</td><td>开立</td>'
            + '</tr><tr><td>机组型号：</td><td>19XR5Q524R5LFH52</td></tr><tr><td>加工定制：</td><td>是</td>'
            + '</tr><tr><td>空调技术：</td><td>定速</td></tr><tr><td>空调频率：</td><td>50（Hz）</td>'
            + '</tr></tbody></table>'
            + '</div>'
            + '</div></div>'
            + '';
		layui.use(
						'layer',
						function() {
							var layer = layui.layer;

							layer
									.open({
										type : 1,
										title : title //不显示标题栏
										,
										skin : 'layui-layer-molv' //样式类名
										,
										offset : [ '12%', '5%' ] //具体配置参考：offset参数项
										,
										area : [ '300px', '485px' ],
										content : layerContent,
										btn : '关闭',
										btnAlign : 'a' //按钮居中
										,
										anim : 3 //弹出 动画
										,
										isOutAnim : true //关闭动画效果
										,
										shade : 0 //不显示遮罩
										,
										shadeClose : true //点击遮罩关闭层
										,
										yes : function(index) {
											layer.close(index);
										}
									});
						});
	}
</script>

<!-- Le styles -->
<STYLE type="text/css">
body {
	background: url(/emcc-new/image/beichen/dzzl.jpg) no-repeat;
	background-size: 99% 100%;
}

.box-shadow-2 {
	-webkit-box-shadow: 0 0 10px #1d1f24;
	-moz-box-shadow: 0 0 10px #1d1f24;
	box-shadow: 0 0 10px #1d1f24;
}

ul {
	padding: 0;
	font-family: 华文中宋;
	font-size: 16px;
	color: #FFFFFF;
	line-height: 2;
}

li {
	list-style-type: none;
	padding: 3px;
}

table tr {
	border-collapse: separate;
	border-spacing: 10px 50px;
}
</style>
</head>
<body style="border: 0px solid red;">
	<!-- 空调系统管理 -->
	<div
		style="border: 0px solid red; margin-top: 1%; margin-left: 2%; width: 90%; text-align: center; color: white;">
		<h2>北辰亚运村东站空调系统图</h2>
	</div>
	<!-- 温度 -->
	<span onclick="clickHz(124,10);" class="label label-weather"
		style="border: 0px solid red; position: absolute; top: 1%;left: 21%;">
		<b >55</b>kW(额定功率)
	</span>
	<span onclick="clickHz(125,10);" class="label label-weather"
		style="border: 0px solid red; position: absolute; top: 19.2%;left: 21%;">
		<b >55</b>kW(额定功率)
	</span>
	<span onclick="clickHz(126,10);" class="label label-weather"
		style="border: 0px solid red; position: absolute; top: 37%;left: 21%;">
		<b >55</b>kW(额定功率)
	</span>
	<span onclick="clickHz(127,10);" class="label label-weather"
		style="border: 0px solid red; position: absolute; top: 53%; left: 21%;">
		<b >55</b>kW(额定功率)
	</span>
	<span onclick="clickHz(128,10);" class="label label-weather"
		style="border: 0px solid red; position: absolute; top: 72%;left: 21%;">
		<b >55</b>kW(额定功率)
	</span>
	<!-- 主机 -->
	<div onclick="clickZJ(1);" class="select"
		style="position: absolute; top: 15%; left: 36%; width: 22%; height: 17%; text-align: center;"></div>
	<div onclick="clickZJ(2);" class="select"
		style="position: absolute; top: 38%; left: 36%; width: 22%; height: 17%;">
	</div>
	<div onclick="clickZJ(3);" class="select"
		style="position: absolute; top: 61%; left: 36%; width: 22%; height: 17%;">
	</div>
	<div class="btn-group"
		style="border: 0px solid red; position: absolute; top: 33%; left: 44%;">
		<button type="button" id="160" class="btn btn-danger">已经停止</button>
	</div>
	<div class="btn-group"
		style="border: 0px solid red; position: absolute; top: 55%; left: 44%;">
		<button type="button" id="161" class="btn btn-danger">已经停止</button>
	</div>
	<div class="btn-group"
		style="border: 0px solid red; position: absolute; top: 78%; left: 44%;">
		<button type="button" id="162" class="btn btn-danger">已经停止</button>
	</div>
	<!-- 温度 -->
	<span onclick="clickHz(129,10);" class="label label-weather"
		style="border: 0px solid red; position: absolute; top: 1%; left: 63%;">
		<b >55</b>kW(额定功率)
	</span>
	<span onclick="clickHz(130,10);" class="label label-weather"
		style="border: 0px solid red; position: absolute; top: 18.5%; left: 63%;">
		<b >55</b>kW(额定功率)
	</span>
	<span onclick="clickHz(131,10);" class="label label-weather"
		style="position: absolute; top: 35.6%; left: 63%;">
		<b >55</b>kW(额定功率)
	</span>
	<span onclick="clickHz(132,10);" class="label label-weather"
		style="border: 0px solid red; position: absolute; top: 53%;left: 63%;">
		<b >55</b>kW(额定功率)
	</span>
	<span onclick="clickHz(133,10);" class="label label-weather"
		style="border: 0px solid red; position: absolute; top: 71%;left: 63%;">
		<b >55</b>kW(额定功率)
	</span>

	<!-- 温度压力 -->
	<!-- 温度压力 -->
	<div style="position: absolute; top: 6.3%; left: 75%; width: 30%; color: #E0EEE0; font-size: 14px;"
		<div>分水器压力：
			<span class="label label-weather" onclick="clickHz(151,15);">
				<b id="151e15" name="15" value="15">0.0</b>MPa</span>
		</div>
	</div>
	<div style="position: absolute; top: 66.8%; left: 75%; width: 30%; color: #E0EEE0; font-size: 14px;"
		<div>集水器压力：
			<span class="label label-weather" onclick="clickHz(152,15);">
				<b id="152e15" name="15" value="15">0.0</b>MPa</span>
		</div>
	</div>
</body>
</html>
