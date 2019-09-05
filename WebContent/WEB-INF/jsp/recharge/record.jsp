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
		<title>充值记录管理-中惠元景能耗监测平台</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!-- Le styles -->
		<link rel="stylesheet" type="text/css" href="/emcc-new/css/themes/color.css"></link>
		<link rel="stylesheet" type="text/css" href="/emcc-new/css/icon.css">
		<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/default/easyui.css"></link>
		<script type="text/javascript" src="/emcc-new/js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="/emcc-new/js/page.js"></script>
		<script type="text/javascript" src="http://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
		
		<script type="text/javascript">
						var args={};
		           		args.pageSize=5;
		           		args.pageIndex=1;
		           		args.pageList=[5,10,15,20,25];
		    $(function(){
		    			
		    	BingData("#dg", args, '${pageContext.request.contextPath}/rechargeRecord/recordAll', null);
		    });
		  </script>
<script type="text/javascript">
		var yearnum = 0;
		var monthnum = 0;
		var daynum = 0;
		//规范日期格式	
		function myformatter(date) {
			var y = date.getFullYear() + yearnum;
			var m = date.getMonth() + 1 + monthnum;
			var d = date.getDate() + daynum;
			return y + '-' + (m < 10 ? ('0' + m) : m) + '-' + (d < 10 ? ('0' + d) : d);
		}
		function myparser(s) {
			if (!s)
				return new Date();
			var ss = (s.split('-'));
			var y = parseInt(ss[0], 10);
			var m = parseInt(ss[1], 10);
			var d = parseInt(ss[2], 10);
			if (!isNaN(y) && !isNaN(m) && !isNaN(d)) {
				return new Date(y, m - 1, d);
			} else {
				return new Date();
			}
		}
		function myparse(s) {
			if (s != "") {
				return s.replace(/-/g, "");
			}
		}
		</script>
<STYLE type="text/css">
	.box-shadow-2 {
		-webkit-box-shadow: 0 0 10px #1d1f24;
		-moz-box-shadow: 0 0 20px #1d1f24;
		box-shadow: 0 0 20px #1d1f24;
	}
</style>
	</head>

	<body>
		<!--  充值记录 -->
		<div class="wrap-fluid">
			<!-- 内容板块 -->
			<div class="col-sm-10 box-shadow-2" style="float:left;width:98.5%;border: 0px solid red ;margin: 0.5%;height:98%;">
				<table id="dg" align="center" title="充值记录" class="easyui-datagrid" striped="true" rownumbers="true" style="width:100%;height:100%;" toolbar="#toolbar" pagination="true" rownumbers="true" fitColumns="true" singleSelect="true">
				<thead>
					<tr>
						<th field="recordId" width="10%" align="center">充值记录编号：</th>
						<th field="userId" width="10%" align="center">用户姓名：</th>
						<th field="userTel" width="20%" align="center">联系方式：</th>
						<th field="userAddress" width="20%" align="center">联系地址：</th> 
						<th field="recordAmount" width="10%" align="center">充值金额：</th>
						<th field="amounts" width="10%" align="center">账户余额：</th>
						<th field="recordTimes" width="20%" align="center">充值时间：</th>
					</tr>
				</thead>
			</table>
			<div id="toolbar">
				<span  style="padding-left:10px; height:30px;font-size:12px;">搜索：</span>
				<input name="search" id="search" type="text" value="" class="easyui-textbox"  data-options="prompt:'请输入用户姓名或手机号...'" style="padding-left:10px;width:200px; height:25px;font-size:12px;" />
				<input name="beforeDate" id="beforeDate" value="2017-07-02" class="easyui-datebox"
				data-options="formatter:myformatter,parser:myparser" style="width: 10%;"/>
				<span  style="height:35px;font-size:12px;margin-top:25px;">	至 </span>
				<input name="alterDate" id="alterDate" value="2017-10-01" class="easyui-datebox"
				data-options="formatter:myformatter,parser:myparser" style="width: 10%;"/>
				<a href="javascript:void(0)" class="easyui-linkbutton" style="padding-left:10px;"  width="10%" iconCls="icon-search" plain="true" onclick="finRecord()">查询</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" style="padding-left:10px;"  width="10%" iconCls="icon-print" plain="true" >打印</a>
			</div>

			<script type="text/javascript">
			
				var url;
				//用户条件查询
				function finRecord() {
					//查询					
					var search=$("#search").val();
					//时间
					var beforeDate=$("#beforeDate").val();
					var alterDate=$("#alterDate").val();
					BingData("#dg", args, '${pageContext.request.contextPath}/rechargeRecord/toSearchRecord?search='+search+'&beforeDate='+beforeDate+'&alterDate='+alterDate, null);
				}
			</script>
			</div>
		</div>
	</body>
</html>
