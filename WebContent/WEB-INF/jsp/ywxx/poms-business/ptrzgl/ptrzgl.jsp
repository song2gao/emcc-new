<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'ptrzgl.jsp' starting page</title>
    
  </head>
  <link href="/emcc-web/css/poms-system/CSS.css" rel="stylesheet" type="text/css" />
  <link href="/emcc-web/css/poms-system/yxztjk.css" rel="stylesheet" type="text/css"/>
  <link href="/emcc-web/css/poms-business/ptrzgl.css" rel="stylesheet" type="text/css"/>
  <script type="text/javascript" src="/emcc-web/component/jquery-easyui/jquery-1.7.2.min.js"></script>
  <script type="text/javascript" src="/emcc-web/component/jquery-easyui/jquery.easyui.min.js"></script>
  
   <script type="text/javascript">
  	//选项卡
  	$(function(){
  		$(".liimgcss,.liimgcss").hover(function(){
				$(this).attr("style","cursor:pointer");
			});	
		 $('#libtn1').click(function(){
			$("#libtn2").css("background","url(/emcc-web/image/poms-system/three_menuBlue.png)");
			$(this).css("background","url(/emcc-web/image/poms-system/three_menu.png)");
			this.className = "liimgcss liimgcssmoren";
			$("#libtn2").addClass("liimgcss");
			$("#libtn2").removeClass("liimgcssmoren");
			$("#lis_1").attr("style","display:block");$("#lis_2").attr("style","display:none");
		 });	
		  	$('#libtn2').click(function(){
		 	$("#libtn1").css("background","url(/emcc-web/image/poms-system/three_menuBlue.png)");
			$(this).css("background","url(/emcc-web/image/poms-system/three_menu.png)");
			this.className = "liimgcss liimgcssmoren";
			$("#libtn1").addClass("liimgcss");
			$("#libtn1").removeClass("liimgcssmoren");
			$("#lis_2").attr("style","display:block");$("#lis_1").attr("style","display:none");
		 });    
    });
  </script>
  <body>
		<div>
			<div id="tab_con">
				<div id="tabs-1" class="div_text1 div_text div_moren">
				<!--  	<ul class="ulcss" id="tab">
						<li class="licss limov"><input type="button" value="运维日志" id="libtn1" class="liimgcss liimgcssmoren"/></li>
						<li class="licss limov"><input type="button" value="操作日志" id="libtn2" class="liimgcss"/></li>
					</ul><br/>
					-->
					<div id="lis_1" style="display:block"><br/>
						<iframe src="toCzrz.action?m=toCalendar" id="ifrecss" scrolling="no" frameborder="0" marginheight="0"></iframe>
					</div>
					<div id="lis_2" style="display:block"><br/>
						<iframe src="toCzrz.action?m=toCzrz" id="ifrecss" scrolling="no" frameborder="0" marginheight="0"></iframe>
					</div>
				</div>
			</div>
		</div>
  </body>
</html>
