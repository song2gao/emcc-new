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
		<title>环境参数监测-中惠元景能耗监测平台</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!-- Le styles -->
		<link rel="stylesheet" href="/emcc-new/assets/css/style.css">
		<link rel="stylesheet" href="/emcc-new/assets/css/loader-style.css">
		<link rel="stylesheet" href="/emcc-new/assets/css/bootstrap.css">
		<link rel="stylesheet" type="text/css"
			href="/emcc-new/css/themes/default/easyui.css">
		<link rel="stylesheet" href="/emcc-new/assets/css/mail.css">
		<link rel="shortcut icon" href="/emcc-new/assets/ico/minus.png">
		<link rel="stylesheet" type="text/css" href="/emcc-new/css/zzsc.css">
		<script type="text/javascript"
			src="/emcc-new/js/tabjs/jquery-1.8.2.min.js"></script>
		<script defer="" src="/emcc-new/js/tabjs/slider.js"></script>
		<script type="text/javascript">
	$(function() {
		$('.flexslider').flexslider( {
			animation : "slide",
			start : function(slider) {
				$('body').removeClass('loading');
			}
		});
	});
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
	function dataObject() {
		var args = {};
		var flag = subitemflag;
		eneryTypeCode = "31";
		unitInfo = "kWh";

		args.flag = flagInfo;
		args.energyCode = eneryTypeCode;
		args.mmpCode = mmpInfoCode;
		args.dateCode = "2017-05-21";
		args.dateCode1 = "2017-05-20";
		args.locationId = locationId;
		args.index = "ri";
		args.eneryName = eneryName;
		args.unitInfo = unitInfo;
		return args;
	}
	function getDateForIfram() {
		var args = dataObject();
		var flag = args.flag;
		var energyCode = args.energyCode;
		var dateCode = args.dateCode;
		var mmpCode = mmpInfoCode;
		var locationId = args.locationId
		var index = args.index;
		var eneryName1 = encodeURI(args.eneryName);
		var unitInfo1 = encodeURI(args.unitInfo);
		var url = "toEneryGovernment.action?m=toDLDHFX&flag=" + flag
				+ "&energyCode=" + energyCode + "&dateCode=" + dateCode
				+ "&dateCode1=" + args.dateCode1 + "&mmpCode=" + mmpCode
				+ "&locationId=" + locationId + "&index=" + index
				+ "&eneryName=" + eneryName1 + "&unitInfo=" + unitInfo1;
		$("#dlxhqs").attr("src", url + "&grapflag=" + 1);
		mmpCode = new Array("31");
		url = "toEneryGovernment.action?m=toDLDHFX&flag=" + flag
				+ "&energyCode=" + energyCode + "&dateCode=" + dateCode
				+ "&dateCode1=" + args.dateCode1 + "&mmpCode=" + mmpCode
				+ "&locationId=" + locationId + "&index=" + index
				+ "&eneryName=" + eneryName1 + "&unitInfo=" + unitInfo1;
		$("#dlxhpie").attr("src", url + "&grapflag=" + 2);
		$("#dfxhqs").attr("src", url + "&grapflag=" + 3);
		$("#dfxhpie").attr("src", url + "&grapflag=" + 4);
		$("#dlxhpie2").attr("src", url + "&grapflag=" + 2);
		$("#dfxhpie2").attr("src", url + "&grapflag=" + 4);
		$("#dlxhpie3").attr("src", url + "&grapflag=" + 2);
		$("#dfxhpie3").attr("src", url + "&grapflag=" + 4);
	}
	function GetClickData(node) {
		subitemflag = flag;
		locationName = node.text;
		locationId = node.id;
		getDateForIfram();
	}
</script>

		<style type="text/css">
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

	<body class="">

		<!--  电力电耗查询 -->
		<div class="wrap-fluid">
			<div class="container-fluid paper-wrap bevel tlbr">
				<!-- 内容板块 -->
				<!-- 内容板块 -->
				<div class="content-wrap"
					style="border: 0px solid green; padding: 0px;">
					<div class="row"
						style="border: 0px solid green; margin-left: 0.2%;">
						<!-- 左边 tree -->
						<div class="col-sm-2 box-shadow-2"
							style="border: 0px solid yellow; margin-top: 1%; height: 96%; width: 15%;">
							<iframe src="/emcc-new/tree.jsp" width="100%" style="border: 0px"
								height="100%" scrolling="no" frameborder="1"></iframe>
						</div>
						<!-- 右板块 -->
						<div class="col-sm-10"
							style="float: left; width: 85.0%; border: 0px solid red; padding-left: 10px; margin-top: 1%; height: 96%;">
							<!--右边面板 -->
							<div class="main box-shadow-2"
								style="border: 0px solid yellow; width: 100%; height: 100%;">
								<div class="pro-switch"
									style="width: 100%; border: 0px solid red; height: 100%;">
									<div class="slider"
										style="width: 100%; border: 0px solid blue; height: 100%;">
										<div class="flexslider"
											style="width: 100%; border: 0px solid blue; height: 100%;">

											<div class="flex-viewport"
												style="overflow: hidden; position: relative;">
												<ul class="slides"
													style="width: 1000%; border: 0px solid blue; height: 100%; transition-duration: 0.4s; transform: translate3d(-3270px, 0px, 0px);">
													<li class="clone"
														style="width: 1090px; float: left; display: block;">
														<div class="tab box-shadow-2"
															style="width: 100%; border: 0px solid red;">
															<div class="col-xs-4 box-shadow-2"
																style="border: 0px solid red; width: 300px; margin-left: 2%; margin-top: 1%; height: 92%;">
																<h4 class="text-left"
																	style="font-size: 20px; color: #1F95EF; margin-top: 3%; text-align: center;">
																	1#电表
																</h4>
																<table>
																	<tbody>
																		<tr>
																			<td>
																				电表总电量：
																			</td>
																			<td>
																				3767.9/KWH
																			</td>
																		</tr>
																		<tr>
																			<td>
																				A相电压
																			</td>
																			<td>
																				397.6V
																			</td>
																		</tr>
																		<tr>
																			<td>
																				B相电压
																			</td>
																			<td>
																				397.6V
																			</td>
																		</tr>
																		<tr>
																			<td>
																				C相电压
																			</td>
																			<td>
																				399.4V
																			</td>
																		</tr>
																		<tr>
																			<td>
																				A相电流
																			</td>
																			<td>
																				00.0A
																			</td>
																		</tr>
																		<tr>
																			<td>
																				B相电流
																			</td>
																			<td>
																				00.0A
																			</td>
																		</tr>
																		<tr>
																			<td>
																				C相电流
																			</td>
																			<td>
																				00.0A
																			</td>
																		</tr>
																	</tbody>
																</table>
															</div>
															<div class="col-xs-4 box-shadow-2"
																style="border: 0px solid red; width: 300px; margin-left: 3%; margin-top: 1%; height: 92%;">
																<h4 class="text-left"
																	style="font-size: 20px; color: #1F95EF; margin-top: 3%; text-align: center;">
																	2#电表
																</h4>
																<table>
																	<tbody>
																		<tr>
																			<td>
																				电表总电量：
																			</td>
																			<td>
																				3767.9/KWH
																			</td>
																		</tr>
																		<tr>
																			<td>
																				A相电压
																			</td>
																			<td>
																				397.6V
																			</td>
																		</tr>
																		<tr>
																			<td>
																				B相电压
																			</td>
																			<td>
																				397.6V
																			</td>
																		</tr>
																		<tr>
																			<td>
																				C相电压
																			</td>
																			<td>
																				399.4V
																			</td>
																		</tr>
																		<tr>
																			<td>
																				A相电流
																			</td>
																			<td>
																				00.0A
																			</td>
																		</tr>
																		<tr>
																			<td>
																				B相电流
																			</td>
																			<td>
																				00.0A
																			</td>
																		</tr>
																		<tr>
																			<td>
																				C相电流
																			</td>
																			<td>
																				00.0A
																			</td>
																		</tr>
																	</tbody>
																</table>
															</div>
															<div class="col-xs-4 box-shadow-2"
																style="border: 0px solid red; width: 300px; margin-left: 3%; margin-top: 1%; height: 92%;">
																<h4 class="text-left"
																	style="font-size: 20px; color: #1F95EF; margin-top: 3%; text-align: center;">
																	3#电表
																</h4>
																<table>
																	<tbody>
																		<tr>
																			<td>
																				电表总电量：
																			</td>
																			<td>
																				3767.9/KWH
																			</td>
																		</tr>
																		<tr>
																			<td>
																				A相电压
																			</td>
																			<td>
																				397.6V
																			</td>
																		</tr>
																		<tr>
																			<td>
																				B相电压
																			</td>
																			<td>
																				397.6V
																			</td>
																		</tr>
																		<tr>
																			<td>
																				C相电压
																			</td>
																			<td>
																				399.4V
																			</td>
																		</tr>
																		<tr>
																			<td>
																				A相电流
																			</td>
																			<td>
																				00.0A
																			</td>
																		</tr>
																		<tr>
																			<td>
																				B相电流
																			</td>
																			<td>
																				00.0A
																			</td>
																		</tr>
																		<tr>
																			<td>
																				C相电流
																			</td>
																			<td>
																				00.0A
																			</td>
																		</tr>
																	</tbody>
																</table>
															</div>
														</div>

													</li>
													<li style="width: 1090px; float: left; display: block;"
														class="">
														<div class="img">
															<div class="tab box-shadow-2"
																style="width: 100%; border: 0px solid red; height: 90%;">
																<div class="col-xs-4 box-shadow-2"
																	style="border: 0px solid red; width: 300px; margin-left: 2%; margin-top: 1%; height: 230px;">
																	<h4 class="text-left"
																		style="font-size: 20px; color: #1F95EF; margin-top: 3%; text-align: center;">
																		一层区域环境
																	</h4>
																	<table>
																		<tbody>
																			<tr>
																				<td>
																					东区温度
																				</td>
																				<td>
																					24.1 ℃
																				</td>
																			</tr>
																			<tr>
																				<td>
																					东区湿度
																				</td>
																				<td>
																					36.8 ℃
																				</td>
																			</tr>
																			<tr>
																				<td>
																					西区温度
																				</td>
																				<td>
																					24.1 ℃
																				</td>
																			</tr>
																			<tr>
																				<td>
																					西区湿度
																				</td>
																				<td>
																					36.8 ℃
																				</td>
																			</tr>
																		</tbody>
																	</table>
																</div>
																<div class="col-xs-4 box-shadow-2"
																	style="border: 0px solid red; float: left; margin-left: 3%; margin-top: 1%; width: 300px; height: 230px;">
																	<h4 class="text-left"
																		style="font-size: 20px; color: #1F95EF; margin-top: 3%; text-align: center;">
																		二层区域环境
																	</h4>
																	<table>
																		<tbody>
																			<tr>
																				<td>
																					东区温度
																				</td>
																				<td>
																					24.1 ℃
																				</td>
																			</tr>
																			<tr>
																				<td>
																					东区湿度
																				</td>
																				<td>
																					36.8 ℃
																				</td>
																			</tr>
																			<tr>
																				<td>
																					西区温度
																				</td>
																				<td>
																					24.1 ℃
																				</td>
																			</tr>
																			<tr>
																				<td>
																					西区湿度
																				</td>
																				<td>
																					36.8 ℃
																				</td>
																			</tr>
																		</tbody>
																	</table>
																</div>
																<div class="col-xs-4 box-shadow-2"
																	style="border: 0px solid red; float: left; margin-top: 1%; margin-left: 3%; width: 300px; height: 230px;">
																	<h4 class="text-left"
																		style="font-size: 20px; color: #1F95EF; margin-top: 3%; text-align: center;">
																		三层区域环境
																	</h4>
																	<table>
																		<tbody>
																			<tr>
																				<td>
																					东区温度
																				</td>
																				<td>
																					24.1 ℃
																				</td>
																			</tr>
																			<tr>
																				<td>
																					东区湿度
																				</td>
																				<td>
																					36.8 ℃
																				</td>
																			</tr>
																			<tr>
																				<td>
																					西区温度
																				</td>
																				<td>
																					24.1 ℃
																				</td>
																			</tr>
																			<tr>
																				<td>
																					西区湿度
																				</td>
																				<td>
																					36.8 ℃
																				</td>
																			</tr>
																		</tbody>
																	</table>
																</div>


																<div class="col-xs-4 box-shadow-2"
																	style="border: 0px solid red; width: 300px; margin-left: 2%; margin-top: 2%; height: 230px;">
																	<h4 class="text-left"
																		style="font-size: 20px; color: #1F95EF; margin-top: 3%; text-align: center;">
																		四层区域环境
																	</h4>
																	<table>
																		<tbody>
																			<tr>
																				<td>
																					东区温度
																				</td>
																				<td>
																					24.1 ℃
																				</td>
																			</tr>
																			<tr>
																				<td>
																					东区湿度
																				</td>
																				<td>
																					36.8 ℃
																				</td>
																			</tr>
																			<tr>
																				<td>
																					西区温度
																				</td>
																				<td>
																					24.1 ℃
																				</td>
																			</tr>
																			<tr>
																				<td>
																					西区湿度
																				</td>
																				<td>
																					36.8 ℃
																				</td>
																			</tr>
																		</tbody>
																	</table>
																</div>
																<div class="col-xs-4 box-shadow-2"
																	style="border: 0px solid red; float: left; margin-left: 3%; margin-top: 2%; width: 300px; height: 230px;">
																	<h4 class="text-left"
																		style="font-size: 20px; color: #1F95EF; margin-top: 3%; text-align: center;">
																		五层区域环境
																	</h4>
																	<table>
																		<tbody>
																			<tr>
																				<td>
																					东区温度
																				</td>
																				<td>
																					24.1 ℃
																				</td>
																			</tr>
																			<tr>
																				<td>
																					东区湿度
																				</td>
																				<td>
																					36.8 ℃
																				</td>
																			</tr>
																			<tr>
																				<td>
																					西区温度
																				</td>
																				<td>
																					24.1 ℃
																				</td>
																			</tr>
																			<tr>
																				<td>
																					西区湿度
																				</td>
																				<td>
																					36.8 ℃
																				</td>
																			</tr>
																		</tbody>
																	</table>
																</div>
																<div class="col-xs-4 box-shadow-2"
																	style="border: 0px solid red; float: left; margin-top: 2%; margin-left: 3%; width: 300px; height: 230px;">
																	<h4 class="text-left"
																		style="font-size: 20px; color: #1F95EF; margin-top: 3%; text-align: center;">
																		六层区域环境
																	</h4>
																	<table>
																		<tbody>
																			<tr>
																				<td>
																					东区温度
																				</td>
																				<td>
																					24.1 ℃
																				</td>
																			</tr>
																			<tr>
																				<td>
																					东区湿度
																				</td>
																				<td>
																					36.8 ℃
																				</td>
																			</tr>
																			<tr>
																				<td>
																					西区温度
																				</td>
																				<td>
																					24.1 ℃
																				</td>
																			</tr>
																			<tr>
																				<td>
																					西区湿度
																				</td>
																				<td>
																					36.8 ℃
																				</td>
																			</tr>
																		</tbody>
																	</table>
																</div>
																<div align="right" style="margin-right: 3%;">
																	<table style="width: 30%; right: 1%;">
																		<tbody>
																			<tr>
																				<td>
																					平均温度
																				</td>
																				<td>
																					24.1 ℃
																				</td>
																				<td>
																					平均湿度
																				</td>
																				<td>
																					24.1 ℃
																				</td>
																			</tr>
																		</tbody>
																	</table>
																</div>
															</div>


														</div>
													</li>
													<li style="width: 1090px; float: left; display: block;"
														class="">

														<div class="tab box-shadow-2"
															style="width: 100%; border: 0px solid red;">
															<div class="col-xs-4 box-shadow-2"
																style="border: 0px solid red; width: 300px; margin-left: 2%; margin-top: 1%; height: 92%;">
																<h4 class="text-left"
																	style="font-size: 20px; color: #1F95EF; margin-top: 3%; text-align: center;">
																	一号主机
																</h4>
																<table>
																	<tbody>
																		<tr>
																			<td>
																				冷冻水出水温度：
																			</td>
																			<td>
																				24.1 ℃
																			</td>
																		</tr>
																		<tr>
																			<td>
																				冷冻水回水温度:
																			</td>
																			<td>
																				36.8 ℃
																			</td>
																		</tr>
																		<tr>
																			<td>
																				冷却水出水温度:
																			</td>
																			<td>
																				24.1 ℃
																			</td>
																		</tr>
																		<tr>
																			<td>
																				冷却水回水温度:
																			</td>
																			<td>
																				36.8 ℃
																			</td>
																		</tr>
																		<tr>
																			<td>
																				总 负 荷 率
																			</td>
																			<td>
																				36.8 ℃
																			</td>
																		</tr>
																		<tr>
																			<td>
																				制冷设定温度:
																			</td>
																			<td>
																				7.0 ℃
																			</td>
																		</tr>
																	</tbody>
																</table>
															</div>
															<div class="col-xs-4 box-shadow-2"
																style="border: 0px solid red; width: 300px; margin-left: 3%; margin-top: 1%; height: 92%;">
																<h4 class="text-left"
																	style="font-size: 20px; color: #1F95EF; margin-top: 3%; text-align: center;">
																	二号主机
																</h4>
																<table>
																	<tbody>
																		<tr>
																			<td>
																				冷冻水出水温度：
																			</td>
																			<td>
																				24.1 ℃
																			</td>
																		</tr>
																		<tr>
																			<td>
																				冷冻水回水温度:
																			</td>
																			<td>
																				36.8 ℃
																			</td>
																		</tr>
																		<tr>
																			<td>
																				冷却水出水温度:
																			</td>
																			<td>
																				24.1 ℃
																			</td>
																		</tr>
																		<tr>
																			<td>
																				冷却水回水温度:
																			</td>
																			<td>
																				36.8 ℃
																			</td>
																		</tr>
																		<tr>
																			<td>
																				总 负 荷 率
																			</td>
																			<td>
																				36.8 ℃
																			</td>
																		</tr>
																		<tr>
																			<td>
																				制冷设定温度:
																			</td>
																			<td>
																				7.0 ℃
																			</td>
																		</tr>
																	</tbody>
																</table>
															</div>
															<div class="col-xs-4 box-shadow-2"
																style="border: 0px solid red; width: 300px; margin-left: 3%; margin-top: 1%; height: 92%;">
																<h4 class="text-left"
																	style="font-size: 20px; color: #1F95EF; margin-top: 3%; text-align: center;">
																	三号主机
																</h4>
																<table>
																	<tbody>
																		<tr>
																			<td>
																				冷冻水出水温度：
																			</td>
																			<td>
																				24.1 ℃
																			</td>
																		</tr>
																		<tr>
																			<td>
																				冷冻水回水温度:
																			</td>
																			<td>
																				36.8 ℃
																			</td>
																		</tr>
																		<tr>
																			<td>
																				冷却水出水温度:
																			</td>
																			<td>
																				24.1 ℃
																			</td>
																		</tr>
																		<tr>
																			<td>
																				冷却水回水温度:
																			</td>
																			<td>
																				36.8 ℃
																			</td>
																		</tr>
																		<tr>
																			<td>
																				总 负 荷 率
																			</td>
																			<td>
																				36.8 ℃
																			</td>
																		</tr>
																		<tr>
																			<td>
																				制冷设定温度:
																			</td>
																			<td>
																				7.0 ℃
																			</td>
																		</tr>
																	</tbody>
																</table>
															</div>
														</div>

													</li>
													<li style="width: 1090px; float: left; display: block;"
														class="flex-active-slide">
														<div class="tab box-shadow-2"
															style="width: 100%; border: 0px solid red;">
															<div class="col-xs-4 box-shadow-2"
																style="border: 0px solid red; width: 300px; margin-left: 2%; margin-top: 1%; height: 92%;">
																<h4 class="text-left"
																	style="font-size: 20px; color: #1F95EF; margin-top: 3%; text-align: center;">
																	1#电表
																</h4>
																<table>
																	<tbody>
																		<tr>
																			<td>
																				电表总电量：
																			</td>
																			<td>
																				3767.9/KWH
																			</td>
																		</tr>
																		<tr>
																			<td>
																				A相电压
																			</td>
																			<td>
																				397.6V
																			</td>
																		</tr>
																		<tr>
																			<td>
																				B相电压
																			</td>
																			<td>
																				397.6V
																			</td>
																		</tr>
																		<tr>
																			<td>
																				C相电压
																			</td>
																			<td>
																				399.4V
																			</td>
																		</tr>
																		<tr>
																			<td>
																				A相电流
																			</td>
																			<td>
																				00.0A
																			</td>
																		</tr>
																		<tr>
																			<td>
																				B相电流
																			</td>
																			<td>
																				00.0A
																			</td>
																		</tr>
																		<tr>
																			<td>
																				C相电流
																			</td>
																			<td>
																				00.0A
																			</td>
																		</tr>
																	</tbody>
																</table>
															</div>
															<div class="col-xs-4 box-shadow-2"
																style="border: 0px solid red; width: 300px; margin-left: 3%; margin-top: 1%; height: 92%;">
																<h4 class="text-left"
																	style="font-size: 20px; color: #1F95EF; margin-top: 3%; text-align: center;">
																	2#电表
																</h4>
																<table>
																	<tbody>
																		<tr>
																			<td>
																				电表总电量：
																			</td>
																			<td>
																				3767.9/KWH
																			</td>
																		</tr>
																		<tr>
																			<td>
																				A相电压
																			</td>
																			<td>
																				397.6V
																			</td>
																		</tr>
																		<tr>
																			<td>
																				B相电压
																			</td>
																			<td>
																				397.6V
																			</td>
																		</tr>
																		<tr>
																			<td>
																				C相电压
																			</td>
																			<td>
																				399.4V
																			</td>
																		</tr>
																		<tr>
																			<td>
																				A相电流
																			</td>
																			<td>
																				00.0A
																			</td>
																		</tr>
																		<tr>
																			<td>
																				B相电流
																			</td>
																			<td>
																				00.0A
																			</td>
																		</tr>
																		<tr>
																			<td>
																				C相电流
																			</td>
																			<td>
																				00.0A
																			</td>
																		</tr>
																	</tbody>
																</table>
															</div>
															<div class="col-xs-4 box-shadow-2"
																style="border: 0px solid red; width: 300px; margin-left: 3%; margin-top: 1%; height: 92%;">
																<h4 class="text-left"
																	style="font-size: 20px; color: #1F95EF; margin-top: 3%; text-align: center;">
																	3#电表
																</h4>
																<table>
																	<tbody>
																		<tr>
																			<td>
																				电表总电量：
																			</td>
																			<td>
																				3767.9/KWH
																			</td>
																		</tr>
																		<tr>
																			<td>
																				A相电压
																			</td>
																			<td>
																				397.6V
																			</td>
																		</tr>
																		<tr>
																			<td>
																				B相电压
																			</td>
																			<td>
																				397.6V
																			</td>
																		</tr>
																		<tr>
																			<td>
																				C相电压
																			</td>
																			<td>
																				399.4V
																			</td>
																		</tr>
																		<tr>
																			<td>
																				A相电流
																			</td>
																			<td>
																				00.0A
																			</td>
																		</tr>
																		<tr>
																			<td>
																				B相电流
																			</td>
																			<td>
																				00.0A
																			</td>
																		</tr>
																		<tr>
																			<td>
																				C相电流
																			</td>
																			<td>
																				00.0A
																			</td>
																		</tr>
																	</tbody>
																</table>
															</div>
														</div>

													</li>

													<li style="width: 1090px; float: left; display: block;"
														class="clone">
														<div class="img">
															<div class="tab box-shadow-2"
																style="width: 100%; border: 0px solid red; height: 90%;">
																<div class="col-xs-4 box-shadow-2"
																	style="border: 0px solid red; width: 300px; margin-left: 2%; margin-top: 1%; height: 230px;">
																	<h4 class="text-left"
																		style="font-size: 20px; color: #1F95EF; margin-top: 3%; text-align: center;">
																		一层区域环境
																	</h4>
																	<table>
																		<tbody>
																			<tr>
																				<td>
																					东区温度
																				</td>
																				<td>
																					24.1 ℃
																				</td>
																			</tr>
																			<tr>
																				<td>
																					东区湿度
																				</td>
																				<td>
																					36.8 ℃
																				</td>
																			</tr>
																			<tr>
																				<td>
																					西区温度
																				</td>
																				<td>
																					24.1 ℃
																				</td>
																			</tr>
																			<tr>
																				<td>
																					西区湿度
																				</td>
																				<td>
																					36.8 ℃
																				</td>
																			</tr>
																		</tbody>
																	</table>
																</div>
																<div class="col-xs-4 box-shadow-2"
																	style="border: 0px solid red; float: left; margin-left: 3%; margin-top: 1%; width: 300px; height: 230px;">
																	<h4 class="text-left"
																		style="font-size: 20px; color: #1F95EF; margin-top: 3%; text-align: center;">
																		二层区域环境
																	</h4>
																	<table>
																		<tbody>
																			<tr>
																				<td>
																					东区温度
																				</td>
																				<td>
																					24.1 ℃
																				</td>
																			</tr>
																			<tr>
																				<td>
																					东区湿度
																				</td>
																				<td>
																					36.8 ℃
																				</td>
																			</tr>
																			<tr>
																				<td>
																					西区温度
																				</td>
																				<td>
																					24.1 ℃
																				</td>
																			</tr>
																			<tr>
																				<td>
																					西区湿度
																				</td>
																				<td>
																					36.8 ℃
																				</td>
																			</tr>
																		</tbody>
																	</table>
																</div>
																<div class="col-xs-4 box-shadow-2"
																	style="border: 0px solid red; float: left; margin-top: 1%; margin-left: 3%; width: 300px; height: 230px;">
																	<h4 class="text-left"
																		style="font-size: 20px; color: #1F95EF; margin-top: 3%; text-align: center;">
																		三层区域环境
																	</h4>
																	<table>
																		<tbody>
																			<tr>
																				<td>
																					东区温度
																				</td>
																				<td>
																					24.1 ℃
																				</td>
																			</tr>
																			<tr>
																				<td>
																					东区湿度
																				</td>
																				<td>
																					36.8 ℃
																				</td>
																			</tr>
																			<tr>
																				<td>
																					西区温度
																				</td>
																				<td>
																					24.1 ℃
																				</td>
																			</tr>
																			<tr>
																				<td>
																					西区湿度
																				</td>
																				<td>
																					36.8 ℃
																				</td>
																			</tr>
																		</tbody>
																	</table>
																</div>


																<div class="col-xs-4 box-shadow-2"
																	style="border: 0px solid red; width: 300px; margin-left: 2%; margin-top: 2%; height: 230px;">
																	<h4 class="text-left"
																		style="font-size: 20px; color: #1F95EF; margin-top: 3%; text-align: center;">
																		四层区域环境
																	</h4>
																	<table>
																		<tbody>
																			<tr>
																				<td>
																					东区温度
																				</td>
																				<td>
																					24.1 ℃
																				</td>
																			</tr>
																			<tr>
																				<td>
																					东区湿度
																				</td>
																				<td>
																					36.8 ℃
																				</td>
																			</tr>
																			<tr>
																				<td>
																					西区温度
																				</td>
																				<td>
																					24.1 ℃
																				</td>
																			</tr>
																			<tr>
																				<td>
																					西区湿度
																				</td>
																				<td>
																					36.8 ℃
																				</td>
																			</tr>
																		</tbody>
																	</table>
																</div>
																<div class="col-xs-4 box-shadow-2"
																	style="border: 0px solid red; float: left; margin-left: 3%; margin-top: 2%; width: 300px; height: 230px;">
																	<h4 class="text-left"
																		style="font-size: 20px; color: #1F95EF; margin-top: 3%; text-align: center;">
																		五层区域环境
																	</h4>
																	<table>
																		<tbody>
																			<tr>
																				<td>
																					东区温度
																				</td>
																				<td>
																					24.1 ℃
																				</td>
																			</tr>
																			<tr>
																				<td>
																					东区湿度
																				</td>
																				<td>
																					36.8 ℃
																				</td>
																			</tr>
																			<tr>
																				<td>
																					西区温度
																				</td>
																				<td>
																					24.1 ℃
																				</td>
																			</tr>
																			<tr>
																				<td>
																					西区湿度
																				</td>
																				<td>
																					36.8 ℃
																				</td>
																			</tr>
																		</tbody>
																	</table>
																</div>
																<div class="col-xs-4 box-shadow-2"
																	style="border: 0px solid red; float: left; margin-top: 2%; margin-left: 3%; width: 300px; height: 230px;">
																	<h4 class="text-left"
																		style="font-size: 20px; color: #1F95EF; margin-top: 3%; text-align: center;">
																		六层区域环境
																	</h4>
																	<table>
																		<tbody>
																			<tr>
																				<td>
																					东区温度
																				</td>
																				<td>
																					24.1 ℃
																				</td>
																			</tr>
																			<tr>
																				<td>
																					东区湿度
																				</td>
																				<td>
																					36.8 ℃
																				</td>
																			</tr>
																			<tr>
																				<td>
																					西区温度
																				</td>
																				<td>
																					24.1 ℃
																				</td>
																			</tr>
																			<tr>
																				<td>
																					西区湿度
																				</td>
																				<td>
																					36.8 ℃
																				</td>
																			</tr>
																		</tbody>
																	</table>
																</div>
																<div align="right" style="margin-right: 3%;">
																	<table style="width: 30%; right: 1%;">
																		<tbody>
																			<tr>
																				<td>
																					平均温度
																				</td>
																				<td>
																					24.1 ℃
																				</td>
																				<td>
																					平均湿度
																				</td>
																				<td>
																					24.1 ℃
																				</td>
																			</tr>
																		</tbody>
																	</table>
																</div>
															</div>
														</div>
													</li>
												</ul>
											</div>
											<ol class="flex-control-nav flex-control-paging">
												<li>
													<a class="">1</a>
												</li>
												<li>
													<a class="">2</a>
												</li>
												<li>
													<a class="flex-active">3</a>
												</li>
											</ol>
											<ul class="flex-direction-nav">
												<li>
													<a class="flex-prev" href="#">Previous</a>
												</li>
												<li>
													<a class="flex-next" href="#">Next</a>
												</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>