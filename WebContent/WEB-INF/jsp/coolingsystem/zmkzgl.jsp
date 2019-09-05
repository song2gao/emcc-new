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
		<title>照明控制管理-中惠元景能耗监测平台</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<!-- Le styles -->
		<link rel="stylesheet" href="/emcc-new/assets/css/style.css">
		<link rel="stylesheet" href="/emcc-new/assets/css/bootstrap.css">
		<link rel="stylesheet" href="/emcc-new/css/themes/default/easyui.css">
		<link rel="stylesheet" href="/emcc-new/js/layui/css/layui.css">
		<link rel="stylesheet" type="text/css"
			href="/emcc-new/css/icon.css"></link>
		<link rel="stylesheet" type="text/css" href="/emcc-new/css/jedate.css">
		<script type="text/javascript"
			src="/emcc-new/js/jquery-1.8.2.min.js">
		</script>
		<script type="text/javascript"
			src="/emcc-new/js/jquery.easyui.min.js">
		</script>
		<script type="text/javascript" src="/emcc-new/js/jquery.jedate.js"></script>
		<script type="text/javascript" src="/emcc-new/js/page.js"></script>
		<script type="text/javascript" src="/emcc-new/js/jsonToTime.js"></script>
		<script type="text/javascript" src="/emcc-new/js/time.js"></script>
		<script>
var id = "";
$(function() {
	InifhTable();
	$('.chages').click(function(){  
	    var img=$(this).find('img').attr('src');
	    if(img=='/emcc-new/images/off.png'){  
	        img="/emcc-new/images/on.png";
	    }else{
	    	img="/emcc-new/images/off.png";
	    }
	    $(this).find('img').attr('src',img);  
	}); 
});

//加载表格数据
function GetData() {
	//var args = {};
	//begindate=$("#begindate").val();
	//enddate=$("#enddate").val();
	//args.begindate=begindate;
	//args.enddate=enddate;
	//args.mmpCode=mmpCode;
	//BingClickRadio();
	//BingData("#fhtb", args, 'yearmonthday?id='+id, null);
	//BingData("#fhtb", args, 'dataTable', null);
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
				{
					title : '编号',
					field : 'ctdName',
					align : 'center',
					width : 300,
					styler : function(value, row, index) {
						return 'border:1px solid #528B8B;';
					}
				},
				{
					title : '起始时间',
					field : 'beginValue',
					align : 'center',
					width : 300,
					styler : function(value, row, index) {
						return 'border:1px solid #528B8B;';
					}
				} ,
				{
					title : '结束时间',
					field : 'endValue',
					align : 'center',
					width : 300,
					styler : function(value, row, index) {
						return 'border:1px solid #528B8B;';
					}
				},
				{
					title : '当前状态',
					field : 'value',
					align : 'center',
					width : 300,
					styler : function(value, row, index) {
						return 'border:1px solid #528B8B;';
					}
				}],[{"title":"线路一",align:'center'},
	 				{"title":"18:00",align:'center'},
	 				{"title":"22:00",align:'center'},
	 				{"title":"<span class='chages'><img src='/emcc-new/images/off.png' width='42px' height='20px' /></span>",align:'center'}
	 			],[{"title":"线路二",align:'center'},
	 				{"title":"18:00",align:'center'},
	 				{"title":"22:00",align:'center'},
	 				{"title":"<span class='chages'><img src='/emcc-new/images/on.png' width='42px' height='20px' /></span>",align:'center'}
	 			],[{"title":"线路三",align:'center'},
	 				{"title":"18:00",align:'center'},
	 				{"title":"22:00",align:'center'},
	 				{"title":"<span class='chages'><img src='/emcc-new/images/on.png' width='42px' height='20px' /></span>",align:'center'}
	 			],[{"title":"线路四",align:'center'},
	 				{"title":"18:00",align:'center'},
	 				{"title":"22:00",align:'center'},
	 				{"title":"<span class='chages'><img src='/emcc-new/images/on.png' width='42px' height='20px' /></span>",align:'center'}
	 			],[{"title":"线路五",align:'center'},
	 				{"title":"18:00",align:'center'},
	 				{"title":"22:00",align:'center'},
	 				{"title":"<span class='chages'><img src='/emcc-new/images/off.png' width='42px' height='20px' /></span>",align:'center'}
	 			],[{"title":"线路六",align:'center'},
	 				{"title":"18:00",align:'center'},
	 				{"title":"22:00",align:'center'},
	 				{"title":"<span class='chages'><img src='/emcc-new/images/on.png' width='42px' height='20px' /></span>",align:'center'}
	 			],[{"title":"线路七",align:'center'},
	 				{"title":"18:00",align:'center'},
	 				{"title":"22:00",align:'center'},
	 				{"title":"<span class='chages'><img src='/emcc-new/images/on.png' width='42px' height='20px' /></span>",align:'center'}
	 			],[{"title":"线路八",align:'center'},
	 				{"title":"18:00",align:'center'},
	 				{"title":"22:00",align:'center'},
	 				{"title":"<span class='chages'><img src='/emcc-new/images/on.png' width='42px' height='20px' /></span>",align:'center'}
	 			],[{"title":"线路九",align:'center'},
	 				{"title":"18:00",align:'center'},
	 				{"title":"22:00",align:'center'},
	 				{"title":"<span class='chages'><img src='/emcc-new/images/on.png' width='42px' height='20px' /></span>",align:'center'}
	 			],[{"title":"线路十",align:'center'},
	 				{"title":"18:00",align:'center'},
	 				{"title":"22:00",align:'center'},
	 				{"title":"<span class='chages'><img src='/emcc-new/images/on.png' width='42px' height='20px' /></span>",align:'center'}
	 			],[{"title":"线路十一",align:'center'},
	 				{"title":"18:00",align:'center'},
	 				{"title":"22:00",align:'center'},
	 				{"title":"<span class='chages'><img src='/emcc-new/images/off.png' width='42px' height='20px' /></span>",align:'center'}
	 			],[{"title":"线路十二",align:'center'},
	 				{"title":"18:00",align:'center'},
	 				{"title":"22:00",align:'center'},
	 				{"title":"<span class='chages'><img src='/emcc-new/images/on.png' width='42px' height='20px' /></span>",align:'center'}
	 			]],
		striped : true
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
</style>
	</head>
	<body>

		<!--  用能负荷监测内容 -->
		<div class="wrap-fluid">
			<div class="container-fluid paper-wrap bevel tlbr" style="width:100%">
				<!-- 内容板块 -->
				<div class="content-wrap" style="border: 0px solid green;padding:0px;">
					<div class="row" style="border: 0px solid green;margin-left:0.2%;">
					<div class="col-sm-10" style="float:left;width:100.0%;border: 0px solid red ;padding-left:10px;margin-top: 1%;height:87%;">
				         <!-- 有功电能 -->
				        
						<div class="col-xs-3 box-shadow-2" style="float:left;width: 99%;height: 10%;padding:10px 0 0 15px;color: #528B8B">
						<h2 align="center" style="color: #ffffff">照明控制</h2>
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
