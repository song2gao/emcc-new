<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>任务工单</title>
<script type="text/javascript" src="/emcc-web/js/poms-business/jquery-1.7.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/default/easyui.css"></link>
<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/icon.css"></link>
<script type="text/javascript" src="/emcc-web/js/poms-business/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/emcc-web/js/page.js"></script>
<script type="text/javascript" src="/emcc-web/js/poms-business/jsonToTime.js"></script>
<style>
span{font-size: 13px;}
select{border:1px solid #99cdff; width:130px;}
.trHeight{height:30px;}
</style>
</head>
<body style="margin-top:20px;">
<div>
	<div style="margin:10px 0;">
		<span>工单类型：</span><select name="type" id="type">
					<option selected="selected" value="0">请选择</option>
					<option value="2">系统</option>
					<option value="1">手动</option>
				 </select>
		<span>提交时间：</span><input name="proposeTime" id="proposeTime" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" style="width: 150px;"/>
		<span>状态：</span><select name="state" id="state">
					<option selected="selected" value="0">请选择</option>
					<option value="1">已处理</option>
					<option value="2">未处理</option>
			 </select>
	<div style="float: right;"> 
	<table>
	     <tr>
		<td id="searchButton" name="searchButton" style="height: 23px; width: 69px; background-repeat: no-repeat; text-align:center; font-size:13px; background-image:url(image/poms-system/btn_1.png)" onmousemove="this.style.color='white'"> 查询 </td>
		<td id="operategd" name="operategd" style="height: 23px; width: 69px; background-repeat: no-repeat; text-align:center; font-size:13px; background-image:url(image/poms-system/btn_1.png)" onmousemove="this.style.color='white'"> 处理 </td>
		</tr>
	</table>	
	</div>
	</div>
	<div>
		 <table id="gd" class="easyui-datagrid" style="height:500px;"
		 toolbar="#toolbar"  rownumbers="true" fitColumns="true" singleSelect="true">
		</table>
	</div>
</div>
<div id="operateDiv" style="border:1px solid #000000; font-size:13px; margin-left:20px; height:500px; display:none;">
	<div  style="margin-top:10px;"><b>&nbsp;&nbsp;任务工单处理</b></div>
	<hr />
	<table>
		<tbody>
			<tr class = "trHeight"><td width="100px;">&nbsp;&nbsp;任务类型：</td><td><span id="oasSheettype"></span></td></tr>
			<tr class = "trHeight"><td>&nbsp;&nbsp;处理人：</td><td><span id="operater"></span></td></tr>
			<tr class = "trHeight"><td>&nbsp;&nbsp;问题描述：</td><td><span id="content"></span></td></tr>
			<tr class = "trHeight"><td>&nbsp;&nbsp;处理过程：</td><td><textarea rows="4" cols="25" id="clgc"></textarea></td></tr>
			<tr class = "trHeight"><td>&nbsp;&nbsp;备注:</td><td><textarea rows="4" cols="25" id="bz"></textarea></td></tr>
			<tr class = "trHeight"><td>&nbsp;&nbsp;是否完成：</td><td><input type="radio" name="iscomplete" id="iscomplete_1" checked="checked" value="1"/>是 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="iscomplete" value="2" id="iscomplete_2"/>否</td></tr>
			<tr class = "trHeight"><td></td><td><a class="easyui-linkbutton" id="submitgd" name="submitgd">&nbsp;&nbsp;提&nbsp;&nbsp;交&nbsp;&nbsp;</a></td></tr>
		</tbody>
	</table>
</div>
<script type="text/javascript">
//规范日期格式	
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
args.gdType=$("#type").val();
args.gdState=$("#state").val();
args.proposeTime=$("#proposeTime").datebox('getValue');
args.pageIndex=1;//页索引
args.pageSize=10;//页容量
BingData("#gd",args,"toSearchGD.action?m=toSearchGD",null);
}
 </script>
<script type="text/javascript"> 
$(function(){ 
	//页面加载时给提交时间赋值为当前时间
	var d = new Date();
	str = d.getFullYear()+'-'+(d.getMonth() + 1<10?('0'+(d.getMonth() + 1)):d.getMonth() + 1)+'-'+(d.getDate()<10?('0'+d.getDate()):d.getDate())
	$("#proposeTime").datebox('setValue',str);
	//初始化table	
	$('#gd').datagrid({
	title: '工单列表',
	fitColumns: true, //自适应列的大小
	singleSelect: true,
	fit: true,
	columns: [[
	{ title: '任务类型', field: 'oasSheetType', width: 100, formatter: function (value, rowData, rowIndex) {if (value==1) {return "手动";} else if(value=="2"){return "自动";}}}, 
	{ title: '提出人', field: 'oasProposer', width: 100 },
	{ title: '提交时间', field: 'proposeTime', width: 100,formatter: function (value, rowData, rowIndex) {return Util.DateTime.Formater('yyyy-MM-dd',value.time);} },
	{ title: '要求完成时间', field: 'needComplteTime', width: 100 ,formatter: function (value, rowData, rowIndex) {return Util.DateTime.Formater('yyyy-MM-dd',value.time)}},
	{ title: '内容', field: 'proposeContent', width: 200 },
	{ title: '优先级状态', field: 'oasPriority', width: 100, formatter: function (value, rowData, rowIndex) {if (value==1) {return "一般";} else if(value=="2"){return "紧急";}}},
	{ title: '处理状态', field: 'dealStatus', width: 100, formatter: function (value, rowData, rowIndex) {if (value==1) {return "已处理";} else if(value=="2"){return "未处理";}}}
	]],
	pagination:true,
	striped:true
	}); 
	//获取后台数据
	$("#gd").datagrid("loadData",[]); 
	GetData();
	//点击查询按钮时，根据条件查询信息
	$("#searchButton").click(function(){
		//验证提交时间是否是日期格式(yyyy-mm-dd)
		var nowDate = $("#proposeTime").datebox('getValue');
		var date_ymd= /^(\d{4})-(0\d{1}|1[0-2])-(0\d{1}|[12]\d{1}|3[01])$/; 
		var r = nowDate.match(date_ymd);
		if(r == null){
			$.messager.alert("提示","提交时间输入错误，请重新输入！","info",null);
			return false;
		}
		//获取后台数据
		$("#gd").datagrid("loadData",[]); 
		GetData();
	});
});	

var gdId = "0";
//点击获取所用用户信息
$("#operategd").click(function(){
	var row = $('#gd').datagrid('getSelected'); 
	if(row != null) {
		if(row.dealStatus == 1){
			$.messager.alert("提示","此工单已经处理，不能再次处理！","info",null);
		}else {
			gdId = row.id;
			$.ajax({
			url: "toOperateGD.action?m=toSearchOperateGD",
			type:"POST",
			dataType:"json",
			timeout: 10000,
			data:{
				"gdId":gdId,
				}, success: function(data){
					var operater = data.pomsOperationAssignmentSheet.pomsUsersManagement.loginName;
					var type = data.pomsOperationAssignmentSheet.oasSheetType;
					if(type ==1){$("#oasSheettype").text('手动');}
					else if(type ==2){$("#oasSheettype").text('系统');}
					$("#operater").text(operater);
					$("#content").text(data.pomsOperationAssignmentSheet.proposeContent);
					$("#clgc").text("");
					$("#bz").text("");
				}
			});
			//显示工单处理隐藏层 
			$("#operateDiv").attr("style","display:black;");
			$('#operateDiv').dialog({
			title: '工单处理',
			width: 500,
			closed: false,
			cache: false,
			modal: true,
			minimizable: false,
			resizable: true
			});
		}
	}
	else {
		$.messager.alert("提示","没有选中需要处理的数据！","info",null);
	}
});

$("#submitgd").click(function(){
		var clgcStr = $("#clgc").val();
		if(clgcStr == ""){
			$.messager.alert("提示","处理过程不能为空！","info",null);
			return false;
		}
		var iscomplete = ShowTemp();
		
		$.ajax({
		url: "toOperateGD.action?m=toOperateGD",
		type:"POST",
		dataType:"json",
		timeout: 1000,
		data:{
			"gdId":gdId, //工单id
			"iscomplete":iscomplete, //是否完成
			"clgc":$("#clgc").val(), //处理过程
			"bz":$("#bz").val() //备注
			}, success: function(data){
				if(data.flag == true){
					$.messager.alert("提示","提交成功！","info",function(){
					$('#operateDiv').dialog('close');
					//操作后重新加载数据
					$("#gd").datagrid("loadData",[]); 
					GetData();
					$("#clgc").attr("value","");
					$("#bz").attr("value","");
					});
				}
				else{
					$.messager.alert("提示","提交失败！","info",function(){
					$('#operateDiv').dialog('close');
					});
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
      $("#searchButton").mouseover(function(){
      $("#searchButton").attr("style","cursor: pointer; height: 23px; width: 69px; background-repeat: no-repeat; text-align:center; font-size:13px; background-image:url(image/poms-system/btn_2.png)");
   });
    $("#searchButton").mouseout(function(){
      $("#searchButton").attr("style","height: 23px; width: 69px; background-repeat: no-repeat; text-align:center; font-size:13px; background-image:url(image/poms-system/btn_1.png)");
   });
   
         $("#operategd").mouseover(function(){
      $("#operategd").attr("style","cursor: pointer; height: 23px; width: 69px; background-repeat: no-repeat; text-align:center; font-size:13px; background-image:url(image/poms-system/btn_2.png)");
   });
    $("#operategd").mouseout(function(){
      $("#operategd").attr("style","height: 23px; width: 69px; background-repeat: no-repeat; text-align:center; font-size:13px; background-image:url(image/poms-system/btn_1.png)");
   });
</script>
</body>
</html>



  
