<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta>
		<title>能耗监测平台</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<!-- Le styles -->
		<link rel="stylesheet" href="assets/css/style.css">
		<link rel="stylesheet" href="assets/css/loader-style.css">
		<link rel="stylesheet" href="assets/css/bootstrap.css">
		<link rel="stylesheet" type="text/css"
			href="assets/js/progress-bar/number-pb.css">
		<link rel="shortcut icon" href="assets/ico/minus.png">
		<script type="text/javascript" src="js/page.js"></script>
		<script type="text/javascript" src="js/jquery-1.8.2.min.js">
		</script>
		<script type="text/javascript" src="assets/js/jquery.js">
		</script>
		<script src="assets/js/progress-bar/src/jquery.velocity.min.js">
		</script>
		<script src="assets/js/progress-bar/number-pb.js">
		</script>
		<script src="assets/js/progress-bar/progress-app.js">
		</script>
		<!-- MAIN EFFECT -->
		<script type="text/javascript" src="assets/js/preloader.js">
		</script>
		<script type="text/javascript" src="assets/js/bootstrap.js">
		</script>
		<script type="text/javascript" src="assets/js/app.js">
		</script>
		<script type="text/javascript" src="assets/js/load.js">
		</script>
		<script type="text/javascript" src="assets/js/main.js">
		</script>
		<!-- GAGE -->
		<script type="text/javascript" src="assets/js/chart/jquery.flot.js">
		</script>
		<script type="text/javascript"
			src="assets/js/chart/jquery.flot.resize.js">
		</script>
		<script type="text/javascript"
			src="assets/js/speed/canvasgauge-coustom.js">
		</script>
		<script type="text/javascript"
			src="assets/js/countdown/jquery.countdown.js">
		</script>
		<script src="assets/js/jhere-custom.js">
		</script>
		<style type="text/css">
canvas#canvas4 {
	position: relative;
	top: 20px;
}

body {
	overflow-x: hidden;
	overflow-y: hidden;
}
    
</style>
		<script language="javascript">
     var t = null;
    t = setTimeout(time,1000);//开始执行
    function time() {
       clearTimeout(t);//清除定时器
       dt = new Date();
       var h=dt.getHours();
       var m=dt.getMinutes();
       var s=dt.getSeconds();
       var n=dt.getFullYear();
       var y=dt.getMonth()+1;
       var r=dt.getDate();
       document.getElementById("dateShow").innerHTML =  "	"+n+"年"+y+"月"+r+"日";
       document.getElementById("timeShow").innerHTML =  "北京时间："+h+"时"+m+"分"+s+"秒	";
       t = setTimeout(time,1000); //设定定时器，循环执行             
    } 
  </script>
		<script type="text/javascript">
			function findWeather() {
				var cityUrl = 'http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js';
				$.getScript(cityUrl, function(script, textStatus, jqXHR) {
					var citytq = remote_ip_info.city; // 获取城市
					var url = "http://php.weather.sina.com.cn/iframe/index/w_cl.php?code=js&city=" + citytq + "&day=0&dfc=3";
					$.ajax({
						url: url,
						dataType: "script",
						scriptCharset: "gbk",
						success: function(data) {
							var _w = window.SWther.w[citytq][0];
							var _f = _w.f1 + "_0.png";
							if(new Date().getHours() > 17) {
								_f = _w.f2 + "_1.png";
							}
							var img = "<img width='16px' height='16px' src='http://i2.sinaimg.cn/dy/main/weather/weatherplugin/wthIco/20_20/" + _f +
								"' />";
							var tq = citytq + " " + img + " " + _w.s1 + " " + _w.t1 + "℃～" + _w.t2 + "℃ " + _w.d1 + _w.p1 + "级";

							$('#weather').html(tq);
						}
					});
				});
			}

			findWeather();
		</script>
		<script type="text/javascript">
			$(function(){
				//console.info($(sessionScope.loginMenu));
				//ClickAlarm();
				var a=$(".ajax-load");
				for(i=0;i<a.length;i++){
					var url=$(a[i]).attr("url");
					if(url!=""){
						$("#mainPage").attr("src", url);
						break;
					}
				}
			});
			function ClickAlarm(){
          	 	$("#alarm").click(function(){
          	 	var search="小";
          	 		$.ajax({
						url:"toMonitorRecharge.action?m=toSearchSUser&search="+search,
						type:"post",
						dataType:'json',
						success:function(data){
							$("#list").html("");
							var all="<li onclick='ClickAll()'><div>查询所有报警信息</div></li>";
							var lis="";
				          for (var i = 0; i < data.list.length; i++) {
				              //动态拼接
				              var temphtml = $("#list").html() + '<li class="lis" style="width:90%;height:100%;" onclick="ClickLis('+data.list[i].userId+')"><div style="width:110%;height:100%">' + data.list[i].userName + '的地址:' + data.list[i].userAddress + "</div></li>";
				          		lis=lis+temphtml;
				          }	
				          $("#list").html(lis+all);
							}
						});
          	 		
				});
				
			}
			function ClickLis(id){
			}
			function ClickAll(){
			}
		</script>
	</head>
	<body>
		<nav role="navigation" class="navbar navbar-static-top"
			style="height:52.4;">
		<div class="container-fluid">
			<div id="bs-example-navbar-collapse-1"
				class="collapse navbar-collapse">
				<!-- 报警信息 -->
				<ul class="nav navbar-nav">
					<li class="dropdown">
						<a data-toggle="dropdown" href="#">
							<div class="noft-red">
								0
							</div>
						 </a>
					</li>
					<li style="border: 0px solid red; left: -10%;" id="alarm">
						<a data-toggle="dropdown" class="dropdown-toggle" href="#"
							style="float: left;">
							<div class="noft-green">
								5
							</div> </a>
						<ul style="margin: 12px 0 0 0;" role="menu" id="list"
							class="dropdown-menu dropdown-wrap">
							<li>
								<a href="#"> <span style="background: #DF2135"
									class="noft-icon maki-bus"></span><i>From Station</i> <b>01B</b>
								</a>
							</li>
							<li class="divider"></li>
							<li>
								<a href="#"> 
									<span style="background: #AB6DB0" class="noft-icon maki-ferry"></span>
									<i>Departing at</i> 
									<b>9:00AM</b> 
								</a>
							</li>
							<li class="divider"></li>
							<li>
								<a href="#"> <span style="background: #FFA200"
									class="noft-icon maki-aboveground-rail"></span><i>Delay for</i>
									<b>09 Min</b> </a>
							</li>
							<li class="divider"></li>
							<li>
								<a href="#"> <span style="background: #86C440"
									class="noft-icon maki-airport"></span><i>Take of</i> <b>08:30
										AM</b> </a>
							</li>
							<li class="divider"></li>
							<li>
								<a href="#"> <span style="background: #0DB8DF"
									class="noft-icon maki-bicycle"></span><i>Take of</i> <b>08:30
										AM</b> </a>
							</li>
							<li class="divider"></li>
							<li>
								<div>
									See All Notification
								</div>
							</li>
						</ul>
					</li>
					<li>
						<a href="#"> </a>
					</li>
				</ul>
				<!-- 时间日期 -->
				<div class="navbar-left running-text visible-lg" style="font-size:20px;width:350px">XX人民医院能源管控平台</div>
				<div id="nt-title-container" style="width:400px"
					class="navbar-left running-text visible-lg">
					<ul class="date-top">
						<li class="entypo-calendar" style="margin-right: 5px"></li>
						<li id="dateShow"></li>
					</ul>
					<ul id="digital-clock" class="digital">
						<li class="entypo-clock" style="margin-right: 5px"></li>
						<li id="timeShow"></li>
					</ul>
					<!-- <ul id="nt-title">
						<li id="weather">
							&#160;&#160;当前天气&#160;
						</li>
						<li>
							&#160;&#160;好消息&#160;
							<b>本月</b>&#160;节省电30000瓦
						</li>
						<li>
							&#160;&#160;箴言&#160;
							<b>高尔基</b>&#160;书籍是人类进步的阶梯
						</li>
					</ul> -->
				</div>
				<ul style="margin-right: 0;" class="nav navbar-nav navbar-right">
					<li>
						<a data-toggle="dropdown" class="dropdown-toggle" href="#"> <img
								alt="" class="admin-pic img-circle"
								src="http://api.randomuser.me/portraits/thumb/men/10.jpg">Hi,
							${sessionScope.loginUser.loginName} </a>
						<ul style="margin-top: 14px;" role="menu"
							class="dropdown-setting dropdown-menu">
							<li>
								<a href="#"> <span class="entypo-user"></span>&#160;&#160;我的简历</a>
							</li>
							<li>
								<a href="#"> <span class="entypo-vcard"></span>&#160;&#160;账号设置</a>
							</li>
							<li>
								<a href="#"> <span class="entypo-lifebuoy"></span>&#160;&#160;帮帮我</a>
							</li>
							<li class="divider"></li>
							<li>
								<a
									href="http://themeforest.net/item/apricot-navigation-admin-dashboard-template/7664475?WT.ac=category_item&WT.z_author=themesmile">
									<span class="entypo-basket"></span>&#160;&#160; 采购</a>
							</li>
						</ul>
					</li>
					<li>
						<a href="javascript:void(0)" onclick="goback()"> <span
							class="icon-gear" ></span>&#160;&#160;返回</a>
						<script>
							function goback(){
								var thisurl=window.location.href;
			   	 		var href=thisurl.substring(0,thisurl.lastIndexOf("/"));
			   	 		window.location.href=href+"/"+"welcome.jsp";
							}
						</script>	
						<ul role="menu" class="dropdown-setting dropdown-menu">
							<li class="theme-bg">
								<div id="button-bg"></div>
								<div id="button-bg2"></div>
								<div id="button-bg3"></div>
								<div id="button-bg5"></div>
								<div id="button-bg6"></div>
								<div id="button-bg7"></div>
								<div id="button-bg8"></div>
								<div id="button-bg9"></div>
								<div id="button-bgzhyj"></div>
								<div id="button-bg11"></div>
								<div id="button-bg12"></div>
								<div id="button-bg13"></div>
							</li>
						</ul>
					</li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
		<br>
		</nav>
		<!-- /END OF TOP NAVBAR -->
		<!-- SIDE MENU -->
		<div id="skin-select">
			<div id="logo">
				<h1 style="font-family: 华文中宋;">
					&nbsp;&nbsp;W
					<b style="color: #1f95ef">E</b>STAR
				</h1>
			</div>
			<a id="toggle"> <span class="entypo-menu"></span> </a>
			<div class="dark">
				<form action="#">
					<span> <input type="text" name="search" value=""
							class="search rounded id_search" placeholder="查询 菜单..."
							autofocus=""> </span>
				</form>
			</div>
			<div class="search-hover">
				<form id="demo-2">
					<input type="search" placeholder="查询 菜单..." class="id_search">
				</form>
			</div>
			<!--
		    	作者：110668032@qq.com
		    	时间：2017-03-13
		    	描述：左边选项卡
		    -->
			<div class="skin-part">
				<div id="tree-wrap">
					<div class="side-bar" id="menusdiv">
						<ul class="topnav menu-left-nest">
							<!--<c:if test="${fn:length(sessionScope.loginMenu) > 0 and !empty sessionScope.loginMenu[0].children and fn:length(sessionScope.loginMenu[0].children) > 0}">-->
								<c:forEach var="menu" items="${sessionScope.loginMenu[0].children}"
									varStatus="firstMenuStatus">
							<li>
								<a class="tooltip-tip ajax-load" url="${menu.mmModuleUrl}" onclick="chosePage('${menu.mmModuleUrl}')" href="#" title="${menu.mmModuleName}"> <i
									class="icon icon-monitor"></i> <span>${menu.mmModuleName}</span> </a>
								<!-- 加载二级节点 -->
								<c:if
									test="${!empty menu.children and fn:length(menu.children) > 0}">
								<ul>
									<c:forEach var="secondMenu" items="${menu.children}"
										varStatus="secondMenuStatus">
											<li>
												<a class="tooltip-tip2 ajax-load" href="#" menus
													onclick="chosePage('${secondMenu.mmModuleUrl}')" url="${secondMenu.mmModuleUrl}"
													title="${secondMenu.mmModuleName}" name="menus"><i class="entypo-doc-text"></i><span>${secondMenu.mmModuleName}</span>
												</a>
											</li>
									</c:forEach>
								</ul>
								</c:if>
							</li>
						</c:forEach>
					<!--</c:if>-->
							<!--<li>
								<a class="tooltip-tip ajax-load" href="#" title="能耗统计分析"> <i
									class="icon icon-view-list"></i> <span>能耗统计分析</span> </a>
								<ul>
									<li>
										<a class="tooltip-tip2 ajax-load" href="#" name="menus"
											onclick="chosePage('statistics/dynhfx')"
											id='dynh' title="单元能耗分析"><i class="fontawesome-th-large"></i><span>单元能耗分析</span>
										</a>
									</li>
									<li>
										<a class="tooltip-tip2 ajax-load" href="#" name="menus"
											onclick="chosePage('monitor/lsqxcx')"
											title="历史曲线查询"><i class="entypo-chart-line"></i><span>历史曲线查询</span>
										</a>
									</li>
									<li>
										<a class="tooltip-tip2 ajax-load" href="#" name="menus"
											onclick="chosePage('statistics/dldhfx')"
											title="电耗电力分析"><i class="entypo-air"></i><span>电耗电力分析</span>
										</a>
									</li>
									<li>
										<a class="tooltip-tip2 ajax-load" href="#" name="menus"
											onclick="chosePage('statistics/yddhbb')"
											title="月度电耗报表"><i class="fontawesome-list-alt"></i><span>月度电耗报表</span>
										</a>
									</li>
									<li>
										<a class="tooltip-tip2 ajax-load" href="#" name="menus"
											onclick="chosePage('statistics/nhqsfx')"
											title="能耗趋势分析"><i class="fontawesome-bar-chart"></i><span>能耗趋势分析</span>
										</a>
									</li>
									<li>
										<a class="tooltip-tip2 ajax-load" href="#" name="menus"
											onclick="chosePage('toEneryGovernment.action?m=toYNFXFX')"
											title="用能分项分析"><i class="icon icon-graph-pie"></i><span>用能分项分析</span>
										</a>
									</li>
								</ul>
							</li>
							<li>
								<a class="tooltip-tip ajax-load" href="#" title="远程控制管理"> <i
									class="fontawesome-table"></i> <span>远程控制管理</span> </a>
								<ul>
									<li>
										<a class="tooltip-tip2 ajax-load" href="#" name="menus"
											onclick="chosePage('toEneryGovernment.action?m=toKTXTGL')"
											title="空调系统管理"><i class="fontawesome-asterisk"></i><span>空调系统管理</span>
										</a>
									</li>
									<li>
										<a class="tooltip-tip2 ajax-load" href="#" name="menus"
											onclick="chosePage('test.jsp')" id="test" title="照明系统管理"><i
											class="fontawesome-tint"></i><span>照明系统管理</span> </a>
									</li>

								</ul>
							</li>

							<li>
								<a class="tooltip-tip ajax-load" href="#" title="预付费管理"> <i
									class="icon icon-calendar"></i> <span>预付费管理</span> </a>
								<ul>
									<li>
										<a class="tooltip-tip2 ajax-load" href="#" name="menus"
											onclick="chosePage('toMonitorRecharge.action?m=toMonitorAllUser')"
											title="用户权限管理"><i class="icon icon-user"></i><span>用户信息管理</span>
										</a>
									</li>
									<li>
										<a class="tooltip-tip2 ajax-load" href="#" name="menus"
											onclick="chosePage('toMonitorRecharge.action?m=toMonitorUserRight')"
											title="充值缴费管理"><i class="icon icon-upload"></i><span>用户权限管理</span>
										</a>
									</li>
									<li>
										<a class="tooltip-tip2 ajax-load" href="#" name="menus"
											onclick="chosePage('toMonitorRecharge.action?m=toMonitorRecord')"
											title="充值记录查询"><i class="icon icon-document"></i><span>充值记录查询</span>
										</a>
									</li>
									<li>
										<a class="tooltip-tip2 ajax-load" href="#" name="menus"
											onclick="chosePage('toMonitorRecharge.action?m=toMonitorRecharge')"
											title="充值记录查询"><i class="icon icon-document"></i><span>消费明细查询</span>
										</a>
									</li>

								</ul>
							</li>
							<li>
								<a class="tooltip-tip ajax-load" href="#" title="报警信息管理"> <i
									class="fontawesome-off"></i> <span>报警信息管理</span> </a>
								<ul>
									<li>
										<a class="tooltip-tip2 ajax-load" href="#" name="menus"
											onclick="chosePage('toMonitorAlarm.action?m=toMonitorAlarmInfo')"
											title="报警信息总览"><i class="fontawesome-tint"></i><span>报警信息总览</span>
										</a>
									</li>
									<li>
										<a class="tooltip-tip2 ajax-load" href="#" name="menus"
											onclick=chosePage( 'toMonitorYNFHJC.action?m=toMonitorYNFHJC
											');
title="报警状态处理"><i class="fontawesome-asterisk"></i><span>报警状态处理</span>
										</a>
									</li>
								</ul>
							</li>

							<li>
								<a class="tooltip-tip ajax-load" href="#" title="节能考核监管"> <i
									class="fontawesome-off"></i> <span>节能考核监管</span> </a>
								<ul>
									<li>
										<a class="tooltip-tip2 ajax-load" href="#" name="menus"
											onclick="chosePage('toMonitorYNFHJC.action?m=toMonitorYNFHJC')"
											title="节能项目分析"><i class="fontawesome-tint"></i><span>节能项目分析</span>
										</a>
									</li>
									<li>
										<a class="tooltip-tip2 ajax-load" href="#" name="menus"
											onclick="chosePage('toMonitorYNFHJC.action?m=toMonitorYNFHJC')"
											title="指标利用率"><i class="fontawesome-asterisk"></i><span>指标利用率</span>
										</a>
									</li>
								</ul>
							</li>

							<li>
								<a class="tooltip-tip ajax-load" href="#" title="系统设备维护"> <i
									class="icon icon-gear"></i> <span>系统设备维护</span> </a>
								<ul>
									<li>
										<a class="tooltip-tip2 ajax-load" href="#" name="menus"
											onclick="chosePage('toMonitorYNFHJC.action?m=toMonitorYNFHJC')"
											title="空调系统监测"><i class="wi-fog"></i><span>空调系统监测</span>
										</a>
									</li>
									<li>
										<a class="tooltip-tip2 ajax-load" href="#" name="menus"
											onclick="chosePage('toMonitorYNFHJC.action?m=toMonitorYNFHJC')"
											title="供暖系统监测"><i class="icon icon-tablet-landscape"></i><span>供暖系统监测</span>
										</a>
									</li>
								</ul>
							</li>
							<li>
								<a class="tooltip-tip ajax-load" href="#" title="员工设备管理"> <i
									class="icon icon-user-group"></i> <span>员工设备管理</span> </a>
								<ul>
									<li>
										<a class="tooltip-tip2 ajax-load" href="#" name="menus"
											onclick="chosePage('toMonitorYNFHJC.action?m=toMonitorYNFHJC')"
											title="员工信息管理"><i class="icon icon-user"></i><span>员工信息管理</span>
										</a>
									</li>
									<li>
										<a class="tooltip-tip2 ajax-load" href="#" name="menus"
											onclick="chosePage('toMonitorYNFHJC.action?m=toMonitorYNFHJC')"
											title="权限菜单管理"><i class="icon icon-lock"></i><span>权限菜单管理</span>
										</a>
									</li>
									<li>
										<a class="tooltip-tip2 ajax-load" href="#" name="menus"
											onclick="chosePage('toMonitorYNFHJC.action?m=toMonitorYNFHJC')"
											title="医院建筑管理"><i class="icon icon-retweet"></i><span>医院建筑管理</span>
										</a>
									</li>
									<li>
										<a class="tooltip-tip2 ajax-load" href="#" name="menus"
											onclick=
											chosePage('toMonitorYNFHJC.action?m=toMonitorYNFHJC');
										title="设备应用管理"><i class="fontawesome-cog"></i><span>设备应用管理</span>
										</a>
									</li>
								</ul>
							</li>
						-->
						</ul>

					</div>
				</div>
			</div>
		</div>
		<!-- END OF SIDE MENU -->

		<!--  内容板块 -->
		<div class="wrap-fluid">
			<iframe style="width: 100%; margin: 0; padding: 0; border: 0px;"
				src="" id="mainPage"
				scrolling="no"></iframe>
		</div>
		<script>
		$(document).ready(function() {
			changeFrameHeight();
			$("#menusdiv a").click(function() {
				var myname = $(this).attr('name')
			$("#menusdiv a").css("background-color", "");
			$("#menusdiv a").css("border", "0px");
			if (myname == "menus") {
				$(this).css("background-color", "#2C3240");
				$(this).css("border-left", "#ffffff 2px solid");
				$(this).css("border-right", "#ffffff 2px solid");
			}
		});
	});
	function changeFrameHeight() {
		$("#mainPage").attr("height",
				document.documentElement.clientHeight * 0.88);
	}
	function chosePage(url) {
		if(url!=''){
			$("#mainPage").attr("src", url);
		}

	}
	window.onresize = function() {
		changeFrameHeight();
	}
</script>
	</body>
</html>