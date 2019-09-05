<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>接入测试管理</title>
    <link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-monitor/monitroFir.css"></link>
    <link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/others.css"></link>
    <link href="/emcc-web/css/poms-system/CSS.css" rel="stylesheet" type="text/css" ></link>
	<link href="/emcc-web/css/poms-system/yxztjk.css" rel="stylesheet" type="text/css"></link>
	<link href="/emcc-web/css/poms-business/ptrzgl.css" rel="stylesheet" type="text/css"></link>
	<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/default/easyui.css"></link>
	<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/icon.css"></link>
	<script type="text/javascript" src="/emcc-web/js/poms-business/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src="/emcc-web/js/poms-business/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/emcc-web/js/page.js"></script>
	<script type="text/javascript" src="/emcc-web/js/poms-business/jsonToTime.js"></script>    
	<script type="text/javascript" src="/emcc-web/js/jzdd.js"></script>

    
  </head>
  
  <body >
	<div id="SecAlarm">
		<table id="tabbb" border="0" align="left">
			<tr>
				<td>企业名称：</td>
				<td><input type="text" id="company" name="company"/></td>
				<td>&emsp;&emsp;&emsp;计量仪表:</td>
				<td><input type="text" id="tabName" name="MeaIns"/></td>
				<td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					<input id="searchButton" class="searchButton" onmousemove="this.style.color='white'" onmouseout="this.style.color='black'" type="button" name="searchButton" value="查询"/>
				</td>
				<td>&emsp;&emsp;&emsp;&emsp;
					<input id="testing" class="searchButton" type="button" onmousemove="this.style.color='white'" onmouseout="this.style.color='black'" name="searchButton" value="测试" onclick="testing()"/>
				</td>
				<td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				<input id="thgs" class="nothg"  type="button" value="通过" onclick="Changetesting()" disabled="disabled"/></td>
				<td>&emsp;&emsp;
					<input type="button" value="等待加载测试" onclick="jz()" onmousemove="this.style.color='white'" onmouseout="this.style.color='black'"/>
				</td>
			</tr>
		</table>
	</div>
	<div style="width: 100%;">
		<table id="gd" class="easyui-datagrid" style="width:1410px;height:230px"
			toolbar="#toolbar"  rownumbers="true" fitColumns="true" singleSelect="true">
		</table>
	</div>
	
	 <div align="left">
		<font id="MeaTerMessage" face="幼圆" style="font-weight: bold;font-size: 14px;"></font>&emsp;
		<font face="幼圆"></font><font face="幼圆" id="Jstatus"></font>
	</div> <br/>
	<div id="kaka" style="width:1410px; height: 170px;">
		<font style="font-size: 13px;font-family: 幼圆;" id="stues"></font>
		<table id="tsila" style="font-size: 12px;" height="80px;" align="left" border="1" width="1230px;">	
			<tr style="width: 500px;" id="bb"></tr>
			<tr style="width: 500px;" id="cc"></tr>
		</table>
	</div>
	<!-- 
	<div id="qing" align="left">
		<table style="font-family: 幼圆;font-size: 15px;" border="0">
			<tr>
				<td>结果描述：</td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea  rows="6" cols="48"></textarea>
				</td>
			</tr>
		</table>
	</div>
	 -->
  </body>
   <script type="text/javascript">
  		function GetData(){
			var args={};
			args.company=$("#company").val();
			args.tabName=$("#tabName").val();
			args.pageIndex=1;//页索引
			args.pageSize=10;//页容量
			BingData("#gd",args,"toJrcsgl.action?m=toFindJrcsgl",null);
		}	
		
		//按id获取前置机返回数据
		function testing(){
			var rows = $('#gd').datagrid('getSelected');
			$.ajax({
				url:"toJrcsgl.action?m=toTestingGetData",
				type:"POST",dataType:"json",
	           	timeout: 1000,
	           	data:{
	           		"id":rows.id
	           	},
	            success:function(data){
					//获取返回数据
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
					var statues = j.sa;
					document.getElementById('Jstatus').innerText=statues;
					//document.getElementById('').innerText=statues;
					document.getElementById('thgs').disabled=false;
					
		        }
			});
		}

		//触发  测试 -->测通 事件
		function Changetesting(){
			$.messager.confirm('提示:','经核实，是否要测通该该计量表计',function(r){
				 if (r){
					createGcjDhccFullScreen('<font style="font-size:18px; color:#ff0000;">加载数据中 。。。</font>', null, null, null, null, null, null);
		    		showGcjDhccFullScreen();  
			        var rows = $('#gd').datagrid('getSelected');
					$.ajax({
						url:"toJrcsgl.action?m=toTestingRequest",
						type:"POST",
						dataType:"json",
			           	data:{
			           		"id":rows.id
			           	},
			           	success:function(data){
							hideGcjDhccFullScreen();
							var stu = data.tade;
							alert(stu.sa);
							GetData();
							$("#tsila").html("");
			           	}
					});
				 }  
			}); 
		}
		/**	加载js测试**/
		function jz(){
			createGcjDhccFullScreen('<font face="幼圆" style="font-size:18px; color:#ff0000;">加载数据中 。。。</font>', null, null, null, null, null, null);
			showGcjDhccFullScreen();
			alert("asdsaddassd");
			hideGcjDhccFullScreen();
		}
		
		
		

  </script>
   <script type="text/javascript"> 
	//页面加载时给提交时间赋值为当前时间
	$(function(){ 
		//初始化table	
		$('#gd').datagrid({
		singleSelect: true,
		pagination:true,
		//fitColumns:true,
		columns: [[
		{ title: 'Id',hidden:true,width: 190, field: 'id',formatter: function (value, rowData, rowIndex) {return value}}, 
		{ title: '计量终端设备', width: 260, field: 'cdtTerminalName',formatter: function (value, rowData, rowIndex) {return value}},
		{ title: '用能单位',  width: 300,  field: 'euiNames',formatter: function (value, rowData, rowIndex)  {return new Object(rowData["pomsEnergyUnitInfo"]).euiNames;}},
		{ title: '通讯协议功能码', width: 335, field: 'cdtProtocalFunCode',formatter: function (value, rowData, rowIndex) {return value}},
		{ title: '运行状态', width: 155, field: 'cdtBackups',formatter: function (value, rowData, rowIndex) {return value}},
		{ title: '计量终端设备地址', width: 300, field: 'cdtProtocalFunCode',formatter: function (value, rowData, rowIndex) {return value}}
		]],
		//单击选中，显示下方信息
		onLoadSuccess:function (data){
			$('#gd').datagrid('selectRow',0);
				var row=$('#gd').datagrid('getSelected');
				document.getElementById('thgs').disabled=true;
				},
		onSelect:function(rowIndex, rowData){
				document.getElementById('thgs').disabled=true;
				
			}
		});
		
		//点击查询按钮时，根据条件查询信息
		$("#searchButton").click(function(){
			$("#gd").datagrid("loadData",[]); 
			GetData();
		});
			GetData();
	});
	
	
	
        $("#searchButton").mouseover(function(){
      $("#searchButton").attr("style","cursor: pointer; height: 23px; width: 69px; background-repeat: no-repeat; text-align:center; font-size:13px; background-image:url(image/poms-system/btn_2.png)");
   });
    $("#searchButton").mouseout(function(){
      $("#searchButton").attr("style","height: 23px; width: 69px; background-repeat: no-repeat; text-align:center; font-size:13px; background-image:url(image/poms-system/btn_1.png)");
   });
  
  
         $("#testing").mouseover(function(){
      $("#testing").attr("style","cursor: pointer; height: 23px; width: 69px; background-repeat: no-repeat; text-align:center; font-size:13px; background-image:url(image/poms-system/btn_2.png)");
   });
    $("#testing").mouseout(function(){
      $("#testing").attr("style","height: 23px; width: 69px; background-repeat: no-repeat; text-align:center; font-size:13px; background-image:url(image/poms-system/btn_1.png)");
   }); 
   
   
	</script>
</html>
