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
	background: url(/emcc-new/image/beichen/xzshys.jpg) no-repeat;
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
<script type="text/javascript">
	
</script>
</head>
<body style="border: 0px solid red;">
	<!-- 空调系统管理 -->
	<div
		style="position: absolute; top: 5%; margin-left: 52%; width: 50%; text-align: center; color: white;">
		<h3>西站低区生活用水</h3>
	</div>
	<div
		style="position: absolute; top: 51.5%; margin-left: 52%; width: 50%; text-align: center; color: white;">
		<h3>西站高区生活用水</h3>
	</div>
	<div class="arrows-ver"
		style="position: absolute; top: 18%; height: 15%; width: 1%; right: 62.8%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/topcool.png"
			style="width: 100%; height: 25%" />
	</div>
	<div class="arrows-ver"
		style="position: absolute; top: 13%; height: 15%; width: 1%; right: 67.5%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/tophot.png"
			style="width: 100%; height: 25%" />
	</div>
	<div class="arrows-ver"
		style="position: absolute; top: 65%; height: 15%; width: 1%; right: 62.8%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/topcool.png"
			style="width: 100%; height: 25%" />
	</div>
	<div class="arrows-ver"
		style="position: absolute; top: 61%; height: 15%; width: 1%; right: 67.5%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/tophot.png"
			style="width: 100%; height: 25%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 15%; height: 2%; width: 20%; right: 78%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 10%; height: 70%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 27.5%; height: 2%; width: 7%; right: 78%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 25%; height: 70%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 39%; height: 2%; width: 7%; right: 78%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 25%; height: 70%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 60.2%; height: 2%; width: 7%; right: 78%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 25%; height: 70%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 72.8%; height: 2%; width: 7%; right: 78%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 25%; height: 70%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 80%; height: 2%; width: 20%; right: 78%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/righthot.png"
			style="width: 10%; height: 70%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 84%; height: 2%; width: 7%; right: 78%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 25%; height: 70%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 11%; height: 2%; width: 15%; right: 17%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/righthot.png"
			style="width: 13%; height: 70%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 38.5%; height: 2%; width: 15%; right: 17%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 13%; height: 70%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 44.7%; height: 2%; width: 15%; right: 17%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 13%; height: 70%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 56.2%; height: 2%; width: 15%; right: 20%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/righthot.png"
			style="width: 13%; height: 70%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 84%; height: 2%; width: 15%; right: 20%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 13%; height: 70%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 90.1%; height: 2%; width: 15%; right: 20%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 13%; height: 70%" />
	</div>
	<!-- 温度压力 -->
	<div style="position: absolute; top: 7%; right: 50%; width: 30%; color: #E0EEE0; font-size: 14px;"
		<div>低1#供：
			<span class="label label-weather" onclick="clickHz(192,14);">
				<b id="192e14" name="14" value="14">0.0</b>℃</span>
		</div>
	</div>
	<div style="position: absolute; top: 18.5%; right: 50%; width: 30%; color: #E0EEE0; font-size: 14px;"
		<div>低2#供：
			<span class="label label-weather" onclick="clickHz(193,14);">
				<b id="193e14" name="14" value="14">0.0</b>℃</span>
		</div>
	</div>
	<div style="position: absolute; top: 30.5%; right: 50%; width: 30%; color: #E0EEE0; font-size: 14px;"
		<div>低3#供：
			<span class="label label-weather" onclick="clickHz(194,14);">
				<b id="194e14" name="14" value="14">0.0</b>℃</span>
		</div>
	</div>
	<div style="position: absolute; top: 50%; right: 50%; width: 30%; color: #E0EEE0; font-size: 14px;"
		<div>高1#供：
			<span class="label label-weather" onclick="clickHz(195,14);">
				<b id="195e14" name="14" value="14">0.0</b>℃</span>
		</div>
	</div>
	<div style="position: absolute; top: 64%; right: 50%; width: 30%; color: #E0EEE0; font-size: 14px;"
		<div>高2#供：
			<span class="label label-weather" onclick="clickHz(196,14);">
				<b id="196e14" name="14" value="14">0.0</b>℃</span>
		</div>
	</div>
	<div style="position: absolute; top: 89%; right: 50%; width: 30%; color: #E0EEE0; font-size: 14px;"
		<div>高3#供：
			<span class="label label-weather" onclick="clickHz(197,14);">
				<b id="197e14" name="14" value="14">0.0</b>℃</span>
		</div>
	</div>
	<div style="position: absolute; top: 14%; right: 15%; width: 30%; color: #E0EEE0; font-size: 14px;"
		<div>低总供：
			<span class="label label-weather" onclick="clickHz(172,15);">
				<b id="172e15" value="15">0.0</b>MPa</span>
		</div>
	</div>
	<div style="position: absolute; top: 35%; right: 15%; width: 30%; color: #E0EEE0; font-size: 14px;"
		<div>低公寓回：
			<span class="label label-weather" onclick="clickHz(173,15);">
				<b id="173e15" value="15">0.0</b>MPa</span>
		</div>
	</div>
	<div style="position: absolute; top: 41%; right: 15%; width: 30%; color: #E0EEE0; font-size: 14px;"
		<div>低汇宾回：
			<span class="label label-weather" onclick="clickHz(174,15);">
				<b id="174e15" value="15">0.0</b>MPa</span>
		</div>
	</div>
	<div style="position: absolute; top: 59%; right: 15%; width: 30%; color: #E0EEE0; font-size: 14px;"
		<div>高总供：
			<span class="label label-weather" onclick="clickHz(169,15);">
				<b id="169e15" value="15">0.0</b>MPa</span>
		</div>
	</div>
	<div style="position: absolute; top: 80%; right: 15%; width: 30%; color: #E0EEE0; font-size: 14px;"
		<div>高汇宾回：
			<span class="label label-weather" onclick="clickHz(170,15);">
				<b id="170e15" value="15">0.0</b>MPa</span>
		</div>
	</div>
	<div style="position: absolute; top: 86.2%; right: 15%; width: 30%; color: #E0EEE0; font-size: 14px;"
		<div>高公寓回：
			<span class="label label-weather" onclick="clickHz(171,15);">
				<b id="171e15" value="15">0.0</b>MPa</span>
		</div>
	</div>
	<!-- 冷凝水 蒸汽-->
	<div style="position: absolute; top: 85%; right: 70%; width: 30%; color: #E0EEE0; font-size: 14px;"
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
		style="border: 0px solid red; position: absolute; top: 28%;left: 43%;">
		<b id="">2.2</b>kW(额定)
	</span>
	<span onclick="" class="label label-weather"
		style="border: 0px solid red; position: absolute; top: 75%;left: 43%;">
		<b id="">2.2</b>kW(额定)
	</span>
	<div class="arrows-ver"
		style="position: absolute; top: 12%; height: 65%; width: 1%; right: 79.5%;border: 0px solid green;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/tophot.png"
			style="width: 100%; height: 7%" />
	</div>
	<div class="arrows-ver"
		style="position: absolute; top: 15.5%; height: 65%; width: 1%; right: 83.7%;border: 0px solid green;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/topcool.png"
			style="width: 100%; height: 7%" />
	</div>
</body>
</html>
