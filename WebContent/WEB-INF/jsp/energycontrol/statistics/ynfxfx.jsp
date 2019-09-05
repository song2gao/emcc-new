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
		<title>电力电耗查询-中惠元景能耗监测平台</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!-- Le styles -->
			<link rel="stylesheet" href="/emcc-web/css/monitor/monitor.css"
			type="text/css"></link>
		<link rel="stylesheet" type="text/css"
			href="/emcc-web/css/poms-business/themes/icon.css"></link>
		<link rel="stylesheet" type="text/css"
			href="/emcc-web/css/poms-business/themes/default/easyui.css"></link>

		<script type="text/javascript"
			src="/emcc-web/js/poms-business/jquery.easyui.min.js">
</script>
		<script type="text/javascript" src="/emcc-web/js/page.js">
</script>
		<script type="text/javascript" src="/emcc-web/js/poms-system/time.js">
</script>
		<script type="text/javascript"
			src="/emcc-web/js/poms-business/jsonToTime.js">
</script>
		<script type="text/javascript" src="/emcc-web/js/other.js">
</script>

		<!-- 选项卡 -->
		<link rel="stylesheet" href="css/htmleaf-demo.css">
		<script type="text/javascript" src="js/prefixfree.min.js">
</script>

		<!-- Le styles -->
		<link rel="stylesheet" href="assets/css/style.css">
		<link rel="stylesheet" href="assets/css/loader-style.css">
		<link rel="stylesheet" href="assets/css/bootstrap.css">
		<link rel="stylesheet" type="text/css"
			href="/emcc-web/css/poms-business/themes/default/easyui.css"></link>
		<link rel="stylesheet" type="text/css"
			href="/emcc-web/css/poms-business/themes/icon.css"></link>
		<link rel="stylesheet" href="assets/css/mail.css">
		<link rel="shortcut icon" href="assets/ico/minus.png">

		<script type="text/javascript" src="assets/js/jquery.js">
</script>
		<script type="text/javascript"
			src="/emcc-web/js/poms-system/jquery-1.7.2.js">
</script>
		<script type="text/javascript" src="/emcc-web/js/poms-system/time.js">
</script>
		<script type="text/javascript"
			src="/emcc-web/js/poms-business/jquery.easyui.min.js">
</script>


<style type="text/css">
/* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
	/* =========
		Get Fonts */
@import url(http://fonts.googleapis.com/css?family=Quicksand);

@import
	url(http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css)
	;

/* ================
		   Assign Variables */ /* ===========================
		   Setup Mixins/Helper Classes */
.clearfix:after,.container:after,.tab-nav:after {
	content: ".";
	display: block;
	height: 0;
	clear: both;
	visibility: hidden;
}

/* ==========
		   Setup Page */
*,*:before,*:after {
	box-sizing: border-box;
}

body {
	font-family: 'Quicksand', sans-serif;
}

/* =================
		   Container Styling */
.container {
	position: relative;
	background: #2C3240;
	padding: 0;
}

/* ===========
		   Tab Styling */
.tab-group {
	position: relative;
	border: 1px solid #eee;
	border-radius: 0 0 10px 10px;
}

.tab-group section {
	opacity: 0;
	height: 0;
	padding: 0 1em;
	overflow: hidden;
	transition: opacity 0.4s ease, height 0.4s ease;
}

.tab-group section.active {
	opacity: 1;
	height: auto;
	overflow: visible;
}

.tab-nav {
	list-style: none;
	margin: 0 -0 0 0;
	padding: 0;
	overflow: hidden;
}

.tab-nav li {
	display: inline;
}

.tab-nav li a {
	top: 1px;
	position: relative;
	display: block;
	float: left;
	border-radius: 10px 10px 0 0;
	background: #eee;
	line-height: 2.5em;
	padding: 0 2.5em;
	text-decoration: none;
	color: grey;
	margin-top: .5em;
	margin-right: 1px;
	transition: background .2s ease, line-height .2s ease, margin .2s ease;
}

.tab-nav li.active a {
	background: #6EB590;
	color: white;
	line-height: 2.5em;
	margin-top: 0;
}
</style>
		<script>
window.jQuery
		|| document.write('<script src="js/jquery-1.11.0.min.js"><\/script>')</script>
		<script type="text/javascript" src="js/jquery-tab.js">
</script>
		<script type="text/javascript">
$(function() {
	// Calling the plugin
	$('.tab-group').tabify();
})
</script>
		<script>
var locationId = "";
var eneryTypeCode = "";
var mmpInfoCode = new Array("31");
var flagInfo = 1;
var eneryName = "电能耗"; //能源名称
var unitInfo = "kWh";
var subitemflag = "1";
$(function() {
	getDateForIfram();
});
function getDateForIfram() {
	url = "toEneryGovernment.action?m=toGetFXPie";
	$("#dlxhpie").attr("src", url + "&grapflag=" + 1);
	$("#dfxhpie").attr("src", url + "&grapflag=" + 2);
	$("#ysytpie").attr("src", url + "&grapflag=" + 3);
	$("#ysxzpie").attr("src", url + "&grapflag=" + 4);
}
function GetClickData(node) {
	subitemflag = flag;
	locationName = node.text;
	locationId = node.id;
	getDateForIfram();
}
</script>


		<STYLE type="text/css">
.box-shadow-2 {
	-webkit-box-shadow: 0 0 10px #1d1f24;
	-moz-box-shadow: 0 0 10px #1d1f24;
	box-shadow: 0 0 10px #1d1f24;
}

table {
	width: 100%;
	border-collapse: separate;
	border-spacing: 0px 10px;
	font-family: 华文中宋;
	color: #FFFFFF;
}

table tr {
	border: 1px solid;
	margin: 4px 0; /*设置tr间距为2px*/
	height: 35px;
	padding: 0px;
	background: #383e54;
	font-size: 14px;
}

table tr td {
	width: 10%;
	text-align: center;
}

input {
	font-family: 华文中宋;
	color: black;
	font-size: 12;
}
</style>
	</head>

	<body>

		<!--  电力电耗查询 -->
		<div class="wrap-fluid">
			<div class="container-fluid paper-wrap bevel tlbr">
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
						<div class="col-sm-2 box-shadow-2" style="border: 0px solid yellow;margin-top: 1%;height: 97%;width: 15%;">
							<iframe src="/emcc-web/tree.jsp" width="100%" style="border: 0px"
								height="100%" scrolling="no" frameborder="1"></iframe>
						</div>
						<!-- 右板块 -->
						<div class="col-sm-10"
							style="float:left;width:85.0%;border: 0px solid red ;padding-left:10px;padding-right:5px;margin-top: 1%;height:97.2%;">
							<!--右边面板 -->
							<div class="container box-shadow-2"
								style="width: 100%; border: 0px solid blue; height: 100%">

								<div class="tab-group"
									style="width: 100%; border: 0px solid blue;">
									<section id="tab1" title="电耗分项显示">
											<div style="height: 48%; width: 100%; border: 0px solid red; ">
												<iframe style="height: 80%; width: 49%;" scrolling="no"
													frameborder="0" marginheight="0" id="dlxhpie"></iframe>
												<iframe style="height: 80%; width: 49%;" scrolling="no"
													frameborder="0" marginheight="0" id="dfxhpie"></iframe>
											
												<div class="col-xs-4 box-shadow-2"
													style="border: 0px solid red; margin-top: 4%; width: 48%; height: 100%;">
													<h4 class="text-left"
														style="font-size: 20px; color: #1F95EF; text-align: center;">
														用电性质分项
													</h4>
													<table>
														<tr>
															<td>
																照明插座
															</td>
															<td>
																12500KW
															</td>
														</tr>
														<tr>
															<td>
																动 力
															</td>
															<td>
																202541KW
															</td>
														</tr>
														<tr>
															<td>
																暖通空调
															</td>
															<td>
																351580KW
															</td>
														</tr>
														<tr>
															<td>
																特殊
															</td>
															<td>
																254510KW
															</td>
														</tr>
														<tr>
															<td>
																其它
															</td>
															<td>
																254510KW
															</td>
														</tr>
													</table>
												</div>
												<div class="col-xs-4 box-shadow-2"
													style="border: 0px solid red; margin-top: 4%; width: 48%; margin-left: 4%; height: 100%;">
													<!--内部导航 -->
													<h4 class="text-left"
														style="font-size: 20px; color: #1F95EF; text-align: center;">
														用电用途分项
													</h4>
													<table>
														<tr>
															<td>
																行 政
															</td>
															<td>
																112500KW
															</td>
														</tr>
														<tr>
															<td>
																办公
															</td>
															<td>
																202541KW
															</td>
														</tr>
														<tr>
															<td>
																科 研
															</td>
															<td>
																351580KW
															</td>
														</tr>
														<tr>
															<td>
																经 营
															</td>
															<td>
																254510KW
															</td>
														</tr>
														<tr>
															<td>
																其 它
															</td>
															<td>
																254510KW
															</td>
														</tr>
				
													</table>
												</div>
											</div>
									</section>
										<section id="tab2" title="水耗分项显示">
											<div style="height: 48%; width: 100%; border: 0px solid red; ">
												<iframe style="height: 80%; width: 49%;" scrolling="no"
													frameborder="0" marginheight="0" id="ysxzpie"></iframe>
												<iframe style="height: 80%; width: 49%;" scrolling="no"
													frameborder="0" marginheight="0" id="ysytpie"></iframe>
											
												<div class="col-xs-4 box-shadow-2"
													style="border: 0px solid red; margin-top: 4%; width: 48%; height: 100%;">
													<h4 class="text-left"
														style="font-size: 20px; color: #1F95EF; text-align: center;">
														用水性质分项
													</h4>
													<table>
																												<tr>
															<td>
																口腔科
															</td>
															<td>
																222500吨
															</td>
														</tr>
														<tr>
															<td>
															检验分析科	
															</td>
															<td>
																202541吨
															</td>
														</tr>
														<tr>
															<td>
																手术室
															</td>
															<td>
																351580吨
															</td>
														</tr>
														<tr>
															<td>
																消毒供应室
															</td>
															<td>
																254510吨
															</td>
														</tr>
														<tr>
															<td>
																其 它
															</td>
															<td>
																254510吨
															</td>
														</tr>
													</table>
												</div>
												<div class="col-xs-4 box-shadow-2"
													style="border: 0px solid red; margin-top: 4%; width: 48%; margin-left: 4%; height: 100%;">
													<!--内部导航 -->
													<h4 class="text-left"
														style="font-size: 20px; color: #1F95EF; text-align: center;">
														用水用途分项
													</h4>
													<table>
														<tr>
															<td>
																生活热水
															</td>
															<td>
																222500吨
															</td>
														</tr>
														<tr>
															<td>
																清洗用水
															</td>
															<td>
																202541吨
															</td>
														</tr>
														<tr>
															<td>
																消毒用水
															</td>
															<td>
																351580吨
															</td>
														</tr>
														<tr>
															<td>
																医疗设备
															</td>
															<td>
																254510吨
															</td>
														</tr>
														<tr>
															<td>
																其 它
															</td>
															<td>
																254510吨
															</td>
														</tr>
				
													</table>
												</div>
											</div>
									</section>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
