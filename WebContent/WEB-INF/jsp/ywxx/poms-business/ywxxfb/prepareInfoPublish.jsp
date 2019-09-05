<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>预览运维信息</title>
<script type="text/javascript" src="/emcc-web/js/poms-system/jquery-1.7.2.js"></script>
<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/default/easyui.css"></link>
<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/icon.css"></link>
<script type="text/javascript" src="/emcc-web/js/poms-business/jquery.easyui.min.js"></script>
<link rel="stylesheet" type="text/css" href="/emcc-web/js/poms-business/ueditor/themes/default/css/ueditor.css"/> 
<script type=text/javascript src="/emcc-web/js/poms-business/ueditor/ueditor.config.js"></script>  
<script type=text/javascript src="/emcc-web/js/poms-business/ueditor/ueditor.all.js"></script>
<style>
tr{height:50px;}
span{font-size: 13px;}
input{border:1px solid #99cdff; width:130px;}
td{text-align:left;}
</style>
</head>
<body><center>
<div  style="font-size:13px; margin-left:20px;">
<div style="height: 100px;"></div>
<input type="hidden" id="id" name="id" value="<%=request.getAttribute("id") %>"/>
<input type="hidden" id="ispublish" name="ispublish" value="<%=request.getAttribute("ispublish") %>"/>
	<table style="width:800px; border:1px solid #000" cellspacing="0px" cellpadding="0px">
		<tbody>
			<tr><td style="border-bottom: 1px solid #000"><h3>&nbsp;&nbsp;预览运维信息</h3></td><td style="border-bottom: 1px solid #000"></td></tr>
			<tr><td width="120px;">&nbsp;&nbsp;用户：</td><td><span id="userName"><%=request.getAttribute("userName") %></span></td></tr>
			<tr><td>&nbsp;&nbsp;主题：</td><td><span id="title"></span></td></tr>
			<tr><td>&nbsp;&nbsp;模块：</td><td><span id="module"></span></td></tr>
			<tr><td>&nbsp;&nbsp;内容：</td><td width="650px;"><div id="myEditor"></div></td></tr>
			<tr><td></td><td style="text-align: center;"><a class="easyui-linkbutton" id="publishButton" name="publishButton">&nbsp;&nbsp;发&nbsp;&nbsp;布&nbsp;&nbsp;</a></td></tr>
		</tbody>
	</table>
</div>
</center>
 

<script type="text/javascript">
	$(function(){
		$.ajax({
		url: "toInfoPublish.action?m=toSearchInfoPublishById",
		type:"POST",
		dataType:"json",
		timeout: 1000,
		data:{
			"id":$("#id").val()
			}, success: function(data){
				$("#title").text(data.publish.mipTitle);
				$("#myEditor").html(data.publish.mipContent);
				if(data.publish.mipModules == 0){
					$("#module").text("通告");
				}
			}
		});
		
	});
	$("#publishButton").click(function(){
		if($("#ispublish").val() == 1){
			$.messager.alert("提示","此信息已发布，不能再次发布！","info",null);
		}
		else {
			$.ajax({
			url: "toInfoPublish.action?m=toPrepareInfoPublish",
			type:"POST",
			dataType:"json",
			timeout: 1000,
			data:{
				"id":$("#id").val(),
				}, success: function(data){
					if(data.flag == true){
						$.messager.alert("提示","发布成功","info",function(){window.parent.$('#iframePreparedDiv').dialog('close'); window.parent.$("#gd").datagrid("loadData",[]); window.parent.GetData();});
					}
					else{
						$.messager.alert("提示","发布失败","info",function(){window.parent.$('#iframePreparedDiv').dialog('close'); });
					}
				}
			});
		}
	});

	
</script>
</body>
</html>