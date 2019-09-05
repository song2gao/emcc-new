<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta>
		<title>用能负荷监测-中惠元景能耗监测平台</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<!-- Le styles -->
		<link rel="stylesheet" href="/emcc-new/assets/css/style.css">
		<link rel="stylesheet" href="/emcc-new/assets/css/bootstrap.css">
		<link rel="stylesheet" href="/emcc-new/css/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css"
			href="/emcc-new/css/icon.css"></link>
		<style>
		input[type=text]{
			color:black;
		}
		</style>
		<script type="text/javascript"
			src="/emcc-new/js/jquery-1.8.2.min.js">
		</script>
		<script type="text/javascript"
			src="/emcc-new/js/jquery.easyui.min.js">
		</script>
		<script type="text/javascript" src="/emcc-new/js/page.js"></script>
		<script type="text/javascript" src="/emcc-new/js/jsonToTime.js"></script>
		<script type="text/javascript" src="/emcc-new/js/time.js"></script>
		<script>
var mydate="";
var type="3";
$(function() {
	var d = new Date();
	daynum = -1;
	var str = myformatter(d);
	daynum=0;
	$("#zhOperateDate").datebox('setValue', str);
	mydate=str;
	InifhTable();
	freshPage();
	BingClickRadio();
	title();
});
function title(){
	$(".dropdown-toggle").css("font-size","24px");
			$(".dropdown-toggle").css("font-family","华文中宋");
			$(".dropdown-toggle").css("line-height","20px");
			$(".col-sm-3").css("padding-left","6px");
			var aLi = document.querySelectorAll('.dropdown-toggle');
		    for (var i = 0; i < aLi.length; i++) {
		        aLi[i].addEventListener('click', function(e){
		        	$(".dropdown-toggle").css("color","white");
		        	if(e.target.className=="dropdown-toggle"){
		        		$(this).css("color","#3F3F3F");
		        	}else{
		        		$(".dropdown-toggle").css("color","white");
		        	}
		        });
		    }
}
//加载表格数据
function GetData() {
	var args = {};
	BingData("#fhtb", args, '../statistics/cpdhdata?type='+type+'&date='+mydate, null);
}
function onChangeDate(date){
	mydate=myformatter(date);
	freshPage();
}
//单选按钮事件
function BingClickRadio() {
	var radios = $("[name='rdmmps']");
	$("[name='rdmmps']").bind('click', function() {
		radiosClick(this.id, this.value);
	});
}
//单选按钮单击事件
function radiosClick(id, value) {
	type=value;
	freshPage();
}
//单击加载图标数据
function freshPage() {
	GetData();
}
</script>
<!-- 表格展示 -->
<script>
function InifhTable() {
	//初始化table	
	$('#fhtb').datagrid( {
		fitColumns : false, //自适应列的大小
		singleSelect : true,
		fit : true,
		rownumbers :false,
		columns : [ [
		{ title: '日期', field: 'dateCode',align:'center', width: 200},
				{
					title : '计量点名称',
					field : 'eusName',
					align : 'center',
					width : 200
				},
				{
					title : '用电量',
					field : 'sumValue',
					align : 'center',
					width : 200
				} ,
				{
					title : '产量',
					field : 'output',
					editor:{type:'text'},
					align : 'center',
					width : 200,
					editor:{type:'text'}
				},
				{
					title : '单耗',
					field : '1',
					formatter:function(value,row){
						return row.sumValue/row.output;
					},
					align : 'center',
					width : 200
				}] ],
		striped : true,
		onClickRow:function(rowIndex, rowData){
			$('#fhtb').datagrid('beginEdit', rowIndex);
			var ed = $('#fhtb').datagrid('getEditors', rowIndex);  
            for (var i = 0; i < ed.length; i++) {  
            	var e = ed[i];  
                $(e.target).bind("change", function() {  
                	return test($(this),rowIndex);  
                });  
           }  
		}
	});
}
function test(text,rowIndex){
		var rows=$("#fhtb").datagrid('getSelected');
		rows.output=text.val();
		$('#fhtb').datagrid('endEdit', rowIndex);
		$('#fhtb').datagrid('refreshRow', rowIndex);
	}
</script>
<STYLE type="text/css">
.box-shadow-2 {
	-webkit-box-shadow: 0 0 10px #1d1f24;
	-moz-box-shadow: 0 0 10px #1d1f24;
	box-shadow: 0 0 10px #1d1f24;
}
.dropdown-toggle{
			cursor:pointer;
		}
</style>
	</head>
	<body>

		<!--  用能负荷监测内容 -->
		<div class="wrap-fluid">
			<div class="container-fluid paper-wrap bevel tlbr" style="width:100%">
						<!--首页导航 -->
		<div class="body-nest col-md-12 box-shadow-2"
			style="background-color: #1f95ef; border: 0px solid; margin-left: -5px;height:55px;;">
			<div class="col-sm-7" style="color: white;border: 0px solid; margin-top: -0.6%;font-family: 华文中宋;font-style:normal;">
				<div class="col-sm-3" style="border: 0px solid;">
					<h4>
						<p data-toggle="dropdown" class="dropdown-toggle" id="top" type="button" >
							<i style="font-style:normal;" class="entypo-home" ></i>总能耗
							<span class="caret"></span>
						</p>
					</h4>
				</div>
				<div class="col-sm-3">
					<h4>
						<p data-toggle="dropdown" class="dropdown-toggle" type="button">
							<i style="font-style:normal;" class="entypo-droplet"></i>用水能耗
							<span class="caret"></span>
						</p>
						
					</h4>
				</div>
				<div class="col-sm-3">
					<h4>
						<p data-toggle="dropdown" class="dropdown-toggle" style="color:#3F3F3F" type="button">
							<i style="font-style:normal;" class="entypo-lamp"></i>用电能耗
							<span class="caret"></span>
						</p>
						
					</h4>
				</div>
				<div class="col-sm-3">
					<h4>
						<p data-toggle="dropdown" class="dropdown-toggle" type="button">
							<i style="font-size: 22px;font-style:normal;" class="entypo-network"></i>用气能耗
							<span class="caret"></span>
						</p>
						
					</h4>
				</div>
			</div>
		</div>
				<!-- 内容板块 -->
				<div class="content-wrap" style="border: 0px solid green;padding:0px;">
					<div class="row" style="border: 0px solid green;margin-left:0.2%;">
					<!--右边面板 -->
					<div class="col-sm-10" style="float:left;width:99.0%;border: 0px solid red ;padding-left:10px;margin-top: 1%;height:87%;">
				         <!-- 有功电能 -->
						<div class="col-xs-3 box-shadow-2" style="float:left;width: 99%;height: 10%;padding:15px 0 0 15px">
							<input type="radio" name="rdmmps" value="3" checked="checked" />日
							<input type="radio" name="rdmmps"  value="2"/>月
							<input type="radio" name="rdmmps"  value="1"/>年
							<span>选择日期</span>&nbsp;
							<input name="zhOperateDate" id="zhOperateDate" value="2013-10-01"
							class="easyui-datebox"
							data-options="formatter:myformatter,parser:myparser,onSelect:onChangeDate"
							style="width: 100px;height:10px" />
						</div>
						<!-- 数据列表 -->
							<div class="col-xs-4 box-shadow-2" style="border:0px solid;width:100%;height: 92%;margin-top: 1%;">
								<table id="fhtb" class="easyui-datagrid" style="width: 100%;; height: 100%;background-color:black" toolbar="#toolbar" >
								</table> 
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
