<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

		<title>建筑用能总览</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		

		<!-- 选项卡 -->
		<link rel="stylesheet" href="css/htmleaf-demo.css">
		<script type="text/javascript" src="js/prefixfree.min.js"></script>

		<!-- Le styles -->
		<link rel="stylesheet" href="assets/css/style.css">
		<link rel="stylesheet" href="assets/css/loader-style.css">
		<link rel="stylesheet" href="assets/css/bootstrap.css">
		
	<script type="text/javascript" src="assets/js/jquery.js"></script>


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
	<style>
.operateDiv {
	float: left;
	width: 80px;
	height: 50px;
	text-align: center;
	line-height: 50px;
}

.operateImg {
	float: left;
	display: block;
}

.operateDiv input {
	vertical-align: middle;
	height: 50px;
}

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

table  tr {
	border: 1px solid;
	margin: 5px 0; /*设置tr间距为2px*/
	height: 40px;
	padding: 0px;
	background: #383e54;
	font-size: 14px;
}

table  th {
	margin: 5px 0; /*设置tr间距为2px*/
	height: 40px;
	padding: 0px;
	text-align: center;
	font-size: 18px;
}

table tr td {
	width: 10%;
	text-align: center;
}
</style>
			<script> window.jQuery || document.write('<script src="js/jquery-1.11.0.min.js"><\/script>')</script>
			<script type="text/javascript" src="js/jquery-tab.js"></script>
			<script type="text/javascript">
$(function() {
	// Calling the plugin
	$('.tab-group').tabify();
})
</script>
<script>
function tessst(dateCode){
	index="yue";
	date=dateCode;
	freshData();
}
</script>
		<script>
var overallid = "";
var mmpName = "总有功电能";
var text = "朝阳医院";
var flag = "1";
var date = "2017";
var index="year";
var energyName="用电";
$(function() {
	InifhTable("fhtb", "负荷", flag);
	freshData();
});
function freshData() {
	$("#fushionchartsIframe").attr(
		"src","toEneryGovernment.action?m=toGraphStatisticsEnergyGovernment&id=" + overallid + "&text="
					+ text + "&mmpName=" + mmpName + "&energy=31&unitInfo=kWh&index="+index+"&energyName="+energyName+"&dateCode=" + date
					);
	$("#fushionchartsIframe2").attr(
		"src","toEneryGovernment.action?m=toGraphStatisticsEnergyGovernment&id=" + overallid + "&text="
					+ text + "&mmpName=" + mmpName + "&energy=31&unitInfo=吨&index=year&energyName=用水&dateCode=" + date
					);
	$("#fushionchartsIframe3").attr(
		"src","toEneryGovernment.action?m=toGraphStatisticsEnergyGovernment&id=" + overallid + "&text="
					+ text + "&mmpName=" + mmpName + "&energy=31&unitInfo=m³&index=year&energyName=用气&dateCode=" + date
					);
	//GetData(mmpName, "1", overallid, "fhtb", flag);
}
function GetClickData(node, flag) {
	overallid = node.id;
	text = node.text;
	freshData();

}
function GetData(mmpName, type, id, tbid, flag) {
	var args = {};
	BingData("#" + tbid, args, 'toMonitorYNFHJC.action?m=toGetData&mmpName='
			+ mmpName + '&type=' + type + '&id=' + id + "&flag=" + flag
			+ "&today=" + date, null);
}
</script>
		<script>
function changeTabs(id, value) {
	var tabshtml = "__tag_99$16_" + "__tag_100$9_"
			+ "__tag_101$10___tag_116$20_" + "__tag_102$9_" + "__tag_103$8_";
	return tabshtml;
</script>
		<script>
function InifhTable(tbid, tbvalue) {
	//初始化table	
	$('#' + tbid).datagrid( {
		title : tbvalue + '日曲线记录',
		fitColumns : false, //自适应列的大小
		singleSelect : true,
		fit : true,
		rownumbers : true,
		columns : [ [
		//{ title: '日期', field: 'dateCode',align:'center', width: 80},
				{
					title : '测点名称',
					field : '0',
					align : 'center',
					width : 100
				}, {
					title : '00:00',
					field : '1',
					align : 'center',
					width : 60
				}, {
					title : '00:15',
					field : '2',
					align : 'center',
					width : 60
				}, {
					title : '00:30',
					field : '3',
					align : 'center',
					width : 60
				}, {
					title : '00:45',
					field : '4',
					align : 'center',
					width : 60
				}, {
					title : '01:00',
					field : '5',
					align : 'center',
					width : 60
				}, {
					title : '01:15',
					field : '6',
					align : 'center',
					width : 60
				}, {
					title : '01:30',
					field : '7',
					align : 'center',
					width : 60
				}, {
					title : '01:45',
					field : '8',
					align : 'center',
					width : 60
				}, {
					title : '02:00',
					field : '9',
					align : 'center',
					width : 60
				}, {
					title : '02:15',
					field : '10',
					align : 'center',
					width : 60
				}, {
					title : '02:30',
					field : '11',
					align : 'center',
					width : 60
				}, {
					title : '02:45',
					field : '12',
					align : 'center',
					width : 60
				}, {
					title : '03:00',
					field : '13',
					align : 'center',
					width : 60
				}, {
					title : '03:15',
					field : '14',
					align : 'center',
					width : 60
				}, {
					title : '03:30',
					field : '15',
					align : 'center',
					width : 60
				}, {
					title : '03:45',
					field : '16',
					align : 'center',
					width : 60
				}, {
					title : '04:00',
					field : '17',
					align : 'center',
					width : 60
				}, {
					title : '04:15',
					field : '18',
					align : 'center',
					width : 60
				}, {
					title : '04:30',
					field : '19',
					align : 'center',
					width : 60
				}, {
					title : '04:45',
					field : '20',
					align : 'center',
					width : 60
				}, {
					title : '05:00',
					field : '21',
					align : 'center',
					width : 60
				}, {
					title : '05:15',
					field : '22',
					align : 'center',
					width : 60
				}, {
					title : '05:30',
					field : '23',
					align : 'center',
					width : 60
				}, {
					title : '05:45',
					field : '24',
					align : 'center',
					width : 60
				}, {
					title : '06:00',
					field : '25',
					align : 'center',
					width : 60
				}, {
					title : '06:15',
					field : '26',
					align : 'center',
					width : 60
				}, {
					title : '06:30',
					field : '27',
					align : 'center',
					width : 60
				}, {
					title : '06:45',
					field : '28',
					align : 'center',
					width : 60
				}, {
					title : '07:00',
					field : '29',
					align : 'center',
					width : 60
				}, {
					title : '07:15',
					field : '30',
					align : 'center',
					width : 60
				}, {
					title : '07:30',
					field : '31',
					align : 'center',
					width : 60
				}, {
					title : '07:45',
					field : '32',
					align : 'center',
					width : 60
				}, {
					title : '08:00',
					field : '33',
					align : 'center',
					width : 60
				}, {
					title : '08:15',
					field : '34',
					align : 'center',
					width : 60
				}, {
					title : '08:30',
					field : '35',
					align : 'center',
					width : 60
				}, {
					title : '08:45',
					field : '36',
					align : 'center',
					width : 60
				}, {
					title : '09:00',
					field : '37',
					align : 'center',
					width : 60
				}, {
					title : '09:15',
					field : '38',
					align : 'center',
					width : 60
				}, {
					title : '09:30',
					field : '39',
					align : 'center',
					width : 60
				}, {
					title : '09:45',
					field : '40',
					align : 'center',
					width : 60
				}, {
					title : '10:00',
					field : '41',
					align : 'center',
					width : 60
				}, {
					title : '10:15',
					field : '42',
					align : 'center',
					width : 60
				}, {
					title : '10:30',
					field : '43',
					align : 'center',
					width : 60
				}, {
					title : '10:45',
					field : '44',
					align : 'center',
					width : 60
				}, {
					title : '11:00',
					field : '45',
					align : 'center',
					width : 60
				}, {
					title : '11:15',
					field : '46',
					align : 'center',
					width : 60
				}, {
					title : '11:30',
					field : '47',
					align : 'center',
					width : 60
				}, {
					title : '11:45',
					field : '48',
					align : 'center',
					width : 60
				}, {
					title : '12:00',
					field : '49',
					align : 'center',
					width : 60
				}, {
					title : '12:15',
					field : '50',
					align : 'center',
					width : 60
				}, {
					title : '12:30',
					field : '51',
					align : 'center',
					width : 60
				}, {
					title : '12:45',
					field : '52',
					align : 'center',
					width : 60
				}, {
					title : '13:00',
					field : '53',
					align : 'center',
					width : 60
				}, {
					title : '13:15',
					field : '54',
					align : 'center',
					width : 60
				}, {
					title : '13:30',
					field : '55',
					align : 'center',
					width : 60
				}, {
					title : '13:45',
					field : '56',
					align : 'center',
					width : 60
				}, {
					title : '14:00',
					field : '57',
					align : 'center',
					width : 60
				}, {
					title : '14:15',
					field : '58',
					align : 'center',
					width : 60
				}, {
					title : '14:30',
					field : '59',
					align : 'center',
					width : 60
				}, {
					title : '14:45',
					field : '60',
					align : 'center',
					width : 60
				}, {
					title : '15:00',
					field : '61',
					align : 'center',
					width : 60
				}, {
					title : '15:15',
					field : '62',
					align : 'center',
					width : 60
				}, {
					title : '15:30',
					field : '63',
					align : 'center',
					width : 60
				}, {
					title : '15:45',
					field : '64',
					align : 'center',
					width : 60
				}, {
					title : '16:00',
					field : '65',
					align : 'center',
					width : 60
				}, {
					title : '16:15',
					field : '66',
					align : 'center',
					width : 60
				}, {
					title : '16:30',
					field : '67',
					align : 'center',
					width : 60
				}, {
					title : '16:45',
					field : '68',
					align : 'center',
					width : 60
				}, {
					title : '17:00',
					field : '69',
					align : 'center',
					width : 60
				}, {
					title : '17:15',
					field : '70',
					align : 'center',
					width : 60
				}, {
					title : '17:30',
					field : '71',
					align : 'center',
					width : 60
				}, {
					title : '17:45',
					field : '72',
					align : 'center',
					width : 60
				}, {
					title : '18:00',
					field : '73',
					align : 'center',
					width : 60
				}, {
					title : '18:15',
					field : '74',
					align : 'center',
					width : 60
				}, {
					title : '18:30',
					field : '75',
					align : 'center',
					width : 60
				}, {
					title : '18:45',
					field : '76',
					align : 'center',
					width : 60
				}, {
					title : '19:00',
					field : '77',
					align : 'center',
					width : 60
				}, {
					title : '19:15',
					field : '78',
					align : 'center',
					width : 60
				}, {
					title : '19:30',
					field : '79',
					align : 'center',
					width : 60
				}, {
					title : '19:45',
					field : '80',
					align : 'center',
					width : 60
				}, {
					title : '20:00',
					field : '81',
					align : 'center',
					width : 60
				}, {
					title : '20:15',
					field : '82',
					align : 'center',
					width : 60
				}, {
					title : '20:30',
					field : '83',
					align : 'center',
					width : 60
				}, {
					title : '20:45',
					field : '84',
					align : 'center',
					width : 60
				}, {
					title : '21:00',
					field : '85',
					align : 'center',
					width : 60
				}, {
					title : '21:15',
					field : '86',
					align : 'center',
					width : 60
				}, {
					title : '21:30',
					field : '87',
					align : 'center',
					width : 60
				}, {
					title : '21:45',
					field : '88',
					align : 'center',
					width : 60
				}, {
					title : '22:00',
					field : '89',
					align : 'center',
					width : 60
				}, {
					title : '22:15',
					field : '90',
					align : 'center',
					width : 60
				}, {
					title : '22:30',
					field : '91',
					align : 'center',
					width : 60
				}, {
					title : '22:45',
					field : '92',
					align : 'center',
					width : 60
				}, {
					title : '23:00',
					field : '93',
					align : 'center',
					width : 60
				}, {
					title : '23:15',
					field : '94',
					align : 'center',
					width : 60
				}, {
					title : '23:30',
					field : '95',
					align : 'center',
					width : 60
				}, {
					title : '23:45',
					field : '96',
					align : 'center',
					width : 60
				} ] ],
		striped : true
	});
}
</script>
<script type="text/javascript">
var yearnum = 0;
var monthnum = 0;
var daynum = 0;
//规范日期格式	
function myformatter(date) {
	var y = date.getFullYear() + yearnum;
	var m = date.getMonth() + 1 + monthnum;
	var d = date.getDate() + daynum;
	return y + '-' + (m < 10 ? ('0' + m) : m) + '-' + (d < 10 ? ('0' + d) : d);
}
function myparser(s) {
	if (!s)
		return new Date();
	var ss = (s.split('-'));
	var y = parseInt(ss[0], 10);
	var m = parseInt(ss[1], 10);
	var d = parseInt(ss[2], 10);
	if (!isNaN(y) && !isNaN(m) && !isNaN(d)) {
		return new Date(y, m - 1, d);
	} else {
		return new Date();
	}
}
function myparse(s) {
	if (s != "") {
		return s.replace(/-/g, "");
	}
}
</script>
	</head>
	<body>
		<!-- 建筑用能总览 -->
		<div class="wrap-fluid">
			<div class="container-fluid paper-wrap bevel tlbr">
				<!-- 内容板块 -->
				<div class="content-wrap" style="border: 0px solid green;padding:0px;">
					<div class="row" style="border: 0px solid green;margin-left:0.2%;">
						<!-- 左边 tree -->
						<div class="col-sm-2 box-shadow-2" style="border: 0px solid yellow;margin-top: 1%;height: 97%;width: 15%;">
							<iframe src="/emcc-new/tree.jsp" width="100%" style="border: 0px"
								height="100%" scrolling="no" frameborder="1"></iframe>
						</div>
						<!-- 右板块 -->
						<div class="col-sm-10"
							style="float:left;width:85.0%;border: 0px solid red ;padding-left:10px;padding-right:5px;margin-top: 1%;height:97.2%;">
							<!--右边面板 -->
													<div class="container box-shadow-2"
														style="width: 100%; border: 0px solid blue;height: 100%">
														
														<div class="tab-group" style="width: 100%; border: 0px solid blue; ">
																<section id="tab1" title="用电能耗">
									<div
										style="height: 300px; width: 100%; border: 0px solid; margin-top: 10px;">
										<iframe id="fushionchartsIframe" src="" frameborder="0"
											marginheight="0" width="100%" height="280px" scrolling="no"></iframe>
									</div>
									<div style="border: 0px solid;">
																<table>
																	<tr>
																		<td rowspan="3">
																			电耗情况（KW·H）
																		</td>
																		<td>
																			今天指标
																		</td>
																		<td>
																			今天累计耗用
																		</td>
																		<td>
																			今天指标使用率
																		</td>
																		<td>
																			剩余指标
																		</td>
																	</tr>
																	<tr>
																		<td>
																			0
																		</td>
																		<td>
																			4844.11
																		</td>
																		<td>
																			0%
																		</td>
																		<td>
																			-4844.11
																		</td>
																	</tr>
																	<tr>
																		<td>
																			0
																		</td>
																		<td>
																			4844.11
																		</td>
																		<td>
																			0%
																		</td>
																		<td>
																			-4844.11
																		</td>
																	</tr>
																</table>
															</div>
																</section>
																<section id="tab2" title="用水能耗">
																	<div style="height: 300px; width: 100%; border: 0px solid;margin-top: 10px; ">
																		<iframe id="fushionchartsIframe2" src="" frameborder="0"
																			marginheight="0" width="100%" height="280px" scrolling="no"></iframe>
																	</div>
																	<div style="border: 0px solid;">
																<table>
																	<tr>
																		<td rowspan="3">
																			水耗情况（吨）
																		</td>
																		<td>
																			今天指标
																		</td>
																		<td>
																			今天累计耗用
																		</td>
																		<td>
																			今天指标使用率
																		</td>
																		<td>
																			剩余指标
																		</td>
																	</tr>
																	<tr>
																		<td>
																			0
																		</td>
																		<td>
																			4844.11
																		</td>
																		<td>
																			0%
																		</td>
																		<td>
																			-4844.11
																		</td>
																	</tr>
																	<tr>
																		<td>
																			0
																		</td>
																		<td>
																			4844.11
																		</td>
																		<td>
																			0%
																		</td>
																		<td>
																			-4844.11
																		</td>
																	</tr>
																</table>
															</div>
																	</section>
															<section id="tab3" title="用气能耗">
																	<div style="height: 300px; width: 100%; border: 0px solid;margin-top: 10px; ">
																		<iframe id="fushionchartsIframe3" src="" frameborder="0"
																			marginheight="0" width="100%" height="280px" scrolling="no"></iframe>
																	</div>
																	<div style="border: 0px solid;">
																<table>
																	<tr>
																		<td rowspan="3">
																			气耗情况（立方米）
																		</td>
																		<td>
																			今天指标
																		</td>
																		<td>
																			今天累计耗用
																		</td>
																		<td>
																			今天指标使用率
																		</td>
																		<td>
																			剩余指标
																		</td>
																	</tr>
																	<tr>
																		<td>
																			0
																		</td>
																		<td>
																			4844.11
																		</td>
																		<td>
																			0%
																		</td>
																		<td>
																			-4844.11
																		</td>
																	</tr>
																	<tr>
																		<td>
																			0
																		</td>
																		<td>
																			4844.11
																		</td>
																		<td>
																			0%
																		</td>
																		<td>
																			-4844.11
																		</td>
																	</tr>
																</table>
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
