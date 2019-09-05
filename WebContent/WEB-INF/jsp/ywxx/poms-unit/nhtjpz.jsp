<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type"
			content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
	</head>
	<link href="/emcc-web/css/poms-unit/nhtjpz.css" rel="stylesheet" type="text/css" />
	<link href="/emcc-web/css/poms-unit/bdcss.css" rel="stylesheet" type="text/css" />	
	<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/default/easyui.css"></link>
	<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/icon.css"></link>
	<script type="text/javascript"	src="/emcc-web/js/poms-system/jquery-1.7.2.js"></script>
	<script type="text/javascript"	src="/emcc-web/js/poms-business/jquery.easyui.min.js"></script>
	<script type="text/javascript"	src="/emcc-web/js/page.js"></script>
	<script type="text/javascript">
		
		// 根据点击的Tabs 、加载对应的内容
	$(function() {	
		$('#tt').tabs({
			onSelect:function(title){
				if(title=="用能设备"){
					$('#ifr_1').attr("src","Terminal.action?m=load_ynxt");
				}else if(title=="用能区域"){
					$('#ifr_2').attr("src","Terminal.action?m=load_ynwz");
				}else if(title=="用能单位"){
					$('#ifr_3').attr("src","Terminal.action?m=load_ynzz");
				}else if(title=="能耗分项"){
					$('#ifr_4').attr("src","Terminal.action?m=load_ynfx");
				}else if(title=="自定义"){
					$('#ifr_5').attr("src","Terminal.action?m=load_zdy");
				}
			}
		});
	});
	</script>

	<body>
		<div id="main" class="xtqygl_main" style="margin-left: -7px;">
				<div id="tt" class="easyui-tabs" style="width:1280px;height:545px;">  
				    <div id="div_1" title="用能设备">  
				    	<iframe id="ifr_1" src="Terminal.action?m=load_ynxt" scrolling="no" frameborder="0" marginheight="0" class="ifthreecss"></iframe>
				    </div>  
				    <div id="div_2" title="用能区域"  style="overflow:auto;">  
				        <iframe id="ifr_2" src="" scrolling="no" frameborder="0" marginheight="0" class="ifthreecss"></iframe>  
				    </div>  
				    <div id="div_3" title="用能单位"  style="border: false;">  
				        <iframe id="ifr_3" src="" scrolling="no" frameborder="0" marginheight="0" class="ifthreecss"></iframe> 
				    </div> 
				    <div id="div_4" title="能耗分项" style="overflow:auto;">  
				        <iframe id="ifr_4" src="" scrolling="no" frameborder="0" marginheight="0" class="ifthreecss"></iframe> 
				    </div>
				    <div id="div_5" title="自定义" style="overflow:auto;">  
				        <iframe id="ifr_5" src="" scrolling="no" frameborder="0" marginheight="0" class="ifthreecss"></iframe> 
				    </div> 				      
				</div> 
			</div>
	</body>
</html>