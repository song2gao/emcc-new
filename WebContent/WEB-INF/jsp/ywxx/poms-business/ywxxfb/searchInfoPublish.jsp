<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>运维信息发布</title>
<script type="text/javascript" src="/emcc-web/js/poms-business/jquery-1.7.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/default/easyui.css"></link>
<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/icon.css"></link>
<script type="text/javascript" src="/emcc-web/js/poms-business/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/emcc-web/js/page.js"></script>
<script type="text/javascript" src="/emcc-web/js/poms-business/jsonToTime.js"></script>
<style>
span{font-size: 13px;}
input{border:1px solid #99cdff; width:130px;}
</style>
</head>
<body style="margin-top:20px;">
<div>
	<div style="margin:10px 0;">
		<span>用户：</span><input type="text" id="userName" name="userName"/>
		<span>时间：</span><input name="publishTime" id="publishTime" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" style="width: 150px;"/>
		<span>主题：</span><input type="text" id="title" name="title"/>
	<div style="float: right;">
	<table>  
	      <tr>
		<td style=" height: 23px; width: 69px; background-repeat: no-repeat; text-align:center; font-size:13px; background-image:url(image/poms-system/btn_1.png)" id="searchButton" onmousemove="this.style.color='white'">查询</td>
		<td style=" height: 23px; width: 69px; background-repeat: no-repeat; text-align:center; font-size:13px; background-image:url(image/poms-system/btn_1.png)" id="addButton" onmousemove="this.style.color='white'" >添加</td>
		<td style=" height: 23px; width: 69px; background-repeat: no-repeat; text-align:center; font-size:13px; background-image:url(image/poms-system/btn_1.png)" id="editButton" onmousemove="this.style.color='white'">修改</td>
		<td style=" height: 23px; width: 69px; background-repeat: no-repeat; text-align:center; font-size:13px; background-image:url(image/poms-system/btn_1.png)" id="deleteButton" onmousemove="this.style.color='white'">删除</td>
		<td style=" height: 23px; width: 69px; background-repeat: no-repeat; text-align:center; font-size:13px; background-image:url(image/poms-system/btn_1.png)" id="preparedButton" onmousemove="this.style.color='white'">预览</td>
		</tr>
  </table>
	</div>
	</div>
	<div>
		 <table id="gd" class="easyui-datagrid" style="height:500px"
		 toolbar="#toolbar"  rownumbers="true" fitColumns="true" singleSelect="true">
		</table>
	</div>
</div>
<div id="iframeAddDiv" style="display: none;"><iframe style="height: 520px;width: 1000px;" scrolling="auto" frameborder="0" marginheight="0" id="addIframe" src=""></iframe></div>
<div id="iframeUpdateDiv" style="display: none;"><iframe style="height: 520px;width: 1000px;" scrolling="auto" frameborder="0" marginheight="0" id="updateIframe" src=""></iframe></div>
<div id="iframePreparedDiv" style="display: none;"><iframe style="height: 520px;width: 1000px;" scrolling="auto" frameborder="0" marginheight="0" id="preparedIframe" src=""></iframe></div>
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
args.userName=$("#userName").val();
args.title=$("#title").val();
args.publishTime=$("#publishTime").datebox('getValue');
args.pageIndex=1;//页索引
args.pageSize=10;//页容量
BingData("#gd",args,"toInfoPublish.action?m=toSearchInfoPublish",null);
}
 </script>
<script type="text/javascript"> 
$(function(){ 
	//页面加载时给提交时间赋值为当前时间
	var d = new Date();
	str = d.getFullYear()+'-'+(d.getMonth() + 1<10?('0'+(d.getMonth() + 1)):d.getMonth() + 1)+'-'+(d.getDate()<10?('0'+d.getDate()):d.getDate())
	$("#publishTime").datebox('setValue',str);
	
	//获取后台数据
		$("#gd").datagrid("loadData",[]); 
		GetData();
	
	//初始化table	
	$('#gd').datagrid({
	title: '运维信息发布',
	fitColumns: true, //自适应列的大小
	singleSelect: true,
	fit: true,
	columns: [[
	{ title: '用户', field: 'pomsUsersManagement', width: 100, formatter: function (value, rowData, rowIndex) {return value.loginName}}, 
	{ title: '模块', field: 'mipModules', width: 100 , formatter: function (value, rowData, rowIndex) {if(value=="0"){return "通告"; }}},
	{ title: '时间', field: 'mipEdittime', width: 100,formatter: function (value, rowData, rowIndex) {return Util.DateTime.Formater('yyyy-MM-dd',value.time);} },
	{ title: '主题', field: 'mipTitle', width: 100 },
	{ title: '状态', field: 'mipIspublished', width: 200, formatter: function (value, rowData, rowIndex) {if(value=="0"){return "未发布"; }else if(value=="1") {return "已发布";}}}
	]],
	pagination:true,
	striped:true
	}); 
	//点击查询按钮时，根据条件查询信息
	$("#searchButton").click(function(){
		//验证提交时间是否是日期格式(yyyy-mm-dd)
		var nowDate = $("#publishTime").datebox('getValue');
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

$("#addButton").click(function(){
	//window.showModalDialog ('toInfoPublish.action?m=toAddInfoPublishPage', "newwindow", "dialogWidth:1100px; dialogHeight:550px; maximize:yes; resizable:yes; status:yes; minimize:yes; center:yes") ;
	document.getElementById('addIframe').src="toInfoPublish.action?m=toAddInfoPublishPage";
	$('#iframeAddDiv').show();//iframeUpdateDiv
	$('#iframeAddDiv').dialog({  
		title:'添加计量表信息', 
		modal:true,
		width:1100,
		draggable:false
	});
});

$("#deleteButton").click(function(){
	var row = $('#gd').datagrid('getSelected'); 
	if(row != null) {
    	$.messager.confirm('提示','确定要删除选中的数据吗?',function(r){
    		if(r){
    			$.ajax({
				url: "toInfoPublish.action?m=toDeleteInfoPublish",
				type:"POST",
				dataType:"json",
				timeout: 1000,
				data:{
					"id":row.id//运维信息发布id
				}, success: function(data){
					if(data.flag == true){
						$.messager.alert("提示","删除成功！","info",null);
						$("#gd").datagrid("loadData",[]); 
						GetData();
					}
					else{
						$.messager.alert("提示","删除失败！","info",null);
					}
				}
				});
    		}
		});
	}
	else {
		$.messager.alert("提示","请选中要删除的行！","info",null);
	}
});


$("#editButton").click(function(){
	var row = $('#gd').datagrid('getSelected'); 
	if(row != null) {
		//window.showModalDialog ('toInfoPublish.action?m=toUpdateInfoPublishPage&id='+row.id, "newwindow", "dialogWidth:1100px; dialogHeight:550px; maximize:yes; resizable:yes; status:yes; minimize:yes; center:yes") ;
		document.getElementById('updateIframe').src="toInfoPublish.action?m=toUpdateInfoPublishPage&id="+row.id;
		$('#iframeUpdateDiv').show();
		$('#iframeUpdateDiv').dialog({  
		title:'添加计量表信息', 
		modal:true,
		width:1100,
		draggable:false
		});
	}
	else {
		$.messager.alert("提示","请选择要修改的行！","info",null);
	}
});

$("#preparedButton").click(function(){
	var row = $('#gd').datagrid('getSelected'); 
	if(row != null) {
		//window.showModalDialog ('toInfoPublish.action?m=toPrepareInfoPublishPage&id='+row.id+'&ispublish='+row.mipIspublished, "newwindow", "dialogWidth:1000px; maximize:yes; resizable:yes; status:yes; minimize:yes;center:yes") ;
		
		document.getElementById('preparedIframe').src='toInfoPublish.action?m=toPrepareInfoPublishPage&id='+row.id+'&ispublish='+row.mipIspublished;
		$('#iframePreparedDiv').show();
		$('#iframePreparedDiv').dialog({  
		title:'添加计量表信息', 
		modal:true,
		width:1100,
		draggable:false
		});
	}
	else {
		$.messager.alert("提示","请选中预览信息！","info",null);
	}
});
   $("#addButton").mouseover(function(){
      $("#addButton").attr("style","cursor: pointer; height: 23px; width: 69px; background-repeat: no-repeat; text-align:center; font-size:13px;  font-color:white; background-image:url(image/poms-system/btn_2.png)");
   });
    $("#addButton").mouseout(function(){
      $("#addButton").attr("style","height: 23px; width: 69px; background-repeat: no-repeat; text-align:center; font-size:13px; background-image:url(image/poms-system/btn_1.png)");
   });
   
      $("#searchButton").mouseover(function(){
      $("#searchButton").attr("style","cursor: pointer; height: 23px; width: 69px; background-repeat: no-repeat; text-align:center; font-size:13px; background-image:url(image/poms-system/btn_2.png)");
   });
    $("#searchButton").mouseout(function(){
      $("#searchButton").attr("style","height: 23px; width: 69px; background-repeat: no-repeat; text-align:center; font-size:13px; background-image:url(image/poms-system/btn_1.png)");
   });
   
        $("#editButton").mouseover(function(){
      $("#editButton").attr("style","cursor: pointer; height: 23px; width: 69px; background-repeat: no-repeat; text-align:center; font-size:13px; background-image:url(image/poms-system/btn_2.png)");
   });
    $("#editButton").mouseout(function(){
      $("#editButton").attr("style","height: 23px; width: 69px; background-repeat: no-repeat; text-align:center; font-size:13px; background-image:url(image/poms-system/btn_1.png)");
   });
   
        $("#deleteButton").mouseover(function(){
      $("#deleteButton").attr("style","cursor: pointer; height: 23px; width: 69px; background-repeat: no-repeat; text-align:center; font-size:13px; background-image:url(image/poms-system/btn_2.png)");
   });
    $("#deleteButton").mouseout(function(){
      $("#deleteButton").attr("style","height: 23px; width: 69px; background-repeat: no-repeat; text-align:center; font-size:13px; background-image:url(image/poms-system/btn_1.png)");
   });
   
        $("#preparedButton").mouseover(function(){
      $("#preparedButton").attr("style","cursor: pointer; height: 23px; width: 69px; background-repeat: no-repeat; text-align:center; font-size:13px; background-image:url(image/poms-system/btn_2.png)");
   });
    $("#preparedButton").mouseout(function(){
      $("#preparedButton").attr("style","height: 23px; width: 69px; background-repeat: no-repeat; text-align:center; font-size:13px; background-image:url(image/poms-system/btn_1.png)");
   });
</script>
</body>
</html>



  
