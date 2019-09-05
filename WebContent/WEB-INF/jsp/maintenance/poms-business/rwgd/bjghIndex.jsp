<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>表计状态变更记录</title>
<script type="text/javascript" src="/emcc-web/js/poms-business/jquery-1.7.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/default/easyui.css"></link>
<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/icon.css"></link>
<script type="text/javascript" src="/emcc-web/js/poms-business/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/emcc-web/js/page.js"></script>
<script type="text/javascript" src="/emcc-web/js/poms-business/jsonToTime.js"></script>
<style>
span{font-size: 13px;}
select{border:1px solid #99cdff; width:130px;}
</style>
</head>
<body style="margin-top:20px;">
<div>
	<div style="margin:10px 0;">
		<span>企业用户：</span><input name="corporateName" id="corporateName"  style="width: 150px;"/>
		<span>终端名称：</span><input name="terminalName" id="terminalName"  style="width: 150px;"/>
		<span>表计状态：</span><select name="terminalStatus" id="terminalStatus">
					<option selected="selected" value="0">新增</option>
					<option value="1">测试</option>
					<option value="2">测通</option>
					<option value="3">正常</option>
					<option value="4">停用</option>
			 </select>
	<div style="float: right;">
	<table> 
	    <tr>
		<td id="updateSate" name="updateSate"  style=" height: 23px; width: 69px; background-repeat: no-repeat; text-align:center; font-size:13px; background-image:url(image/poms-system/btn_1.png)" onmousemove="this.style.color='white'">状态变更</td>
		<td id="updateBj" name="updateBj" style=" height: 23px; width: 69px; background-repeat: no-repeat; text-align:center; font-size:13px; background-image:url(image/poms-system/btn_1.png)" onmousemove="this.style.color='white'">表计更换</td>
		<td id="searchButton" name="searchButton" style=" height: 23px; width: 69px; background-repeat: no-repeat; text-align:center; font-size:13px; background-image:url(image/poms-system/btn_1.png)" onmousemove="this.style.color='white'">查&nbsp;&nbsp;询</td>
		</tr>
   </table>
	</div>
	</div>
	<div>
		 <table id="gd" class="easyui-datagrid" style="height:212px"
		 toolbar="#toolbar"  rownumbers="true" fitColumns="true" singleSelect="true">
		</table>
	</div>
	<div id="tt" class="easyui-tabs" style="height:280px; margin-top:5px;">  
	    <div title="状态变更记录" style="padding:10px;">  
	        <table id="statusAlter" class="easyui-datagrid" style="height:201px"
			 toolbar="#toolbar"  rownumbers="true" fitColumns="true" singleSelect="true">
			</table>   
	    </div>  
	    <div title="表计更换记录" style="padding:10px;">  
	         <table id="bjgh" class="easyui-datagrid" style="height:200px"
			 toolbar="#toolbar"  rownumbers="true" fitColumns="true" singleSelect="true">
			</table> 
	    </div>
</div>  
	
</div>
<div id="iframeUpdateStatusDiv" style="display: none;"><iframe style="height: 400px;width: 700px;" scrolling="auto" frameborder="0" marginheight="0" id="updateStatusIframe" src=""></iframe></div>
<div id="iframeUpdateBjDiv" style="display: none;"><iframe style="height: 450px;width: 1150px;" scrolling="auto" frameborder="0" marginheight="0" id="updateBjIframe" src=""></iframe></div>
<script type="text/javascript">

function GetData(){
var args={};
args.terminalName=$("#terminalName").val();
args.corporateName=$("#corporateName").val();
args.terminalStatus=$("#terminalStatus").val();
args.pageIndex=1;//页索引
args.pageSize=5;//页容量
BingData("#gd",args,"toTerminalDevice.action?m=toSearchTerminalDevice",null);
}
function GetData1(){
var args={};
args.pageIndex=1;//页索引
args.pageSize=5;//页容量
BingData("#statusAlter",args,"toAlertDevice.action?m=toSearchDeviceStatus",null);
}

function GetData2(){
var args={};
args.pageIndex=1;//页索引
args.pageSize=5;//页容量
BingData("#bjgh",args,"toAlterRecord.action?m=toSearchDeviceRecodePage",null);
}
 </script>
<script type="text/javascript"> 
$(function(){ 
	
	//初始化table	
	$('#gd').datagrid({
	title: '计能终端设备',
	fitColumns: true, //自适应列的大小
	singleSelect: false,
	fit: true,
	columns: [[
	{ title: '全选', field:'ck',checkbox:true,disable:true, width:100},
	{ title: '企业用户', field: 'pomsEnergyUnitInfo', width: 100, formatter: function (value, rowData, rowIndex) {return value.euiNames}}, 
	{ title: '计量表编号', field: 'ctdCodes', width: 100 },
	{ title: '计量表终端名称', field: 'cdtTerminalName', width: 100 },
	{ title: '安装计量回路', field: 'cdtMeasureLoop', width: 100 },
	{ title: '生产厂家', field: 'cdtTerminalIndustry', width: 200 },
	{ title: '检定周期', field: 'cdtCheckPeriod', width: 100},
	{ title: '是否虚表', field: 'cdtIsinvented', width: 100, formatter: function (value, rowData, rowIndex) {if (value==0) {return "实终表";} else if(value==1){return "虚终表";}}},
	{ title: '表计状态', field: 'cdtTerminalStatus', width: 100, formatter: function (value, rowData, rowIndex) {
		if (value==0) {return "新增";} 
		else if(value==1){return "测试";}
		else if(value==2){return "测通";}
		else if(value==3){return "正常";}
		else if(value==4){return "停用";}
	}}
	]],
	pagination:true,
	pageSize:5,
	pageList: [5,10,15,20],
	striped:true
	}); 
	//获取后台数据（打开页面就获取）
	$("#gd").datagrid("loadData",[]); 
	GetData();
	
	
	
	$('#statusAlter').datagrid({
	fitColumns: true, //自适应列的大小
	singleSelect: true,
	fit: true,
	columns: [[
	{ title: '状态变更时间', field: 'statusAlterTime', width: 100, formatter: function (value, rowData, rowIndex) {return Util.DateTime.Formater('yyyy-MM-dd',value.time);}}, 
	{ title: '计量终端', field: 'pomsCalculateTerminalDevice', width: 100,formatter: function (value, rowData, rowIndex){return value.cdtTerminalName;}},
	{ title: '变更操作人', field: 'pomsUsersManagement', width: 100, formatter: function (value, rowData, rowIndex){return value.loginName;}},
	{ title: '状态变更原因', field: 'statusAlterReason', width: 100, formatter: function (value, rowData, rowIndex) {
		if (value==0) {return "更换";} 
		else if(value==1){return "检修";}
		else if(value==2){return "检定";}
		else if(value==3){return "报废";}
		else if(value==4){return "新增";}
		else if(value==5){return "测试";}
	}},
	{ title: '备注', field: 'statusBackups', width: 200 }
	]],
	pagination:true,
	pageSize:5,
	pageList: [5,10,15,20],
	striped:true
	}); 
	//获取后台数据（打开页面就获取）
	$("#statusAlter").datagrid("loadData",[]); 
	GetData1();  
	
	$('#bjgh').datagrid({
	fitColumns: true, //自适应列的大小
	singleSelect: true,
	fit: true,
	columns: [[
	{ title: '更换时间', field: 'ctarAddTime', width: 100, formatter: function (value, rowData, rowIndex) {return Util.DateTime.Formater('yyyy-MM-dd',value.time);}},
	{ title: '计量终端设备', field: 'pomsCalculateTerminalDevice', width: 100,formatter: function (value, rowData, rowIndex){return value.cdtTerminalName;}},
	{ title: '计量表编号', field: 'ctarCodes', width: 100 },
	{ title: '终端名称', field: 'ctarTerminalName', width: 100 },
	{ title: '安装计量回路', field: 'ctarMeasureLoop', width: 200 },
	{ title: '表底数', field: 'ctarInitValue', width: 200 }
	]],
	pagination:true,
	pageSize:5,
	pageList: [5,10,15,20],
	striped:true
	});
	
	//获取后台数据（打开页面就获取）
	$("#bjgh").datagrid("loadData",[]); 
	GetData2();  
	
	//点击查询按钮时，根据条件查询信息
	$("#searchButton").click(function(){
		//获取后台数据（打开页面就获取）
		$("#gd").datagrid("loadData",[]); 
		GetData(); 
	});
	
	$('#tt').tabs({    
    onSelect:function(title){   
        if(title == "状态变更记录"){
        	$("#statusAlter").datagrid("loadData",[]); 
			GetData1();
        } else if (title == "表计更换记录") {
        	$("#bjgh").datagrid("loadData",[]); 
			GetData2();
        }
    }   
});
});	

$("#updateSate").click(function(){
	var row = $('#gd').datagrid('getSelections'); 
	var idStr = "0"; //选中的所有工单id
	var flag = true; //判断选择的工单是否有已经确认的，若已确认，则不允许操作
	var nameStr = ""; 
	var statusInfo = $("#terminalStatus").val();
	if(row.length > 0) {
		$.each(row, function(i,item) {
			idStr = idStr + ",'" + item.id+"'";
			nameStr = nameStr + item.cdtTerminalName + ",";
		});
		var enNameStr = encodeURIComponent(nameStr);
		//window.showModalDialog ('toAlertDevice.action?m=toUpdateDeviceStatusPage&deviceId='+idStr+'&deviceNames='+enNameStr+'&statusInfo='+statusInfo, "newwindow", "height=550, width=500, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no") ;
		document.getElementById('updateStatusIframe').src='toAlertDevice.action?m=toUpdateDeviceStatusPage&deviceId='+idStr+'&deviceNames='+enNameStr+'&statusInfo='+statusInfo;
		$('#iframeUpdateStatusDiv').show();
		$('#iframeUpdateStatusDiv').dialog({  
			title:'修改计量表状态', 
			modal:true,
			width:750,
			draggable:true
		});
	} else {
		$.messager.alert("提示","您还没有选中变更的记录，请选中！","info",null);
	}
});

$("#updateBj").click(function(){
	var row = $('#gd').datagrid('getSelections'); 
	var idStr = "0";
	var nameStr = "";
	var unitId="";
	var unitName="";
	var cdtCodes = "";
	var modelId = "0";
	if(row.length == 1) {
		$.each(row, function(i,item) {
			idStr = item.id;
			nameStr = encodeURIComponent(item.pomsCalculateTerminalModel.ctmNames);
			modelId = item.pomsCalculateTerminalModel.id
			unitId= item.pomsEnergyUnitInfo.id;
			unitName = encodeURIComponent(item.pomsEnergyUnitInfo.euiNames);
			cdtCodes = encodeURIComponent(item.ctdCodes);
		});
		var url = 'bjId='+idStr+'&modelName='+nameStr+'&unitId='+unitId+'&unitName='+unitName+'&cdtCodes='+cdtCodes+'&modelId='+modelId;
		//window.showModalDialog ('toAlterRecord.action?m=toDeviceRecodePage&'+url, "newwindow", " maximize:yes; resizable:yes; status:yes; minimize:yes; center:yes") ;
		document.getElementById('updateBjIframe').src='toAlterRecord.action?m=toDeviceRecodePage&'+url;
		$('#iframeUpdateBjDiv').show();
		$('#iframeUpdateBjDiv').dialog({  
			title:'表计变更', 
			modal:true,
			width:1170,
			draggable:false
		});
		
		//操作后重新加载数据
		/*$("#gd").datagrid("loadData",[]); 
		GetData();
		$("#statusAlter").datagrid("loadData",[]); 
		GetData1();*/
	}
	else {
		$.messager.alert("提示","请选中一条需要更换表计信息！","info",null);
	}
});

      $("#updateSate").mouseover(function(){
      $("#updateSate").attr("style","cursor: pointer; height: 23px; width: 69px; background-repeat: no-repeat; text-align:center; font-size:13px; background-image:url(image/poms-system/btn_2.png)");
   });   
    $("#updateSate").mouseout(function(){
      $("#updateSate").attr("style","height: 23px; width: 69px; background-repeat: no-repeat; text-align:center; font-size:13px; background-image:url(image/poms-system/btn_1.png)");
   });
   
   
         $("#updateBj").mouseover(function(){
      $("#updateBj").attr("style","cursor: pointer; height: 23px; width: 69px; background-repeat: no-repeat; text-align:center; font-size:13px; background-image:url(image/poms-system/btn_2.png)");
   });
   
  
    $("#updateBj").mouseout(function(){
      $("#updateBj").attr("style","height: 23px; width: 69px; background-repeat: no-repeat; text-align:center; font-size:13px; background-image:url(image/poms-system/btn_1.png)");
   });
   
         $("#searchButton").mouseover(function(){
      $("#searchButton").attr("style","cursor: pointer; height: 23px; width: 69px; background-repeat: no-repeat; text-align:center; font-size:13px; background-image:url(image/poms-system/btn_2.png)");
   });
    $("#searchButton").mouseout(function(){
      $("#searchButton").attr("style","height: 23px; width: 69px; background-repeat: no-repeat; text-align:center; font-size:13px; background-image:url(image/poms-system/btn_1.png)");
   });
</script>
</body>
</html>