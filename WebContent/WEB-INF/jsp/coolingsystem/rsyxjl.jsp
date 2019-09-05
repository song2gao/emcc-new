<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta>
<title>历史数据查询-中惠元景能耗监测平台</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<!-- Le styles -->
<link rel="stylesheet" href="/emcc-new/assets/css/style.css">
<link rel="stylesheet" href="/emcc-new/assets/css/bootstrap.css">
<link rel="stylesheet" href="/emcc-new/css/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/emcc-new/css/icon.css"></link>
<link rel="stylesheet" type="text/css" href="/emcc-new/css/jedate.css">
<script type="text/javascript" src="/emcc-new/js/jquery-1.8.2.min.js">
	
</script>
<script type="text/javascript" src="/emcc-new/js/jquery.easyui.min.js">
	
</script>
<script type="text/javascript" src="/emcc-new/js/layui/layui.all.js"></script>
<script type="text/javascript" src="/emcc-new/js/jquery.jedate.js"></script>
<script type="text/javascript" src="/emcc-new/js/page.js"></script>
<script type="text/javascript" src="/emcc-new/js/jsonToTime.js"></script>
<script type="text/javascript" src="/emcc-new/js/time.js"></script>
<script type="text/javascript" src="/emcc-new/js/coolsystem/export.js"></script>
<script type="text/javascript"
	src="/emcc-new/js/datagrid-transposedview.js"></script>
<script>
	var id = "";
	var mydate = "";
	var systemCode = "10";//类型标识 
	var title="";
	$(function() {
		var d = new Date();
		daynum =0;
		var str = myformatter(d);
		$("#zhOperateDate").datebox('setValue', str);
		mydate = str;
		GetData();
	});
	//加载表格数据
	function GetData() {
		var args = {};
		mydate = $("#zhOperateDate").datebox('getValue');
		systemCode=$("#cc").combobox('getValue');
		eval("IniTable"+systemCode+"()");
		BingData("#fhtb", args, 'custom?systemCode='+systemCode+'&dateCode=' + mydate,
				null);
	}
	function exportTable(){
		expt('fhtb','exprotfrom',title);
	}
</script>
<!-- ——————————————————西站系统—————————————————— -->
<!-- 初始化西站制冷用电表格 -->
<script>
	function IniTable0() {
		title="热力管理部制冷用电统计表";
		$('#fhtb').datagrid({
			fit : true,
			headerTextAlign : "center",
			nowrap : false,
			height : "50px",
			title : title,
			fitColumns : false,
			border : true,
			singleSelect : true,
			collapsible : false,
			scrollbarSize : 0,
			method : 'get',
			frozenColumns: [[    
                { title: '日期',align:'center', field: '0',rowspan:2, width: 80, sortable: true}    
            ]], 
			columns:[
			[{"title":"制冷机表数","colspan":4,"rowspan":1,width:120,align:'center'},
				{"title":"冷媒泵表数","colspan":2,width:900,align:'center'},
				{"title":"冷却泵表数","colspan":3,width:900,align:'center'},
				{"title":"冷却塔表数","colspan":4,"rowspan":1,width:950,align:'center'},
				{"title":"抄表人","colspan":1,"rowspan":1,width:900,align:'center'}
			],
			[
				{"title":"1#","colspan":1,field: '1',width:80,align:'center'},
				{"title":"2#","colspan":1,field: '2',width:80,align:'center'},
				{"title":"3#","colspan":1,field: '3',width:80,align:'center'},
				{"title":"4#","colspan":1,field: '4',width:80,align:'center'},
				{"title":"1#","colspan":1,field: '5',width:80,align:'center'},
				{"title":"2#","colspan":1,field: '6',width:80,align:'center'},
				{"title":"1#","colspan":1,field: '7',width:80,align:'center'},
				{"title":"2#","colspan":1,field: '8',width:80,align:'center'},
				{"title":"3#","colspan":1,field: '9',width:80,align:'center'},
				{"title":"1#","colspan":1,field: '10',width:80,align:'center'},
				{"title":"2#","colspan":1,field: '11',width:80,align:'center'},
				{"title":"3#","colspan":1,field: '12',width:80,align:'center'},
				{"title":"4#","colspan":1,field: '13',width:80,align:'center'},
				{"title":"","colspan":1,field: '14',width:80,align:'center'}
			]			
			]
		});
	}
</script>
<!-- 初始化西站能耗表表格 -->
<script>
	function IniTable3() {
		title="热  力  管  理  部  西  站  能  耗  表";
		$('#fhtb').datagrid({
			fit : true,
			headerTextAlign : "center",
			nowrap : false,
			height : "50px",
			title : title,
			fitColumns : false,
			border : true,
			singleSelect : true,
			collapsible : false,
			scrollbarSize : 0,
			method : 'get',
			frozenColumns: [[    
                { title: '记录时间',align:'center', field: '0',rowspan:3, width: 80, sortable: true}    
            ]], 
			columns:[
			[{"title":"总水表（周查）","colspan":2,"rowspan":2,width:120,align:'center'},
				{"title":"高区水表","colspan":2,width:900,"rowspan":2,align:'center'},
				{"title":"低区水表","colspan":2,width:900,"rowspan":2,align:'center'},
				{"title":"电力","colspan":2,width:900,"rowspan":1,align:'center'},
				{"title":"二层热水","colspan":2,width:900,"rowspan":2,align:'center'},
				{"title":"软进水表","colspan":2,width:900,"rowspan":2,align:'center'},
				{"title":"软出水表","colspan":2,width:900,"rowspan":2,align:'center'},
				{"title":"冷却水表","colspan":2,width:900,"rowspan":2,align:'center'},
				{"title":"冷 一水表","colspan":1,"rowspan":2,width:900,align:'center'},
				{"title":"总电表 ","colspan":2,width:900,align:'center'},
				{"title":"办公区电表 ","colspan":2,width:900,align:'center'},
				{"title":"汇宾电表","colspan":2,width:900,align:'center'},
				{"title":"电力总耗","rowspan":2,width:600,align:'center'},
				{"title":" 签 名 ","rowspan":2,width:900,align:'center'}
			],
			
			[
				{"title":"冷水",width:60,align:'center'},
				{"title":"热水",width:60,align:'center'},
				{"title":"(A)×500","colspan":2,width:100,align:'center'},
				{"title":"(B)×40","colspan":2,width:100,align:'center'},
				{"title":"(C)×300","colspan":2,width:100,align:'center'}
			],
			[
				{"title":"底数",field: '1',width:60,align:'center'},//总压
				{"title":"用量",field: '2',width:60,align:'center'},//分压
				{"title":"底数",field: '3',width:60,align:'center'},//总压
				{"title":"用量",field: '4',width:60,align:'center'},//分压
				{"title":"底数",field: '5',width:60,align:'center'},//总压
				{"title":"用量",field: '6',width:60,align:'center'},//分压
				{"title":"底数",field: '7',width:60,align:'center'},//总压
				{"title":"用量",field: '8',width:60,align:'center'},//分压
				{"title":"底数",field: '9',width:60,align:'center'},//总压
				{"title":"用量",field: '10',width:60,align:'center'},//分压
				{"title":"底数",field: '11',width:60,align:'center'},//总压
				{"title":"用量",field: '12',width:60,align:'center'},//分压
				{"title":"底数",field: '13',width:60,align:'center'},//总压
				{"title":"用量",field: '14',width:60,align:'center'},//分压
				{"title":"底数",field: '15',width:60,align:'center'},//总压
				{"title":"用量",field: '16',width:60,align:'center'},//分压
				{"title":"",field: '17',width:60,align:'center'},//分压
				{"title":"底数",field: '18',width:60,align:'center'},//总压
				{"title":"用量",field: '19',width:60,align:'center'},//分压
				{"title":"底数",field: '20',width:60,align:'center'},//总压
				{"title":"用量",field: '21',width:60,align:'center'},//分压
				{"title":"底数",field: '22',width:60,align:'center'},//总压
				{"title":"用量",field: '23',width:60,align:'center'},
				{"title":"A-B+C","colspan":1,field: '24',"rowspan":1,width:60,align:'center'},
				{"title":"","colspan":1,field: '25',"rowspan":1,width:60,align:'center'}
			]
			]
		});
	}
</script>
<!-- 初始化西站采暖表格 -->
<script>
	function IniTable4() {
		title="热 力 管 理 部 西 站 采 暖 运 行 表";
		$('#fhtb').datagrid({
			fit : true,
			headerTextAlign : "center",
			nowrap : false,
			height : "50px",
			title : title,
			fitColumns : false,
			border : true,
			singleSelect : true,
			collapsible : false,
			scrollbarSize : 0,
			method : 'get',
			frozenColumns: [[    
			                 { title: '时间',align:'center', field: '0',rowspan:5, width: 80, sortable: true}    
			             ]], 
			 			columns:[
			 			[{"title":"分汽缸","colspan":2,"rowspan":1,width:220,align:'center'},
			 				{"title":"95度系统","colspan":2,width:900,align:'center'},
			 				{"title":"65度系统","colspan":2,width:900,align:'center'},
			 				{"title":"95度换热器","colspan":8,width:900,align:'center'},
			 				{"title":"65度换热器","colspan":8,width:900,align:'center'},
			 				{"title":"95度采暖泵","colspan":8,width:900,align:'center'},
			 				{"title":"65度采暖泵","colspan":8,width:900,align:'center'}
			 			],
			 			[
			 				{"title":"总压","rowspan":3,width:200,align:'center'},
			 				{"title":"采暖分压","rowspan":3,width:150,align:'center'},
			 				{"title":"水温度","colspan":2,width:150,align:'center'},
			 				{"title":"水温度","colspan":2,rowspan:1,width:100,align:'center'},
			 				{"title":"1#容换",colspan:4,width:100,align:'center'},
			 				{"title":"2#容换","colspan":4,rowspan:1,width:100,align:'center'},
			 				{"title":"1#容换","colspan":4,rowspan:1,width:100,align:'center'},
			 				{"title":"2#容换","colspan":4,rowspan:1,width:100,align:'center'},
			 				{"title":"泵号   1#","colspan":4,width:200,align:'center'},
			 				{"title":"泵号   2#","colspan":4,width:200,align:'center'},
			 				{"title":"泵号   1#","colspan":4,width:200,align:'center'},
			 				{"title":"泵号   2#","colspan":4,width:200,align:'center'}
			 			],
			 			[
			 				{"title":"总供","rowspan":2,width:200,align:'center'},
			 				{"title":"总回","rowspan":2,width:150,align:'center'},
			 				{"title":"总供",rowspan:2,width:100,align:'center'},
			 				{"title":"总回","rowspan":2,width:100,align:'center'},
			 				{"title":"压力","colspan":2,rowspan:1,width:100,align:'center'},
			 				{"title":"水温度","colspan":2,rowspan:1,width:100,align:'center'},
			 				{"title":"压力","colspan":2,rowspan:1,width:100,align:'center'},
			 				{"title":"水温度","colspan":2,rowspan:1,width:100,align:'center'},
			 				{"title":"压力","colspan":2,rowspan:1,width:100,align:'center'},
			 				{"title":"水温度","colspan":2,rowspan:1,width:100,align:'center'},
			 				{"title":"压力","colspan":2,rowspan:1,width:100,align:'center'},
			 				{"title":"水温度","colspan":2,rowspan:1,width:100,align:'center'},
			 				{"title":"压力","colspan":2,width:200,align:'center'},
			 				{"title":"频率","colspan":1,"rowspan":2,width:200,align:'center'},
			 				{"title":"电流","colspan":1,"rowspan":2,width:200,align:'center'},
			 				{"title":"压力","colspan":2,width:200,align:'center'},
			 				{"title":"频率","colspan":1,"rowspan":2,width:200,align:'center'},
			 				{"title":"电流","colspan":1,"rowspan":2,width:200,align:'center'},
			 				{"title":"压力","colspan":2,width:200,align:'center'},
			 				{"title":"频率","colspan":1,"rowspan":2,width:200,align:'center'},
			 				{"title":"电流","colspan":1,"rowspan":2,width:200,align:'center'},
			 				{"title":"压力","colspan":2,width:200,align:'center'},
			 				{"title":"频率","colspan":1,"rowspan":2,width:200,align:'center'},
			 				{"title":"电流","colspan":1,"rowspan":2,width:200,align:'center'}
			 			],
			 			[
			 				{"title":"供",width:60,align:'center'},
			 				{"title":"回",width:60,align:'center'},
			 				{"title":"供",width:60,align:'center'},
			 				{"title":"回",width:60,align:'center'},
			 				{"title":"供",width:60,align:'center'},
			 				{"title":"回",width:60,align:'center'},
			 				{"title":"供",width:60,align:'center'},
			 				{"title":"回",width:60,align:'center'},
			 				{"title":"供",width:60,align:'center'},
			 				{"title":"回",width:60,align:'center'},
			 				{"title":"供",width:60,align:'center'},
			 				{"title":"回",width:60,align:'center'},
			 				{"title":"供",width:60,align:'center'},
			 				{"title":"回",width:60,align:'center'},
			 				{"title":"供",width:60,align:'center'},
			 				{"title":"回",width:60,align:'center'},
			 				{"title":"供水",width:60,align:'center'},
			 				{"title":"回水",width:60,align:'center'},
			 				{"title":"供",width:60,align:'center'},
			 				{"title":"回",width:60,align:'center'},
			 				{"title":"供",width:60,align:'center'},
			 				{"title":"回",width:60,align:'center'},
			 				{"title":"供",width:60,align:'center'},
			 				{"title":"回",width:60,align:'center'}
			 			],
			 			[
			 				{"title":"Mpa",field: '1',width:60,align:'center'},//总压
			 				{"title":"Mpa",field: '2',width:60,align:'center'},//分压
			 				{"title":"℃",field: '3',width:60,align:'center'},//高区1#罐出口压力
			 				{"title":"℃",field: '4',width:60,align:'center'},//高区1#罐出口温度
			 				{"title":"℃",field: '5',width:60,align:'center'},//高区2#罐出口压力
			 				{"title":"℃",field: '6',width:60,align:'center'},//高区2#罐出口温度
			 				{"title":"Mpa",field: '7',width:60,align:'center'},//高区3#罐出口压力
			 				{"title":"Mpa",field: '8',width:60,align:'center'},//高区3#罐出口温度
			 				{"title":"℃",field: '9',width:60,align:'center'},//高区总供水温度
			 				{"title":"℃",field: '10',width:60,align:'center'},//高区总回水温度
			 				{"title":"Mpa",field: '11',width:60,align:'center'},//高区总（高区泵）出口压力
			 				{"title":"Mpa",field: '12',width:60,align:'center'},//低区1#罐出口压力
			 				{"title":"℃",field: '13',width:60,align:'center'},//低区1#罐出口温度
			 				{"title":"℃",field: '14',width:60,align:'center'},//低区2#罐出口压力
			 				{"title":"℃",field: '15',width:60,align:'center'},//低区2#罐出口温度
			 				{"title":"Mpa",field: '16',width:60,align:'center'},//低区3#罐出口压力
			 				{"title":"℃",field: '17',width:60,align:'center'},//低区3#罐出口温度
			 				{"title":"℃",field: '18',width:60,align:'center'},//低区总供水温度
			 				{"title":"℃",field: '19',width:60,align:'center'},//低区总供水温度
			 				{"title":"Mpa",field: '20',width:60,align:'center'},//低区总（低区泵）出口压力
			 				{"title":"℃",field: '21',width:60,align:'center'},//高区2#罐出口压力
			 				{"title":"℃",field: '22',width:60,align:'center'},//高区2#罐出口温度
			 				{"title":"Mpa",field: '23',width:60,align:'center'},//高区3#罐出口压力
			 				{"title":"Mpa",field: '24',width:60,align:'center'},//高区3#罐出口温度
			 				{"title":"Hz",field: '25',width:60,align:'center'},//高区总供水温度
			 				{"title":"A",field: '26',width:60,align:'center'},//高区总回水温度
			 				{"title":"Mpa",field: '27',width:60,align:'center'},//高区总（高区泵）出口压力
			 				{"title":"Mpa",field: '28',width:60,align:'center'},//低区1#罐出口压力
			 				{"title":"Hz",field: '29',width:60,align:'center'},//低区1#罐出口温度
			 				{"title":"A",field: '30',width:60,align:'center'},
			 				{"title":"Mpa",field: '31',width:60,align:'center'},//高区3#罐出口压力
			 				{"title":"Mpa",field: '32',width:60,align:'center'},//高区3#罐出口温度
			 				{"title":"Hz",field: '33',width:60,align:'center'},//高区总供水温度
			 				{"title":"A",field: '34',width:60,align:'center'},//高区总回水温度
			 				{"title":"Mpa",field: '35',width:60,align:'center'},//高区总（高区泵）出口压力
			 				{"title":"Mpa",field: '36',width:60,align:'center'},//低区1#罐出口压力
			 				{"title":"Hz",field: '37',width:60,align:'center'},//低区1#罐出口温度
			 				{"title":"A",field: '38',width:60,align:'center'}
			 			]
			 			]
		});
	}
</script>
<!-- 初始化西站制冷表格 -->
<script>
	function IniTable5() {
		title="热 力 管 理 部 西 站 采 暖 运 行 表";
		$('#fhtb').datagrid({
			fit : true,
			headerTextAlign : "center",
			nowrap : false,
			height : "50px",
			title :title,
			fitColumns : false,
			border : true,
			singleSelect : true,
			collapsible : false,
			scrollbarSize : 0,
			method : 'get',
			frozenColumns: [[    
			                 { title: '时间',align:'center', field: '0',rowspan:4, width: 80, sortable: true}    
			             ]], 
			 			columns:[
			 			[{"title":"制冷机","colspan":14,"rowspan":1,width:220,align:'center'},
			 				{"title":"冷媒泵","colspan":10,width:900,align:'center'},
			 				{"title":"冷却泵","colspan":7,width:900,align:'center'},
			 				{"title":"运行记事","colspan":1,rowspan:3,width:900,align:'center'}
			 			],
			 			[
			 				{"title":"制冷机电机","colspan":3,width:200,align:'center'},
			 				{"title":"蒸发器","colspan":5,width:150,align:'center'},
			 				{"title":"冷凝器","colspan":4,width:150,align:'center'},
			 				{"title":"油槽","colspan":2,rowspan:1,width:100,align:'center'},
			 				{"title":"进口压力",rowspan:2,width:100,align:'center'},
			 				{"title":"1#","colspan":3,rowspan:1,width:100,align:'center'},
			 				{"title":"2#","colspan":3,rowspan:1,width:100,align:'center'},
			 				{"title":"3#","colspan":3,rowspan:1,width:100,align:'center'},
			 				{"title":"进口压力",rowspan:2,width:100,align:'center'},
			 				{"title":"1#","colspan":3,width:200,align:'center'},
			 				{"title":"2#","colspan":3,width:200,align:'center'}
			 			],
			 			[
			 				{"title":"机号",width:60,align:'center'},
			 				{"title":"负载",width:60,align:'center'},
			 				{"title":"电流",width:60,align:'center'},
			 				{"title":"温度",width:60,align:'center'},
			 				{"title":"压力",width:60,align:'center'},
			 				{"title":"出水温度",width:60,align:'center'},
			 				{"title":"回水温度",width:60,align:'center'},//对应3#罐出口压力  原因后查
			 				{"title":"过热度",width:60,align:'center'},
			 				{"title":"压力",width:60,align:'center'},
			 				{"title":"出水温度",width:60,align:'center'},
			 				{"title":"回水温度",width:60,align:'center'},//对应3#罐出口压力  原因后查
			 				{"title":"过冷度",width:60,align:'center'},
			 				{"title":"油压",width:60,align:'center'},
			 				{"title":"油温",width:60,align:'center'},
			 				{"title":"出口压力",width:100,align:'center'},
			 				{"title":"电流",width:100,align:'center'},
			 				{"title":"频率",width:100,align:'center'},
			 				{"title":"出口压力",width:100,align:'center'},
			 				{"title":"电流",width:100,align:'center'},
			 				{"title":"频率",width:100,align:'center'},
			 				{"title":"出口压力",width:100,align:'center'},
			 				{"title":"电流",width:100,align:'center'},
			 				{"title":"频率",width:100,align:'center'},
			 				{"title":"出口压力",width:100,align:'center'},
			 				{"title":"电流",width:100,align:'center'},
			 				{"title":"频率",width:100,align:'center'},
			 				{"title":"出口压力",width:100,align:'center'},
			 				{"title":"电流",width:100,align:'center'},
			 				{"title":"频率",width:100,align:'center'}
			 			],
			 			[
			 				{"title":"#",field: '1',width:60,align:'center'},//总压
			 				{"title":"%",field: '2',width:60,align:'center'},//分压
			 				{"title":"A",field: '3',width:60,align:'center'},//高区1#罐出口压力
			 				{"title":"℃",field: '4',width:60,align:'center'},//高区1#罐出口温度
			 				{"title":"Mpa",field: '5',width:60,align:'center'},//高区2#罐出口压力
			 				{"title":"℃",field: '6',width:60,align:'center'},//高区2#罐出口温度
			 				{"title":"℃",field: '7',width:60,align:'center'},//高区3#罐出口压力
			 				{"title":"℃",field: '8',width:60,align:'center'},//高区3#罐出口温度
			 				{"title":"Mpa",field: '9',width:60,align:'center'},//高区总供水温度
			 				{"title":"℃",field: '10',width:60,align:'center'},//高区总回水温度
			 				{"title":"℃",field: '11',width:60,align:'center'},//高区总（高区泵）出口压力
			 				{"title":"℃",field: '12',width:60,align:'center'},//低区1#罐出口压力
			 				{"title":"Mpa",field: '13',width:60,align:'center'},//低区1#罐出口温度
			 				{"title":"℃",field: '14',width:60,align:'center'},//低区2#罐出口压力
			 				{"title":"Mpa",field: '15',width:60,align:'center'},//低区2#罐出口温度
			 				{"title":"Mpa",field: '16',width:60,align:'center'},//低区3#罐出口压力
			 				{"title":"A",field: '17',width:60,align:'center'},//低区3#罐出口温度
			 				{"title":"Hz",field: '18',width:60,align:'center'},//低区总供水温度
			 				{"title":"Mpa",field: '19',width:60,align:'center'},//低区总供水温度
			 				{"title":"A",field: '20',width:60,align:'center'},//低区2#罐出口温度
			 				{"title":"Hz",field: '21',width:60,align:'center'},//低区3#罐出口压力
			 				{"title":"Mpa",field: '22',width:60,align:'center'},//低区3#罐出口温度
			 				{"title":"A",field: '23',width:60,align:'center'},//低区总供水温度
			 				{"title":"Hz",field: '24',width:60,align:'center'},//低区总供水温度
			 				{"title":"Mpa",field: '25',width:60,align:'center'},//低区3#罐出口压力
			 				{"title":"Mpa",field: '26',width:60,align:'center'},//低区3#罐出口温度
			 				{"title":"A",field: '27',width:60,align:'center'},//低区总供水温度
			 				{"title":"Hz",field: '28',width:60,align:'center'},//低区总供水温度
			 				{"title":"Mpa",field: '29',width:60,align:'center'},//低区3#罐出口压力
			 				{"title":"A",field: '30',width:60,align:'center'},//低区3#罐出口温度
			 				{"title":"Hz",field: '31',width:60,align:'center'},//低区总供水温度
			 				{"title":"",field: '32',width:60,align:'center'},//低区总供水温度
			 			]
			 			]
		});
	}
</script>

<!-- 初始化西暖计量65℃表格 -->
<script>
	function IniTable1() {
		title="热力管理部西站供暖（65度）超声波计量表";
		$('#fhtb').datagrid({
			fit : true,
			headerTextAlign : "center",
			nowrap : false,
			height : "50px",
			title : title,
			fitColumns : false,
			border : true,
			singleSelect : true,
			collapsible : false,
			scrollbarSize : 0,
			method : 'get',
			frozenColumns: [[    
                { title: '时间',align:'center', field: '0',rowspan:4, width: 80, sortable: true},
                { title: '泵号',align:'center', field: '1',rowspan:4, width: 80, sortable: true},
                { title: '频率',align:'center', field: '2',rowspan:4, width: 80, sortable: true}    
            ]], 
			columns:[
			[{"title":"汇宾大厦","colspan":5,"rowspan":1,width:120,align:'center'},
			 {"title":"西区公寓","colspan":5,width:120,align:'center'}
			],
			[
				{"title":"10","colspan":1,width:100,align:'center'},
				{"title":"20","colspan":1,width:100,align:'center'},
				{"title":"21","colspan":1,width:100,align:'center'},
				{"title":"22",rowspan:1,width:100,align:'center'},
				{"title":"23",rowspan:1,width:100,align:'center'},
				{"title":"10",rowspan:1,width:100,align:'center'},
				{"title":"20","colspan":1,width:100,align:'center'},
				{"title":"21","colspan":1,width:100,align:'center'},
				{"title":"22","colspan":1,width:100,align:'center'},
				{"title":"23","rowspan":1,width:100,align:'center'}
			],
			[
				{"title":"累计热量",width:100,align:'center'},
				{"title":"瞬时热量",width:100,align:'center'},
				{"title":"瞬时流量",width:100,align:'center'},
				{"title":"供水温度",width:100,align:'center'},
				{"title":"回水温度",width:100,align:'center'},
				{"title":"累计热量",width:100,align:'center'},
				{"title":"瞬时热量",width:100,align:'center'},
				{"title":"瞬时流量",width:100,align:'center'},
				{"title":"供水温度",width:100,align:'center'},
				{"title":"回水温度",width:100,align:'center'}
			],
			[
				{"title":"MWh",field: '3',width:100,align:'center'},//总压
				{"title":"MWh",field: '4',width:100,align:'center'},//分压
				{"title":"m3/h",field: '5',width:100,align:'center'},//高区1#罐出口压力
				{"title":"℃",field: '6',width:100,align:'center'},//高区1#罐出口温度
				{"title":"℃",field: '7',width:100,align:'center'},//高区2#罐出口压力
				{"title":"MWh",field: '8',width:100,align:'center'},//总压
				{"title":"MWh",field: '9',width:100,align:'center'},//分压
				{"title":"m3/h",field: '10',width:100,align:'center'},//高区1#罐出口压力
				{"title":"℃",field: '11',width:100,align:'center'},//高区1#罐出口温度
				{"title":"℃",field: '12',width:100,align:'center'}
			]
			]
		});
	}
</script>

<!-- 初始化西暖计量95℃表格 -->
<script>
	function IniTable2() {
		title="热力管理部西站供暖（95度）超声波计量表";
		$('#fhtb').datagrid({
			fit : true,
			headerTextAlign : "center",
			nowrap : false,
			height : "50px",
			title : title,
			fitColumns : false,
			border : true,
			singleSelect : true,
			collapsible : false,
			scrollbarSize : 0,
			method : 'get',
			frozenColumns: [[    
                { title: '时间',align:'center', field: '0',rowspan:4, width: 80, sortable: true},
                { title: '泵号',align:'center', field: '1',rowspan:4, width: 80, sortable: true},
                { title: '频率',align:'center', field: '2',rowspan:4, width: 80, sortable: true}    
            ]], 
			columns:[
			[{"title":"汇宾大厦","colspan":5,"rowspan":1,width:120,align:'center'},
			 {"title":"西区公寓","colspan":5,width:120,align:'center'}
			],
			[
				{"title":"LOOP-0","colspan":1,width:100,align:'center'},
				{"title":"LOOP-1-1","colspan":1,width:100,align:'center'},
				{"title":"LOOP-1-2","colspan":1,width:100,align:'center'},
				{"title":"LOOP-1TV",rowspan:1,width:100,align:'center'},
				{"title":"LOO0-1TR",rowspan:1,width:100,align:'center'},
				{"title":"LOOP-0","colspan":1,width:100,align:'center'},
				{"title":"LOOP-1-1","colspan":1,width:100,align:'center'},
				{"title":"LOOP-1-2","colspan":1,width:100,align:'center'},
				{"title":"LOOP-1TV",rowspan:1,width:100,align:'center'},
				{"title":"LOO0-1TR",rowspan:1,width:100,align:'center'}
			],
			[
				{"title":"累计热量",width:100,align:'center'},
				{"title":"瞬时热量",width:100,align:'center'},
				{"title":"瞬时流量",width:100,align:'center'},
				{"title":"供水温度",width:100,align:'center'},
				{"title":"回水温度",width:100,align:'center'},
				{"title":"累计热量",width:100,align:'center'},
				{"title":"瞬时热量",width:100,align:'center'},
				{"title":"瞬时流量",width:100,align:'center'},
				{"title":"供水温度",width:100,align:'center'},
				{"title":"回水温度",width:100,align:'center'}
			],
			[
				{"title":"GJ",field: '3',width:100,align:'center'},//总压
				{"title":"m3/h",field: '4',width:100,align:'center'},//分压
				{"title":"KW",field: '5',width:100,align:'center'},//高区1#罐出口压力
				{"title":"℃",field: '6',width:100,align:'center'},//高区1#罐出口温度
				{"title":"℃",field: '7',width:100,align:'center'},//高区2#罐出口压力
				{"title":"GJ",field: '8',width:100,align:'center'},//总压
				{"title":"m3/h",field: '9',width:100,align:'center'},//分压
				{"title":"KW",field: '10',width:100,align:'center'},//高区1#罐出口压力
				{"title":"℃",field: '11',width:100,align:'center'},//高区1#罐出口温度
				{"title":"℃",field: '12',width:100,align:'center'},//高区2#罐出口压力
			]
			]
		});
	}
</script>
<!-- 初始化西站生活热水表格 -->
<script>
	function IniTable6() {
		title="热力管理部西站生活热水运行表";
		$('#fhtb').datagrid({
			fit : true,
			headerTextAlign : "center",
			nowrap : false,
			height : "50px",
			title : title,
			fitColumns : false,
			border : true,
			singleSelect : true,
			collapsible : false,
			scrollbarSize : 0,
			method : 'get',
			frozenColumns: [[    
                { title: '记录时间',align:'center', field: '0',rowspan:4, width: 80, sortable: true}    
            ]], 
			columns:[
			[{"title":"分汽缸","colspan":2,"rowspan":2,width:120,align:'center'},
				{"title":"高区","colspan":9,width:900,align:'center'},
				{"title":"低区","colspan":9,width:900,align:'center'}
			],
			[
				{"title":"1#罐","colspan":2,width:200,align:'center'},
				{"title":"2#罐","colspan":2,width:200,align:'center'},
				{"title":"3#罐","colspan":2,width:200,align:'center'},
				{"title":"总供水温度",rowspan:2,width:100,align:'center'},
				{"title":"总回水温度",rowspan:2,width:100,align:'center'},
				{"title":"总出口压力",rowspan:2,width:100,align:'center'},
				{"title":"1#罐","colspan":2,width:200,align:'center'},
				{"title":"2#罐","colspan":2,width:200,align:'center'},
				{"title":"3#罐","colspan":2,width:200,align:'center'},
				{"title":"总供水温度","rowspan":2,width:100,align:'center'},
				{"title":"总回水温度","rowspan":2,width:100,align:'center'},
				{"title":"总出口压力","rowspan":2,width:100,align:'center'}
			],
			[
				{"title":"总压",width:60,align:'center'},
				{"title":"分压",width:60,align:'center'},
				{"title":"出口压力",width:100,align:'center'},
				{"title":"出口温度",width:100,align:'center'},
				{"title":"出口压力",width:100,align:'center'},
				{"title":"出口温度",width:100,align:'center'},
				{"title":"出口压力",width:100,align:'center'},//对应3#罐出口压力  原因后查
				{"title":"出口温度",width:100,align:'center'},
				{"title":"出口压力",width:100,align:'center'},
				{"title":"出口温度",width:100,align:'center'},
				{"title":"出口压力",width:100,align:'center'},
				{"title":"出口温度",width:100,align:'center'},
				{"title":"出口压力",width:100,align:'center'},
				{"title":"出口温度",width:100,align:'center'}
			],
			[
				{"title":"Mpa",field: '1',width:60,align:'center'},//总压
				{"title":"Mpa",field: '2',width:60,align:'center'},//分压
				{"title":"Mpa",field: '3',width:100,align:'center'},//高区1#罐出口压力
				{"title":"℃",field: '4',width:100,align:'center'},//高区1#罐出口温度
				{"title":"Mpa",field: '5',width:100,align:'center'},//高区2#罐出口压力
				{"title":"℃",field: '6',width:100,align:'center'},//高区2#罐出口温度
				{"title":"Mpa",field: '7',width:100,align:'center'},//高区3#罐出口压力
				{"title":"℃",field: '8',width:100,align:'center'},//高区3#罐出口温度
				{"title":"℃",field: '9',width:100,align:'center'},//高区总供水温度
				{"title":"℃",field: '10',width:100,align:'center'},//高区总回水温度
				{"title":"Mpa",field: '11',width:100,align:'center'},//高区总（高区泵）出口压力
				{"title":"Mpa",field: '12',width:100,align:'center'},//低区1#罐出口压力
				{"title":"℃",field: '13',width:100,align:'center'},//低区1#罐出口温度
				{"title":"Mpa",field: '14',width:100,align:'center'},//低区2#罐出口压力
				{"title":"℃",field: '15',width:100,align:'center'},//低区2#罐出口温度
				{"title":"Mpa",field: '16',width:100,align:'center'},//低区3#罐出口压力
				{"title":"℃",field: '17',width:100,align:'center'},//低区3#罐出口温度
				{"title":"℃",field: '18',width:100,align:'center'},//低区总供水温度
				{"title":"℃",field: '19',width:100,align:'center'},//低区总供水温度
				{"title":"Mpa",field: '20',width:100,align:'center'}//低区总（低区泵）出口压力
			]
			]
		});
	}
</script>

<!-- ——————————————————东站系统—————————————————— -->

<!-- 初始化东站制冷表格 -->
<script>
	function IniTable12() {
		title="热 力 管 理 部 东 站 制 冷 运 行 记 录 ";
		$('#fhtb').datagrid({
			fit : true,
			headerTextAlign : "center",
			nowrap : false,
			height : "50px",
			title : title,
			fitColumns : false,
			border : true,
			singleSelect : true,
			collapsible : false,
			scrollbarSize : 0,
			method : 'get',
			frozenColumns: [[    
			                 { title: '时间',align:'center', field: '0',rowspan:4, width: 80, sortable: true}    
			             ]], 
			             columns:[
						 			[{"title":"制冷机","colspan":14,"rowspan":1,width:220,align:'center'},
						 				{"title":"冷媒泵","colspan":10,width:900,align:'center'},
						 				{"title":"冷却泵","colspan":7,width:900,align:'center'},
						 				{"title":"运行记事","colspan":2,rowspan,4,width:900,align:'center'}
						 			],
						 			[
						 				{"title":"制冷机电机","colspan":3,width:200,align:'center'},
						 				{"title":"蒸发器","colspan":5,width:150,align:'center'},
						 				{"title":"冷凝器","colspan":4,width:150,align:'center'},
						 				{"title":"油槽","colspan":2,rowspan:1,width:100,align:'center'},
						 				{"title":"进口压力",rowspan:2,width:100,align:'center'},
						 				{"title":"1#","colspan":3,rowspan:1,width:100,align:'center'},
						 				{"title":"2#","colspan":3,rowspan:1,width:100,align:'center'},
						 				{"title":"3#","colspan":3,rowspan:1,width:100,align:'center'},
						 				{"title":"进口压力",rowspan:2,width:100,align:'center'},
						 				{"title":"1#罐","colspan":3,width:200,align:'center'},
						 				{"title":"2#罐","colspan":3,width:200,align:'center'},
						 				{"title":"","colspan":3,"rowspan":2,width:200,align:'center'}
						 			],
						 			[
						 				{"title":"机号",width:60,align:'center'},
						 				{"title":"负载",width:60,align:'center'},
						 				{"title":"电流",width:60,align:'center'},
						 				{"title":"温度",width:60,align:'center'},
						 				{"title":"压力",width:60,align:'center'},
						 				{"title":"出水温度",width:60,align:'center'},
						 				{"title":"回水温度",width:60,align:'center'},//对应3#罐出口压力  原因后查
						 				{"title":"过热度",width:60,align:'center'},
						 				{"title":"压力",width:60,align:'center'},
						 				{"title":"出水温度",width:60,align:'center'},
						 				{"title":"回水温度",width:60,align:'center'},//对应3#罐出口压力  原因后查
						 				{"title":"过冷度",width:60,align:'center'},
						 				{"title":"油压",width:60,align:'center'},
						 				{"title":"油温",width:60,align:'center'},
						 				{"title":"出口压力",width:100,align:'center'},
						 				{"title":"电流",width:100,align:'center'},
						 				{"title":"频率",width:100,align:'center'},
						 				{"title":"出口压力",width:100,align:'center'},
						 				{"title":"电流",width:100,align:'center'},
						 				{"title":"频率",width:100,align:'center'},
						 				{"title":"出口压力",width:100,align:'center'},
						 				{"title":"电流",width:100,align:'center'},
						 				{"title":"频率",width:100,align:'center'},
						 				{"title":"出口压力",width:100,align:'center'},
						 				{"title":"电流",width:100,align:'center'},
						 				{"title":"频率",width:100,align:'center'},
						 				{"title":"出口压力",width:100,align:'center'},
						 				{"title":"电流",width:100,align:'center'},
						 				{"title":"频率",width:100,align:'center'}
						 			],
						 			[
						 				{"title":"#",field: '1',width:60,align:'center'},//总压
						 				{"title":"%",field: '2',width:60,align:'center'},//分压
						 				{"title":"A",field: '3',width:60,align:'center'},//高区1#罐出口压力
						 				{"title":"℃",field: '4',width:60,align:'center'},//高区1#罐出口温度
						 				{"title":"Mpa",field: '5',width:60,align:'center'},//高区2#罐出口压力
						 				{"title":"℃",field: '6',width:60,align:'center'},//高区2#罐出口温度
						 				{"title":"℃",field: '7',width:60,align:'center'},//高区3#罐出口压力
						 				{"title":"℃",field: '8',width:60,align:'center'},//高区3#罐出口温度
						 				{"title":"Mpa",field: '9',width:60,align:'center'},//高区总供水温度
						 				{"title":"℃",field: '10',width:60,align:'center'},//高区总回水温度
						 				{"title":"℃",field: '11',width:60,align:'center'},//高区总（高区泵）出口压力
						 				{"title":"℃",field: '12',width:60,align:'center'},//低区1#罐出口压力
						 				{"title":"Mpa",field: '13',width:60,align:'center'},//低区1#罐出口温度
						 				{"title":"℃",field: '14',width:60,align:'center'},//低区2#罐出口压力
						 				{"title":"Mpa",field: '15',width:60,align:'center'},//低区2#罐出口温度
						 				{"title":"Mpa",field: '16',width:60,align:'center'},//低区3#罐出口压力
						 				{"title":"A",field: '17',width:60,align:'center'},//低区3#罐出口温度
						 				{"title":"Hz",field: '18',width:60,align:'center'},//低区总供水温度
						 				{"title":"Mpa",field: '19',width:60,align:'center'},//低区总供水温度
						 				{"title":"A",field: '20',width:60,align:'center'},//低区2#罐出口温度
						 				{"title":"Hz",field: '21',width:60,align:'center'},//低区3#罐出口压力
						 				{"title":"Mpa",field: '22',width:60,align:'center'},//低区3#罐出口温度
						 				{"title":"A",field: '23',width:60,align:'center'},//低区总供水温度
						 				{"title":"Hz",field: '24',width:60,align:'center'},//低区总供水温度
						 				{"title":"Mpa",field: '25',width:60,align:'center'},//低区3#罐出口压力
						 				{"title":"Mpa",field: '26',width:60,align:'center'},//低区3#罐出口温度
						 				{"title":"A",field: '27',width:60,align:'center'},//低区总供水温度
						 				{"title":"Hz",field: '28',width:60,align:'center'},//低区总供水温度
						 				{"title":"Mpa",field: '29',width:60,align:'center'},//低区3#罐出口压力
						 				{"title":"A",field: '30',width:60,align:'center'},//低区3#罐出口温度
						 				{"title":"Hz",field: '31',width:60,align:'center'}
						 			]
						 			]
		});
	}
</script>

<!-- 初始化东站能耗表表格 -->
<script>
	function IniTable10() {
		title="热  力  管  理  部  东  站  能  耗  表";
		$('#fhtb').datagrid({
			fit : true,
			headerTextAlign : "center",
			nowrap : false,
			height : "50px",
			title : title,
			fitColumns : false,
			border : true,
			singleSelect : true,
			collapsible : false,
			scrollbarSize : 0,
			method : 'get',
			frozenColumns: [[    
                { title: '记录时间',align:'center', field: '0',rowspan:3, width: 80, sortable: true}    
            ]], 
			columns:[
			[{"title":"总水表（周查）","colspan":2,"rowspan":2,width:120,align:'center'},
				{"title":"高区水表","colspan":2,width:900,"rowspan":2,align:'center'},
				{"title":"低区水表","colspan":2,width:900,"rowspan":2,align:'center'},
				{"title":"电力","colspan":2,width:900,"rowspan":1,align:'center'},
				{"title":"二层热水","colspan":2,width:900,"rowspan":2,align:'center'},
				{"title":"软进水表","colspan":2,width:900,"rowspan":2,align:'center'},
				{"title":"软出水表","colspan":2,width:900,"rowspan":2,align:'center'},
				{"title":"冷却水表","colspan":2,width:900,"rowspan":2,align:'center'},
				{"title":"冷 一水表","colspan":1,"rowspan":2,width:900,align:'center'},
				{"title":"总电表 ","colspan":2,width:900,align:'center'},
				{"title":"办公区电表 ","colspan":2,width:900,align:'center'},
				{"title":"汇宾电表","colspan":2,width:900,align:'center'},
				{"title":"电力总耗","rowspan":2,width:600,align:'center'},
				{"title":" 签 名 ","rowspan":2,width:900,align:'center'}
			],
			
			[
				{"title":"冷水",width:60,align:'center'},
				{"title":"热水",width:60,align:'center'},
				{"title":"(A)×500","colspan":2,width:100,align:'center'},
				{"title":"(B)×40","colspan":2,width:100,align:'center'},
				{"title":"(C)×300","colspan":2,width:100,align:'center'}
			],
			[
				{"title":"底数",field: '1',width:60,align:'center'},//总压
				{"title":"用量",field: '2',width:60,align:'center'},//分压
				{"title":"底数",field: '3',width:60,align:'center'},//总压
				{"title":"用量",field: '4',width:60,align:'center'},//分压
				{"title":"底数",field: '5',width:60,align:'center'},//总压
				{"title":"用量",field: '6',width:60,align:'center'},//分压
				{"title":"底数",field: '7',width:60,align:'center'},//总压
				{"title":"用量",field: '8',width:60,align:'center'},//分压
				{"title":"底数",field: '9',width:60,align:'center'},//总压
				{"title":"用量",field: '10',width:60,align:'center'},//分压
				{"title":"底数",field: '11',width:60,align:'center'},//总压
				{"title":"用量",field: '12',width:60,align:'center'},//分压
				{"title":"底数",field: '13',width:60,align:'center'},//总压
				{"title":"用量",field: '14',width:60,align:'center'},//分压
				{"title":"底数",field: '15',width:60,align:'center'},//总压
				{"title":"用量",field: '16',width:60,align:'center'},//分压
				{"title":"",field: '17',width:60,align:'center'},//分压
				{"title":"底数",field: '18',width:60,align:'center'},//总压
				{"title":"用量",field: '19',width:60,align:'center'},//分压
				{"title":"底数",field: '20',width:60,align:'center'},//总压
				{"title":"用量",field: '21',width:60,align:'center'},//分压
				{"title":"底数",field: '22',width:60,align:'center'},//总压
				{"title":"用量",field: '23',width:60,align:'center'},
				{"title":"A-B+C","colspan":1,field: '24',"rowspan":1,width:60,align:'center'},
				{"title":"","colspan":1,"rowspan":1,width:60,align:'center'}
			]
			]
		});
	}
</script>

<!-- 初始化东站采暖表格 -->
<script>
	function IniTable11() {
		title="热 力 管 理 部 东 站 采 暖 运 行 表";
		$('#fhtb').datagrid({
			fit : true,
			headerTextAlign : "center",
			nowrap : false,
			height : "50px",
			title : title,
			fitColumns : false,
			border : true,
			singleSelect : true,
			collapsible : false,
			scrollbarSize : 0,
			method : 'get',
			frozenColumns: [[    
			                 { title: '时间',align:'center', field: '0',rowspan:5, width: 80, sortable: true}    
			             ]], 
			 			columns:[
			 			[{"title":"分汽缸","colspan":2,"rowspan":1,width:220,align:'center'},
			 				{"title":"95度系统","colspan":2,width:900,align:'center'},
			 				{"title":"65度系统","colspan":4,width:900,align:'center'},
			 				{"title":"95度换热器","colspan":8,width:900,align:'center'},
			 				{"title":"65度换热器","colspan":16,width:900,align:'center'},
			 				{"title":"95度采暖泵","colspan":8,width:900,align:'center'},
			 				{"title":"65度采暖泵","colspan":8,width:900,align:'center'}
			 			],
			 			[
			 				{"title":"总压","rowspan":3,width:200,align:'center'},
			 				{"title":"采暖分压","rowspan":3,width:150,align:'center'},
			 				{"title":"水温度","colspan":2,width:150,align:'center'},
			 				{"title":"水温度","colspan":4,rowspan:1,width:100,align:'center'},
			 				{"title":"1#容换",colspan:4,width:100,align:'center'},
			 				{"title":"2#容换","colspan":4,rowspan:1,width:100,align:'center'},
			 				{"title":"1#容换","colspan":4,rowspan:1,width:100,align:'center'},
			 				{"title":"2#容换","colspan":4,rowspan:1,width:100,align:'center'},
			 				{"title":"3#容换","colspan":4,rowspan:1,width:100,align:'center'},
			 				{"title":"4#容换","colspan":4,rowspan:1,width:100,align:'center'},
			 				{"title":"泵号   1#","colspan":4,width:200,align:'center'},
			 				{"title":"泵号   2#","colspan":4,width:200,align:'center'},
			 				{"title":"泵号   3#","colspan":4,width:200,align:'center'},
			 				{"title":"泵号   4#","colspan":4,width:200,align:'center'}
			 			],
			 			[
			 				{"title":"总供","rowspan":2,width:200,align:'center'},
			 				{"title":"总回","rowspan":2,width:150,align:'center'},
			 				{"title":"低区",rowspan:1,colspan:2,width:100,align:'center'},
			 				{"title":"高区","rowspan":1,colspan:2,width:100,align:'center'},
			 				{"title":"压力","colspan":2,rowspan:1,width:100,align:'center'},
			 				{"title":"水温度","colspan":2,rowspan:1,width:100,align:'center'},
			 				{"title":"压力","colspan":2,rowspan:1,width:100,align:'center'},
			 				{"title":"水温度","colspan":2,rowspan:1,width:100,align:'center'},
			 				{"title":"压力","colspan":2,rowspan:1,width:100,align:'center'},
			 				{"title":"水温度","colspan":2,rowspan:1,width:100,align:'center'},
			 				{"title":"压力","colspan":2,rowspan:1,width:100,align:'center'},
			 				{"title":"水温度","colspan":2,rowspan:1,width:100,align:'center'},
			 				{"title":"压力","colspan":2,rowspan:1,width:100,align:'center'},
			 				{"title":"水温度","colspan":2,rowspan:1,width:100,align:'center'},
			 				{"title":"压力","colspan":2,rowspan:1,width:100,align:'center'},
			 				{"title":"水温度","colspan":2,rowspan:1,width:100,align:'center'},
			 				{"title":"压力","colspan":2,width:200,align:'center'},
			 				{"title":"频率","colspan":1,"rowspan":2,width:200,align:'center'},
			 				{"title":"电流","colspan":1,"rowspan":2,width:200,align:'center'},
			 				{"title":"压力","colspan":2,width:200,align:'center'},
			 				{"title":"频率","colspan":1,"rowspan":2,width:200,align:'center'},
			 				{"title":"电流","colspan":1,"rowspan":2,width:200,align:'center'},
			 				{"title":"压力","colspan":2,width:200,align:'center'},
			 				{"title":"频率","colspan":1,"rowspan":2,width:200,align:'center'},
			 				{"title":"电流","colspan":1,"rowspan":2,width:200,align:'center'},
			 				{"title":"压力","colspan":2,width:200,align:'center'},
			 				{"title":"频率","colspan":1,"rowspan":2,width:200,align:'center'},
			 				{"title":"电流","colspan":1,"rowspan":2,width:200,align:'center'}
			 			],
			 			[
			 				{"title":"总供",width:60,align:'center'},
			 				{"title":"总回",width:60,align:'center'},
			 				{"title":"供",width:60,align:'center'},
			 				{"title":"回",width:60,align:'center'},
			 				{"title":"供",width:60,align:'center'},
			 				{"title":"回",width:60,align:'center'},
			 				{"title":"供",width:60,align:'center'},
			 				{"title":"回",width:60,align:'center'},
			 				{"title":"供",width:60,align:'center'},
			 				{"title":"回",width:60,align:'center'},
			 				{"title":"供",width:60,align:'center'},
			 				{"title":"回",width:60,align:'center'},
			 				{"title":"供",width:60,align:'center'},
			 				{"title":"回",width:60,align:'center'},
			 				{"title":"供",width:60,align:'center'},
			 				{"title":"回",width:60,align:'center'},
			 				{"title":"供",width:60,align:'center'},
			 				{"title":"回",width:60,align:'center'},
			 				{"title":"供水",width:60,align:'center'},
			 				{"title":"回水",width:60,align:'center'},
			 				{"title":"供",width:60,align:'center'},
			 				{"title":"回",width:60,align:'center'},
			 				{"title":"供",width:60,align:'center'},
			 				{"title":"回",width:60,align:'center'},
			 				{"title":"供",width:60,align:'center'},
			 				{"title":"回",width:60,align:'center'},
			 				{"title":"供",width:60,align:'center'},
			 				{"title":"回",width:60,align:'center'},
			 				{"title":"供",width:60,align:'center'},
			 				{"title":"回",width:60,align:'center'},
			 				{"title":"供",width:60,align:'center'},
			 				{"title":"回",width:60,align:'center'},
			 				{"title":"供",width:60,align:'center'},
			 				{"title":"回",width:60,align:'center'}
			 			],
			 			[
			 				{"title":"Mpa",field: '1',width:60,align:'center'},//总压
			 				{"title":"Mpa",field: '2',width:60,align:'center'},//分压
			 				{"title":"℃",field: '3',width:60,align:'center'},//高区1#罐出口压力
			 				{"title":"℃",field: '4',width:60,align:'center'},//高区1#罐出口温度
			 				{"title":"℃",field: '5',width:60,align:'center'},//高区2#罐出口压力
			 				{"title":"℃",field: '6',width:60,align:'center'},//高区2#罐出口温度
			 				{"title":"℃",field: '7',width:60,align:'center'},//高区1#罐出口压力
			 				{"title":"℃",field: '8',width:60,align:'center'},//高区1#罐出口温度
			 				{"title":"Mpa",field: '9',width:60,align:'center'},//高区3#罐出口压力
			 				{"title":"Mpa",field: '10',width:60,align:'center'},//高区3#罐出口温度
			 				{"title":"℃",field: '11',width:60,align:'center'},//高区总供水温度
			 				{"title":"℃",field: '12',width:60,align:'center'},//高区总回水温度
			 				{"title":"Mpa",field: '13',width:60,align:'center'},//高区总（高区泵）出口压力
			 				{"title":"Mpa",field: '14',width:60,align:'center'},//低区1#罐出口压力
			 				{"title":"℃",field: '15',width:60,align:'center'},//低区1#罐出口温度
			 				{"title":"℃",field: '16',width:60,align:'center'},//低区2#罐出口压力
			 				{"title":"℃",field: '17',width:60,align:'center'},//低区2#罐出口温度
			 				{"title":"Mpa",field: '18',width:60,align:'center'},//低区3#罐出口压力
			 				{"title":"℃",field: '19',width:60,align:'center'},//低区3#罐出口温度
			 				{"title":"℃",field: '20',width:60,align:'center'},//低区总供水温度
			 				{"title":"℃",field: '21',width:60,align:'center'},//低区总供水温度
			 				{"title":"Mpa",field: '22',width:60,align:'center'},//低区总（低区泵）出口压力
			 				{"title":"℃",field: '23',width:60,align:'center'},//高区2#罐出口压力
			 				{"title":"℃",field: '24',width:60,align:'center'},//高区2#罐出口温度
			 				{"title":"Mpa",field: '25',width:60,align:'center'},//高区3#罐出口压力
			 				{"title":"Mpa",field: '26',width:60,align:'center'},//高区3#罐出口温度
			 				{"title":"Hz",field: '27',width:60,align:'center'},//高区总供水温度
			 				{"title":"A",field: '28',width:60,align:'center'},//高区总回水温度
			 				{"title":"Mpa",field: '29',width:60,align:'center'},//高区总（高区泵）出口压力
			 				{"title":"Mpa",field: '30',width:60,align:'center'},//低区1#罐出口压力
			 				{"title":"Hz",field: '31',width:60,align:'center'},//低区1#罐出口温度
			 				{"title":"A",field: '32',width:60,align:'center'},
			 				{"title":"Mpa",field: '33',width:60,align:'center'},//高区3#罐出口压力
			 				{"title":"Mpa",field: '34',width:60,align:'center'},//高区3#罐出口温度
			 				{"title":"Hz",field: '35',width:60,align:'center'},//高区总供水温度
			 				{"title":"A",field: '36',width:60,align:'center'},//高区总回水温度
			 				{"title":"Mpa",field: '37',width:60,align:'center'},//高区总（高区泵）出口压力
			 				{"title":"Mpa",field: '38',width:60,align:'center'},//低区1#罐出口压力
			 				{"title":"Hz",field: '39',width:60,align:'center'},//低区1#罐出口温度
			 				{"title":"A",field: '40',width:60,align:'center'},//高区总回水温度
			 				{"title":"Mpa",field: '41',width:60,align:'center'},//高区总（高区泵）出口压力
			 				{"title":"Mpa",field: '42',width:60,align:'center'},//低区1#罐出口压力
			 				{"title":"Hz",field: '43',width:60,align:'center'},//低区1#罐出口温度
			 				{"title":"A",field: '44',width:60,align:'center'},//高区总回水温度
			 				{"title":"Mpa",field: '45',width:60,align:'center'},//高区总（高区泵）出口压力
			 				{"title":"Mpa",field: '46',width:60,align:'center'},//低区1#罐出口压力
			 				{"title":"Hz",field: '47',width:60,align:'center'},//低区1#罐出口温度
			 				{"title":"A",field: '48',width:60,align:'center'}
			 			]
			 			]
		});
	}
</script>

<!-- 初始化东暖计量95℃表格 -->
<script>
	function IniTable9() {
		title="热力管理部东站供暖（95度）超声波计量表";
		$('#fhtb').datagrid({
			fit : true,
			headerTextAlign : "center",
			nowrap : false,
			height : "50px",
			title : title,
			fitColumns : false,
			border : true,
			singleSelect : true,
			collapsible : false,
			scrollbarSize : 0,
			method : 'get',
			frozenColumns: [[    
                { title: '时间',align:'center', field: '0',rowspan:4, width: 80, sortable: true},
                { title: '泵号',align:'center', field: '1',rowspan:4, width: 80, sortable: true},
                { title: '频率',align:'center', field: '2',rowspan:4, width: 80, sortable: true}    
            ]], 
			columns:[
			[{"title":"ABC座","colspan":5,"rowspan":1,width:120,align:'center'},
			 {"title":"汇珍楼","colspan":5,width:120,align:'center'}
			],
			[
				{"title":"LOOP-0","colspan":1,width:100,align:'center'},
				{"title":"LOOP-1-1","colspan":1,width:100,align:'center'},
				{"title":"LOOP-1-2","colspan":1,width:100,align:'center'},
				{"title":"LOOP-1TV",rowspan:1,width:100,align:'center'},
				{"title":"LOO0-1TR",rowspan:1,width:100,align:'center'},
				{"title":"LOOP-0","colspan":1,width:100,align:'center'},
				{"title":"LOOP-1-1","colspan":1,width:100,align:'center'},
				{"title":"LOOP-1-2","colspan":1,width:100,align:'center'},
				{"title":"LOOP-1TV",rowspan:1,width:100,align:'center'},
				{"title":"LOO0-1TR",rowspan:1,width:100,align:'center'}
			],
			[
				{"title":"累计热量",width:100,align:'center'},
				{"title":"瞬时热量",width:100,align:'center'},
				{"title":"瞬时流量",width:100,align:'center'},
				{"title":"供水温度",width:100,align:'center'},
				{"title":"回水温度",width:100,align:'center'},
				{"title":"累计热量",width:100,align:'center'},
				{"title":"瞬时热量",width:100,align:'center'},
				{"title":"瞬时流量",width:100,align:'center'},
				{"title":"供水温度",width:100,align:'center'},
				{"title":"回水温度",width:100,align:'center'}
			],
			[
				{"title":"GJ",field: '3',width:100,align:'center'},//总压
				{"title":"m3/h",field: '4',width:100,align:'center'},//分压
				{"title":"KW",field: '5',width:100,align:'center'},//高区1#罐出口压力
				{"title":"℃",field: '6',width:100,align:'center'},//高区1#罐出口温度
				{"title":"℃",field: '7',width:100,align:'center'},//高区2#罐出口压力
				{"title":"GJ",field: '8',width:100,align:'center'},//总压
				{"title":"m3/h",field: '9',width:100,align:'center'},//分压
				{"title":"KW",field: '10',width:100,align:'center'},//高区1#罐出口压力
				{"title":"℃",field: '11',width:100,align:'center'},//高区1#罐出口温度
				{"title":"℃",field: '12',width:100,align:'center'},//高区2#罐出口压力
			]
			]
		});
	}
</script>

<!-- 初始化东暖计量65℃表格 -->
<script>
	function IniTable8() {
		title="热力管理部东站供暖（65度）超声波计量表";
		$('#fhtb').datagrid({
			fit : true,
			headerTextAlign : "center",
			nowrap : false,
			height : "50px",
			title : title,
			fitColumns : false,
			border : true,
			singleSelect : true,
			collapsible : false,
			scrollbarSize : 0,
			method : 'get',
			frozenColumns: [[    
                { title: '时间',align:'center', field: '0',rowspan:4, width: 80, sortable: true},
                { title: '泵号',align:'center', field: '1',rowspan:4, width: 80, sortable: true},
                { title: '频率',align:'center', field: '2',rowspan:4, width: 80, sortable: true}    
            ]], 
			columns:[
			[{"title":"ABC座","colspan":5,"rowspan":1,width:120,align:'center'},
			 {"title":"汇珍楼","colspan":5,width:120,align:'center'}
			],
			[
				{"title":"10","colspan":1,width:100,align:'center'},
				{"title":"20","colspan":1,width:100,align:'center'},
				{"title":"21","colspan":1,width:100,align:'center'},
				{"title":"22",rowspan:1,width:100,align:'center'},
				{"title":"23",rowspan:1,width:100,align:'center'},
				{"title":"10",rowspan:1,width:100,align:'center'},
				{"title":"20","colspan":1,width:100,align:'center'},
				{"title":"21","colspan":1,width:100,align:'center'},
				{"title":"22","colspan":1,width:100,align:'center'},
				{"title":"23","rowspan":1,width:100,align:'center'}
			],
			[
				{"title":"累计热量",width:100,align:'center'},
				{"title":"瞬时热量",width:100,align:'center'},
				{"title":"瞬时流量",width:100,align:'center'},
				{"title":"供水温度",width:100,align:'center'},
				{"title":"回水温度",width:100,align:'center'},
				{"title":"累计热量",width:100,align:'center'},
				{"title":"瞬时热量",width:100,align:'center'},
				{"title":"瞬时流量",width:100,align:'center'},
				{"title":"供水温度",width:100,align:'center'},
				{"title":"回水温度",width:100,align:'center'}
			],
			[
				{"title":"MWh",field: '3',width:100,align:'center'},//总压
				{"title":"MWh",field: '4',width:100,align:'center'},//分压
				{"title":"m3/h",field: '5',width:100,align:'center'},//高区1#罐出口压力
				{"title":"℃",field: '6',width:100,align:'center'},//高区1#罐出口温度
				{"title":"℃",field: '7',width:100,align:'center'},//高区2#罐出口压力
				{"title":"MWh",field: '8',width:100,align:'center'},//总压
				{"title":"MWh",field: '9',width:100,align:'center'},//分压
				{"title":"m3/h",field: '10',width:100,align:'center'},//高区1#罐出口压力
				{"title":"℃",field: '11',width:100,align:'center'},//高区1#罐出口温度
				{"title":"℃",field: '12',width:100,align:'center'}
			]
			]
		});
	}
</script>

<!-- 初始化东站制冷用电表格 -->
<script>
	function IniTable7() {
		title="热力管理部东站制冷用电统计表";
		$('#fhtb').datagrid({
			fit : true,
			headerTextAlign : "center",
			nowrap : false,
			height : "50px",
			title : title,
			fitColumns : false,
			border : true,
			singleSelect : true,
			collapsible : false,
			scrollbarSize : 0,
			method : 'get',
			frozenColumns: [[    
                { title: '日期',align:'center', field: '0',rowspan:4, width: 80, sortable: true}    
            ]], 
			columns:[
			[{"title":"制冷机表数","colspan":3,"rowspan":1,width:120,align:'center'},
				{"title":"冷媒泵表数","colspan":5,width:900,align:'center'},
				{"title":"冷却泵表数","colspan":5,width:900,align:'center'},
				{"title":"冷却塔表数","colspan":3,"rowspan":1,width:950,align:'center'},
				{"title":"抄表人","colspan":1,"rowspan":1,width:900,align:'center'}
			],
			[
				{"title":"1#","colspan":1,field: '1',width:80,align:'center'},
				{"title":"2#","colspan":1,field: '2',width:80,align:'center'},
				{"title":"3#","colspan":1,field: '3',width:80,align:'center'},
				{"title":"1#","colspan":1,field: '4',width:80,align:'center'},
				{"title":"2#","colspan":1,field: '5',width:80,align:'center'},
				{"title":"3#","colspan":1,field: '6',width:80,align:'center'},
				{"title":"4#","colspan":1,field: '7',width:80,align:'center'},
				{"title":"5#","colspan":1,field: '8',width:80,align:'center'},
				{"title":"1#","colspan":1,field: '9',width:80,align:'center'},
				{"title":"2#","colspan":1,field: '10',width:80,align:'center'},
				{"title":"3#","colspan":1,field: '11',width:80,align:'center'},
				{"title":"4#","colspan":1,field: '12',width:80,align:'center'},
				{"title":"5#","colspan":1,field: '13',width:80,align:'center'},
				{"title":"1#","colspan":1,field: '14',width:80,align:'center'},
				{"title":"2#","colspan":1,field: '15',width:80,align:'center'},
				{"title":"3#","colspan":1,field: '16',width:80,align:'center'},
				{"title":"","colspan":1,field: '17',width:80,align:'center'}
			]			
			]
		});
	}
</script>

<!-- 初始化东站生活热水表格 -->
<script>
	function IniTable13() {
		title="热力管理部东站生活热水运行表";
		$('#fhtb').datagrid({
			fit : true,
			headerTextAlign : "center",
			nowrap : false,
			height : "50px",
			title : title,
			fitColumns : false,
			border : true,
			singleSelect : true,
			collapsible : false,
			scrollbarSize : 0,
			method : 'get',
			frozenColumns: [[    
                { title: '记录时间',align:'center',rowspan:4, field: '0', width: 80, sortable: true}    
            ]], 
			columns:[
			[{"title":"分汽缸","colspan":2,"rowspan":2,width:120,align:'center'},
				{"title":"高区","colspan":6,width:600,align:'center'},
				{"title":"中区","colspan":6,width:600,align:'center'},
				{"title":"低区","colspan":4,width:600,align:'center'}
			],
			[
				{"title":"1#罐","colspan":2,width:200,align:'center'},
				{"title":"2#罐","colspan":2,width:200,align:'center'},
				{"title":"总回水温度",rowspan:2,width:100,align:'center'},//对应3#罐出口温度  原因后查
				{"title":"总出口压力",rowspan:2,width:100,align:'center'},//对应总供水温度  原因后查
				{"title":"1#罐","colspan":2,width:200,align:'center'},
				{"title":"2#罐","colspan":2,width:200,align:'center'},
				{"title":"总回水温度","rowspan":2,width:100,align:'center'},
				{"title":"总出口压力","rowspan":2,width:100,align:'center'},
				{"title":"1#罐","colspan":2,width:200,align:'center'},
				{"title":"总回水温度","rowspan":2,width:100,align:'center'},
				{"title":"总出口压力","rowspan":2,width:100,align:'center'}
			],
			[
				{"title":"总压",width:60,align:'center'},
				{"title":"分压",width:60,align:'center'},
				{"title":"出口压力",width:100,align:'center'},
				{"title":"出口温度",width:100,align:'center'},
				{"title":"出口压力",width:100,align:'center'},
				{"title":"出口温度",width:100,align:'center'},
				{"title":"出口压力",width:100,align:'center'},
				{"title":"出口温度",width:100,align:'center'},
				{"title":"出口压力",width:100,align:'center'},
				{"title":"出口温度",width:100,align:'center'},
				{"title":"出口压力",width:100,align:'center'},
				{"title":"出口温度",width:100,align:'center'}
			],
			[
				{"title":"Mpa",field: '1',width:60,align:'center'},//总压
				{"title":"Mpa",field: '2',width:60,align:'center'},//分压
				{"title":"Mpa",field: '3',width:100,align:'center'},//高区1#罐出口压力
				{"title":"℃",field: '4',width:100,align:'center'},//高区1#罐出口温度
				{"title":"Mpa",field: '5',width:100,align:'center'},//高区2#罐出口压力
				{"title":"℃",field: '6',width:100,align:'center'},//高区2#罐出口温度
				{"title":"℃",field: '7',width:100,align:'center'},//高区总回水温度
				{"title":"Mpa",field: '8',width:100,align:'center'},//高区总（高区泵）出口压力
				{"title":"Mpa",field: '9',width:100,align:'center'},//中区1#罐出口压力
				{"title":"℃",field: '10',width:100,align:'center'},//中区1#罐出口温度
				{"title":"Mpa",field: '11',width:100,align:'center'},//中区2#罐出口压力
				{"title":"℃",field: '12',width:100,align:'center'},//中区2#罐出口温度
				{"title":"℃",field: '13',width:100,align:'center'},//中区总回水温度
				{"title":"Mpa",field: '14',width:100,align:'center'},//中区总（中区泵）出口压力
				{"title":"Mpa",field: '15',width:100,align:'center'},//低区1#罐出口压力
				{"title":"℃",field: '16',width:100,align:'center'},//低区1#罐出口温度
				{"title":"℃",field: '17',width:100,align:'center'},//低区总回水温度
				{"title":"Mpa",field: '18',width:100,align:'center'}//低区总（低区泵）出口压力
			]
			]
		});
	}
</script>
<STYLE type="text/css">
.box-shadow-2 {
	-webkit-box-shadow: 0 0 10px #1d1f24;
	-moz-box-shadow: 0 0 10px #1d1f24;
	box-shadow: 0 0 10px #1d1f24;
}

.dropdown-toggle {
	cursor: pointer;
}

.button {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 5px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
}
</style>
</head>
<body>
	<!--  用能负荷监测内容 -->
	<div class="wrap-fluid">
		<div class="container-fluid paper-wrap bevel tlbr" style="width: 100%">
			<!-- 内容板块 -->
			<div class="content-wrap"
				style="border: 0px solid green; padding: 0px;">
				<div class="row" style="border: 0px solid green; margin-left: 0.2%;">
					<div class="col-sm-10"
						style="float: left; width: 100.0%; border: 0px solid red; padding-left: 10px; margin-top: 1%; height: 87%;">

						<div class="col-xs-3 box-shadow-2"
							style="float: left; width: 99%; height: 10%; padding: 15px 0 0 15px;color:#fff">
							报表类型：
							<select id="cc" class="easyui-combobox" style="width: 200px">  
    							<option value="0">西站制冷用电</option>  
    							<option value="1" >西暖计量65℃</option>  
    							<option value="2">西暖计量95℃</option>  
    							<option value="3" >西站能耗表</option>  
    							<option value="4" >西站采暖</option>  
    							<option value="5" selected="selected">西站制冷</option>  
    							<option value="6" >西站热水</option>
    							<option value="7" >东站制冷用电</option>  
    							<option value="8" >东暖计量65℃</option>  
    							<option value="9">东暖计量95℃</option>  
    							<option value="10" >东站能耗表</option>  
    							<option value="11" >东站采暖</option>  
    							<option value="12">东站制冷</option>  
    							<option value="13">东站热水</option>  
							</select>  
							时间：
							<input name="zhOperateDate" id="zhOperateDate"
										value="2013-10-01" class="easyui-datebox"
										data-options="formatter:myformatter,parser:myparser"
										style="width: 100px; height: 10px" />
							<input type="button" class="button"
								style="margin-left: 1%; background-color: #008CBA;"
								onclick="GetData()" value="查询" /> <input type="button"
								id="btnExport" class="button"
								style="margin-left: 1%; background-color: #008CBA;"
								onclick="exportTable()" value="导出" />
						</div>

						<!-- 数据列表 -->
						<div class="col-xs-4 box-shadow-2" id="table"
							style="width: 99%; height: 99%; margin-top: 1%;">
							<!--  用能负荷监测内容 -->
							<table id="fhtb"
								style="width: 100%; height: 100%;overflow-x: scroll;"
								singleSelect="true" >
							</table>
						</div>
						<form id="exprotfrom"></form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
