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
		<title>消费明细管理-中惠元景能耗监测平台</title>
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
		           		args.pageSize=10;
		           		args.pageIndex=1;
		           		args.pageList=[5,10,15,20,25];
		    $(function(){
		    	BingData("#dg", args, '${pageContext.request.contextPath}/rechargeConsumption/detaileAll', null);
		    	loadDate();
        
		    });
		    function loadDate(){
			$('#attYearMonth').datebox({
		       //显示日趋选择对象后再触发弹出月份层的事件，初始化时没有生成月份层
		       onShowPanel: function () {
		          //触发click事件弹出月份层
		          span.trigger('click'); 
		          if (!tds)
		            //延时触发获取月份对象，因为上面的事件触发和对象生成有时间间隔
		            setTimeout(function() { 
		                tds = p.find('div.calendar-menu-month-inner td');
		                tds.click(function(e) {
		                   //禁止冒泡执行easyui给月份绑定的事件
		                   e.stopPropagation(); 
		                   //得到年份
		                   var year = /\d{4}/.exec(span.html())[0] ,
		                   //月份
		                   //之前是这样的month = parseInt($(this).attr('abbr'), 10) + 1; 
		                   month = parseInt($(this).attr('abbr'), 10);  
		
		         //隐藏日期对象                     
		         $('#attYearMonth').datebox('hidePanel') 
		           //设置日期的值
		           .datebox('setValue', year + '-' + month); 
		                        });
		                    }, 0);
		            },
		            //配置parser，返回选择的日期
		            parser: function (s) {
		                if (!s) return new Date();
		                var arr = s.split('-');
		                return new Date(parseInt(arr[0], 10), parseInt(arr[1], 10) - 1, 1);
		            },
		            //配置formatter，只返回年月 之前是这样的d.getFullYear() + '-' +(d.getMonth()); 
		            formatter: function (d) { 
		                var currentMonth = (d.getMonth()+1);
		                var currentMonthStr = currentMonth < 10 ? ('0' + currentMonth) : (currentMonth + '');
		                return d.getFullYear() + '-' + currentMonthStr; 
		            }
		        });
		
		        //日期选择对象
		        var p = $('#attYearMonth').datebox('panel'), 
		        //日期选择对象中月份
		        tds = false, 
		        //显示月份层的触发控件
		        span = p.find('span.calendar-text'); 
		        var curr_time = new Date();
		
		        //设置前当月
		        $("#attYearMonth").datebox("setValue", myformatter(curr_time));
		    	
		    }
		    
		    //格式化日期
		function myformatter(date) {
		    //获取年份
		    var y = date.getFullYear();
		    //获取月份
		    var m = date.getMonth() + 1;
		    return y + '-' + m;
		}
		  </script>
<script type="text/javascript">
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
		<!--  消费明细查询 -->
		<div class="wrap-fluid">
			<!-- 内容板块 -->
			<div class="col-sm-10 box-shadow-2" style="float:left;width:98.5%;border: 0px solid red ;margin: 0.5%;height:98%;">
				<table id="dg" align="center" title="消费明细查询" class="easyui-datagrid" striped="true" rownumbers="true" style="width:100%;height:100%;" toolbar="#toolbar" pagination="true" rownumbers="true" fitColumns="true" singleSelect="true">
				<thead>
					<tr>
						<th field="detailId" width="10%" align="center">消费明细编号：</th>
						<th field="userId" width="10%" align="center">用户姓名：</th>
						<th field="userTel" width="10%" align="center">联系方式：</th>
						<th field="month" width="10%" align="center">月份：</th>
						<th field="energyType" width="20%" align="center">能耗类别：</th>
						<th field="moduleAmount" width="20%" align="center">月总额：</th>
						<th field="allAmount" width="20%" align="center">总金额：</th>
					</tr>
				</thead>
			</table>
			<div id="toolbar">
				<span  style="padding-left:10px; height:30px;font-size:12px;">搜索：</span>
				<input name="search" id="search" type="text" class="easyui-textbox" value="" data-options="prompt:'请输入用户姓名或手机号...'" 
				style="padding-left:10px;width:200px; height:25px;font-size:12px;"  />
				<span  style="padding-left:10px; height:20px;font-size:12px;">月份：</span>
				<input id="attYearMonth" editable="false" name="attYearMonth" class="easyui-datebox"  style="width: 10%;" /> 
				
				<a href="javascript:void(0)" class="easyui-linkbutton" width="10%" iconCls="icon-search" onclick="finDetail()"  plain="true">查询</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" width="10%" iconCls="icon-print" plain="true" onclick="destroyUser()">打印</a>
			</div>

			<script type="text/javascript">
			
				//用户条件查询
				function finDetail() {
					//查询					
					var search=$("#search").val();
					//时间
					var beforeDate=$("#attYearMonth").val();
					
					BingData("#dg", args, '${pageContext.request.contextPath}/rechargeConsumption/searchDetail?search='+search+'&beforeDate='+beforeDate, null);
				}
				
			</script>
			</div>
		</div>
	</body>
</html>
