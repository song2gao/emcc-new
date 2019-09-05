<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<link href="/emcc-web/css/poms-system/CSS.css" rel="stylesheet" type="text/css" />
		<link href="/emcc-web/css/poms-system/yxztjk.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="/emcc-web/js/poms-system/jquery-1.7.2.js"></script>
		
<script>
//三级节点的JS
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
	</head>
	<body>
			<div id="main">				
				<div id="tab_con">
					<div id="tabs-1" class="div_text1 div_text div_moren"><br/>
					<!--<ul class="ulcss" id="tab">
					<li class="licss limov"><input type="button" value="运行任务工单" id="libtn1" class="liimgcss liimgcssmoren"/></li>
					<li class="licss limov"><input type="button" value="维护工作申报" id="libtn2" class="liimgcss"/></li>
					<li class="licss limov"><input type="button" value="表计更换处理" id="libtn3" class="liimgcss"/></li>
					</ul>
					 -->
						<div id="lis_1" style="display:block;">
						<iframe src="toSearchGD.action?m=toSearchPage" class="ifrcss" scrolling="no" frameborder="0" style="margin-top:20px; width:100%;"></iframe>
						</div>
						<div id="lis_2" style="display:block">
						<iframe src="toOperationSysLog.action?m=toYwgzsbPage" class="ifrcss" scrolling="no" frameborder="0" style="margin-top:10px; width:100px;;"></iframe>
						</div>
						<div id="lis_3" style="display:block">
							<iframe src="toTerminalDevice.action?m=toTerminalDevicePage" class="ifrcss" scrolling="no" frameborder="0" style="margin-top:10px; 100%;;"></iframe>
						</div>
					</div>
					
					<div id="tabs-2" class="div_text1 div_text">
						<img src="/emcc-web/image/poms-system/运维状态监控-故障记录告警-.jpg" style="margin-top:10px; width:1280px;"/>
					</div>
					
					<div id="tabs-3" class="div_text1 div_text">
						<img src="/emcc-web/image/poms-system/运维状态监控-实时数据监视-.jpg" style="width:1280px;"/>
					</div>
				</div>
		</div>
	</body>
</html>