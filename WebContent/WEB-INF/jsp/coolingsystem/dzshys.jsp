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
<title>北辰西站空调系统管理-中惠元景能耗监测平台</title>
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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/arrows.js"></script>
<!-- Le styles -->
<STYLE type="text/css">
body {
	background: url(/emcc-new/image/beichen/dzshys.jpg) no-repeat;
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
	<div
		style="position: absolute; top: 2%; margin-left: 50%; width: 50%; text-align: center; color: white;">
		<h3>东站低区生活热水</h3>
	</div>
	<div
		style="position: absolute; top: 30%; margin-left: 50%; width: 50%; text-align: center; color: white;">
		<h3>东站中区生活热水</h3>
	</div>
	<div
		style="position: absolute; top: 64%; margin-left: 50%; width: 50%; text-align: center; color: white;">
		<h3>东站高区生活热水</h3>
	</div>
	<div class="arrows-ver"
		style="position: absolute; top: 42%; height: 4%; width: 1%; right: 61.5%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/topcool.png"
			style="width: 100%; height: 80%" />
	</div>
	<div class="arrows-ver"
		style="position: absolute; top: 39.5%; height: 6%; width: 1%; right: 68.5%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/tophot.png"
			style="width: 100%; height: 60%" />
	</div>
	<div class="arrows-ver"
		style="position: absolute; top: 76%; height: 4%; width: 1%; right: 61.5%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/topcool.png"
			style="width: 100%; height: 80%" />
	</div>
	<div class="arrows-ver"
		style="position: absolute; top: 74%; height: 6%; width: 1%; right: 68.5%;border: 0px solid green;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/tophot.png"
			style="width: 100%; height: 50%" />
	</div>
	<div class="arrows-ver"
		style="position: absolute; top: 12%; height: 69%; width: 1%; right: 80.5%;border: 0px solid green;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/tophot.png"
			style="width: 100%; height: 7%" />
	</div>
	<div class="arrows-ver"
		style="position: absolute; top: 15.5%; height: 69%; width: 1%; right: 84%;border: 0px solid green;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/topcool.png"
			style="width: 100%; height: 7%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 15.2%; height: 2%; width: 20%; right: 78%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 12%; height: 80%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 40.5%; height: 2%; width: 7%; right: 78%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 25%; height: 80%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 56%; height: 2%; width: 7%; right: 78%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 25%; height: 80%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 74%; height: 2%; width: 7%; right: 78%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 25%; height: 80%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 85%; height: 2%; width: 20%; right: 78%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/righthot.png"
			style="width: 12%; height: 80%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 89.5%; height: 2%; width: 7%; right: 78%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 25%; height: 80%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 10.5%; height: 2%; width: 15%; right: 22%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/righthot.png"
			style="width: 12%; height: 80%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 15%; height: 2%; width: 15%; right: 22%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 12%; height: 80%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 22.5%; height: 2%; width: 15%; right: 22%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 12%; height: 80%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 36%; height: 2%; width: 15%; right: 22%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/righthot.png"
			style="width: 12%; height: 80%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 50.5%; height: 2%; width: 15%; right: 22%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 12%; height: 80%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 55.5%; height: 2%; width: 15%; right: 22%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 12%; height: 80%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 69.5%; height: 2%; width: 15%; right: 22%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/righthot.png"
			style="width: 12%; height: 80%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 84.5%; height: 2%; width: 15%; right: 22%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 12%; height: 80%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 88.9%;height: 2%; width: 15%; right: 22%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 12%; height: 80%" />
	</div>
	<!-- 温度压力 -->
	<div style="position: absolute; top: 5.5%; left: 18%; width: 30%; color: #E0EEE0; font-size: 14px;"
		<div>低供：
			<span class="label label-weather" onclick="clickHz(143,14);">
				<b id="143e14" name="14" value="14">0.0</b>℃</span>
		</div>
	</div>
	<div style="position: absolute; top: 7%; left: 41%; width: 30%; color: #E0EEE0; font-size: 14px;"
		<div>低供：
			<span class="label label-weather" onclick="clickHz(144,15);">
				<b id="144e15" value="15">0.0</b>MPa</span>
		</div>
	</div>
	<div style="position: absolute; top: 18%; left: 31%; width: 30%; color: #E0EEE0; font-size: 14px;"
		<div>低回：
			<span class="label label-weather" onclick="clickHz(145,15);">
				<b id="145e15" value="15">0.0</b>MPa</span>
		</div>
	</div>
	<div style="position: absolute; top: 30%; left: 20%; width: 30%; color: #E0EEE0; font-size: 14px;"
		<div>中1#供：
			<input type="hidden" id="142u" value="0"/>
			<input type="hidden" id="142d" value="0"/>
			<span class="label label-weather" onclick="clickHz(142,14);">
				<b id="142e14" value="14">0.0</b>℃</span>
		</div>
	
	<div style="position: absolute; top: 32%; left: 41%; width: 30%; color: #E0EEE0; font-size: 14px;"
		<div>中总供：
			<span class="label label-weather" onclick="clickHz(146,15);">
				<b id="146e15" value="15">0.0</b>MPa</span>
		</div>
	</div>
	<div style="position: absolute;top: 45%; left: 20%; width: 30%; color: #E0EEE0; font-size: 14px;"
		<div>中2#供：
			<span class="label label-weather" onclick="clickHz(141,14);">
				<b id="141e14" value="14">0.0</b>℃</span>
		</div>
	</div>
	<div style="position: absolute;top: 47%; left: 61%; width: 30%; color: #E0EEE0; font-size: 14px;"
		<div>中1#回：
			<span class="label label-weather" onclick="clickHz(147,15);">
				<b id="147e15" value="15">0.0</b>MPa</span>
		</div>
	</div>
	<div style="position: absolute; top: 57.5%; left: 61%; width: 30%; color: #E0EEE0; font-size: 14px; "
		<div>中2#回：
			<span class="label label-weather" onclick="clickHz(148,15);">
				<b id="148e15" value="15">0.0</b>MPa</span>
		</div>
	</div>
	<div style="position: absolute;  top: 63%; left: 20%; width: 30%; color: #E0EEE0; font-size: 14px;"
		<div>高1#供：
			<span class="label label-weather" onclick="clickHz(140,14);">
				<b id="140e14" value="14">0.0</b>℃</span>
		</div>
	</div>
	<div style="position: absolute;  top: 80%; left: 20%; width: 30%; color: #E0EEE0; font-size: 14px;"
		<div>高2#供：
			<span class="label label-weather" onclick="clickHz(139,14);">
				<b id="139e14" value="14">0.0</b>℃</span>
		</div>
	</div>
	<div style="position: absolute;top: 65%; left: 41%; width: 30%; color: #E0EEE0; font-size: 14px;"
		<div>高总供：
			<span class="label label-weather" onclick="clickHz(149,15);">
				<b id="149e15" value="15">0.0</b>MPa</span>
		</div>
	</div>
	<div style="position: absolute; top: 91%;left: 41%; width: 30%; color: #E0EEE0; font-size: 14px;"
		<div>高总回：
			<span class="label label-weather" onclick="clickHz(150,15);">
				<b id="150e15" value="15">0.0</b>MPa</span>
		</div>
	</div>
	<!-- 冷凝水 蒸汽-->
	<div style="position: absolute; top: 87%; right: 70%; width: 30%; color: #E0EEE0; font-size: 14px;"
		<div>蒸汽温度：
			<span class="label label-weather" onclick="">
				<b id="" name="" value=""></b>暂缺</span>
		</div>
	</div>
	<div style="position: absolute; top: 10%; right: 67%; width: 30%; color: #E0EEE0; font-size: 14px;"
		<div>冷凝水温度：
			<span class="label label-weather" onclick="">
				<b id="" name="" value=""></b>暂缺</span>
		</div>
	</div>
	<span onclick="" class="label label-weather"
		style="border: 0px solid red; position: absolute; top: 7%;left: 32%;">
		<b id="">2.2</b>kW(额定)
	</span>
	<span onclick="" class="label label-weather"
		style="border: 0px solid red; position: absolute; top: 44%;left: 41%;">
		<b id="">2.2</b>kW(额定)
	</span>
	<span onclick="" class="label label-weather"
		style="border: 0px solid red; position: absolute; top: 77%;left: 41%;">
		<b id="">2.2</b>kW(额定)
	</span>
</body>
</html>
