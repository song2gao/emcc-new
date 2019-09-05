<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<script type="text/javascript"
			src="/emcc-web/js/poms-system/jquery-1.7.2.js"></script>
		<title>日历</title>
		<link href="/emcc-web/css/poms-system/CSS.css" rel="stylesheet"	type="text/css"></link>
		<link href="/emcc-web/css/poms-system/yxztjk.css" rel="stylesheet"	type="text/css"></link>
		<link href="/emcc-web/css/poms-business/ptrzgl.css" rel="stylesheet"	type="text/css"></link>
		<link rel="stylesheet" type="text/css"	href="/emcc-web/css/poms-business/themes/default/easyui.css"></link>
		<link rel="stylesheet" type="text/css"	href="/emcc-web/css/poms-business/themes/icon.css"></link>
		<script type="text/javascript"	src="/emcc-web/js/poms-business/jquery-1.7.1.min.js"></script>
		<script type="text/javascript"	src="/emcc-web/js/poms-business/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="/emcc-web/js/page.js"></script>
		<script type="text/javascript"	src="/emcc-web/js/poms-business/jsonToTime.js"></script>
		<script type="text/javascript"	src="/emcc-web/js/poms-business/btn123ABC.js"></script>
		
		<script language="JavaScript" type="text/javascript"> 
			function montharr(m0, m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11) 
			{this[0] = m0;
			this[1] = m1;
			this[2] = m2;
			this[3] = m3;
			this[4] = m4;
			this[5] = m5;
			this[6] = m6;
			this[7] = m7;
			this[8] = m8;
			this[9] = m9;
			this[10] = m10;
			this[11] = m11;}
			function calendar(paramYear,paramMon) {
				var monthNames = "JanFebMarAprMayJunJulAugSepOctNovDec";
				var today = new Date();
				var thisDay;
				var monthDays = new montharr(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);//每一个月份拥有的天数;
				year = today.getYear() +1900;//获取年份;
				thisDay = today.getDate();//获取当日;
				if (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)) monthDays[1] = 29;//闰年拥有29天;
				nDays = monthDays[paramMon];
				firstDay = today;
				firstDay.setDate(1);//本月1号;
				firstDay.setMonth(paramMon);
				firstDay.setYear(paramYear);
				testMe = firstDay.getDate();
				if (testMe == 2) firstDay.setDate(0);
				startDay = firstDay.getDay();//1号,对应的星期几;
				document.write("<div id='rili' style='position:absolute;width:180px;left:0px;top:0px;'>") 
				document.write("<TABLE width='700' BORDER='0' CELLSPACING='0' CELLPADDING='0'")
				//*****1.下方设置表格的边框、颜色可改变日历外框
				document.write("<TR style='cursor:pointer;'><TD><table width='700' height='220' border='0' cellspacing='1' cellpadding='2' bgcolor='#ffffff'>");
				document.write("<TR><th colspan='7' height='8' ");
				var dayNames = new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六");
				var monthNames = new Array("1 月","2 月","3 月","4 月","5 月","6 月","7 月","8 月","9 月","10 月","11 月","12 月");
				var now = new Date();
				firstDay.setDate(now.getDate());
				var oldDay = firstDay.getDay();
				//*****2.下方设置的th可改变日历标头
				document.writeln("</TH></TR><TR><TH height='25' BGCOLOR='#ECF5FF'><FONT face='微软雅黑' STYLE='font-size:12pt;Color:red'>周日</FONT></TH>");
				document.writeln("<th bgcolor='#ECF5FF'><FONT face='微软雅黑' STYLE='font-size:11pt;Color:#3D3D3D'>周一</FONT></TH>");
				document.writeln("<TH BGCOLOR='#ECF5FF'><FONT face='微软雅黑' STYLE='font-size:11pt;Color:#3D3D3D'>周二</FONT></TH>");
				document.writeln("<TH BGCOLOR='#ECF5FF'><FONT face='微软雅黑' STYLE='font-size:11pt;Color:#3D3D3D'>周三</FONT></TH>");
				document.writeln("<TH BGCOLOR='#ECF5FF'><FONT face='微软雅黑' STYLE='font-size:11pt;Color:#3D3D3D'>周四</FONT></TH>");
				document.writeln("<TH BGCOLOR='#ECF5FF'><FONT face='微软雅黑' STYLE='font-size:11pt;Color:#3D3D3D'>周五</FONT></TH>");
				document.writeln("<TH BGCOLOR='#ECF5FF'><FONT face='微软雅黑' STYLE='font-size:11pt;Color:red'>周六</FONT></TH>");
				document.writeln("</TR><TR>");
				column = 0;
				for (i=0; i<startDay; i++) {
				document.writeln("\n<TD><FONT STYLE='font-size:9pt'>  &nbsp; </FONT></TD>");
				column++;
				}
				//*****3.下方的两个.writeln中设置的双单击事件、颜色字体颜色可改变日历今日/除今日意外的格子样式
				for (i=1; i<=nDays; i++) {
					var monthParams = monthParam+1;
					var ye = yearParam;
					var tomon = new Date();
					var ssm = tomon.getMonth()+1;
					var ssy = tomon.getFullYear();
				if (i == thisDay && monthParams == ssm && ye == ssy){
				document.writeln("</TD><TD id='td"+i+"' onclick='clickMe("+i+")' ondblclick='dbclickMe("+i+")' ALIGN='CENTER' BGCOLOR='#ECF5FF' style='border:1px solid yellow;'><FONT STYLE='font-size:9pt;Color:red'>")
				}
				else {
				document.writeln("</TD><TD id='td"+i+"' onclick='clickMe("+i+")' ondblclick='dbclickMe("+i+")' BGCOLOR='#ECF5FF' ALIGN='CENTER'><FONT STYLE='font-size:9pt;font-family:Arial;font-weight:bold;Color:black'>");
				}
				document.writeln(i);
				if (i == thisDay) document.writeln("</FONT></TD>")
				column++;
				if (column == 7) {
				document.writeln("<TR>"); 
				column = 0;
				}
				}
				document.writeln("<TR>")
				document.writeln("<FORM NAME='clock' onSubmit='0'><FONT STYLE='font-size:10pt;Color:#ffffff'>")
				document.writeln("</TD></TR></TABLE></div>");
			}
			var timerID = null;
			var timerRunning = false;
			function stopclock (){
				if(timerRunning)
				clearTimeout(timerID);
				timerRunning = false;
			}
			//*****4.设置颜色，该函数中第一次设置的样式颜色为单击选中格子样式，第二次设置的是今天日期的格子样式，第三次设置的是添加时间后的格子样式。
			function setColor(day,sn){
				if(sn=='bt'){
					for(var ki=1;ki<=31;ki++){
						$("#td"+ki).removeAttr("style");
					}
					$("#td"+day).attr("style","border:1px solid yellow;");
				}
				$.ajax({
			           url: "toCzrz.action?m=toOnet",
			           type:"POST",dataType:"json",
			           timeout: 1000,
			           data: {
							"yearss":yearParam,
							"monthss":monthParam
						},
			           success: function(data){
			           	var list = data.xiaoshu;
			           	var listyue = data.yuefen;
			           	var listnian = data.nianfen
			           	var date=new Date;
						var year=date.getFullYear();
						var month=date.getMonth()+1;
						month =(month<10 ? month:month);
						var nowst  = (year.toString()+"年"+month.toString()+"月"+date.getDate()); 
						for(var k=0;k<list.length;k++){
							var sns = listnian[k]+"年"+listyue[k]+"月"+list[k];
							if(nowst==sns){
								$("#td"+list[k]).attr("style","background-color:#DFFFDF;border:1px solid #FFCBB3;");
							}else{
								$("#td"+list[k]).attr("style","background-color:#DFFFDF");		
							}
						}
			        }
			   });
			}
			function startclock () {
				stopclock();
				setColor();
			}
			function dbclickMe(day){	//双击出现添加事件
				window.parent.$("#logInfoDiv").attr("style","display:black;");
				window.parent.$('#logInfoDiv').dialog({
				title: '记录日志',
				width: 500,
				closed: false,
				cache: false,
				modal: true,
				minimizable: false,
				resizable: true
				});
				$.ajax({
					url:"toCzrzri.action?m=findtoCalend",
					type:"POST",dataType:"json",
		          	timeout: 1000,
		          	data:{
		          		"yearss":yearParam,
		          		"monthss":monthParam,
		          		"dayss":day
		          		},
					success:function(data){
						var en = data.beizhu;
						var en2 = data.shijian;
						if(en==null&&en2==null){
							window.parent.$('#count').val('null');
		           			window.parent.$('#backs').val('null');
		           			return false
						}
		           		window.parent.$('#count').val(en2);
		           		window.parent.$('#backs').val(en);
		           	}
				});
			}
			function clickMe(day){	//单击
				var sn='bt';
				setColor(day,sn);			
			}
		</script>
	</head>
	<body bgcolor="#FFFFFF"
		onLoad="startclock(); timerONE=window.setTimeout" text="#000000">

		<div id='loc' style='position: absolute; left: 0px; top: 0px;'>
			<table width="500" height="100">
				<tr>
					<th>
						<script language="JavaScript" type="text/javascript">
						    var yearParam = <%=request.getParameter("year")%>;
							var monthParam = <%=request.getParameter("month")%>;
							calendar(yearParam,monthParam);		
						</script>
					</th>
				</tr>
			</table>
		</div>
	</body>
</html>
