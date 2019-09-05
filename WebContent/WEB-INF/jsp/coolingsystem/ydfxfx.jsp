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
		<title>用电分项分析-中惠元景能耗监测平台</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<!-- Le styles -->
		<link rel="stylesheet" href="/emcc-new/assets/css/style.css">
		<link rel="stylesheet" href="/emcc-new/assets/css/bootstrap.css">
		<link rel="stylesheet" href="/emcc-new/css/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css" href="/emcc-new/css/icon.css"></link>
		<script type="text/javascript" src="/emcc-new/js/jquery-1.8.2.min.js">
	
</script>
		<script type="text/javascript" src="/emcc-new/js/jquery.easyui.min.js">
	
</script>
		<link rel="stylesheet" href="/emcc-new/js/layui/css/layui.css">
		<script type="text/javascript" src="/emcc-new/js/layui/layui.all.js"></script>
		<script type="text/javascript" src="/emcc-new/js/page.js"></script>
		<script type="text/javascript" src="/emcc-new/js/jsonToTime.js"></script>
		<script type="text/javascript" src="/emcc-new/js/time.js"></script>
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
/*更改表格标题文字大小*/
.datagrid-header span {font-size: 20px !important; } 
.datagrid-header-row {     /* background-color: #e3e3e3; */     /* color: #111 */     height: 50px;}

/*更改表格中单元格行间距*/
#fhtb .datagrid-btable tr{height: 100px;}

/*更改表格标题的行间距*/
.panel-title {
    margin-top: 50px;
    margin-bottom: 50px;
    font-size: 30px;
    color: inherit;
}
</style>
<script>
	var id = "111";
	var name = "总有功电能";
	var mybegindate = "";
	var myenddate = "";
	var type = 3;
	var mmpCode = "31";
	var flag="";//是否为虚拟表 0否 
	$(function() {
		var d = new Date();
		daynum = 0;
		var str = myformatter(d);
		$("#begindate").datebox('setValue', str);
		mybegindate = str;
		$("#enddate").datebox('setValue', str);
		myenddate = str;
		InifhTable();
		freshPage();
		BingClickRadio();
	});
	function GetClickData(node) {
		id = node.id;
		flag=node.attributes.eid;
		freshPage();
	}
	//加载表格数据
	function GetData() {
		var args = {};
		BingData("#fhtb", args,
				'daymonyearsum?ctdCode='
						+ id +'&dateBeginCode=' + mybegindate+'&energyType=1&flag='+flag+'&mmpCode='+mmpCode, null);
	}
	function onChangeBeginDate(date) {
		mybegindate = myformatter(date);
		//freshPage();
	}
	function onChangeEndDate(date) {
		myenddate = myformatter(date);
		//freshPage();
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
		type = value;
		freshPage();
	}
	//单击加载图标数据
	function freshPage() {
		//单击加载图标数据
		var iframe = $("#fushionchartsIframe");
		var tablestatus=$("#table").css("display");
		showtable();
		console.info("3333=="+mybegindate);
		console.info("4444=="+myenddate);
		var b=mybegindate.substring(0,4);
		var bm=mybegindate.substring(5,7);
		var e=myenddate.substring(0,4);
		var em=myenddate.substring(5,7);
		var bym=parseInt(b)*12+parseInt(bm);
		var eym=parseInt(e)*12+parseInt(em);
		//得到月份差
		var cym=eym-bym;
		//得到年份差
		var year=parseInt(e)-parseInt(b);
		if(type=="3"&&DateDiff(mybegindate,myenddate)>7){
			alert("可查询日期不能超过七天！");
		}else if(type=="2"&&cym>7){
			alert("可查询日期不能超过七个月！");
		}else if(type=="1"&&year>3){
			alert("可查询日期不能超过三年！");
		}else{
			iframe.attr("src",
					"${pageContext.request.contextPath}/statistics/nhqsdata?id="
							+ id + "&dateBeginCode=" + mybegindate+"&dateEndCode="+myenddate+"&type=" + type
							+ '&mmpCode=' + mmpCode+"&flag="+flag);
			GetData();
					if(tablestatus=="none"){
				showfusion();
			}
		}
	}
	//计算天数差的函数，通用  
	   function  DateDiff(sDate1,  sDate2){    //sDate1和sDate2是2002-12-18格式  
	       var  aDate,  oDate1,  oDate2,  iDays  
	       aDate  =  sDate1.split("-")  
	       oDate1  =  new  Date(aDate[1]  +  '-'  +  aDate[2]  +  '-'  +  aDate[0])    //转换为12-18-2002格式  
	       aDate  =  sDate2.split("-")  
	       oDate2  =  new  Date(aDate[1]  +  '-'  +  aDate[2]  +  '-'  +  aDate[0])  
	       iDays  =  parseInt(Math.abs(oDate1  -  oDate2)  /  1000  /  60  /  60  /24)    //把相差的毫秒数转换为天数  
	       return  iDays  
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
			rownumbers : false,
			columns : [ [
			//{ title: '日期', field: 'dateCode',align:'center', width: 80},
					{
						title : '计量点名称',
						field : 'ctdName',
						align : 'center',
						width : fixWidth(0.2),
						formatter:  function(value,row,index){
                            return '<span style="font-size:20px">'+value+'</span>';//改变表格中内容字体的大小
                		},styler : function(value, row, index) {  
                    		return 'border:1px solid #528B8B;';  
                		}   
					}, {
						title : '时间',
						field : 'dateCode',
						align : 'center',
						width : fixWidth(0.2),
						formatter:  function(value,row,index){
                            return '<span style="font-size:20px">'+value+'</span>';//改变表格中内容字体的大小
                		} ,styler : function(value, row, index) {  
                    		return 'border:1px solid #528B8B;';  
                		}  
					}, {
						title : '计量周期',
						field : 'roundName',
						align : 'center',
						width : fixWidth(0.1),
						formatter:  function(value,row,index){
                            return '<span style="font-size:20px">'+value+'</span>';//改变表格中内容字体的大小
                		} ,styler : function(value, row, index) {  
                    		return 'border:1px solid #528B8B;';  
                		}  
					}, {
						title : '累计用量',
						field : 'value',
						align : 'center',
						width : fixWidth(0.2),
						formatter:  function(value,row,index){
                            return '<span style="font-size:20px">'+value+'</span>';//改变表格中内容字体的大小
                		},styler : function(value, row, index) {  
                    		return 'border:1px solid #528B8B;';  
                		}  
					}, {
						title : '单位',
						field : 'unit',
						align : 'center',
						width : fixWidth(0.1),
						formatter:  function(value,row,index){
                            return '<span style="font-size:20px">'+value+'</span>';//改变表格中内容字体的大小
                		},styler : function(value, row, index) {  
                    		return 'border:1px solid #528B8B;';  
                		}   
					}, {
						title : '去年同期',
						field : 'lastValue',
						align : 'center',
						width : fixWidth(0.19),
						formatter:  function(value,row,index){
                            return '<span style="font-size:20px;font-family:宋代">'+value+'</span>';//改变表格中内容字体的大小
                		},styler : function(value, row, index) {  
                    		return 'border:1px solid #528B8B;';  
                		}   
					} ] ],
			striped : true
		});
	}
	function showtable(){
		$("#table").css("display","block");
		$("#fusion").css("display","none");
	}
	function showfusion(){
		$("#fusion").css("display","block");
		$("#table").css("display","none");
	}
	function fixWidth(percent){
		return $("#table").width()*percent;
	}
</script>
	</head>
	<body>
		<!-- 能耗总量监测 -->
		<div class="wrap-fluid">
			<div class="container-fluid paper-wrap bevel tlbr"
				style="width: 100%">
				<!-- 内容板块 -->
				<div class="content-wrap"
					style="border: 0px solid green; padding: 0px;">
					<div class="row"
						style="border: 0px solid green; margin-left: 0.2%;">
						<!-- 左边 tree -->
						<div class="col-sm-2 box-shadow-2"
							style="border: 0px solid yellow; margin-top: 1%; height: 99.8%; width: 20%;">
							<iframe src="tree?type=1" width="100%" style="border: 0px"
								height="100%" scrolling="no" frameborder="1"></iframe>
						</div>
						<!--右边面板 -->
						<div class="col-sm-10"
							style="float: left; width: 80.0%; border: 0px solid red; padding-left: 10px; margin-top: 1%; height: 87%;">
							<!-- 有功电能 -->
							<div class="col-xs-3 box-shadow-2"
								style="float: left; width: 99%; color:#528B8B;height: 10%; padding: 0px 0 0 15px">
								<div style="float: left">
									<input style="margin-top:15px" type="radio" name="rdmmps" value="1"  />
									年
									<input type="radio" name="rdmmps" value="2" />
									月
									<input type="radio" name="rdmmps" value="3" checked="checked"/>
									日
									<span>开始日期</span>&nbsp;
									<input name="begindate" id="begindate"
										value="2013-10-01" class="easyui-datebox"
										data-options="formatter:myformatter,parser:myparser,onSelect:onChangeBeginDate"
										style="width: 100px; height: 10px" />
									<span>结束日期</span>&nbsp;
									<input name="enddate" id="enddate"
										value="2013-10-01" class="easyui-datebox"
										data-options="formatter:myformatter,parser:myparser,onSelect:onChangeEndDate"
										style="width: 100px; height: 10px" />
									<button onclick="freshPage()" style="width:130px;height:35px;color:#ffffff;background-color: #008CBA;border: 0px solid red">查询</button>
								</div>
								<div class="layui-tab layui-tab-brief"
									style="float:right;height: 40px;right:20px;margin-top:0px;padding:0px;"
									lay-filter="docDemoTabBrief">
									<ul class="layui-tab-title"style="color:#528B8B"  >
										<li class="layui-this" onclick="showtable()">
											表格
										</li>
										<li onclick="showfusion()">
											图形
										</li>
									</ul>
								</div>
							</div>
							<div class="col-xs-4 box-shadow-2"
								style="height: 100%; border: 0px solid yellow; width: 99%; background-color: #2c3240; margin-top: 10px">
								<!-- 图表数据 -->
								<div class="nest" id="fusion" style="display:none" >
									<iframe id="fushionchartsIframe" src="" frameborder="0"
										marginheight="0" width="100%" height="100%"></iframe>
								</div>
								<div class="nest" id="table" style="width:100%;height: 100%;" >
									<table id="fhtb" class="easyui-datagrid" style="width: 100%;; height: 100%;background-color:black" toolbar="#toolbar" >
									</table> 
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
