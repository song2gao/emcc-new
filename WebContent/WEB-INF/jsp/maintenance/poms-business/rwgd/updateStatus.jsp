<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>表计状态更换</title>
<script type="text/javascript" src="/emcc-web/js/poms-system/jquery-1.7.2.js"></script>
<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/default/easyui.css"></link>
<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/icon.css"></link>
<script type="text/javascript" src="/emcc-web/js/poms-business/jquery.easyui.min.js"></script>
<style>
tr{height:35px;}
select{width:150px;}
</style>
</head>
<body>
<span  id='deviceId' style="display: none;"><%=request.getAttribute("deviceId") %></span>
<span  id='dn' style="display: none;"><%=request.getAttribute("deviceNames") %></span>
<div  style="border:1px solid #000000; font-size:13px; margin-left:20px; margin-top:20px;">
	<div  style="margin-top:10px;"><b>&nbsp;&nbsp;表计状态更换</b></div>
	<hr/>
	<table>
		<tbody>
			<tr><td width="120px;">&nbsp;&nbsp;变更人：</td><td><span id="people"><%=request.getAttribute("people") %></span></td></tr>
			<tr><td>&nbsp;&nbsp;计量终端设备：<input id="deviceName" name="deviceName" style="display: none;" value="<%=request.getAttribute("deviceNames") %>"/></td><td><span id="deviceName"><%=request.getAttribute("deviceNames") %></span></td></tr>	
			<tr><td>&nbsp;&nbsp;状态：</td><td>
				<select id="status">
					<option value="0" selected="selected">新增</option>
					<option value="1">测试</option>
					<option value="2">测通</option>
					<option value="3">正常</option>
					<option value="4">停用</option>
				</select>
			</td></tr>
			<tr><td>&nbsp;&nbsp;状态变更原因:</td><td>
				<select id="reason" name="reason">
					<option value="0" selected="selected">更换</option>
					<option value="1">检修</option>
					<option value="2">检定</option>
					<option value="3">报废</option>
					<option value="4">新增</option>
					<option value="5">测试</option>
				</select>
			</td></tr>
			<tr><td>&nbsp;&nbsp;备注:</td><td><textarea rows="4" cols="35" id="bz"></textarea></td></tr>
			<tr><td>&nbsp;</td><td><a class="easyui-linkbutton" id="saveButton" name="saveButton">&nbsp;&nbsp;保&nbsp;&nbsp;存&nbsp;&nbsp;</a></td></tr>
		</tbody>
	</table>
</div>
<script type="text/javascript">
	var statusInfo = <%= request.getAttribute("statusInfo")%>;
	$("#status option[value='"+statusInfo+"']").attr("selected",true);
	$("#saveButton").click(function(){
		$.ajax({
		url: "toAlertDevice.action?m=toUpdateDeviceStatus",
		type:"POST",
		dataType:"json",
		timeout: 1000,async:false,
		data:{
			"deviceId":$("#deviceId").text(),
			"dn":$("#dn").text(),
			"status":$("#status").val(), //表计状态
			"reason":$("#reason").val(), //变更原因
			"bz":$("#bz").val()
			}, success: function(data){
				//alert("S U C C");
				//var obj = eval('(' + data.tad + ')'); 
				//alert(obj);
				if(data.tad==1){
					$.messager.alert("提示","保存成功,已变更将计量表计状态。","info",function(){window.parent.$('#iframeUpdateStatusDiv').dialog('close'); window.parent.$("#gd").datagrid("loadData",[]); window.parent.GetData();window.parent.$("#statusAlter").datagrid("loadData",[]); window.parent.GetData1();});
				}
				else{
					$.messager.alert("提示","保存失败,因设备故障或离线无法变更将计量表计状态。","info",function(){window.parent.$('#iframeUpdateStatusDiv').dialog('close'); });
				}
			}
		});
	});

	
</script>
</body>
</html>