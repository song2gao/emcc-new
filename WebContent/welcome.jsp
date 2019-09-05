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
		<base href="<%=basePath%>">

		<title>My JSP 'test.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<link rel="stylesheet" href="/emcc-new/css/themes/default/easyui.css">
		<script type="text/javascript" src="/emcc-new/js/jquery-1.8.2.min.js">
	
</script>
		<script type="text/javascript" src="/emcc-new/js/jquery.easyui.min.js">
	
</script>
		<style>
div {
	color: #ffffff;
	text-align: center;
}

div .title {
	width: 100%;
	height: 30%;
}

div.img {
	width: 100%;
	height: 70%;
}

img {
	
}

.sysmenu {
	background-color: #1f95ef;
	width: 20%;
	height: 30%;
	margin: 5px 5px;
	cursor: pointer;
	float: left;
	border: 1px solid #2c3240;
	padding: 0px 0px 0px 0px;
}
</style>
		<script>
	$(function() {
		$(".sysmenu").mouseover(function(e) {
			$(this).css("border", "1px solid #ffffff");
		});
		$(".sysmenu").mouseout(function(e) {
			$(this).css("border", "1px solid #2c3240");
		});
		$(".sysmenu").click(
				function(e) {
					var type = $(this).attr("url");
					if (type != undefined) {
						$.ajax( {
							url : "login/login?uname=admin&upwd=admin&type="
									+ type,
							dataType : "json",
							async : false,
							success : function(data) {
								var thisurl = window.location.href;
								var href = thisurl.substring(0, thisurl
										.lastIndexOf("/"));
								window.location.href = href + "/" + data.url
										+ ".jsp";
							}
						});
					}
				});
	});
</script>
	</head>
	<script>
	
</script>
	<body>
		<div style="width: 100%; height: 100%; background-color: #2c3240">
			<div style="padding: 3% 13%; font-size: 36px">
				智慧&middot;WESTAR能源服务中心
			</div>
			<div style="width: 70%; height: 70%; margin-left: 18%">
				<div style="width: 65%;height:100%;float:left">
					<div class="sysmenu" url="4" style="width:35%">
						<div class="img">
							<img src="image/login/yffxt.png" width="64" height="64" />
						</div>
						<div class="title">
							预付费系统
						</div>
					</div>
					<div class="sysmenu" style="width: 61%" url="5">
						<div class="img">
							<img src="image/login/nygkzx.png" width="64" height="64" />
						</div>
						<div class="title">
							能源管控中心
						</div>
					</div>
					<div class="sysmenu" style="width:50%" url="7">
						<div class="img">
							<img src="image/login/xtqx.png" width="64" height="64" />
						</div>
						<div class="title">
							权限管理系统
						</div>
					</div>
					<div class="sysmenu" style="width: 22%" url="2">
						<div class="img">
							<img src="image/login/dlxqc.png" width="64" height="64" />
						</div>
						<div class="title">
							电力需求侧平台
						</div>
					</div>
					<div class="sysmenu" url="10"
						style="width: 22%; background-color: #ff3999">
						<div class="img">
							<img src="image/login/gjxxgl.png" width="64" height="64" />
						</div>
						<div class="title">
							告警中心
						</div>
					</div>
					<div class="sysmenu" url="1" style="width: 35%;">
						<div class="img">
							<img src="image/login/sbyx.png" width="64" height="64" />
						</div>
						<div class="title">
							设备台账中心
						</div>
					</div>
					<div class="sysmenu" url="10"
						style="width: 61%;">
						<div class="img">
							<img src="image/login/ywyw.png" width="64" height="64" />
						</div>
						<div class="title">
							安防管理
						</div>
					</div>
				</div>
				<div style="width:35%;float:left;height:100%">
					<div class="sysmenu" style="width: 45%" url="6">
						<div class="img">
							<img src="image/login/ryxx.png" width="64" height="64" />
						</div>
						<div class="title">
							企业信息管理
						</div>
					</div>
					<div class="sysmenu" style="width: 45%">
						<div class="img">
							<img src="image/login/dlxx.png" width="64" height="64" />
						</div>
						<div class="title">
							BIM系统
						</div>
					</div>
					<div class="sysmenu" url="9" style="width: 93%; height: 63%">
						<div class="img">
							<img src="image/login/nygk.png" width="96" height="96"
								style="margin-top: 15%" />
						</div>
						<div class="title">
							节能控制系统
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
