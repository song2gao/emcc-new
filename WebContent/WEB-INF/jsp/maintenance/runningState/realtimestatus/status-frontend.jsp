<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>前置机状态监视</title>
    <link rel="stylesheet" type="text/css" href="/emcc-new/css/poms-monitor/monitroFir.css"></link>
    <link href="/emcc-new/css/CSS.css" rel="stylesheet" type="text/css" ></link>
	<link href="/emcc-new/css/poms-system/yxztjk.css" rel="stylesheet" type="text/css"></link>
	<link href="/emcc-new/css/poms-system/ptrzgl.css" rel="stylesheet" type="text/css"></link>
	<link rel="stylesheet" type="text/css" href="/emcc-new/css/themes/default/easyui.css"></link>
	<link rel="stylesheet" type="text/css" href="/emcc-new/css/themes/icon.css"></link>
	<script type="text/javascript" src="/emcc-new/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="/emcc-new/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/emcc-new/js/page.js"></script>
	<script type="text/javascript" src="/emcc-new/js/sonToTime.js"></script>    
    <script type="text/javascript" src="/emcc-new/js/other.js"></script>  
  </head>

  <body>
	<div id="FirAlarmsss" align="left">
		<font style="font-size: 13px;">
		<img id="bbimg" src="/emcc-new/image/poms-monitor/frYes.png"/>
		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				截止当前时间：共有<font id="num">0</font>台前置机处于故障或离线状态。&emsp;&emsp;&emsp; 	
		</font>
		<font style="font-size: 13px;" color="#009ACD">
			<a href="faultinfo">&raquo;详情</a>
		</font>
	</div>
	
	<div id="SecAlarm">
		<table id="tabbb" border="0" align="left">
			<tr>
				<td>前置机服务名称：</td>
					<td><input id="names" name="names"/></td>
				<td>&emsp;&emsp;&emsp;&emsp;前置端口：</td>
					<td><input id="ports" name="ports"/></td>
				<td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
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
			<tr><td><font face="幼圆" style="font-weight: bold;font-size: 14px;">前置机：</font><font id="ForendMessage" face="幼圆" style="font-weight: bold;font-size: 14px;"></font></td></tr>
			<tr><td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<font face="幼圆">☆&nbsp;前置机工作状态:</font></td><td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<font face="幼圆">☆&nbsp;有功电量:</font></td></tr>
			<tr><td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<font face="幼圆">☆&nbsp;CPU利用率:</font></td><td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<font face="幼圆">☆&nbsp;无功电量:</font></td></tr>
			<tr><td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<font face="幼圆">☆&nbsp;虚拟机对内存大小:</font></td></tr>
			<tr><td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<font face="幼圆">☆&nbsp;JVM当前活动线程数:</font></td></tr>
			<tr><td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<font face="幼圆">☆&nbsp;JVM当前占用内存:</font></td></tr>
		</table>
	</div>
  </body>
  
  <script type="text/javascript">
  		function GetData(){
		var args={};
		args.names=$("#names").val();
		args.ports=$("#ports").val();
		args.pageIndex=1;//页索引
		args.pageSize=10;//页容量
		BingData("#gd",null,"runStatus/frontendGet",null);
	}
  </script>
   <script type="text/javascript"> 
	//页面加载时给提交时间赋值为当前时间
	$(function(){
		alert("第一个");
		//初始化table	
		$('#gd').datagrid({
		fitColumns: false, //自适应列的大小
		singleSelect: true,
		pagination:true,
		height:310,
		columns: [[
		{ title: '前置服务名称', width: 300, field: 'communicateProtocal',formatter: function (value, rowData, rowIndex) {return value}}, 
		{ title: '前置机IP',  width: 250,  field: 'frontProcessorIp',formatter: function (value, rowData, rowIndex)  {return value}},
		{ title: '前置机端口', width: 300, field: 'frontProcessorPort',formatter: function (value, rowData, rowIndex) {return value}},
		{ title: '前置机性质', width: 250, field: '#',formatter: function (value, rowData, rowIndex) {return value}},
		{ title: '当前工作状态', width: 250, field: '#',formatter: function (value, rowData, rowIndex) {return value}}
		]],
		//单击选中，显示下方信息
		onLoadSuccess:function (data){
			$('#gd').datagrid('selectRow',0);
				var row=$('#gd').datagrid('getSelected');
				},
		onSelect:function(rowIndex, rowData){
			if(rowData!=null){
				$.ajax({
					url:"runStatus/frontendList",
					type:"POST",dataType:"json",
			       	timeout: 1000,
			       	data:{
			       		"id":rowData.id
		         	},
		           	success:function(data){
		           		alert(data);
						var v = data.keys;
						var name = v.communicateProtocal;
						document.getElementById('ForendMessage').innerText=name;			
						btValue();
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
	//执行单机查询请求前置机
		function GetDataC(rowid){
			var args={};
			args.pageIndex=1;//页索引
			args.pageSize=10;//页容量为10
			args.rowid=rowid;
			BingData("#gd2",args,"toMeaTermon.action?m=toRequestMearTeronQ",null);
		}

	//表头数
		function btValue(){
			var row=$('#gd').datagrid('getSelected');
			$.ajax({
				url:"toFrontend.action?m=tofindQzjBTV",
				type:"POST",dataType:"json",
		       	timeout: 1000,
		       	data:{
		       		"id":row.id
	         	},
	           	success:function(data){
					var v = data.size;
					//alert("jjjjjjj"+v);					
					//document.getElementById('ForendMessage').innerText=name;			
		        }
			});

		};
  </script>
</html>
