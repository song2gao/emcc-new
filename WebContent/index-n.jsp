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
	margin-top:5%;
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
	margin: 3% 5%;
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
	var i=1;
	$(function(){
			//window.setInterval(changeImg, 2000); 
	});
	function changeImg(){
		if(i==1){
			$("#pic").attr("src","${pageContext.request.contextPath}/assets/img/2.jpg");
			i=2;
		}else if(i==2){
			$("#pic").attr("src","${pageContext.request.contextPath}/assets/img/3.jpg");
			i=3;
		}else{
			$("#pic").attr("src","${pageContext.request.contextPath}/assets/img/1.jpg");
			i=1;
		}
	}
</script>
	<body>
		<div style="width: 100%; height: 100%; background-color: #2c3240">
			<div style="padding: 1% 30%; font-size: 36px">
				章丘人民医院&middot;节能监测平台
			</div>
			<div style="width: 100%; height: 70%;float:left">
				<img id="pic" style="width: 100%; height: 100%"
					src="${pageContext.request.contextPath}/assets/img/timg.jpg" />
			</div>
			<div style="width: 100%; height: 20%;">
				<div style="float: left; height: 70%;width: 60%">
					<p>
						  章丘区人民医院建于1950年6月，是集医疗、教学、科研、预防保健、急救和管理指导于一体的三级综合性医院，济南市第六人民医院、济南东部区域医疗中心、济宁医学院附属医院。    近年来，医院先后荣获“国际爱婴医院”、“全国百姓放心示范医院”、“全国县市医院优秀院长单位”、“全国模范职工之家”、“全国诚信示范医院”、 “山东省卫生保健协会诚信医院” 等荣誉称号。
					</p>
				</div>
				<div style="float:left;width:40%;">
						<div class="sysmenu" url="2" style="width: 93%; height: 63%">
						<div class="title">
							进入系统
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
