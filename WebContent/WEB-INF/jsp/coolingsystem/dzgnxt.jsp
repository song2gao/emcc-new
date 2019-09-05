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
<title>北辰亚运村东热力站系统管理-中惠元景能耗监测平台</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" href="/emcc-new/assets/css/style.css">
<link rel="stylesheet" href="/emcc-new/assets/css/loader-style.css">
<link rel="stylesheet" href="/emcc-new/assets/css/bootstrap.css">
<link rel="shortcut icon" href="/emcc-new/assets/ico/minus.png">
<link rel="stylesheet" href="/emcc-new/js/layui/css/layui.css">
<script type="text/javascript" src="/emcc-new/js/layui/layui.all.js"></script>
<script type="text/javascript" src="/emcc-new/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/coolsystem/realdata.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/coolsystem/alarm.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/arrows.js"></script>
<link href="/emcc-new/assets/js/tabs/acc-wizard.min.css"
	rel="stylesheet">

<!-- Le styles -->
<STYLE type="text/css">
body {
	background: url(/emcc-new/image/beichen/dzgn.jpg) no-repeat;
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
		style="border: 0px solid red; margin-top: 1%; width: 90%; text-align: center; color: white;">
		<h2>北辰亚运村东热力站供暖系统图(上65℃下95℃)</h2>
	</div>
	<!-- <span class="layui-btn layui-btn-radius" disabled="disabled" name=""
		style="border: 0px solid red; position: absolute; top: 3%; right: 3%;">
		主机效率值：0.8</span> -->
	<div class="arrows-ver"
		style="position: absolute; top: 44.7%; height: 6%; width: 1.1%; right: 46.58%;border: 0px solid red; ">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/tophot.png"
			style="width: 80%; height: 60%" />
	</div>
	<!-- class="arrows-ver" -->
	<div class="arrows-ver"
		style="position: absolute; top: 20.5%; height: 6%; width: 1%; right: 56.65%;border:0px solid red;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/topcool.png"
			style="width: 80%; height: 60%" />
	</div>
	<div class="arrows-ver"
		style="position: absolute; top: 78%; height: 6%; width: 1.1%; right: 46.65%;border: 0px solid red;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/topcool.png"
			style="width: 80%; height: 60%" />
	</div>
	<div class="arrows-ver"
		style="position: absolute; top: 73%; height: 6%; width: 1.1%; right: 56.78%;border: 0px solid blue;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/tophot.png"
			style="width: 80%; height: 60%" />
	</div>
	<!-- 蒸汽箭头 --><!-- class="arrows-acr" -->
	<div class="arrows-acr"
		style="position: absolute; top: 18.2%; height: 2%; width: 20%; right: 80%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 10%; height: 70%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 18.2%; height: 2%; width: 12%; right: 61.5%;border: 0px solid green;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 18%; height: 70%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 31.5%; height: 2%; width: 8%; right: 80%;border: 0px solid green;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 25%; height: 70%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 31.5%; height: 2%; width: 12%; right: 61.5%;border: 0px solid green;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 18%; height: 70%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 27.3%; height: 2%; width: 12%; right: 61.5%;border: 0px solid green;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/righthot.png"
			style="width: 18%; height: 70%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 41.9%; height: 2%; width: 12%; right: 61.5%;border: 0px solid red;" >
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/righthot.png"
			style="width: 18%; height: 70%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 46.8%; height: 2%; width: 8%; right: 80%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 25%; height: 70%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 46.7%; height: 2%; width: 12%; right: 61.5%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 18%; height: 70%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 54%; height: 2%; width: 12%; right: 61.5%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/righthot.png"
			style="width: 18%; height: 70%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 58.8%; height: 2%; width: 8%; right: 80%;border: 0px solid red;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 25%; height: 70%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 58.8%; height: 2%; width: 12%; right: 61.5%;border: 0px solid red;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 18%; height: 70%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 69.8%; height: 2%; width: 12%; right: 61.5%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/righthot.png"
			style="width: 18%; height: 70%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 74%; height: 2%; width: 8%; right: 80%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 25%; height: 70%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 74%; height: 2%; width: 12%; right: 61.5%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 18%; height: 70%" />
	</div>
	
	
	
	<div class="arrows-acr"
		style="position: absolute; top: 85%; height: 2%; width: 20%; right: 80%;border: 0px solid green;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/righthot.png"
			style="width: 10%; height: 70%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 85%; height: 2%; width: 12%; right: 61.5%;border: 0px solid green;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/righthot.png"
			style="width: 18%; height: 70%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 89.6%; height: 2%; width: 8%; right: 80%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 25%; height: 70%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 89.6%; height: 2%; width: 12%; right: 61.5%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 18%; height: 70%" />
	</div>
	<!-- 供回水箭头 -->
	<div class="arrows-acr"
		style="position: absolute; top: 13.5%; height: 2%; width: 6.5%; right: 30%;border: 0px solid green;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/righthot.png"
			style="width: 35%; height: 75%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 31.3%; height: 2%; width: 6.5%; right: 30.5%;border: 0px solid green;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 35%; height: 75%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 41.8%; height: 2%; width: 12%; right: 24%;border: 0px solid green;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/righthot.png"
			style="width: 18%; height: 75%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 58.7%; height: 2%; width: 12%; right: 24%;border: 0px solid green;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 18%; height: 75%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 69.7%; height: 2%; width: 12%; right: 24%;border: 0px solid green;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/righthot.png"
			style="width: 18%; height: 75%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 89.3%; height: 2%; width: 12%; right: 24%;border: 0px solid green;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 18%; height: 75%" />
	</div>
<%-- 	<div class="arrows-acr"
		style="position: absolute; top: 58%; height: 2%; width: 21%; right: 53%;border: 1px solid green;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/righthot.png"
			style="width: 20%; height: 80%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 63%; height: 2%; width: 60%; right: 13%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 10%; height: 100%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 71%; height: 2%; width: 63%; right: 10%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/righthot.png"
			style="width: 10%; height: 100%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 75%; height: 2%; width: 28%; right: 46%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 10%; height: 100%" />
	</div> 
	<div class="arrows-acr"
		style="position: absolute; top: 90.5%; height: 2%; width: 63%; right: 10%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 10%; height: 100%" />
	</div> --%>
	<!-- 分水器 -->
	<div class="arrows-acr"
		style="position: absolute; top: 6.9%; height: 2%; width: 5%; right: 18%;border: 0px solid green;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/righthot.png"
			style="width: 43%; height: 75%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 9.9%; height: 2%; width: 5%; right: 18%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/righthot.png"
			style="width: 43%; height: 75%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 12.9%; height: 2%; width: 5%; right: 18%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/righthot.png"
			style="width: 43%; height: 75%" />
	</div>
	<!--集水器-->
	<div class="arrows-acr"
		style="position: absolute; top: 24.2%; height: 2%; width: 5%; right: 18%;border: 0px solid green;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 43%; height: 75%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 27.2%; height: 2%; width: 5%; right: 18%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 43%; height: 75%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 30.2%; height: 2%; width: 5%; right: 18%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 43%; height: 75%" />
	</div>
	<div style="position: absolute; top: 9.8%; right: 43%; width: 30%; color: #E0EEE0; font-size: 14px;"
		<div>1#65℃供水温度：
			<span class="label label-weather" onclick="clickHz(107,14);">
				<b id="107e14" name="14" value="14">0.0</b>℃</span>
		</div>
	</div>
	<div style="position: absolute; top: 23%; right: 43%; width: 30%; color: #E0EEE0; font-size: 14px;"
		<div>2#65℃供水温度：
			<span class="label label-weather" onclick="clickHz(108,14);">
				<b id="108e14" name="14" value="14">0.0</b>℃</span>
		</div>
	</div>
	<div style="position: absolute; top: 38%; right: 43%; width: 30%; color: #E0EEE0; font-size: 14px;"
		<div>3#65℃供水温度：
			<span class="label label-weather" onclick="clickHz(109,14);">
				<b id="109e14" name="14" value="14">0.0</b>℃</span>
		</div>
	</div>
	<div style="position: absolute; top: 50%; right: 43%; width: 30%; color: #E0EEE0; font-size: 14px;"
		<div>4#65℃供水温度：
			<span class="label label-weather" onclick="clickHz(110,14);">
				<b id="110e14" name="14" value="14">0.0</b>℃</span>
		</div>
	</div>
	<div style="position: absolute; top: 66%; right: 43%; width: 30%; color: #E0EEE0; font-size: 14px;"
		<div>1#95℃供水温度：
			<span class="label label-weather" onclick="clickHz(104,14);">
				<b id="104e14" name="14" value="14">0.0</b>℃</span>
		</div>
	</div>
	<div style="position: absolute; top: 81%; right: 43%; width: 30%; color: #E0EEE0; font-size: 14px;"
		<div>2#95℃供水温度：
			<span class="label label-weather" onclick="clickHz(105,14);">
				<b id="105e14" name="14" value="14">0.0</b>℃</span>
		</div>
	</div>
		<div style="position: absolute; top: 2%; right: 9%; width: 20%; color: #E0EEE0; font-size: 14px;"
		<div>分水器压力：
			<span class="label label-weather" onclick="clickHz(151,15);">
				<b id="151e15" value="15">0.0</b>MPa</span>
		</div>
	</div>
	<div style="position: absolute; top: 19%; right: 9%; width: 20%; color: #E0EEE0; font-size: 14px;"
		<div>集水器压力：
			<span class="label label-weather" onclick="clickHz(152,15);">
				<b id="152e15" value="15">0.0</b>MPa</span>
		</div>
	</div>
	<div style="position: absolute; top: 72.3%; right: 1%; width: 30%; color: #E0EEE0; font-size: 14px;"
		<div>95℃供水压力：
			<span class="label label-weather" onclick="clickHz(106,15);">
				<b id="106e15" value="15">0.0</b>MPa</span>
		</div>
	</div>
	<div style="position: absolute; top: 85%; right: 1%; width: 30%; color: #E0EEE0; font-size: 14px;"
		<div>95℃回水压力：
			<span class="label label-weather" onclick="clickHz(138,15);">
				<b id="138e15" value="15">0.0</b>MPa</span>
		</div>
	</div>
	<div class="arrows-ver" style="position: absolute; top: 15%; height: 60%; width: 1.1%; right: 81.5%;border: 0px solid blue;">
		<img id="thb" src="/emcc-new/assets/img/tophot.png" style="width: 80%; height: 8%; margin-top: 34.6342px;">
	</div>
	<div class="arrows-ver" style="position: absolute; top: 19%; height: 60%; width: 1.1%; right: 87.5%;border: 0px solid blue;">
		<img id="thb" src="/emcc-new/assets/img/topcool.png" style="width: 80%; height: 8%; margin-top: 34.6342px;">
	</div>
	<!-- 冷凝水 蒸汽-->
	<div style="position: absolute; top: 88%; right: 70%; width: 30%; color: #E0EEE0; font-size: 14px;"
		<div>蒸汽温度：
			<span class="label label-weather" onclick="">
				<b id="" name="" value=""></b>暂缺</span>
		</div>
	</div>
	<div style="position: absolute; top: 14%; right: 67%; width: 30%; color: #E0EEE0; font-size: 14px;"
		<div>冷凝水温度：
			<span class="label label-weather" onclick="">
				<b id="" name="" value=""></b>暂缺</span>
		</div>
	</div>
	<span onclick="" class="label label-weather"
		style="border: 0px solid red; position: absolute; top: 24%;left: 56%;">
		<b id="131">55</b>kW(额定功率)
	</span>
	<span onclick="" class="label label-weather"
		style="border: 0px solid red; position: absolute; top: 51%;left: 56%;">
		<b id="131">30</b>kW(额定功率)
	</span>
	<span onclick="" class="label label-weather"
		style="border: 0px solid red; position: absolute; top: 81%;left: 56%;">
		<b id="131">30</b>kW(额定功率)
	</span>
</body>
</html>
