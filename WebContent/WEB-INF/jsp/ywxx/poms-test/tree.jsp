<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>树形组件</title>
    
	<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">  
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">  
	<script type="text/javascript" src="easyui/jquery-1.7.2.min.js"></script>  
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    This is my JSP page. <br>
  </body>
</html>
