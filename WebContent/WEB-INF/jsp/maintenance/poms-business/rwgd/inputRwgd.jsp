<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>录入任务工单</title>
<script type="text/javascript" src="/emcc-web/js/poms-business/jquery-1.7.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/gray/easyui.css"></link>
<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/icon.css"></link>
<script type="text/javascript" src="/emcc-web/js/poms-business/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/emcc-web/js/poms-business/jsonToTime.js"></script>
<style>
td{padding-top: 20px;}
span{font-size: 13px;}
select{width:150px;}
</style>
</head>
<body>
	<div  style="border:1px solid #000000; font-size:13px; margin-left:20px; margin-top:10px;">
	<div  style="margin-top:10px;"><b>&nbsp;&nbsp;申报信息</b></div>
	<hr />
	<table>
		<tbody>
			<tr><td width="150px;">&nbsp;&nbsp;申报人：</td><td><span id="people"><%=request.getAttribute("userName") %></span></td></tr>
			<tr><td>&nbsp;&nbsp;申报时间：</td><td><span id="proposeTime"></span></td></tr>
			<tr><td>&nbsp;&nbsp;工单内容：</td><td><textarea rows="4" cols="45" id="gdContent"></textarea></td></tr>
			<tr><td>&nbsp;&nbsp;负责人：</td><td><input id="userNameId" type="hidden"/><input id="userName"  style="width:120px;" disabled="disabled" value='点击右侧按钮选择'/><button id="userhref" style="width:30px;">...</button></td></tr>
			<tr><td>&nbsp;&nbsp;优先级:</td><td>
				<select name="oasPriority" id="oasPriority">
					<option value="1" selected="selected">一般</option>
					<option value="2">紧急</option>
			 	</select>
			</td></tr>
			<tr><td>&nbsp;&nbsp;要求完成时间：</td><td><input name="complteTime" id="complteTime" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" style="width: 150px;"/></td></tr>
			<tr><td></td><td><a class="easyui-linkbutton" id="submitgd" name="submitgd">&nbsp;&nbsp;确&nbsp;&nbsp;认&nbsp;&nbsp;</a></td></tr>
		</tbody>
	</table>
	<br />
</div>
<div id="userDiv" style="display:none;"></div>
<script type="text/javascript">
var userNameStr; //被选中的负责人名称
$(function(){
	//页面加载时给提交时间赋值为当前时间
	var d = new Date();
	str = d.getFullYear()+'-'+(d.getMonth() + 1<10?('0'+(d.getMonth() + 1)):d.getMonth() + 1)+'-'+(d.getDate()<10?('0'+d.getDate()):d.getDate())
	$("#complteTime").datebox('setValue',str);
	$("#proposeTime").text(str);
	
	//点击查询按钮时，根据条件查询信息
	$("#submitgd").click(function(){
		var conStr = $("#gdContent").val();
		var uStr = $("#userName").val();
		if(conStr == ""){
			$.messager.alert("提示","工单内容不能为空！","info",null);
			return false;
		}
		if(uStr == "点击右侧按钮选择"){
			

			return false;
		}
		//验证提交时间是否是日期格式(yyyy-mm-dd)
		var nowDate = $("#complteTime").datebox('getValue');
		var date_ymd= /^(\d{4})-(0\d{1}|1[0-2])-(0\d{1}|[12]\d{1}|3[01])$/; 
		var r = nowDate.match(date_ymd);
		if(r == null){
			$.messager.alert("提示","提交时间输入错误，请重新输入！","info",null);
			return false;
		}
		
		//确认提交申报 
		$.ajax({
		url: "toSearchGD.action?m=toInputSystemGD",
		type:"POST",
		dataType:"json",
		timeout: 1000,
		data:{
			"people":$("#people").text(), //申报人
			"proposeTime":$("#proposeTime").text(), //申报时间
			"gdContent":$("#gdContent").val(), //工单内容
			"umId":$("#userNameId").val(), //负责人
			"oasPriority":$("#oasPriority").val(),
			"complteTime":$("#complteTime").datebox('getValue')
			}, success: function(data){
				if(data.flag == true){
					$.messager.alert("提示","提交成功!","info",function(){window.parent.$('#iframeInputDiv').dialog('close');});
				}
				else{
					$.messager.alert("提示","提交失败!","info",function(){window.parent.$('#iframeInputDiv').dialog('close');});
				}
			}
		});
	});
	
	//获取所有的用户信息
	$.ajax({
		url: "toSearchGD.action?m=toSearchAllUser",
		type:"POST",
		dataType:"json",
		timeout: 1000,
		success: function(data){
			if(data.size == 0){
				$.messager.alert("提示","当前系统没有用户!","info",null);
			}
			else{
				$.each(data.list, function(i,item) {
					//动态为dialog生成radio
					var div = $("<div style='width:90px; float:left;'>");
					var radio = $("<input>");
					radio.attr("type","radio");
					radio.attr("id",item[1]);
					radio.attr("name","uName")
					radio.attr("value",item[0]);
					div.append(radio);
					div.append(item[1]);
					
					$("#userDiv").append(div);
				});
			}
		}
	});
});

//点击获取所用用户信息
$("#userhref").click(function(){
	$("#userDiv").attr("style","display:black;");
	$('#userDiv').dialog({
		title: 'userName',
		width: 300,
		height: 300,
		closed: false,
		cache: false,
		modal: true,
		minimizable: false,
		resizable: true,
		buttons: [{ 
			text: '提交',  
			handler: function() { 
				var radioValue = ShowTemp();
				$("#userNameId").attr("value",radioValue); 
				$("#userName").attr("value",userNameStr);  
				$('#userDiv').dialog('close');
			} 
		}]
	});
});

//获取选中的radio值
function ShowTemp()
{
	var complete;
   	var eless = document.getElementsByName("uName");
   	for(var i=0;i<eless.length;i++)
   	{
    	if(eless[i].checked){
     		complete=eless[i].value;
     		userNameStr = eless[i].id;
     		break;
    	}
   	}
   	return complete;
}

function myformatter(date){
	var y = date.getFullYear();
    var m = date.getMonth()+1;
    var d = date.getDate();
    return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
}

function myparser(s){
	if (!s) return new Date();
    var ss = (s.split('-'));
    var y = parseInt(ss[0],10);
    var m = parseInt(ss[1],10);
    var d = parseInt(ss[2],10);
    if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
    	return new Date(y,m-1,d);
    } else {
        return new Date();
    }
}
</script>
</body>
</html>