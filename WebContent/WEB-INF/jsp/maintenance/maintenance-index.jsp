<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>运维管理系统-首页内容</title>
<link href="/emcc-new/css/CSS.css" rel="stylesheet" type="text/css" ></link>
<link href="/emcc-new/css/poms-system/yxztjk.css" rel="stylesheet" type="text/css"></link>
<link href="/emcc-new/css/poms-system/ptrzgl.css" rel="stylesheet" type="text/css"></link>
<link href="/emcc-new/css/poms-system/businessIndex.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="/emcc-new/js/jquery-1.7.2.js"></script>
<link rel="stylesheet" type="text/css" href="/emcc-new/css/themes/default/easyui.css"></link>
<link rel="stylesheet" type="text/css" href="/emcc-new/css/themes/icon.css"></link>
<script type="text/javascript" src="/emcc-new/js/jquery.easyui.min.js"></script>

<script type="text/javascript" src="/emcc-new/js/time.js"></script>
<script type="text/javascript" src="/emcc-new/js/jsonToTime.js"></script>
<script type="text/javascript" src="/emcc-new/js/poms-system/btn123ABC.js"></script> 
<style>
span{font-size: 13px;}
select{border:1px solid #99cdff; width:130px;}
.trHeight{height:30px;}
.bka img{ border:none}
</style>
<script type="text/javascript">
		$(function(){
			//我的工单
			$.ajax({
			url: "toSearchGD.action?m=toSearchGD",
			type:"POST",
			dataType:"json",
			timeout: 10000,
			data:{
				"gdType":"0",
				"gdState":"0",
				"proposeTime":getNowTime(),
				"pageIndex":1,
				"pageSize":7
				}, success: function(data){
					$.each(data.list, function(i,item) {
						var tr = "<tr><td><div class='contentLeft'><img src='/emcc-new/image/poms-business/picture/gdblue.png' />&nbsp;<a href='#' class='gdAndDtA' id='gdInfo_"+item.id+"' onclick=gdFunction('"+item.id+"');>"+item.proposeContent+"</a></div><div class='contentright'>"+Util.DateTime.Formater("yyyy-MM-dd",item.proposeTime.time)+"</div></td></tr>";
						$("#myGd").append(tr);
					});
				}
			});
			//故障报警信息
			$.ajax({
			url: "toOperationSysLog.action?m=toSearchPomsSystemLog",
			type:"POST",
			dataType:"json",
			timeout: 10000,
			data:{
				"keyword":"",
				"bugBound":"2",
				"gdTime":getNowTime(),
				"pageIndex":1,
				"pageSize":7
				}, success: function(data){
					$.each(data.list, function(i,item) {
						var tr = "<tr><td><div class='contentLeft'><img src='/emcc-new/image/poms-business/picture/jg18x18.png' />&nbsp;<a  href='#' class='yjA' id='yjInfo_"+item.id+"'onclick=yjFunction('"+item.id+"');>"+item.oslBugContent+"</a></div><div class='contentright'>"+Util.DateTime.Formater("yyyy-MM-dd",item.oslBugTime.time)+"</div></td></tr>";
						$("#yjInfo").append(tr);
					});
				}
			});
		
			//动态信息
			$.ajax({
			url: "toInfoPublish.action?m=toSearchInfoPublish",
			type:"POST",
			dataType:"json",
			timeout: 10000,
			data:{
				"userName":"",
				"title":"",
				"publishTime":getNowTime(),
				"pageIndex":1,
				"pageSize":7
				}, success: function(data){
					$.each(data.list, function(i,item) {
						var tr = "<tr><td><div class='contentLeft'><img src='/emcc-new/image/poms-business/picture/dt16x16.png' />&nbsp;<a  href='#' class='gdAndDtA' id='dtInfo_"+item.id+"' onclick=dtFunction('"+item.id+"');>"+item.mipTitle+"</a></div><div class='contentright'>"+Util.DateTime.Formater("yyyy-MM-dd",item.mipEdittime.time)+"</div></td></tr>";
						$("#dtInfo").append(tr);
					});
				}
			});
		});
		
		//获取当前时间
		function getNowTime(){
		var now=new Date();
		var year=now.getFullYear();
		var month=now.getMonth()+1;
		var day=now.getDate();
		var nowTime = ""+year+"-"+month+"-"+day;
		return nowTime;
	}
	//点击链接获取工单详细信息
	function gdFunction(id){
		$.ajax({
			url: "toOperateGD.action?m=toSearchOperateGD",
			type:"POST",
			dataType:"json",
			timeout: 10000,
			data:{
				"gdId":id,
				}, success: function(data){
					$("#oasProposer").text(data.pomsOperationAssignmentSheet.oasProposer);
					$("#proposeTime").text(Util.DateTime.Formater("yyyy-MM-dd",data.pomsOperationAssignmentSheet.proposeTime.time));
					$("#needComplteTime").text(Util.DateTime.Formater("yyyy-MM-dd",data.pomsOperationAssignmentSheet.needComplteTime.time));
					var type = data.pomsOperationAssignmentSheet.oasSheetType;
					if(type ==1){$("#oasSheettype").text('手动');}
					else if(type ==2){$("#oasSheettype").text('系统');}
					var yxj = data.pomsOperationAssignmentSheet.oasPriority;
					if(yxj ==1){$("#oasPriority").text('一般');}
					else if(yxj ==2){$("#oasPriority").text('紧急');}
					var status = data.pomsOperationAssignmentSheet.dealStatus;
					if(status ==1){$("#dealStatus").text('已处理');}
					else if(status ==2){$("#dealStatus").text('未处理');}
					$("#proposeContent").text(data.pomsOperationAssignmentSheet.proposeContent); 
					if(data.gc!=null){
						$("#gctxx").show();
						$("#clgc").show();
						$("#gctxx").text(data.gc);
					}else{
						$("#gctxx").hide();
						$("#clgc").hide();
					}
				}
		});
		//显示工单信息隐藏层 
			$("#gdDiv").attr("style","display:black;");
			$('#gdDiv').dialog({
			title: '工单信息',
			width: 500,
			closed: false,
			cache: false,
			modal: true,
			minimizable: false,
			resizable: true
			});
	}
	//点击链接获取预警详细信息
	function yjFunction(id){
		$.ajax({
			url: "toOperationSysLog.action?m=toSearchPomsSystemLogById",
			type:"POST",
			dataType:"json",
			timeout: 10000,
			data:{
				"gdId":id,
				}, success: function(data){
					$.each(data.list, function(i,item) {
						$("#oslBugTime").text(Util.DateTime.Formater("yyyy-MM-dd",item.oslBugTime.time));
						$("#oslBugCodes").text(item.oslBugCodes);
						$("#oslBugContent").text(item.oslBugContent);
						var isSure = item.oslIssure;
						if (isSure==0) {$("#oslIssure").text("未确认");} else if(isSure==1){$("#oslIssure").text("已确认")};
						var problemBand = item.oslBugBand;
						if (problemBand==1) {$("#oslBugBand").text("警告");} else if(problemBand==2){$("#oslBugBand").text("错误/故障");} else if(problemBand==0){$("#oslBugBand").text("正常");}
					});
				}
		});
		//显示预警信息隐藏层 
			$("#yjDiv").attr("style","display:black;");
			$('#yjDiv').dialog({
			title: '预警信息',
			width: 500,
			closed: false,
			cache: false,
			modal: true,
			minimizable: false,
			resizable: true
			});
	}
	//点击链接获取动态详细信息
	function dtFunction(id){
		$.ajax({
		url: "toInfoPublish.action?m=toSearchInfoPublishById",
		type:"POST",
		dataType:"json",
		timeout: 1000,
		data:{
			"id":id
			}, success: function(data){
				$("#loginName").text(data.publish.pomsUsersManagement.loginName);
				var modeInfo = data.publish.mipModules;
				if(modeInfo == 0){$("#mipModules").text("通告");}
				$("#mipEdittime").text(Util.DateTime.Formater("yyyy-MM-dd",data.publish.mipEdittime.time));
				$("#mipTitle").text(data.publish.mipTitle);
				var ispublish = data.publish.mipIspublished;
				if(ispublish=="0"){$("#mipIspublished").text("未发布");}else if(ispublish=="1") {$("#mipIspublished").text("已发布");}
				$("#myEditor").html(data.publish.mipContent);
			}
		});
		//显示动态信息隐藏层 
			$("#dtDiv").attr("style","display:black;");
			$('#dtDiv').dialog({
			title: '动态信息',
			width: 500,
			closed: false,
			cache: false,
			modal: true,
			minimizable: false,
			resizable: true
			});
			
	}
	
	
	</script>
</head>
<body onload="initShowTime();loadFrame(); timerONE=window.setTimeout">
<div style="background-color:#e9e9e9;width:1280px; height:555px;">
	<!--左侧内容start -->
	<div style="width:160px; height:555px; float:left; border-right:1px solid #D2D2D2; border-bottom:1px solid #999999;background-color:#ffffff;">
		<div style="width:160px;height:228px;">
			<div class="leftTitle">个人信息</div>
			<div style="width:160px;height:200px;">
					<img src="/emcc-new/image/poms-business/picture/rw80x100.png" style="margin-top:20px;margin-bottom:20px;"/>
					<div class="leftContent">欢迎您,<%=request.getAttribute("userName") %> </div>
					<div class="leftContent"><font id="showTimeInfo">显示时间的位置</font></div>
			</div>
		</div>
		<div style="width:160px; height:327px;">
			<div class="leftTitle">友情链接</div>
			<div style="width:160px;height:299px;   font-size:14px;">
				<div class="leftContent"><img src="/emcc-new/image/poms-business/picture/lj.png" /> <span>公司主页</span></div>
				<div class="leftContent"><img src="/emcc-new/image/poms-business/picture/lj.png" /> <span>公司邮箱</span></div>
			</div>
		</div>
	</div>
	<!--左侧内容end -->
	<!--中间内容start -->
	<div style="width:724px; height:555px; padding-left:10px; padding-top:10px; padding-bottom:10px; margin-right:3px; float:left;">
		<div style="width:721px;height:310px;border:1px solid #D2D2D2; margin-bottom:3px;background-color:#ffffff;">
			<div class="contentTitle">
				<div class="contentLeft"><img src="/emcc-new/image/poms-business/picture/myLog16x16.png" />&nbsp;我的日志</div>
			</div>
			<!--我的日志内容start-->
			<!--<iframe style="height:300px;width: 715px;" scrolling="auto" frameborder="0" marginheight="0" id="systemIframe" src="toBusinessIndex.action?m=toIndexRili"></iframe>
			-->
			<div class="three_top2">
				<span>请选择年月:&nbsp;</span>
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
								</select><span>&nbsp;年</span>
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
								</select><span>&nbsp;月</span>
			</div>
			<!--我的日志内容end-->
			<div><iframe id="main" frameborder=0 scrolling=auto src="" width="707" height=240"></iframe></div>
		</div>
		<div style="width:721px;height:222px;border:1px solid #D2D2D2;background-color:#ffffff;">
			<div class="contentTitle">
				<div class="contentLeft"><img src="/emcc-new/image/poms-business/picture/gd16x16.png" />&nbsp;我的工单</div>
				<div class="contentright1"><a href="toSearchGD.action?m=toSearchPage">更多...</a></div>
			</div>
			<!--我的工单内容start-->
			<table style="width:721px; font-size:12px;" id="myGd"></table>
			<!--我的工单内容end-->
		</div>
	</div>
	<!--中间内容end -->
	<!--右边内容start -->
	<div style="width:373px; height:555px;padding-top:10px; float:left;">
		<div style="width:373px;height:310px;border:1px solid #D2D2D2; margin-bottom:3px;background-color:#ffffff;">
			<div class="contentTitle">
				<div class="contentLeft"><img src="/emcc-new/image/poms-business/picture/yj16x16.png" />&nbsp;故障报警信息</div>
				<div class="contentright1"><a href="toOperationSysLog.action?m=toYwgzsbPage">更多...</a></div>
			</div>
			<!--故障报警信息start-->
				<table style="width:373px; font-size:12px;" id="yjInfo"></table>
			<!--故障报警信息end-->
		</div>
		<div style="width:373px;height:222px;border:1px solid #D2D2D2;background-color:#ffffff;">
			<div class="contentTitle">
				<div class="contentLeft"><img src="/emcc-new/image/poms-business/picture/dt16x16.png" style="border: none;"/>&nbsp;动态信息</div>
				<div class="contentright1"><a href="toInfoPublish.action?m=toSearchInfoPublishPage">更多...</a></div>
			</div>
			<!--动态信息start-->
			<table style="width:373px; font-size:12px;" id="dtInfo"></table>
			<!-- 动态信息 end -->
		</div>
	</div>
	<!-- 右边内容 end -->
</div>
<!-- 页脚部分 -->
	<div style="height:46px; width:1280px; text-align:right; font-size:13px; line-height:46px; border-top:1px solid #999999;background-color:#e9e9e9;">
		<font size="-1" face="新宋体" color="#333333"> 最新警告信息:<a href="toOperationSysLog.action?m=toYwgzsbPage" class="bka"><img src="/emcc-new/image/poms-business/picture/rightBottom.png" /></a>&nbsp;&nbsp;</font>
	</div>
<!-- 页脚部分 -->
	<!-- 工单详情 -->
	<div id="gdDiv" style="border:1px solid #000000; font-size:13px; margin-left:20px; height:600px; display:none;">
		<div  style="margin-top:10px;"><b>&nbsp;&nbsp;我的工单详情</b></div>
		<hr />
		<table style="height: 400px;">
			<tbody>
				<tr class = "trHeight"><td width="100px;">&nbsp;&nbsp;任务类型：</td><td><span id="oasSheettype"></span></td></tr>
				<tr class = "trHeight"><td>&nbsp;&nbsp;提出人：</td><td><span id="oasProposer"></span></td></tr>
				<tr class = "trHeight"><td>&nbsp;&nbsp;提交时间：</td><td><span id="proposeTime"></span></td></tr>
				<tr class = "trHeight"><td>&nbsp;&nbsp;完成时间：</td><td><span id="needComplteTime"></span></td></tr>
				<tr class = "trHeight"><td>&nbsp;&nbsp;优先级：</td><td><span id="oasPriority"></span></td></tr>
				<tr class = "trHeight"><td>&nbsp;&nbsp;处理状态：</td><td><span id="dealStatus"></span></td></tr>
				<tr class = "trHeight"><td>&nbsp;&nbsp;内容:</td><td><textarea rows="4" cols="35" id="proposeContent" readonly="true" style="height: 60px; width: 240px; resize:none;"></textarea></td></tr>
				<tr class = "trHeight"><td id="clgc">&nbsp;&nbsp;处理过程:</td><td><textarea id="gctxx" rows="4" cols="35" readonly="true" style="height: 60px; width: 240px; resize:none;"></textarea></td></tr>
			</tbody>
		</table>
	</div>
	<!-- 工单详情 -->
	
	<!-- 预警信息 -->
	<div id="yjDiv" style="border:1px solid #000000; font-size:13px; margin-left:20px; height:500px; display:none;">
		<div  style="margin-top:10px;"><b>&nbsp;&nbsp;预警详情</b></div>
		<hr />
		<table>
			<tbody>
				<tr class = "trHeight"><td width="100px;">&nbsp;&nbsp;提交时间：</td><td><span id="oslBugTime" ></span></td></tr>
				<tr class = "trHeight"><td>&nbsp;&nbsp;故障预警编码：</td><td><span id="oslBugCodes"></span></td></tr>
				<tr class = "trHeight"><td>&nbsp;&nbsp;问题级别：</td><td><span id="oslBugBand"></span></td></tr>
				<tr class = "trHeight"><td>&nbsp;&nbsp;是否确认：</td><td><span id="oslIssure"></span></td></tr>
				<tr class = "trHeight"><td>&nbsp;&nbsp;问题内容：</td><td><textarea rows="4" cols="35" id="oslBugContent"></textarea></td></tr>
			</tbody>
		</table>
	</div>
	<!-- 预警信息 -->
	
	<!-- 动态信息 -->
	<div id="dtDiv" style="border:1px solid #000000; font-size:13px; margin-left:20px; height:500px; display:none;">
		<div  style="margin-top:10px;"><b>&nbsp;&nbsp;动态详情</b></div>
		<hr />
		<table>
			<tbody>
				<tr class = "trHeight"><td width="100px;">&nbsp;&nbsp;用户：</td><td><span id="loginName"></span></td></tr>
				<tr class = "trHeight"><td>&nbsp;&nbsp;模块：</td><td><span id="mipModules"></span></td></tr>
				<tr class = "trHeight"><td>&nbsp;&nbsp;状态：</td><td><span id="mipIspublished"></span></td></tr>
				<tr class = "trHeight"><td>&nbsp;&nbsp;时间：</td><td><span id="mipEdittime"></span></td></tr>
				<tr class = "trHeight"><td>&nbsp;&nbsp;主题：</td><td><span id="mipTitle"></span></td></tr>
				<tr><td>&nbsp;&nbsp;内容：</td><td width="650px;"><div id="myEditor"></div></td></tr>
			</tbody>
		</table>
	</div>
	<!-- 动态信息 -->
	<!-- 点击日期，写日志start -->
	<div id="logInfoDiv" >
				<form action="toCzrzri.action?m=toAddrili" method="post">
					<table>
						<tbody>
							<tr class = "trHeight">
								<td style="width:100px;">&nbsp;&nbsp;事件：</td>
								<td>
									<textarea style="border:1px #ADADAD solid" rows="4" cols="35" id="count" name="count"><%=session.getAttribute("things")%></textarea>
								</td>
							</tr>
							<tr class = "trHeight">
								<td width="100px;">&nbsp;&nbsp;备注：</td>
								<td>
									<textarea style="border:1px #ADADAD solid" rows="4" cols="35" id="backs" name="backs"><%=session.getAttribute("upbacks")%></textarea>
								</td>
							</tr>
							<tr><td></td><td style="text-align: center;">
							<input type="submit" class="btn1" name="btn1" id="btn1" value="保存"/>&nbsp;&nbsp;&nbsp;
							<input type="reset" class="btn2" name="btn2" id="btn2" value="清空"/></td></tr>
						</tbody>
					</table>
				</form>
			</div>
	<!-- 点击日期，写日志end -->
	
	<script type="text/javascript"> 
		var yearParam = $("#YEAR").val();
		var monthParam = $("#MONTH").val();
		function YM_onchange(){
			var yearParam = $("#YEAR").val();
			var monthParam = $("#MONTH").val();
			document.getElementById("main").src="toBusinessIndex.action?m=toRiliPage&year="+yearParam+"&month="+monthParam;
		}
		function loadFrame(){
			document.getElementById("main").src="toBusinessIndex.action?m=toRiliPage&year="+yearParam+"&month="+monthParam;
		}
</script>
</body>
</html>