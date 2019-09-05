<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>实时状态监视</title>
	<link href="/emcc-web/css/poms-system/CSS.css" rel="stylesheet" type="text/css" />
	<link href="/emcc-web/css/poms-system/yxztjk.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="/emcc-web/js/poms-system/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="/emcc-web/js/other.js"></script>  
  </head>
  <script type="text/javascript">
  		$(function(){
		$(".liimgcss,.liimgcss").hover(function(){
				$(this).attr("style","cursor:pointer");
			});	
		 $('#libtn1').click(function(){
			$("#libtn3").attr("style","background:url(/emcc-web/image/poms-system/three_menuBlue.png)");
			$("#libtn2").attr("style","background:url(/emcc-web/image/poms-system/three_menuBlue.png)");
			$(this).attr("style","background:url(/emcc-web/image/poms-system/three_menu.png)");
			this.className = "liimgcss liimgcssmoren";
			$("#libtn2").addClass("liimgcss");
			$("#libtn3").addClass("liimgcss");
			$("#libtn2").removeClass("liimgcssmoren");
			$("#libtn3").removeClass("liimgcssmoren");
			$("#lis_1").attr("style","display:block");$("#lis_2").attr("style","display:none");$("#lis_3").attr("style","display:none");
		 });	
		  $('#libtn2').click(function(){
			$("#libtn1").attr("style","background:url(/emcc-web/image/poms-system/three_menuBlue.png)");
			$("#libtn3").attr("style","background:url(/emcc-web/image/poms-system/three_menuBlue.png)");
			$(this).attr("style","background:url(/emcc-web/image/poms-system/three_menu.png)");
			$('#liimg2-1').attr("src","/emcc-web/image/poms-system/three_01.png");
			$('#liimg2-2').attr("src","/emcc-web/image/poms-system/three_03.png");
			this.className = "liimgcss liimgcssmoren";
			$("#libtn1").addClass("liimgcss");
			$("#libtn3").addClass("liimgcss");
			$("#libtn1").removeClass("liimgcssmoren");
			$("#libtn3").removeClass("liimgcssmoren");
			$("#lis_2").attr("style","display:block");$("#lis_1").attr("style","display:none");$("#lis_3").attr("style","display:none");
		 });
		  $('#libtn3').click(function(){
			$("#libtn1").attr("style","background:url(/emcc-web/image/poms-system/three_menuBlue.png)");
			$("#libtn2").attr("style","background:url(/emcc-web/image/poms-system/three_menuBlue.png)");
			$(this).attr("style","background:url(/emcc-web/image/poms-system/three_menu.png)");
			this.className = "liimgcss liimgcssmoren";
			$("#libtn1").addClass("liimgcss");
			$("#libtn1").removeClass("liimgcssmoren");
			$("#libtn2").addClass("liimgcss");
			$("#libtn2").removeClass("liimgcssmoren");
			$("#lis_3").attr("style","display:block");$("#lis_1").attr("style","display:none");$("#lis_2").attr("style","display:none");
		 });	
		});
  </script>
  <body>
 		<div id="main">				
				<div id="tab_con">
					<div id="tabs-1" class="div_text1 div_text div_moren"><br/><br/>
						<div id="lis_1" style="display:block;">
							<iframe src="toConRecordAlarm.action?m=toQzjztJump" class="ifrcss" scrolling="no" frameborder="0" style="margin-top:10px; width:100%;"></iframe>
						</div>
						<div id="lis_2" style="display:block">
							<iframe src="toConRecordAlarm.action?m=toCJqztJump" class="ifrcss" scrolling="no" frameborder="0" style="margin-top:10px; width:100%;"></iframe>
						</div>
						<div id="lis_3" style="display:block">
							<iframe src="toConRecordAlarm.action?m=toJlzdJump" class="ifrcss" scrolling="no" frameborder="0" style="margin-top:10px; width:100%;"></iframe>
						</div>
					</div>
				</div>
		</div>
  </body>
</html>
