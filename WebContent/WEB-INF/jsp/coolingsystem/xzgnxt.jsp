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
<title>北辰亚运村西热力站系统管理-中惠元景能耗监测平台</title>
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
	background: url(/emcc-new/image/beichen/xzgn.jpg) no-repeat;
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
		style="border: 0px solid red; top: 1%;width: 90%; margin-left: 5%; text-align: center; color: white;">
		<h2>北辰亚运村西热力站供暖系统(上65℃下95℃)</h2>
	</div>
	<!-- 65 -->
	<div class="arrows-acr"
		style="position: absolute; top: 9.3%; height: 2%; width: 17%; right: 52%;border: 0px solid green;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/righthot.png"
			style="width: 13%; height: 70%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 14.1%; height: 2%; width: 17%; right: 52%;border: 0px solid green;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 13%; height: 70%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 27.1%; height: 2%; width: 17%; right: 52%;border: 0px solid green;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/righthot.png"
			style="width: 13%; height: 70%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 32.7%; height: 2%; width: 15%; right: 54%;border: 0px solid green;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 15%; height: 78%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 54.3%; height: 2%; width: 15%; right: 54%;border: 0px solid green;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 15%; height: 78%" />
	</div>
		<div class="arrows-ver"
		style="position: absolute; top: 18%; height: 8%; width: 1%; right: 48.4%;border: 0px solid red;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/topcool.png"
			style="width: 90%; height: 45%" />
	</div>
	<div class="arrows-ver"
		style="position: absolute; top: 13%; height: 4%; width: 1%; right: 38.4%;border: 0px solid red;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/downhot.png"
			style="width: 90%; height: 50%" />
	</div>
	<div class="arrows-ver"
		style="position: absolute; top: 19.5%; height: 4%; width: 1%; right: 38.4%;border: 0px solid red;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/tophot.png"
			style="width: 90%; height: 50%" />
	</div>
	
	<div class="arrows-ver"
		style="position: absolute; top: 53%; height: 8%; width: 1%; right: 38.4%;border: 0px solid red;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/downhot.png"
			style="width: 90%; height: 40%" />
	</div>
	<div class="arrows-ver"
		style="position: absolute; top: 69%; height: 8%; width: 1%; right: 38.4%;border: 0px solid red;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/tophot.png"
			style="width: 90%; height: 40%" />
	</div>
	<!-- 95 -->
	<%-- <div class="arrows-acr"
		style="position: absolute; top: 96%; height: 2%; width: 62%; right: 9%;border: 1px solid red;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 20%; height: 80%" />
	</div> --%>
	<div class="arrows-acr"
		style="position: absolute; top: 87.2%; height: 2%; width: 15%; right: 54%;border: 0px solid red;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 15%; height: 78%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 70.8%; height: 2%; width: 15%; right: 54%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 15%; height: 78%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 82.5%; height: 2%; width: 17%; right: 54%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/righthot.png"
			style="width: 13%; height: 70%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 66%; height: 2%; width: 17%; right: 54%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/righthot.png"
			style="width: 13%; height: 70%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 49.5%; height: 2%; width: 17%; right: 54%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/righthot.png"
			style="width: 13%; height: 70%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 66%; height: 2%; width: 17%; right: 17%;border: 0px solid red;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/righthot.png"
			style="width: 13%; height: 75%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 87.2%; height: 2%; width: 17%; right: 17%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 13%; height: 75%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 32.65%; height: 2%; width: 17%; right: 17%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 13%; height: 75%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 18.8%; height: 2%; width: 8%; right: 30%;border: 0px solid red;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/righthot.png"
			style="width: 22%; height: 70%" />
	</div>
		<div class="arrows-ver"
		style="position: absolute; top: 58%; height: 6%; width: 1%; right: 48.5%;border: 0px solid red;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/topcool.png"
			style="width: 100%; height:60%" />
	</div>
	<div class="arrows-ver"
		style="position: absolute; top: 75%; height: 6%; width: 1%; right: 48.5%;border: 0px solid red;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/topcool.png"
			style="width: 100%; height: 60%" />
	</div>
	<!-- 蒸汽 -->
	<div class="arrows-acr"
		style="position: absolute; top: 87.2%; height: 2%; width: 7%; right: 77%;border: 0px solid red;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 35%; height: 70%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 70.8%; height: 2%; width: 7%; right: 77%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 35%; height: 70%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 54.2%; height: 2%; width: 7%; right: 77%;border: 0px solid red;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 35%; height: 70%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 32.8%; height: 2%; width: 7%; right: 77%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 35%; height: 70%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 14%; height: 2%; width: 22%; right: 77%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/leftcool.png"
			style="width: 10%; height: 70%" />
	</div>
	<div class="arrows-acr"
		style="position: absolute; top: 82.5%; height: 2%; width: 20%; right: 77%;">
		<img id="thb"
			src="${pageContext.request.contextPath}/assets/img/righthot.png"
			style="width: 10%; height: 70%" />
	</div>
	<div style="position: absolute; top: 15%; right: 18%; width: 20%; color: #E0EEE0; font-size: 14px;"
		<div>总供：
			<span class="label label-weather" onclick="clickHz(175,15);">
				<b id="175e15" value="15">0.0</b>MPa</span>
		</div>
	</div>
	<div style="position: absolute; top: 6%; right: 8%; width: 20%; color: #E0EEE0; font-size: 14px;"
		<div>公寓供：
			<span class="label label-weather" onclick="clickHz('00919253',204);">
				<b id="00919253e204" value="204">0.0</b>℃</span>
		</div>
	</div>
		<div style="position: absolute; top: 22%; right: 6%; width: 20%; color: #E0EEE0; font-size: 14px;"
		<div>汇宾供：
			<span class="label label-weather" onclick="clickHz('00919241',204);">
				<b id="00919241e204" value="204">0.0</b>℃</span>
		</div>
	</div>
	<div style="position: absolute; top: 35%; right: 25%; width: 20%; color: #E0EEE0; font-size: 14px;"
		<div>总回：
			<span class="label label-weather" onclick="clickHz(176,15);">
				<b id="176e15" value="15">0.0</b>MPa</span>
		</div>
	</div>
	<div style="position: absolute; top: 29%; right: 8%; width: 20%; color: #E0EEE0; font-size: 14px;"
		<div>公寓回：
			<span class="label label-weather" onclick="clickHz('00919253',205);">
				<b id="00919253e205" value="205">0.0</b>℃</span>
		</div>
	</div>
		<div style="position: absolute; top: 35%; right: 8%; width: 20%; color: #E0EEE0; font-size: 14px;"
		<div>汇宾回：
			<span class="label label-weather" onclick="clickHz('00919241',205);">
				<b id="00919241e205" value="205">0.0</b>℃</span>
		</div>
	</div>
	<div style="position: absolute; top: 62%; right: 10%; width: 20%; color: #E0EEE0; font-size: 14px;"
		<div>95℃总供：
			<span class="label label-weather" onclick="clickHz(177,15);">
				<b id="177e15" value="15">0.0</b>MPa</span>
		</div>
	</div>
	<div style="position: absolute; top: 68%; right: 10%; width: 20%; color: #E0EEE0; font-size: 14px;"
		<div>95℃总供：
			<span class="label label-weather" onclick="clickHz('68373083',204);">
				<b id="68373083e204" value="204">0.0</b>℃</span>
		</div>
	</div>
	<div style="position: absolute; top: 83%; right: 10%; width: 20%; color: #E0EEE0; font-size: 14px;"
		<div>95℃总回：
			<span class="label label-weather" onclick="clickHz(178,15);">
				<b id="178e15" value="15">0.0</b>MPa</span>
		</div>
	</div>
	<div style="position: absolute; top: 90%; right: 10%; width: 20%; color: #E0EEE0; font-size: 14px;"
		<div>95℃总回：
			<span class="label label-weather" onclick="clickHz('68373083',205);">
				<b id="68373083e205" value="205">0.0</b>℃</span>
		</div>
	</div>
	<div class="arrows-ver" style="position: absolute; top: 11%; height: 60%; width: 1.1%; right: 79.2%;border: 0px solid blue;">
		<img id="thb" src="/emcc-new/assets/img/tophot.png" style="width: 80%; height: 8%; margin-top: 34.6342px;">
	</div>
	<div class="arrows-ver" style="position: absolute; top: 20%; height: 60%; width: 1.1%; right: 83.2%;border: 0px solid blue;">
		<img id="thb" src="/emcc-new/assets/img/topcool.png" style="width: 80%; height: 8%; margin-top: 34.6342px;">
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
		style="border: 0px solid red; position: absolute; top: 11%;left: 24%;">
		<b id="">65℃</b>1#
	</span>
	<span onclick="" class="label label-weather"
		style="border: 0px solid red; position: absolute; top: 28%;left: 24%;">
		<b id="">65℃</b>2#
	</span>
	<span onclick="" class="label label-weather"
		style="border: 0px solid red; position: absolute; top: 50%;left: 24%;">
		<b id="">95℃</b>1#
	</span>
	<span onclick="" class="label label-weather"
		style="border: 0px solid red; position: absolute; top: 67%;left: 24%;">
		<b id="">95℃</b>2#
	</span>
	<span onclick="" class="label label-weather"
		style="border: 0px solid red; position: absolute; top: 83%;left: 24%;">
		<b id="">95℃</b>3#
	</span>
	<span onclick="" class="label label-weather"
		style="border: 0px solid red; position: absolute; top: 11%;left: 50%;">
		<b id="">75</b>kW(额定功率)
	</span>
	<span onclick="" class="label label-weather"
		style="border: 0px solid red; position: absolute; top: 30%;left: 52%;">
		<b id="">75</b>kW(额定功率)
	</span>
	<span onclick="" class="label label-weather"
		style="border: 0px solid red; position: absolute; top: 41%;left: 52%;">
		<b id="">75</b>kW(额定功率)
	</span>
	<span onclick="" class="label label-weather"
		style="border: 0px solid red; position: absolute; top: 58%;left: 52%;">
		<b id="">75</b>kW(额定功率)
	</span>
	<span onclick="" class="label label-weather"
		style="border: 0px solid red; position: absolute; top: 75%;left: 52%;">
		<b id="">75</b>kW(额定功率)
	</span>
</body>
</html>
