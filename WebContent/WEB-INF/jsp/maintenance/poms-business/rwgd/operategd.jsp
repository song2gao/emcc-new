<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>处理工单</title>
<script type="text/javascript" src="/emcc-web/js/poms-system/jquery-1.7.2.js"></script>
<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/default/easyui.css"></link>
<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/icon.css"></link>
<script type="text/javascript" src="/emcc-web/js/poms-business/jquery.easyui.min.js"></script>
<style>
tr{height:50px;}
</style>
</head>
<body>
<input value='<%=request.getAttribute("gdId") %>' type='hidden' id='gdId'/>
<div  style="border:1px solid #000000; font-size:13px; margin-left:20px; height:500px;">
	<div  style="margin-top:10px;"><b>&nbsp;&nbsp;任务工单处理</b></div>
	<hr />
	<table>
		<tbody>
			<tr><td width="100px;">&nbsp;&nbsp;任务类型：</td><td><span id="oasSheettype"></span></td></tr>
			<tr><td>&nbsp;&nbsp;处理人：</td><td><span id="operater"></span></td></tr>
			<tr><td>&nbsp;&nbsp;问题描述：</td><td><span id="content"></span></td></tr>
			<tr><td>&nbsp;&nbsp;处理过程：</td><td><textarea rows="4" cols="25" id="clgc"></textarea></td></tr>
			<tr><td>&nbsp;&nbsp;备注:</td><td><textarea rows="4" cols="25" id="bz"></textarea></td></tr>
			<tr><td>&nbsp;&nbsp;是否完成：</td><td><input type="radio" name="iscomplete" id="iscomplete_1" checked="checked" value="1"/>是 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="iscomplete" value="2" id="iscomplete_2"/>否</td></tr>
			<tr><td></td><td><a class="easyui-linkbutton" id="submitgd" name="submitgd">&nbsp;&nbsp;提&nbsp;&nbsp;交&nbsp;&nbsp;</a></td></tr>
		</tbody>
	</table>
</div>
<script type="text/javascript">
	$(function(){
		$.ajax({
			url: "toOperateGD.action?m=toSearchOperateGD",
			type:"POST",
			dataType:"json",
			timeout: 10000,
			data:{
				"gdId":$("#gdId").val(),
				}, success: function(data){
					var operater = data.pomsOperationAssignmentSheet.pomsUsersManagement.loginName;
					var type = data.pomsOperationAssignmentSheet.oasSheetType;
					if(type ==1){$("#oasSheettype").text('手动');}
					else if(type ==2){$("#oasSheettype").text('系统');}
					$("#operater").text(operater);
					$("#content").text(data.pomsOperationAssignmentSheet.proposeContent);
				}
		});
	});
	
	$("#submitgd").click(function(){
		var clgcStr = $("#clgc").val();
		if(clgcStr == ""){
			alert("处理过程不能为空!");
			return false;
		}
		var iscomplete = ShowTemp();
		$.ajax({
		url: "toOperateGD.action?m=toOperateGD",
		type:"POST",
		dataType:"json",
		timeout: 1000,
		data:{
			"gdId":$("#gdId").val(), //工单id
			"iscomplete":iscomplete, //是否完成
			"clgc":$("#clgc").val(), //处理过程
			"bz":$("#bz").val() //备注
			}, success: function(data){
				if(data.flag == true){
					alert("提交成功");
					window.close();
				}
				else{
					alert("提交失败");
					window.close();
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