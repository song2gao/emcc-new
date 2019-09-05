<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>故障记录告警</title>
    <link rel="stylesheet" type="text/css" href="/emcc-new/css/poms-monitor/monitroFir.css"></link>
	<link href="/emcc-new/css/CSS.css" rel="stylesheet" type="text/css" ></link>
	<link href="/emcc-new/css/poms-system/yxztjk.css" rel="stylesheet" type="text/css"></link>
	<link href="/emcc-new/css/poms-system/ptrzgl.css" rel="stylesheet" type="text/css"></link>
	<link rel="stylesheet" type="text/css" href="/emcc-new/css/themes/default/easyui.css"></link>
	<link rel="stylesheet" type="text/css" href="/emcc-new/css/themes/icon.css"></link>
	<script type="text/javascript" src="/emcc-new/js/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src="/emcc-new/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/emcc-new/js/page.js"></script>
	<script type="text/javascript" src="/emcc-new/js/jsonToTime.js"></script>  
	<script type="text/javascript" src="/emcc-new/js/other.js"></script>  
  </head>
  
  <body>
	<div id="FirAlarmsss" align="left">
		<font style="font-size: 13px;">
		<img id="bbimg" src="/emcc-new/image/poms-monitor/frYes.png"/>
		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				截止今天时间,告警<input class="fbs" id="gj" value="&nbsp;" readonly="readonly"/>个；
				故障<input  class="fbs" id="gz" value="&nbsp;" readonly="readonly"/>个；
				一共需确认的数量<input class="fbs" id="qr" value="&nbsp;" readonly="readonly"/>个。
		</font>
	</div>
	
	<div id="SecAlarm">
		<table id="tabbb" border="0" align="left">
			<tr>
				<td>时间：</td>
					<td><input type="text" id="time" name="time" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser"/></td>
				<td>&emsp;&emsp;&emsp;&emsp;关键字：</td>
					<td><input type="text" id="keywords" name="keywords"/></td>
				<td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					<input id="searchButton" class="searchButton" type="button" name="searchButton" value="查询"/>
				</td>
			</tr>
		</table>
	</div>
	
	<table id="gd" class="easyui-datagrid" style="width:1410px;height:455px"
		toolbar="#toolbar"  rownumbers="true" fitColumns="true" singleSelect="true">
	</table>
	
  </body>
  <script type="text/javascript">
  		function GetData(){
			var args={};
			args.time=$("#time").datebox('getValue');
			args.keywords=$("#keywords").val();
			args.pageIndex=1;//页索引
			args.pageSize=10;//页容量
			BingData("#gd",args,"toFailureReco.action?m=toFailureRecord",null);
	}
  </script>
  <script type="text/javascript"> 
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
	//页面加载时给提交时间赋值为当前时间
	$(function(){
		var d = new Date();
		str = d.getFullYear()+'-'+(d.getMonth() + 1<10?('0'+(d.getMonth() + 1)):d.getMonth() + 1)+'-'+(d.getDate()<10?('0'+d.getDate()):d.getDate())
		$("#time").datebox('setValue',str);
		//初始化table
		$('#gd').datagrid({
		fitColumns: false, //自适应列的大小
		singleSelect: true,
		pagination:true,
		title:'故障告警记录',
		columns: [[
			{ title: '时间', width: 200, field: 'oslBugTime',formatter: function (value, rowData, rowIndex) {return  Util.DateTime.Formater('yyyy-MM-dd hh:mm:ss',value.time)}}, 
			{ title: '内容', width: 500,  field: 'oslBugContent',formatter: function (value, rowData, rowIndex)  {return value}},
			{ title: '问题级别', width: 80, field: 'oslBugBand',formatter: function (value, rowData, rowIndex) {return value}},
			{ title: '是否确认', width: 80, field: 'oslIssure',formatter: function (value, rowData, rowIndex) {return value}},
			{ title: '备注', width: 500, field: 'oslBackups',formatter: function (value, rowData, rowIndex) {return value}}	
		]]
		}); 
		//点击查询按钮时，根据条件查询信息
		$("#searchButton").click(function(){
			//获取后台数据
			$("#gd").datagrid("loadData",[]); 
			GetData();
		});
			GetData();
	});
	</script>
	<script type="text/javascript">
		//表头值
		function go1(){
			$.ajax({
				url:"toFailureReco.action?m=togetFRbt",
				type:"POST",dataType:"json",
		       	timeout: 1000,
				success:function(data){
					var yj = data.count1;
					var gz = data.count2;
					//var qr = data.count3;
						$('#gj').val(yj);
						$('#gz').val(gz);
					if(yj>0 || gz>0){
						$("#bbimg").attr("src","/emcc-new/image/poms-monitor/frNo.png");
					}
				}
				});
			}
		function go2(){
			$.ajax({
				url:"toFailureReco.action?m=togetFRbt2",
				type:"POST",dataType:"json",
		       	timeout: 1000,
				success:function(data){
					var qr = data.count3;
					$('#qr').val(qr);
					if(qr>0){
						$("#bbimg").attr("src","/emcc-new/image/poms-monitor/frNo.png");
					}
				}
				});
			}
		//20秒一刷新
		$(function(){  
			go1();
			go2();
			setInterval("go1()", 20000);
			setInterval("go2()", 20000);
		  });
	</script>
</html>
