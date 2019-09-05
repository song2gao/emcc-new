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
		<link rel="stylesheet" href="/emcc-new/js/layui/css/layui.css">
		<link rel="stylesheet" type="text/css" href="/emcc-new/css/jedate.css">
		<script type="text/javascript"
			src="/emcc-new/js/jquery-1.8.2.min.js">
		</script>
		<script type="text/javascript"
			src="/emcc-new/js/jquery.easyui.min.js">
		</script>
		<script type="text/javascript" src="/emcc-new/js/layui/layui.all.js"></script>
		<script type="text/javascript" src="/emcc-new/js/jquery.jedate.js"></script>
		<script type="text/javascript" src="/emcc-new/js/page.js"></script>
		<script type="text/javascript" src="/emcc-new/js/jsonToTime.js"></script>
		<script type="text/javascript" src="/emcc-new/js/time.js"></script>
<!-- 表格展示 -->
<script>
var ctdCode="2";
var mmpCode="";
var value=0;
var timer;
$(function(){
	getPoints();
	BindText();
	timer=window.setInterval(readdata, 3000);
});
function getPoints(){
	$.ajax({
		url:'coolindex/modelpoints',
		data:{ctmId:"1"},
		dataType:'json',
		async:false,
		success:function(data){
		var str="";
			for(var i=0;i<data.points.length;i++){
				var point=data.points[i];
				str+='<div class="layui-inline">'+
					  	'<label class="layui-form-label" style="width:200px;color:#fff">'+point.mmpNames+'：</label>'+
						'<input type="text" name="test" id="'+point.mmpCodes+'" lay-verify="email" autocomplete="off" class="layui-input"';
				if(point.mmpType==0){
					str+='disabled="disabled"';
				}	
				str+='style="color:black;width:60px;" value="0"></div>'
			}
			$("#data").html(str);
		}
	});
}
function readdata(){
	$.ajax({
		url:'coolindex/plcread',
		dataType:'json',
		data:{ctdCode:"2"},
		success:function(data){
			for(var i=0;i<data.list.length;i++){
				var point=data.list[i];
				var id=point.code;
				var value=point.value;
				$("#"+id).val(value);
			}
		}
	});
}
function writeData(ctdCode,mmpCode,value){
	$.ajax({
		url:'coolindex/plcwrite',
		data:{ctdCode:ctdCode,mmpCode:mmpCode,value:value},
		dataType:'json',
		success:function(data){
			//alert(data.result);
		}
	});
}
//单选按钮事件
function BindText() {
	var texts = $("[name='test']");
	texts.bind('blur', function() {
		mmpCode=this.id;
		value=this.value;
		writeData(ctdCode,mmpCode,value);
		timer=window.setInterval(readdata, 3000);
	});
	texts.bind('focus', function() {
		clearInterval(timer);
	});
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
input[type="text"]{
	color:gray;
}
</style>
	</head>
	<body>
				<!-- 内容板块 -->
				<div class="content-wrap" style="border: height:100%;padding:0px;">
					<div class="row" style="border: height:100%;margin-left:0.2%;">
					<div class="col-sm-10" style="float:left;width:100.0%;height:95%;padding-left:10px;">
					<div style="height:10%;width:90%;border:1px solid red;text-align: center;padding-top:2%;margin-left:5%;color:#fff ">
						<div style="float:left;width:33%">监测点位：
							<select id="cc" class="easyui-combobox" style="width: 200px">
							</select>
						</div>
						<div style="float:left;width:33%">通讯状态：<label id="txtconnstatus">正常</label></div>
						<div style="float:left;width:33%">写入状态：<label id="txtstatus"></label></div>
					</div>
					<div style="float:left;width:100%;height:90%" >
							<div class="layui-form-item" id="data" style="height:100%;overflow-y:scroll;">
							</div>
					</div>
				</div>
	</body>
</html>
