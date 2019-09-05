<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="utf-8">
		<title>能耗总量监测-中惠元景能耗监测平台</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<!-- Le styles -->
		<link rel="stylesheet" href="/emcc-new/assets/css/style.css">
		<link rel="stylesheet" href="/emcc-new/assets/css/bootstrap.css">
		<link rel="stylesheet" href="/emcc-new/css/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css"
			href="/emcc-new/css/icon.css"></link>
		<script type="text/javascript"
			src="/emcc-new/js/jquery-1.8.2.min.js">
</script>
		<script type="text/javascript"
			src="/emcc-new/js/jquery.easyui.min.js">
</script>
		<script type="text/javascript" src="/emcc-new/js/page.js"></script>
		<style>
.left_tab {
	width: 49%;
	height: 100%;
	border: 0px;
	border-right: 1px;
	border-style: outset;
	border-color: #f7f7f7;
	float: left;
}

.right_tab {
	width: 49%;
	height: 100%;
	float: left;
	border: 0px;
	border-left: 1px;
	border-style: outset;
	border-color: #f7f7f7;
}

.box-shadow-2 {
	-webkit-box-shadow: 0 0 10px #1d1f24;
	-moz-box-shadow: 0 0 10px #1d1f24;
	box-shadow: 0 0 10px #1d1f24;
}
</style>
<script>
var id="";		
$(function() {
	InifhTable();
	GetData();
	//titile();
});
	function titile(){
		$("#top").css("color","#3F3F3F");
				$(".dropdown-toggle").css("font-size","22px");
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
</script>
<!-- 展示所选择监测点数据 -->
<script type="text/javascript">
function GetClickData(node) {
	id=node.id;
	GetData();
}
//加载数据
function GetData() {
	$("#gaugesYear").attr("src","gauges?id="+id+"&type=1");
	$("#gauges").attr("src","gauges?id="+id);
	var args = {};
	BingData("#fhtb", args, 'yearmonthday?id='+id, null);
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
		//{ title: '日期', field: 'dateCode',align:'center', width: 80},
				{
					title : '用能周期',
					field : 'name',
					align : 'center',
					width:300
				},{
					title : '累计能耗',
					field : 'value',
					align : 'center',
					width:300
				}, {
					title : '同比能耗',
					field : 'lastvalue',
					align : 'center',
					width:200
				}, {
					title : '对比',
					field : 'compare',
					align : 'center',
					width : 200
				}]],
		striped : true
	});
}
</script>
	</head>

	<body>
	<!-- 能耗总量监测 -->
		<div class="wrap-fluid">
			<div class="container-fluid paper-wrap bevel tlbr" style="width:100%">
				<!-- 内容板块 -->
				<div class="content-wrap" style="border: 0px solid green;padding:0px;">
					<div class="row" style="border: 0px solid green;margin-left:0.2%;">
						<!-- 左边 tree -->
						<div class="col-sm-2 box-shadow-2" style="border: 0px solid yellow;margin-top: 1%;height: 86.8%;width: 15%;">
							<iframe src="/emcc-new/tree.jsp" width="100%" style="border: 0px"
								height="100%" scrolling="no" frameborder="1"></iframe>
						</div>
						<!--右边面板 -->
						<div class="col-sm-10" style="float:left;width:85.0%;border: 0px solid red ;padding-left:10px;margin-top: 1%;height:87%;">
							<div class="content-wrap box-shadow-2" style="height: 50%;border: 0px solid yellow ;width:100%;">
								<div class="table-responsive" style="">
									<!-- 图表 -->
									<div class="nest" id="realtimeClose">
										<div id="kindofenergy" style="width: auto; height: 240px;background-color:#2c3240">
											<div class="left_tab">
												<iframe id='gauges' src=''
													style='width:100%;height:100%;margin-top:0px;' scrolling='no' frameborder='0' marginheight='0'>
												</iframe>
											</div>
											<div class="right_tab">
												<iframe id='gaugesYear'	src=''
													style='width:100%;height:100%' scrolling='no' frameborder='0' marginheight='0'>
												</iframe>
											</div>
										</div>
								</div>
								</div>
							</div>
						<!-- 图标列表 -->
							<div class="col-xs-4 box-shadow-2" style="border:0px solid;width:100%;height: 52%;padding-top: 5%;">
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
