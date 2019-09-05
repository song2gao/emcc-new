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
		if (value == 1) {
			title = "一号主机";
		}
		if (value == 2) {
			title = "二号主机";
		}
		if (value == 3) {
			title = "三号主机";
		}
		layui
				.use(
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
										content : '<div class="layui-tab layui-tab-brief" style="border:0px solid red;height:95%;" lay-filter="docDemoTabBrief"><ul class="layui-tab-title">'
												+ '<li class="layui-this">运行参数</li><li>机型参数</li></ul>'
												+ '<div class="layui-tab-content" style="border:0px solid blue;height:90%;">'
												+ '<div class="layui-tab-item layui-show">'
												+ '<table class="layui-table" lay-size="sm" style="width:100%;">'
												+ '<colgroup><col width="30px"><col width="40px"></colgroup>'
												+ '<thead><tr><th>参数类别</th><th>参数值</th></tr></thead>'
												+ '<tbody><tr><td>冷冻水出水温度：</td><td>15.6℃</td></tr><tr><td>冷冻水回水温度：</td><td>15.6℃</td>'
												+ '</tr><tr><td>冷却水出水温度：</td><td>15.6℃</td></tr><tr><td>冷却水回水温度：</td><td>15.6℃</td>'
												+ '</tr><tr><td>总负荷率：</td><td>50%</td></tr><tr><td>制冷设定温度：</td><td>15.6℃</td>'
												+ '</tr></tbody></table>'
												+ '</div>'
												+ '<div class="layui-tab-item">'
												+ '<table class="layui-table" lay-size="sm" style="width:100%;">'
												+ '<colgroup><col width="20px"><col width="40px"></colgroup>'
												+ '<thead><tr><th>参数类别</th><th>参数值</th></tr></thead>'
												+ '<tbody><tr><td>制冷量：</td><td>2462kW</td></tr><tr><td>电源频率：</td><td>50</td>'
												+ '</tr><tr><td>产地：</td><td>上海</td></tr><tr><td>售后服务：</td><td>一年保修</td>'
												+ '</tr><tr><td>执行质量标准：</td><td>国标</td></tr><tr><td>冷暖类型：</td><td>单冷型</td>'
												+ '</tr><tr><td>品牌：</td><td>开立</td>'
												+ '</tr><tr><td>机组型号：</td><td>19XR5Q524R5LFH52</td></tr><tr><td>加工定制：</td><td>是</td>'
												+ '</tr><tr><td>空调技术：</td><td>定速</td></tr><tr><td>空调频率：</td><td>50（Hz）</td>'
												+ '</tr></tbody></table>'
												+ '</div>'
												+ '</div></div>'
												+ '',
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
	background: url(/emcc-new/image/beichen/spjk.png) no-repeat;
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
</body>
</html>
