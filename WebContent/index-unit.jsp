<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>运维管理系统-首页</title>
<link href="/emcc-new/css/CSS.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/emcc-new/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="/emcc-new/js/time.js"></script>
<script type="text/javascript" src="/emcc-new/js/base.js"></script>
<link href="/emcc-new/css/nav/nav.css" rel="stylesheet" type="text/css" />

<script>
	$(function() {
		$("a").click(function() {
			var u = $(this).text();

			if (u == "企业信息维护企业信息维护") {
				setMainPage('unit/unitinfo');
			}
			if (u == "人员信息维护人员信息维护") {
				setMainPage('unit/personInfo');
			}
			if (u == "测量仪表配置测量仪表配置") {
				setMainPage('unit/measureTable');
			}
			if (u == "通讯路由配置通讯路由配置") {
				setMainPage('unit/communication');
			}
			if (u == "能耗统计配置能耗统计配置") {
				setMainPage('unit/energyStatistics');
			}
			if (u == "能耗负荷配置能耗负荷配置") {
				setMainPage('unit/energyLoad');
			}

			if (u == "计量终端模型计量终端模型") {
				alert("测试");
				setMainPage('operations/meterModel');
			}
			if (u == "接入测试管理接入测试管理") {
				setMainPage('operations/personInfo');
			}
			if (u == "平台日志管理平台日志管理") {
				setMainPage('operations/measureTable');
			}
			if (u == "设备运行维护设备运行维护") {
				setMainPage('operations/communication');
			}
			if (u == "采集数据稽核采集数据稽核") {
				setMainPage('operations/energyStatistics');
			}
			if (u == "运维信息维护运维信息维护") {
				setMainPage('operations/energyLoad');
			}

		})
	});
</script>
<script language="javascript">
	$(document).ready(
			function() {
				/// wrap inner content of each anchor with first layer and append background layer
				$("li a").wrapInner('<span class="out"></span>').append(
						'<span class="bg"></span>');

				// loop each anchor and add copy of text content
				$("li a").each(
						function() {
							$('<span class="over">'+ $(this).text() + '</span>').appendTo(this);
						});
				$("li a").hover(function() {

					// this function is fired when the mouse is moved over
					$(".out", this).stop().animate({
						'top' : '40px'
					}, 250); // move down - hide
					$(".over", this).stop().animate({
						'top' : '0px'
					}, 250); // move down - show
					$(".bg", this).stop().animate({
						'top' : '0px'
					}, 120); // move down - show

				}, function() {

					// this function is fired when the mouse is moved off
					$(".out", this).stop().animate({
						'top' : '0px'
					}, 250); // move up - show
					$(".over", this).stop().animate({
						'top' : '-40px'
					}, 250); // move up - hide
					$(".bg", this).stop().animate({
						'top' : '-40px'
					}, 120); // move up - hide
				});

			});
</script>
<script type="text/javascript">
	$(function() {
		$('.module').hover(function() {
			var module = getModule(this);
			hoverModule(module);
		}, function() {
			clearHoverModule();
		});

		$('.module').click(function() {
			var module = getModule(this);
			chooseModule(module);
		});

		//单击退出按钮
		$("#exit").click(function() {
			if (confirm("确定退出系统?!")) {
				$.post("toLogin.action?m=logout", null, function(data) {
					if ($.trim(data) == "true") {
						window.location.href = "login.jsp";
					}
				}, 'text');
			}
		});

		$('.noselected').click(function() {
			chooseSecondMenu(this);
		});
		$('.noselected')
				.mouseover(
						function() {
							if (!$(this).hasClass('selected')) {
								$('.noselected').removeClass('hover');
								$(this).addClass('hover');
							}
							var top = $(this).offset().top;
							var left = $(this).offset().left;
							var height = $(this).height();
							var width = $(this).width();

							var $chlidren = $(this).next();
							$chlidren.css('width', width).css("left", left);

							// 根据浏览器 以及 浏览器 版本不同，设置top属性
							if (getOs() == "MSIE") {
								if (getIEVersion() == "IE 8.0") {

									if ($(this).parent().parent().attr('flag') == "0"
											&& $(this).parent()
													.prevAll('.menu').length == 0) {
										$chlidren.css("top", top + height + 24);
									} else {
										$chlidren.css("top", top + height);
									}
								} else {
									$chlidren.css("top", top + height);
								}

							} else {
								$chlidren.css("top", top + height + 24);
							}

							$chlidren.css('display', 'block');
						});

		$('.noselected').mouseout(function() {
			if ($.trim($(this).next().text()) == "") {
				$('.noselected').removeClass('hover');
			}
		});

		$('.childrenMenu div').click(function() {
			$('.childrenMenu div').removeClass();
			$(this).addClass('menuselect');
		});

		$('.childrenMenu div').mousemove(function() {
			$('.childrenMenu div').removeClass();
			$(this).addClass('menuhover');
		});

		$('.childrenMenu').parent().mouseleave(function() {
			$('.noselected').removeClass('hover');
			$('.childrenMenu').css('display', 'none');
		});

		$('.childrenMenu div').click(function(event) {
			event.stopPropagation();
			setMainPage($.trim($(this).attr('url')));
			chooseSecondMenu($(this).parent().prev());
		});

		$('.menu').click(function() {
			setMainPage($.trim($(this).attr('url')));
		});

		chooseModule('module4');
	});

	function chooseSecondMenu(menu) {
		var $opMenuLine = $(menu).parent().parent().find('.noselected');
		$opMenuLine.removeClass('hover');
		$opMenuLine.removeClass('selected');
		$(menu).addClass('selected');

		if (getOs() == "MSIE" && getIEVersion() == "IE 8.0"
				&& $(menu).parent().prevAll('.menu').length > 0
				&& $(menu).parent().parent().attr('flag') == "0") {
			$(menu).parent().parent().attr('flag', '1');
		}
	}

	function hiddenMenu() {
		$('.nav').css('display', 'none');
	}

	function chooseMenu(menuCode) {
		$('.nav').css('display', 'none');
		$('.nav[id="' + menuCode + '"]').css('display', 'block');
	}

	function choosePage(menuCode) {
		var url = $('.nav[id="' + menuCode + '"] .menu .selected').parent()
				.attr('url');
		setMainPage(url);
	}

	function setMainPage(url) {
		if (url != '') {
			$('#mainPage').attr('src', url);
		}
	}

	function getModule(moduleObj) {
		var num = $('.module').size();
		for (var i = 1; i <= num; i++) {
			if ($(moduleObj).hasClass('module' + i)) {
				return 'module' + i;
			}
		}
	}

	function getModuleNumber(module) {
		return module.substr(6);
	}

	function isModuleSelected(module) {
		var number = getModuleNumber(module);
		return $('.module' + number).hasClass('selectedmodule' + number) ? true
				: false;
	}

	function hoverModule(module) {
		if (!isModuleSelected(module)) {
			clearHoverModule();
			$('.' + module).addClass('hover' + module);
		}
	}

	function clearHoverModule() {
		var num = $('.module').size();
		for (var i = 1; i <= num; i++) {
			$('.module' + i).removeClass('hovermodule' + i);
		}
	}

	function chooseModule(module) {
		clearHoverModule();
		clearChooseModule();
		$('.' + module).addClass('selected' + module);

		if (module == 'module1') {
			alert("首页");
			return;
		} else if (module == 'module2') {
			alert("运行状态监控");
		} else if (module == 'module3') {
			$("#menus").hide();
			$("#menu1").show();
			setMainPage('unit/unitinfo');
		} else if (module == 'module4') {
			$("#menu1").hide();
			$("#menus").show();
			setMainPage('operations/meterModel');
		} else if (module == 'module5') {
			chooseMenu('XTQXGL');
			choosePage('XTQXGL');
		}

		$('#backline').show();
	}

	function clearChooseModule() {
		var num = $('.module').size();
		for (var i = 1; i <= num; i++) {
			$('.module' + i).removeClass('selectedmodule' + i);
		}
	}
</script>
<style type="text/css">
</style>
</head>

<body>
	<div class="banner">
		<div class="logo">
			<img src="/emcc-new/image/poms-system/logo.png" />
		</div>
		<div class="rightBanner">
			<div class="module module1">
				<div class="title">首页</div>
			</div>
			<div class="module module2">
				<div class="title">运行状态监控</div>
			</div>
			<div class="module module3">
				<div class="title">用能单位维护</div>
			</div>
			<div class="module module4">
				<div class="title">运维业务管理</div>
			</div>
			<div class="module module5">
				<div class="title">系统权限管理</div>
			</div>
			<div class="user" style="border: 0px red solid;">
				<div>${sessionScope.loginUser.loginName},您好</div>
				<div>${sessionScope.loginDate}</div>
				<div>
					<a href="">密码</a>&nbsp;&nbsp; <a id="exit"
						href="javascript:void(0);">退出</a>
				</div>
			</div>
		</div>
	</div>
	<div id="backline" style="width: 100%; height: 5px; background-color: #08589c;"></div>
	<div id="menu1" class="menu" style="border: 1px solid;display:none">
		<ul>
			<li><a href="#">企业信息维护</a></li>
			<li><a href="#">人员信息维护</a></li>
			<li><a href="#">测量仪表配置</a></li>
			<li><a href="#">通讯路由配置</a></li>
			<li><a href="#">能耗统计配置</a></li>
			<li><a href="#">能耗负荷配置</a></li>
		</ul>
	</div>
	<div id="menus" class="menu" style="border: 1px solid;">
		<ul>
			<li><a href="#">计量终端模型</a></li>
			<li><a href="#">接入测试管理</a></li>
			<li><a href="#">平台日志管理</a></li>
			<li><a href="#">设备运行维护</a></li>
			<li><a href="#">采集数据稽核</a></li>
			<li><a href="#">运维信息发布</a></li>
		</ul>
	</div>

	<!--  中间的主体,引用外部的 jsp-->
	<iframe src="runStatus/status" id="mainPage" class="ifrTwoPage ifrcss"
		scrolling="no" frameborder="0" marginheight="0"></iframe>
	<div id="foot" class="divfootcss" align="right">
		<br /> <font size="-1" face="新宋体" color="#666666">
			中惠元景能源科技(北京)股份有限公司 &nbsp;<a href="#">系统帮助</a>
		</font>
	</div>
</body>
</html>
