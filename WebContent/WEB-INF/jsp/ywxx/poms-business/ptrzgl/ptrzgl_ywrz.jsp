<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'ptrzgl.jsp' starting page</title>
    
  </head>
    <link href="/emcc-web/css/poms-system/CSS.css" rel="stylesheet" type="text/css" ></link>
	<link href="/emcc-web/css/poms-system/yxztjk.css" rel="stylesheet" type="text/css"></link>
	<link href="/emcc-web/css/poms-business/ptrzgl.css" rel="stylesheet" type="text/css"></link>
	<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/default/easyui.css"></link>
	<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/icon.css"></link>
	<script type="text/javascript" src="/emcc-web/js/poms-business/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src="/emcc-web/js/poms-business/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/emcc-web/js/page.js"></script>
	<script type="text/javascript" src="/emcc-web/js/poms-business/jsonToTime.js"></script>   
	<script type="text/javascript" src="/emcc-web/js/poms-business/btn123ABC.js"></script>   

	

<body bgcolor="#FFFFFF" onLoad="loadFrame(); timerONE=window.setTimeout" text="#000000">
 <div  style='position:absolute;left:0px;top:25px;'>	
	<table width="100%" height="100%" >
		<tr>
			<th>
			<div align="left" id="three_top2">
					<table id="tbls1" align="left">
						<tr>
							<td><span style="width:40px;"></span><font style="font-weight: lighter;">请选择年月</font>:&nbsp;&nbsp;&nbsp;
								<select id="YEAR" name="YEAR" onchange=YM_onchange()>
									<script language="JavaScript">
									var dToday = new Date();
									for(nYear=2013;nYear<=2020; nYear++){
										document.write("<option value=\"" + nYear + "\"");
										var thisyear = dToday.getYear()+1900;
										if(nYear==thisyear){
											document.write(" selected");
										}
										document.write(">" + nYear + "</option>");
									}
									</script>
								</select>&nbsp;&nbsp;&nbsp;年
							</td>
							<td>
								<select id="MONTH" name="MONTH" onchange=YM_onchange()>
									<script language="JavaScript">
									var dToday = new Date();
									for(nMonth=0; nMonth<12; nMonth++){
										document.write("<option value=\"" + nMonth + "\"");
										if(nMonth==dToday.getMonth()){
											document.write(" selected");
										}
										document.write(">" + (nMonth+1) + "</option>");
									}
									</script>
								</select>&nbsp;&nbsp;&nbsp;月
							</td>
						</tr>
					</table>
			</div>
			
			<div id="three_top3">
				<form action="toCzrzri.action?m=toAddM" method="post">
					<table align="left" style="font-size: 12px;" >
						<tr>
							<td><span style="width: 35px;"></span>
							事&nbsp;&nbsp;&nbsp;件：
							</td>
							<td>
							<textarea style="border:1px #ADADAD solid" rows="3" cols="40" id="count" name="count"><%=session.getAttribute("things")%></textarea>
							</td>
							<td><span style="width: 50px;"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							备&nbsp;&nbsp;&nbsp;注：
							</td>
							<td>
							<textarea style="border:1px #ADADAD solid" rows="3" cols="40" id="backs" name="backs" ><%=session.getAttribute("upbacks")%></textarea><br/></td>
							<td><span style="width: 60px;"></span>
							<input type="submit" class="addButton" name="addButton" id="addButton" value="保存" onmousemove="this.style.color='white'" onmouseout="this.style.color='black'" style="cursor:pointer;"/></td>
							<td><span style="width: 30px;"></span>
							<input type="button" class="btnB" name="btnC" id="btnB" value="删除" onclick="dels()" onmousemove="this.style.color='white'" onmouseout="this.style.color='black'" style="cursor:pointer;"/></td>
						</tr>		
					</table>
				</form>
			</div>
			
			</th>
		</tr>
		<tr>
			<th>
				<!--<jsp:include page=""></jsp:include>-->
				<br/>
				<iframe id="main" frameborder=0 scrolling=auto src="" width="1300" height="900"> </iframe>
			</th>
		</tr>
		
	</table>
	<!-- asd -->
</div>	

	

		
</body>
</html>
<SCRIPT LANGUAGE="JavaScript"> 
		var yearParam = $("#YEAR").val();
		var monthParam = $("#MONTH").val();
		function YM_onchange(){
			var yearParam = $("#YEAR").val();
			var monthParam = $("#MONTH").val();
			//document.getElementById("main").src="toCzrzri.action?m=findtoCalendJump?year="+yearParam+"&month="+monthParam;
			document.getElementById("main").src="rili.jsp?year="+yearParam+"&month="+monthParam;
		}
		function loadFrame(){
			document.getElementById("main").src="rili.jsp?year="+yearParam+"&month="+monthParam;
			//document.getElementById("main").src="toCzrzri.action?m=findtoCalendJump?year="+yearParam+"&month="+monthParam;
		}
		
		function dels(){
			 var result = confirm("确认删除当天事件信息？")
			if (result) {
				 window.location.href="toCzrzri.action?m=deltoCalender";
			}
			else {

			}
		}
</SCRIPT>

