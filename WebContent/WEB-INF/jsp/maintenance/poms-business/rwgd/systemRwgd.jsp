<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript" src="/emcc-web/js/poms-business/jquery-1.7.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/gray/easyui.css"></link>
<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/icon.css"></link>
<script type="text/javascript" src="/emcc-web/js/poms-business/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/emcc-web/js/poms-business/jsonToTime.js"></script>
<script type="text/javascript" src="/emcc-web/js/page.js"></script>
<style>
td{padding-top: 20px;}
span{font-size: 13px;}
select{width:150px;}
</style>
</head>
<body>
	<span  id='gdId' style="display: none;"><%=request.getAttribute("idStr")%></span>
<div  style="border:1px solid #000000; font-size:13px; margin-left:20px;">
	<div  style="margin-top:10px;"><b>&nbsp;&nbsp;工单信息</b></div>
	<hr />
	<table>
		<tbody>
			<tr><td width="150px;">&nbsp;&nbsp;工单类型：</td><td width="300px;"><span id="oasSheettype">系统</span></td></tr>
			<tr><td>&nbsp;&nbsp;申报人：</td><td><span id="people"><%=request.getAttribute("userName") %></span></td></tr>
			<tr><td>&nbsp;&nbsp;申报时间：</td><td><span id="proposeTime"></span></td></tr>
			<tr><td>&nbsp;&nbsp;要求完成时间：</td><td><input name="complteTime" id="complteTime" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" style="width: 150px;"/></td></tr>
			<tr><td>&nbsp;&nbsp;工单内容：</td><td><table id="gdcontent"></table></td></tr>
			<tr><td>&nbsp;&nbsp;优先级:</td><td>
				<select name="oasPriority" id="oasPriority">
					<option value="1" selected="selected">一般</option>
					<option value="2">紧急</option>
			 	</select>
			</td></tr>
			<tr><td>&nbsp;&nbsp;相关责任人：</td><td><input id="userNameId" type="hidden"/><input id="userName"  style="width:120px;" disabled="disabled" value='点击右侧按钮选择'/><button id="userhref" style="width:30px;">...</button></td></tr>
			<tr><td></td><td><a class="easyui-linkbutton" id="submitgd" name="submitgd">&nbsp;&nbsp;工单确认&nbsp;&nbsp;</a></td></tr>
			<tr style="width: 20px;"></tr>
		</tbody>
	</table>
	<br/>
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
	
	$('#gdcontent').datagrid({
	rownumbers: true, //每一行的行号
	fitColumns: true, //自适应列的大小
	singleSelect: true,
	fit: false,
	columns: [[
	{ title: '故障预警编码', field: 'oslBugCodes', width: 100}, 
	{ title: '问题内容', field: 'oslBugContent', width: 100 }
	]],
	striped:true
	}); 
	//获取后台数据
	$("#gdcontent").datagrid("loadData",[]); 
	GetData();
	
	
	//点击查询按钮时，根据条件查询信息
	$("#submitgd").click(function(){
		var uStr = $("#userName").val();
		//验证提交时间是否是日期格式(yyyy-mm-dd)
		var nowDate = $("#complteTime").datebox('getValue');
		var date_ymd= /^(\d{4})-(0\d{1}|1[0-2])-(0\d{1}|[12]\d{1}|3[01])$/; 
		var r = nowDate.match(date_ymd);
		if(r == null){
			$.messager.alert("提示","提交时间输入错误，请重新输入！","info",null);
			return false;
		}
		if(uStr == "点击右侧按钮选择"){
			$.messager.alert("提示","负责人不能为空！","info",null);
			return false;
		}
		//获取后台数据
		var rows = $("#gdcontent").datagrid("getRows");//获取所有datagrid数据
		var jsonStr="";
		$.each(rows, function(i,item) {
			jsonStr = jsonStr + "'"+item.id +"',"+item.oslBugCodes+","+item.oslBugContent+";";
		});
		
		//确认提交申报 
		$.ajax({
		url: "toSearchGD.action?m=toSystemGD",
		type:"POST",
		dataType:"json",
		timeout: 1000,
		data:{
			"gdId":$("#gdId").text(),
			"people":$("#people").text(), //申报人
			"proposeTime":$("#proposeTime").text(), //申报时间
			"jsonStr":jsonStr, //工单内容
			"umId":$("#userNameId").val(), //负责人
			"oasPriority":$("#oasPriority").val(), //优先级
			"complteTime":$("#complteTime").datebox('getValue')
			}, success: function(data){
				if(data.flag == true){
					$.messager.alert("提示","提交成功!","info",function(){window.parent.$('#iframeSystemDiv').dialog('close');window.parent.$("#gdcontent").datagrid("loadData",[]); window.parent.GetData();});
					window.close();
				}
				else{
					$.messager.alert("提示","提交失败！","info",function(){window.parent.$('#iframeSystemDiv').dialog('close');});
					window.close();
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
				$.messager.alert("提示","当前系统没有用户！","info",null);
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

function GetData(){
var args={};
args.gdId=$("#gdId").text();
args.pageIndex=1;//页索引
args.pageSize=10;//页容量
BingData("#gdcontent",args,"toOperationSysLog.action?m=toSearchPomsSystemLogById",null);
}
</script>
</body>
</html>