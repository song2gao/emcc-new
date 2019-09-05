<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title>运维管理统-首页</title>
		<link href="/emcc-new/css/CSS.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="/emcc-new/js/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" src="/emcc-new/js/time.js"></script>
		<script type="text/javascript" src="/emcc-new/js/base.js"></script>
<script type="text/javascript">
$(function() {
	$('.module').hover(
		function(){
			var module = getModule(this);
			hoverModule(module);
		},
		function(){
			clearHoverModule();
		});
	$('.module').click(function(){
		var module = getModule(this);
		chooseModule(module);
	});

	//单击退出按钮
	$("#exit").click(function() {
		if (confirm("确定退出系统?!")) {
			//$.post("toLogin.action?m=logout", null, function(data) {
				//if ($.trim(data) == "true") {
					//window.location.href = "login.jsp";
				//}
			//}, 'text');
			var thisurl=window.location.href;
			   	 		var href=thisurl.substring(0,thisurl.lastIndexOf("/"));
			   	 		window.location.href=href+"/"+"welcome.jsp";
		}
	});

	$('.noselected')
			.click(
					function() {
						chooseSecondMenu(this);
					});
	$('.noselected').mouseover(function() {
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
							&& $(this).parent().prevAll('.menu').length == 0) {
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
	var test=${sessionScope.loginType}
	if(test==1){
		chooseModule('module4');
	}else if(test==6){
		chooseModule('module3');
	}else{
		chooseModule('module5');
	}
	
});

function chooseSecondMenu(menu){
	var $opMenuLine = $(menu).parent().parent().find(
			'.noselected');
	$opMenuLine.removeClass('hover');
	$opMenuLine.removeClass('selected');
	$(menu).addClass('selected');
	
	if (getOs() == "MSIE"
			&& getIEVersion() == "IE 8.0"
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
	var url = $('.nav[id="' + menuCode + '"] .menu .selected').parent().attr(
			'url');
	setMainPage(url);
}

function setMainPage(url) {
	if (url != '') {
		$('#mainPage').attr('src', url);
	}
}

function getModule(moduleObj){
	var num = $('.module').size();
	for(var i=1;i<=num;i++){
		if($(moduleObj).hasClass('module' + i)){
			return 'module' + i;
		}
	}
}

function getModuleNumber(module){
	return module.substr(6);
}

function isModuleSelected(module){
	var number = getModuleNumber(module);
	return $('.module' + number).hasClass('selectedmodule' + number) ? true : false;
}

function hoverModule(module){
	if(!isModuleSelected(module)){
		clearHoverModule();
		$('.' + module).addClass('hover' + module);
	}
}

function clearHoverModule(){
	var num = $('.module').size();
	for(var i=1;i<=num;i++){
		$('.module' + i).removeClass('hovermodule' + i);
	}
}

function chooseModule(module){
	clearHoverModule();
	clearChooseModule();
	$('.' + module).addClass('selected' + module);
	
	if(module == 'module1'){
		hiddenMenu();
		//setMainPage('ywindex/index');
		$('#backline').hide();
		return;
	}else if(module == 'module2'){
		chooseMenu('YWZTJS');
		choosePage('YWZTJS');
	}else if(module == 'module3'){
		chooseMenu('YNDWWH');
		choosePage('YNDWWH');
	}else if(module == 'module4'){
		chooseMenu('YWYWGL');
		choosePage('YWYWGL');
	}else if(module == 'module5'){
		chooseMenu('XTQXGL');
		choosePage('XTQXGL');
	}
	$('#backline').show();
}
function clearChooseModule(){
	var num = $('.module').size();
	for(var i=1;i<=num;i++){
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
					<div class="title">
						首页
					</div>
				</div>
				<div class="module module2">
					<div class="title">
						运行状态监控
					</div>
				</div>
				<div class="module module3">
					<div class="title">
						用能单位维护
					</div>
				</div>
				<div class="module module4">
					<div class="title">
						运维业务管理
					</div>
				</div>
				<div class="module module5">
					<div class="title">
						系统权限管理
					</div>
				</div>
				<div class="user">
					<div>
						${sessionScope.loginUser.loginName},您好
					</div>
					<div>
						${sessionScope.loginDate}
					</div>
					<div>
						<a href="">密码</a>&nbsp;&nbsp;
						<a id="exit" href="javascript:void(0);">退出</a>
					</div>
				</div>
			</div>
		</div>

		<!-- 加载一级节点 -->
		<c:if
			test="${fn:length(sessionScope.loginMenu) > 0 and !empty sessionScope.loginMenu[0].children and fn:length(sessionScope.loginMenu[0].children) > 0}">
			<c:forEach var="menu" items="${sessionScope.loginMenu[0].children}"
				varStatus="firstMenuStatus">
				<div class="nav" id="${menu.mmModuleCode}" flag="0">
					<!-- 加载二级节点 -->
					<c:if
						test="${!empty menu.children and fn:length(menu.children) > 0}">
						<c:forEach var="secondMenu" items="${menu.children}"
							varStatus="secondMenuStatus">
							<div class="menu" url="${secondMenu.mmModuleUrl}">
								<c:if test="${secondMenuStatus.index==3}">
									<div class="noselected selected">
								</c:if>
								<c:if test="${secondMenuStatus.index!=3}">
									<div class="noselected">
								</c:if>
								<div class="left"></div>
								<div class="center">
									<div class="word">
										${secondMenu.mmModuleName}
									</div>
								</div>
								<div class="right">
									<c:if
										test="${!empty secondMenu.children and fn:length(secondMenu.children) > 0}">
										<img src="/emcc-new/image/poms-system/down20X24.png">
									</c:if>
								</div>
							</div>
							<!-- 加载三级节点 -->
							<c:if
								test="${!empty secondMenu.children and fn:length(secondMenu.children) > 0}">
								<div class="childrenMenu">
									<c:forEach var="thirdMenu" items="${secondMenu.children}">
										<div url="${thirdMenu.mmModuleUrl}">
											${thirdMenu.mmModuleName}
										</div>
									</c:forEach>
								</div>
							</c:if>
				</div>
			</c:forEach>
		</c:if>
		</div>
		</c:forEach>
		</c:if>
		<div id="backline" style="width: 100%; height: 5px; background-color: #08589c;">
		</div>

		<!--  中间的主体,引用外部的 jsp-->
		<iframe src="toBusinessIndex.action?m=toBusinessIndex" id="mainPage"
			class="ifrTwoPage ifrcss" scrolling="no" frameborder="0"
			marginheight="0"></iframe>
		<div id="foot" class="divfootcss" align="right">
			<br />
			<font size="-1" face="新宋体" color="#666666"> 北京有限公司
				&nbsp;<a href="#">系统帮助</a> </font>
		</div>
	</body>
</html>
