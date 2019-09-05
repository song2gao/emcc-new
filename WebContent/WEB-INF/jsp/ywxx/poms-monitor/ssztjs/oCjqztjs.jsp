<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>采集器状态监视</title>
    <link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-monitor/monitroFir.css"></link>
    <link href="/emcc-web/css/poms-system/CSS.css" rel="stylesheet" type="text/css" ></link>
	<link href="/emcc-web/css/poms-system/yxztjk.css" rel="stylesheet" type="text/css"></link>
	<link href="/emcc-web/css/poms-business/ptrzgl.css" rel="stylesheet" type="text/css"></link>
	<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/default/easyui.css"></link>
	<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/icon.css"></link>
	<script type="text/javascript" src="/emcc-web/js/poms-business/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src="/emcc-web/js/poms-business/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/emcc-web/js/page.js"></script>
	<script type="text/javascript" src="/emcc-web/js/poms-business/jsonToTime.js"></script>    
	<script type="text/javascript" src="/emcc-web/js/other.js"></script>    
	<script type="text/javascript" src="/emcc-web/js/jzdd.js"></script>
    
  </head>
  <script type="text/javascript">
  
 
  
  </script>
  <body onload="GetData()">
	<div id="FirAlarmsss" align="left">
		
		<font style="font-size: 13px;">
		<img id="bbimg" src="/emcc-web/image/poms-monitor/frYes.png"/>
		
		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				截止当前时间：共有<font id="num">?</font>台采集器处于故障或离线状态。&emsp;&emsp;&emsp; 	
		</font>
		<font style="font-size: 13px;" color="#009ACD">
			<a href="toConRecordAlarm.action?m=toGzjlgjJump">&raquo;详情</a>
		</font>
	</div>
	
	<div id="SecAlarm">
		<table id="tabbb" border="0" align="left">
			<tr>
				<td>企业：</td>
					<td><input type="text" id="company" name="company"/></td>
				<td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					<input id="searchButton" class="searchButton" type="button" name="searchButton" value="查询"/>
				</td>
			</tr>
		</table>
	</div>
	
	<table id="gd" class="easyui-datagrid" style="width:1410px;height:250px"
		toolbar="#toolbar"  rownumbers="true" fitColumns="true" singleSelect="true">
	</table>
	
	<div id="ThrAlarm">
		<table id="tabbbb" align="left" border="0">	
			<tr><td><font face="幼圆" style="font-weight: bold;font-size: 14px;"></font><font id="jihaoMessage" face="幼圆" style="font-weight: bold;font-size: 14px;">请选中一台采集器</font></td></tr>
			<tr><td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<font face="幼圆"></font>&emsp;&emsp;<font face="幼圆" id="Cstatus"></font></td></tr>
			<tr><td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<font face="幼圆"></font>&emsp;&emsp;<font face="幼圆" id="Cip"></font></td></tr>
			<tr><td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<font face="幼圆"></font>&emsp;&emsp;<font face="幼圆" id="Ctxiey"></font></td></tr>
			<tr><td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<font face="幼圆"></font>&emsp;&emsp;<font face="幼圆" id="Ctxfang"></font></td></tr>
		</table>
	</div>
  </body>
  
  <script type="text/javascript">
  		function GetData(){
			var args={};
			args.company=$("#company").val();
			args.pageIndex=1;//页索引
			args.pageSize=10;//页容量
			BingData("#gd",args,"toConRecordAlarm.action?m=toFindCjqLyq",null);
		}	
	
  </script>
   <script type="text/javascript"> 
	//页面加载时给提交时间赋值为当前时间
	$(function(){ 
		//createGcjDhccFullScreen('<font face="幼圆" style="font-size:18px; color:#ff0000;">加载数据中 。。。</font>', null, null, null, null, null, null);
		//showGcjDhccFullScreen();
		//初始化table	
		$('#gd').datagrid({
		fitColumns: false, //自适应列的大小
		singleSelect: true,
		pagination:true,
		height:310,
		columns: [[
		{ title: '采集器名称', width: 200, field: 'asstdNames',formatter: function (value, rowData, rowIndex) {return value}}, 
		{ title: '采集器IP',align:'center',  width: 160,  field: 'frontProcessorIp',formatter: function (value, rowData, rowIndex)  {return new Object(rowData["pomsFrontProcessorConfig"]).frontProcessorIp;}},
		{ title: '企业名称', width: 400, field: 'euiNames',formatter: function (value, rowData, rowIndex) {return new Object(rowData["pomsEnergyUnitInfo"]).euiNames;}},
		{ title: '前置端口',align:'center' ,width: 60, field: 'frontProcessorPort',formatter: function (value, rowData, rowIndex) {return new Object(rowData["pomsFrontProcessorConfig"]).frontProcessorPort;}},
		{ title: '通信协议',align:'center' ,width: 60, field: 'communicateProtocal',formatter: function (value, rowData, rowIndex) {return new Object(rowData["pomsFrontProcessorConfig"]).communicateProtocal;}},	
		{ title: '采集工作状态',align:'center', width: 80, field: 'asstdBackups',formatter: function (value, rowData, rowIndex) {return value}},
		{ title: '前置机编号',align:'center', width: 400, field: 'id',formatter: function (value, rowData, rowIndex) {return new Object(rowData["pomsFrontProcessorConfig"]).id;}}
		]],
		//单击选中，显示下方信息
		onLoadSuccess:function (data){
			//hideGcjDhccFullScreen();
			$('#gd').datagrid('selectRow',0);
				var row=$('#gd').datagrid('getSelected');
				},
		onSelect:function(rowIndex, rowData){
			if(rowData!=null){
				//showGcjDhccFullScreen();
				$.ajax({
					url:"toConRecordAlarm.action?m=toRequestConditionQ",
					type:"POST",dataType:"json",
			       	timeout: 1000,
			       	data:{
			       		"id":rowData.id
		         	},
		           	success:function(data){
		         		document.getElementById('Cip').innerText="";
						document.getElementById('Ctxiey').innerText="";
						document.getElementById('Ctxfang').innerText="";
						document.getElementById('Cip').innerText="";
		         		//hideGcjDhccFullScreenB();
			           	var v = data.keys;
			           	var j = data.jihe;
			           	var name = v.asstdNames;
			           	var ip = v.crcAssembleIp;
			           	var fang = v.crcCommunicateType;
			           	var status = j.sd;
						document.getElementById('jihaoMessage').innerText="采集器："+name;
						if(status=="故障或离线"){
							document.getElementById('Cstatus').innerText="☆工作状态:"+status;
						}else{
							document.getElementById('Cstatus').innerText="☆工作状态:正常";
						}
						//下表信息:
						var ip = j.sa;
						var fangshi = j.sb;
						var xieyi = j.sc;
						if(ip==""){
							document.getElementById('Cip').innerText="☆IP地址:无记录";
						}else{
							document.getElementById('Cip').innerText="☆IP地址:"+ip;
						}if(xieyi==""){
							document.getElementById('Ctxiey').innerText="☆通信协议:无记录";
						}else{
							document.getElementById('Ctxiey').innerText="☆通信协议:"+xieyi;
						}if(fangshi==""){
							document.getElementById('Ctxfang').innerText="☆通信方式:无记录";
						}else{
							document.getElementById('Ctxfang').innerText="☆通信方式:"+fangshi;
						}
			        },error:function(data){
			        	document.getElementById('Cip').innerText="";
						document.getElementById('Ctxiey').innerText="";
						document.getElementById('Ctxfang').innerText="";
						document.getElementById('Cip').innerText="";
						var dataes =$("#gd").datagrid("getSelected"); 
		         		document.getElementById('jihaoMessage').innerText="采集器:"+dataes.asstdNames;
		         		document.getElementById('Cstatus').innerText="☆工作状态:故障或离线";
		         		document.getElementById('Cip').innerText="☆IP地址:无记录";
		         		document.getElementById('Ctxiey').innerText="☆通信协议:无记录";
		         		document.getElementById('Ctxfang').innerText="☆通信方式:无记录";
				    }
				});
				}
			}
		});
		
		//点击查询按钮时，根据条件查询信息
		$("#searchButton").click(function(){
			$("#gd").datagrid("loadData",[]); 
			GetData();
		});
			GetData();
	});


	//表头
	function getTitle(){
		$.ajax({
	         url:"toConRecordAlarm.action?m=tofindCjqBTV",
	         type:"POST",dataType:"json",
	         success:function(data){
	         	var size = data.size;
         		document.getElementById('num').innerText=size;
	         	if(size>0){
	         		$("#bbimg").attr("src","/emcc-web/image/poms-monitor/frNo.png");
	         	}
			}
		});
	}

	 $(function(){  
		 GetData();
		 //二十秒更新头部
		 getTitle();
		 setInterval("getTitle()", 20000);
	 });
	
	
		//执行单机查询请求前置机
		function GetDataC(rowid){
			var args={};
			args.pageIndex=1;//页索引
			args.pageSize=10;//页容量为10
			args.rowid=rowid;
			BingData("#gd2",args,"toConRecordAlarm.action?m=toRequestConditionQ",null);
		}
  </script>
</html>
