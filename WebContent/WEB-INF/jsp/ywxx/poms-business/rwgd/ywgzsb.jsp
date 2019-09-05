<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>运行工作维护</title>
<script type="text/javascript" src="/emcc-web/js/poms-business/jquery-1.7.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/default/easyui.css"></link>
<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/icon.css"></link>
<script type="text/javascript" src="/emcc-web/js/poms-business/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/emcc-web/js/poms-business/jsonToTime.js"></script>
<script type="text/javascript" src="/emcc-web/js/page.js"></script>


<style>
    span{font-size: 13px;}
    select{border:1px solid #99cdff; width:130px;}
    
    
    .noSelectButton div{ float:left; }
	.noSelectButton .left{ background-image:url(image/poms-system/noselectButtonLeft.png); width:10px; height:23px;}
	.noSelectButton .center{ background-image:url(image/poms-system/noselectButtonCenter.png); height:23px;}
	.noSelectButton .right{ background-image:url(image/poms-system/noselectButtonRight.png); width:10px; height:23px;}
	
	.selectedButton div{float:left;}
	.selectedButton .left{ background-image:url(image/poms-system/selectedButtonLeft.png); width:10px; height:23px;}
	.selectedButton .center{ background-image:url(image/poms-system/selectedButtonCenter.png); height:23px;}
	.selectedButton .right{ background-image:url(image/poms-system/selectedButtonRight.png); width:10px; height:23px;}
    
</style>
</head>
<body style="margin-top:20px;" >
<div>
	<div style="margin:10px 0;">
		<span>关键字：</span><input id="keyword" name="keyword" style="border:1px solid #99cdff; width:130px;" />
		<span>时间：</span><input name="time" id="time" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" style="width: 150px;"/>
		<span>问题级别：</span>
			<select name="oslBugBand" id="oslBugBand">
				<option value="0">正常</option>
				<option value="1">警告</option>
				<option selected="selected" value="2">错误/故障</option>
			</select>
		<div style="float: right;">
		  <table> 
		     <tr>
			<td id="scrwgd" name="scrwgd" onmousemove="this.style.color='white'" onmouseout="this.style.color='black'" style="cursor:pointer;">
		<div class="noSelectButton">
		   <div class="left"></div>
		   <div class="center" style="font-size: 12px;line-height:23px; ">生成任务工单</div>
		   <div class="right"></div> 
		</div>	
			</td>
			<td id="lrrwgd" name="lrrwgd" onmousemove="this.style.color='white'" onmouseout="this.style.color='black'" style="cursor:pointer;">
		   <div class="noSelectButton">
		      <div class="left"></div>
		      <div class="center"  style="font-size: 12px; line-height:23px;">录入任务工单</div>
		      <div class="right"></div> 
		   </div>
			</td>
			<td id="searchButton" name="searchButton" style=" height: 23px; width: 69px; background-repeat: no-repeat; text-align:center; font-size:13px; background-image:url(image/poms-system/btn_1.png)" onmousemove="this.style.color='white'">查询</td>
			</tr>
		</table>
			
		</div>
	</div>
	<div data-options="region:'center'">
		 <table id="whgz" class="easyui-datagrid" style="height:500px;"></table>
	</div>
</div>
<div id="iframeSystemDiv" style="display: none;"><iframe style="height:450px;;width: 750px;" scrolling="auto" frameborder="0" marginheight="0" id="systemIframe" src=""></iframe></div>
<div id="iframeInputDiv" style="display: none;"><iframe style="height: 450px;width: 750px;" scrolling="auto" frameborder="0" marginheight="0" id="inputIframe" src=""></iframe></div>
<script type="text/javascript">

$(function(){
		$('.noSelectButton').mousemove(function(){
			$(this).removeClass('noSelectButton');
			$(this).addClass('selectedButton');
		});
		
		$('.noSelectButton').mouseout(function(){
			$(this).removeClass('selectedButton');
			$(this).addClass('noSelectButton');
		});
	});







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
args.keyword=$("#keyword").val();
args.bugBound=$("#oslBugBand").val();
args.gdTime=$("#time").datebox('getValue');
args.pageIndex=1;//页索引
args.pageSize=10;//页容量
BingData("#whgz",args,"toOperationSysLog.action?m=toSearchPomsSystemLog",null);
}
</script>

<script type="text/javascript"> 
$(function(){ 
	//页面加载时给提交时间赋值为当前时间
	var d = new Date();
	str = d.getFullYear()+'-'+(d.getMonth() + 1<10?('0'+(d.getMonth() + 1)):d.getMonth() + 1)+'-'+(d.getDate()<10?('0'+d.getDate()):d.getDate())
	$("#time").datebox('setValue',str);
	
	//初始化table	
	$('#whgz').datagrid({
	title: '运维工作申报',
	rownumbers: true,
	fitColumns: true, //自适应列的大小
	singleSelect: false,
	fit: true,
	columns: [[
	{ title: '全选', field:'ck',checkbox:true,disable:true, width:100},
	{ title: '提交时间', field: 'oslBugTime', width: 100, formatter: function (value, rowData, rowIndex) {return Util.DateTime.Formater('yyyy-MM-dd',value.time);}}, 
	{ title: '故障预警编码', field: 'oslBugCodes', width: 100},
	{ title: '问题内容', field: 'oslBugContent', width: 100},
	{ title: '问题级别', field: 'oslBugBand', width: 100, formatter: function (value, rowData, rowIndex) {if (value==1) {return "警告";} else if(value=="2"){return "错误/故障";} else if(value=="0"){return "正常";}}},
	{ title: '是否确认', field: 'oslIssure', width: 100, formatter: function (value, rowData, rowIndex) {if (value==0) {return "未确认";} else if(value=="1"){return "已确认";}}}
	]],
	pagination:true,
	striped:true
	}); 
	//获取后台数据
	$("#whgz").datagrid("loadData",[]); 
	GetData();
	//点击查询按钮时，根据条件查询信息
	$("#searchButton").click(function(){
		//验证提交时间是否是日期格式(yyyy-mm-dd)
		var nowDate = $("#time").datebox('getValue');
		var date_ymd= /^(\d{4})-(0\d{1}|1[0-2])-(0\d{1}|[12]\d{1}|3[01])$/; 
		var r = nowDate.match(date_ymd);
		if(r == null){
			$.messager.alert("提示","提交时间输入错误，请重新输入！","info",null);
			return false;
		}
		//获取后台数据
		$("#whgz").datagrid("loadData",[]); 
		GetData();
	});
});	


//录入任务工单
$("#lrrwgd").click(function(){
		//window.showModalDialog ('toSearchGD.action?m=toManualPage', "newwindow", "height=550, width=500, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no") ;
		document.getElementById('inputIframe').src='toSearchGD.action?m=toManualPage';
		$('#iframeInputDiv').show();
		$('#iframeInputDiv').dialog({  
			title:'录入任务工单', 
			modal:true,
			width:800,
			draggable:false
		});
});
//生成任务工单
$("#scrwgd").click(function(){
	var row = $('#whgz').datagrid('getSelections'); 
	var idStr = "0"; //选中的所有工单id
	var flag = true; //判断选择的工单是否有已经确认的，若已确认，则不允许操作
	if(row.length > 0) {
		$.each(row, function(i,item) {
			idStr = idStr + ",'" + item.id+"'";
			if(item.oslIssure ==1 ){
				flag = false;
			}
		});
		if(flag){
			//window.showModalDialog ('toSearchGD.action?m=toSystemPage&idStr='+idStr, "newwindow", "height=700, width=800, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no") ;	
			document.getElementById('systemIframe').src='toSearchGD.action?m=toSystemPage&idStr='+idStr;
			$('#iframeSystemDiv').show();
			$('#iframeSystemDiv').dialog({  
				title:'录入任务工单', 
				modal:true,
				width:800,
				draggable:false
			});
			//操作后重新加载数据
			$("#gdcontent").datagrid("loadData",[]); 
			GetData();
		} else {
			$.messager.alert("提示","您所选中工单已经确认，请重新选择！！","info",null);
		}
		
	}
	else {
		$.messager.alert("提示","您没有选中任何工作申报项，请选中！","info",null);
	}
}); 
 //   $("#scrwgd").mouseover(function(){
 //     $("#scrwgd").attr("style","cursor: pointer; height: 23px; width: 69px; background-repeat: no-repeat; text-align:center; font-size:10px; background-image:url(image/poms-system/btn_2.png)");
 //  });
 //   $("#scrwgd").mouseout(function(){
 //     $("#scrwgd").attr("style","height: 23px; width: 69px; background-repeat: no-repeat; text-align:center; font-size:10px; background-image:url(image/poms-system/btn_1.png)");
 //  });
   
 //        $("#lrrwgd").mouseover(function(){
 //     $("#lrrwgd").attr("style","cursor: pointer; height: 23px; width: 69px; background-repeat: no-repeat; text-align:center; font-size:10px; background-image:url(image/poms-system/btn_2.png)");
 //  });
 //   $("#lrrwgd").mouseout(function(){
 //     $("#lrrwgd").attr("style","height: 23px; width: 69px; background-repeat: no-repeat; text-align:center; font-size:10px; background-image:url(image/poms-system/btn_1.png)");
 //  });
   
         $("#searchButton").mouseover(function(){
      $("#searchButton").attr("style","cursor: pointer; height: 23px; width: 69px; background-repeat: no-repeat; text-align:center; font-size:13px; background-image:url(image/poms-system/btn_2.png)");
   });
    $("#searchButton").mouseout(function(){
      $("#searchButton").attr("style","height: 23px; width: 69px; background-repeat: no-repeat; text-align:center; font-size:13px; background-image:url(image/poms-system/btn_1.png)");
   });

</script>
</body>
</html>



  
