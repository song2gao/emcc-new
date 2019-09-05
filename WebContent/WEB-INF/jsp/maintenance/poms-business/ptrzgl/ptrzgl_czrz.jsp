<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>操作日志</title>
    <link href="/emcc-web/css/poms-system/CSS.css" rel="stylesheet" type="text/css" ></link>
	<link href="/emcc-web/css/poms-system/yxztjk.css" rel="stylesheet" type="text/css"></link>
	<link href="/emcc-web/css/poms-business/ptrzgl.css" rel="stylesheet" type="text/css"></link>
	<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/default/easyui.css"></link>
	<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/icon.css"></link>
	<script type="text/javascript" src="/emcc-web/js/poms-business/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src="/emcc-web/js/poms-business/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/emcc-web/js/page.js"></script>
	<script type="text/javascript" src="/emcc-web/js/poms-business/jsonToTime.js"></script>    
  </head>
  <body>
	<div id="tab_con">
		<div id="lis_2" style="display: block;" align="center">	<br/><br/>
			<div align="left" id="three_top">
				<form method="post">
					<table id="tbls1" align="left">
						<tr>
							<td><span style="width:40px;"></span>&nbsp;&nbsp;&nbsp;
								用&nbsp;&nbsp;&nbsp;&nbsp;户：</td>
							<td><input type="text" name="name" id="name"/></td>
							<td><span style="width: 25px;"></span>&nbsp;&nbsp;&nbsp;&nbsp; 
								关键字：</td>
							<td><input type="text" name="words" id="words"/></td>
							<td><span style="width: 25px; display: block;" ></span>&nbsp;&nbsp;&nbsp;&nbsp; 
								时&nbsp;&nbsp;&nbsp;&nbsp;间：</td>
							<td><input id="dates" style="width: 125px;" type="text" name="dates"  class="easyui-datebox" data-options="formatter:myformatter,parser:myparser"/></td>
							<td><span style="width: 280px;"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input id="searchButton" class="searchButton" type="button" name="searchButton" value="查询" style="cursor:pointer;"x onmousemove="this.style.color='white'" onmouseout="this.style.color='black'" />
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<table id="gd" class="easyui-datagrid" style="1420px;height:535px"
		toolbar="#toolbar"  rownumbers="true" fitColumns="true" singleSelect="true">
	</table>
 
  <script type="text/javascript">
	$(function(){
  			//鼠标点击(按钮)
  			$(".searchButton").focus(function(){
  				if(!false)$(this).attr("style","background:url(/emcc-web/image/poms-system/btn_3.png)")
  			});
	  		//鼠标移过(按钮)
  			$(".searchButton").hover(function(){
  				if(!false)$(this).attr("style","background:url(/emcc-web/image/poms-system/btn_2.png)");
  			},function(){
  				if(!false)$(this).attr("style","background:url(/emcc-web/image/poms-system/btn_1.png)");
  			});
  	});
  	//小日历
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
	function GetData(){
		var args={};
		args.name=$("#name").val();
		args.words=$("#words").val();
		args.dates=$("#dates").datebox('getValue');
		args.pageIndex=1;//页索引
		args.pageSize=10;//页容量
		BingData("#gd",args,"toCzrz.action?m=toCzrzMo",null);
	}
  </script>
   <script type="text/javascript"> 
	//页面加载时给提交时间赋值为当前时间
	$(function(){ 
		var d = new Date();
		str = d.getFullYear()+'-'+(d.getMonth() + 1<10?('0'+(d.getMonth() + 1)):d.getMonth() + 1)+'-'+(d.getDate()<10?('0'+d.getDate()):d.getDate())
		$("#dates").datebox('setValue',str);
		//初始化table	
		$('#gd').datagrid({
		title: '操作日志',
		fitColumns: false, //自适应列的大小
		singleSelect: true,
		columns: [[
		{ title: '用户', field: 'pomsUsersManagement', width: 300,formatter: function (value, rowData, rowIndex) {return value.loginName}}, 
		{ title: '时间', field: 'oblOperateTime', width: 400,formatter: function (value, rowData, rowIndex) {return Util.DateTime.Formater('yyyy-MM-dd hh:mm:ss',value.time)} },
		{ title: '操作内容', field: 'oblOperateContent', width: 680,formatter: function (value, rowData, rowIndex) {return value}}
		]],
		pagination:true
		}); 
		//点击查询按钮时，根据条件查询信息
		$("#searchButton").click(function(){
			//验证提交时间是否是日期格式(yyyy-mm-dd)
			var nowDate = $("#dates").datebox('getValue');
			var date_ymd= /^(\d{4})-(0\d{1}|1[0-2])-(0\d{1}|[12]\d{1}|3[01])$/; 
			var r = nowDate.match(date_ymd);
			//时间输入可否为空
			//if(r == null){
			//	alert("提交时间输入错误，请重新输入！");
			//	return false;}
			//获取后台数据
			$("#gd").datagrid("loadData",[]); 
			GetData();
		});
			GetData();
	});
	</script>
   </body>
</html>