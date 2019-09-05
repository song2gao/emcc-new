<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>添加运维信息</title>
<script type="text/javascript" src="/emcc-web/js/poms-system/jquery-1.7.2.js"></script>
<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/default/easyui.css"></link>
<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/icon.css"></link>
<script type="text/javascript" src="/emcc-web/js/poms-business/jquery.easyui.min.js"></script>
<link rel="stylesheet" type="text/css" href="/emcc-web/js/poms-business/ueditor/themes/default/css/ueditor.css"/> 
<script type=text/javascript src="/emcc-web/js/poms-business/ueditor/ueditor.config.js"></script>  
<script type=text/javascript src="/emcc-web/js/poms-business/ueditor/ueditor.all.js"></script> 


<style>
tr{height:35px;}
span{font-size: 13px;}
input{border:1px solid #99cdff; width:130px;}
td{text-align:left;}
</style>
</head>
<body>
<center>
<div  style="font-size:13px; margin-left:20px; ">
<div style="height: 20px;"></div>
	<table style=" border:1px solid #000" cellspacing="0px" cellpadding="0px">
		<tbody>
			<tr><td style="border-bottom: 1px solid #000;"><h3>&nbsp;&nbsp;添加运维信息</h3></td><td style="border-bottom: 1px solid #000"></td></tr>
			<tr><td width="120px;">&nbsp;&nbsp;用户：</td><td><span id="userName"><%=request.getAttribute("userName") %></span></td></tr>
			<tr><td>&nbsp;&nbsp;主题：</td><td><input type="text" id="title" name="title"/></td></tr>
			<tr><td>&nbsp;&nbsp;模块：</td><td><select id="module" name="module"><option value="0" selected="selected">通告</option></select></td></tr>
			<tr><td width="120px;">&nbsp;&nbsp;编辑器：</td><td width="830px;"><script id="myEditor" type="text/plain"></script></td></tr>
			<tr><td></td><td style="text-align: center;"><a class="easyui-linkbutton" id="saveButton" name="saveButton">&nbsp;&nbsp;保&nbsp;&nbsp;存&nbsp;&nbsp;</a></td></tr>
		</tbody>
	</table>
</div> 
</center>
<script type="text/javascript">
	$(function(){
		var editor = new UE.ui.Editor();  
    	editor.render("myEditor");
    });
	
	
	$("#saveButton").click(function(){
		var title = $("#title").val();
		if(title == ""){
			$.messager.alert("提示","标题不能为空!","info",null);
			return false;
		}
		var content = UE.getEditor("myEditor").getContent();
		if(content == ""){
			$.messager.alert("提示","内容 不能为空!","info",null);
			return false;
		}
		$.ajax({
		url: "toInfoPublish.action?m=toAddInfoPublish",
		type:"POST",
		dataType:"json",
		timeout: 1000,
		data:{
			"title":$("#title").val(), //主题
			"content":content, //编辑内容
			"module":$("#module").val() //模块
			}, success: function(data){
				if(data.flag == true){
					$.messager.alert("提示","提交成功","info",function(){window.parent.$('#iframeAddDiv').dialog('close'); window.parent.$("#gd").datagrid("loadData",[]); window.parent.GetData();});
				}
				else{
					$.messager.alert("提示","提交失败","info",function(){window.parent.$('#iframeAddDiv').dialog('close'); });
				}
			}
		});
	});
	
//获取选中的radio值
function ShowTemp()
{
	var complete;
   	var eless = document.getElementsByName("iscomplete");
   	for(var i=0;i<eless.length;i++)
   	{
    	if(eless[i].checked){
     		complete=eless[i].value;
     		break;
    	}
   	}
   	return complete;
}

	
</script>
</body>
</html>