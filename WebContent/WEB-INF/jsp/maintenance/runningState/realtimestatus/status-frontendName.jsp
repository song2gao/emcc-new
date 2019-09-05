<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>计量终端监视</title>
    <link rel="stylesheet" type="text/css" href="/emcc-new/css/poms-monitor/monitroFir.css"></link>
    <link href="/emcc-new/css/CSS.css" rel="stylesheet" type="text/css" ></link>
	<link href="/emcc-new/css/poms-system/yxztjk.css" rel="stylesheet" type="text/css"></link>
	<link href="/emcc-new/css/poms-system/ptrzgl.css" rel="stylesheet" type="text/css"></link>
	<link rel="stylesheet" type="text/css" href="/emcc-new/css/themes/default/easyui.css"></link>
	<link rel="stylesheet" type="text/css" href="/emcc-new/css/themes/icon.css"></link>
	<script type="text/javascript" src="/emcc-new/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="/emcc-new/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/emcc-new/js/page.js"></script>
	<script type="text/javascript" src="/emcc-new/js/jsonToTime.js"></script>    
    <script type="text/javascript" src="/emcc-new/js/other.js"></script>
    <script type="text/javascript" src="/emcc-new/js/jzdd.js"></script>  
  </head>
  
  <body onload="GetData()">
	<div id="FirAlarmsss" align="left">
		<font style="font-size: 13px;">
		<img id="bbimg" src="/emcc-new/image/poms-monitor/frYes.png"/>
		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				 截止当前时间：共有<font id="num">0</font>只表计处于故障或离线状态。&emsp;&emsp;&emsp; 	
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
				<td>&emsp;&emsp;&emsp;&emsp;采集器：</td>
					<td><input type="text" id="collector" name="collector"/></td>
				<td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					<input id="searchButton" class="searchButton" type="button" name="searchButton" value="查询"/>
				</td>
			</tr>
		</table>
	</div>
	<div style="width: 100%";>
	<table id="gd" class="easyui-datagrid" style="width:1410px;height:200px"
		toolbar="#toolbar"  rownumbers="true" fitColumns="true" singleSelect="true">
	</table>
	</div>
	<div align="left">
		<font id="MeaTerMessage" face="幼圆" style="font-weight: bold;font-size: 14px;"></font>&emsp;
		<font face="幼圆"></font><font face="幼圆" id="Jstatus"></font>
	</div> <br/>
	<div id="kaka" style="width:1410px;height: 100px;">
		<table id="tsila" style="font-size: 12px;" height="80px;" align="left" border="1" width="1230px;">	
			<tr style="width: 500px;" id="bb"></tr>
			<tr style="width: 500px;" id="cc"></tr>
		</table>
	</div>
  </body>
  
  <script type="text/javascript">
  		function GetData(){
			var args={};
			args.company=$("#company").val();
			args.collector=$("#collector").val();
			args.pageIndex=1;//页索引
			args.pageSize=10;//页容量
			BingData("#gd",args,"toMeaTermon.action?m=toMeaTermon",null);
	}
  </script>
   <script type="text/javascript"> 
	//页面加载时给提交时间赋值为当前时间
	$(function(){
		//初始化table
		//createGcjDhccFullScreen('<font face="幼圆" style="font-size:18px; color:#ff0000;">加载数据中 。。。</font>', null, null, null, null, null, null);
		//showGcjDhccFullScreen();
		alert("第二个");
		$('#gd').datagrid({
		fitColumns: false, //自适应列的大小
		singleSelect: true,
		pagination:true,
		height:310,
		columns: [[
			{ title: '终端名称', width: 400, field: 'cdtMeasureLoop',formatter: function (value, rowData, rowIndex) {return value}}, 
			{ title: '企业名称', width: 500, field: 'euiNames',formatter: function (value, rowData, rowIndex) {return new Object(rowData["pomsEnergyUnitInfo"]).euiNames;}},
			{ title: '采集器IP',align:'center' , width: 250,  field: 'crcAssembleIp',formatter: function (value, rowData, rowIndex)  {return new Object(rowData["pomsAssembledTerminalDevice"]).crcAssembleIp;}},
			{ title: '计量表工作状态',align:'center' ,width: 150, field: 'cdtBackups',formatter: function (value, rowData, rowIndex) {return value}}	
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
				$("#cc").html("");
				$("#bb").html("");
				$.ajax({
					url:"toMeaTermon.action?m=toRequestMearTeronQ",
					type:"POST",dataType:"json",
			       	timeout: 1000,
			       	data:{
			       		"id":rowData.id
		         	},
		           	success:function(data){
		         		//hideGcjDhccFullScreen();
		         		document.getElementById('MeaTerMessage').innerText="";			
						document.getElementById('Jstatus').innerText="";
						document.getElementById('bb').innerText="";
						document.getElementById('cc').innerText="";
						var v = data.keys;
						var j = data.tade;
						var name = v.cdtTerminalName;
						var st = v.cdtBackups;
						var jj = j.sd;
						document.getElementById('MeaTerMessage').innerText=name;			
						document.getElementById('Jstatus').innerText="     ☆  工作状态:"+st;			
						
						//下方计量表的信息
						var aa = data.ttt;
						var ss = "<tr>"
						for(var i = 0;i<aa.length;i++){
							ss += " <td >"+aa[i].sa+"</td>"
						}
						ss += " </tr>"
							$("#bb").html("");
							$("#bb").html(ss);
						var qq = "<tr>"
						for(var i = 0;i<aa.length;i++){
							qq += "<td>"+aa[i].da+"</td>"	
						}
						qq += "</tr>"
							$("#cc").html("");
							$("#cc").html(qq);
			        }
				});
				}
			}
		});
		//点击查询按钮时，根据条件查询信息
		$("#searchButton").click(function(){	
			$("#gd").datagrid("loadData",[]); 
			$("#cc").html("");
			$("#bb").html("");
			GetData();
		});
	});
	//执行单机查询请求前置机
		function GetDataC(rowid){
			var args={};
			args.pageIndex=1;//页索引
			args.pageSize=10;//页容量为10
			args.rowid=rowid;
			BingData("#gd2",args,"toMeaTermon.action?m=toRequestMearTeronQ",null);
		}
	function getTitle(){
		$.ajax({
			 url:"toMeaTermon.action?m=tofindBjBTV",
	         type:"POST",dataType:"json",
	         success:function(data){
	         	var size = data.size;
         		document.getElementById('num').innerText=size;
	         	if(size>0){
	         		$("#bbimg").attr("src","/emcc-new/image/poms-monitor/frNo.png");
	         	}
			}
		});
	}
	 $(function(){  
		GetData();
		//二十秒刷新一次表头
		getTitle();
		setInterval("getTitle()", 20000);
	 });
  </script>
</html>







