<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>计量终端模型</title>
    <link href="/emcc-web/css/poms-system/CSS.css" rel="stylesheet" type="text/css" ></link>
	<link href="/emcc-web/css/poms-system/yxztjk.css" rel="stylesheet" type="text/css"></link>
	<link href="/emcc-web/css/poms-business/ptrzgl.css" rel="stylesheet" type="text/css"></link>
	<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/default/easyui.css"></link>
	<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/icon.css"></link>
	<script type="text/javascript" src="/emcc-web/js/poms-business/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src="/emcc-web/js/poms-business/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/emcc-web/js/page.js"></script>
	<script type="text/javascript" src="/emcc-web/js/poms-business/jsonToTime.js"></script>   
  </head>
  <script type="text/javascript">
  </script>
  <body>
		<iframe src="toJlzd.action?m=toJlzdmx_model" style="width: 100%;" id="ifrecsszd" scrolling="no" frameborder="0" marginheight="0"></iframe>
		<!--<iframe src="toJlzd.action?m=toJlzdmx_points" id="ifrecsszd" scrolling="no" frameborder="0" marginheight="0"></iframe>-->
  </body>
</html>
