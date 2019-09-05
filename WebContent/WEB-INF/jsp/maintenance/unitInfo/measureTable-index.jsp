<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.net.URLEncoder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>测量仪表配置</title>
</head>

<link href="/emcc-new/css/poms-system/xtqygl.css" rel="stylesheet"
	type="text/css" />

<link href="/emcc-new/css/poms-system/bdcss.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" type="text/css"
	href="/emcc-new/css/themes/easyui.css">
<link rel="stylesheet" type="text/css" href="/emcc-new/css/icon.css">
<link rel="stylesheet" type="text/css"
	href="/emcc-new/css/themes/demo.css">
<script type="text/javascript" src="/emcc-new/css/themes/jquery.min.js"></script>
<script type="text/javascript" src="/emcc-new/css/themes/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/emcc-new/js/page.js"></script>
<script type="text/javascript" src="/emcc-new/js/poms-unit/measureTable-index.js"></script>
<script type="text/javascript" src="/emcc-new/js/easyui-lang-zh_CN.js"></script>
<body>
	<div id="main" style="padding: 0px; margin-left: -3px;">
		<!-- 
			<div id="clb_right" style="width: 1275px;">
			 -->
		<div id="yhgl_right_top" align="left"
			style="width: 1450px; height: 40px;">

			<div style="padding-top: 8px;">
				<table>
					<tr>
						<td>企业：</td>
						<td><input type="text" id="qy" name="qy" /></td>
						<td><input type="button" value="查询" class="btnClass"
							id="search" /></td>
					</tr>
				</table>
				<!-- 
						<font >&nbsp;企业：</font>
						<input type="text" id="qy" name="qy"/>	
						<input type="button" value="查询" class="btnClass" id="search"/>
						 -->
			</div>
			<!-- 
					<input type="button" value="添加" class="btnClass" />
					<input type="button" value="修改" class="btnClass" />
					<input type="button" value="删除" class="delClass" />
					 -->
		</div>
		<div style="width: 100%">
			<table id="cc" style="height: 240px;"></table>
		</div>
		<div id="leftC" style="width: 50%; float: left; margin-left: 0px;">
			<div id="" align="left"
				style="width: 630px; height: 10px; text-align: inherit; VISIBILITY: hidden;">
				<input type="button" value="添加" class="btnClass" id="addAss" /> <input
					type="button" value="修改" class="btnClass" id="updAss" /> <input
					type="button" value="删除" class="delClass" id="delAss" />
			</div>
			<table id="dd" style="height: 250px;"></table>
		</div>

		<!-- 
				<div style="float: left;width: 5px;">
					<img  src="/emcc-new/image/poms-unit/FGX.jpg" height="50px;">
				</div>
				 -->
		<div id="rightJ" style="width: 50%; float: left; margin-left: 0px;">
			<div id="" align="left"
				style="width: 630px; height: 10px; text-align: inherit; VISIBILITY: hidden;">
				<input type="button" value="添加" class="btnClass" id="addCal" /> <input
					type="button" value="修改" class="btnClass" id="updCal" /> <input
					type="button" value="删除" class="delClass" id="delCal" />
			</div>
			<table id="ee" style="height: 250px;"></table>
		</div>
		<!-- 
			</div>
			 -->
	</div>

	<!-- 采集终端配置添加页 -->
	<div id="divAdd"
		style="display: none; text-align: center; padding: 5px">
		<form id="addForm" method="post">
			<table>
				<tr>
					<td width="100px" align="center">用能企业:</td>
					<td align="left"><input type="hidden" id="unit" name="eid">
						<input type="text" id="unitid" name="unitid" disabled=true /></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td width="100px" align="center">采集器终端编号:</td>
					<td align="left"><input type="text" id="crcCommunicateSerial"
						name="crcCommunicateSerial" /> <font color="red">*</font></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td width="100px" align="center">采集终端名称:</td>
					<td align="left"><input type="text" id="asstdNames"
						name="asstdNames" /> <font color="red">*</font></td>
					<td>&nbsp;</td>
				</tr>

				<!--  <tr>
			    		<td width="100px" align="center">运行状况:</td>
			    		<td  align="left">
			    		 
			    		<input type="text" id="asstdRunStatus" name="asstdRunStatus" />
			    		
			    			<select id="asstdRunStatus" name="asstdRunStatus">
			    				
			    				<option value="0">--在线--</option>
			    				<option value="1">--离线--</option>
			    			</select>
			    		</td>
			    		
			    	</tr>
			    	-->
				<tr>
					<td width="100px" align="center">生产厂家:</td>
					<td align="left"><input type="text" id="asstdProduction"
						name="asstdProduction" /> <font color="red">*</font></td>
					<td>&nbsp;</td>
				</tr>
				<!-- <tr>
			    		<td width="100px" align="center">前置机:</td>
			    		<td  align="left">
							<select id="qzjid" name="qzjid"></select>
						<font color="red">*</font></td>
			    		<td>&nbsp;</td>
			    	</tr> -->
				<!--  <tr>
			    		<td width="100px" align="center">采集终端IP:</td>
			    		<td  align="left"><input type="text" id="crcAssembleIp" name="crcAssembleIp" /></td>
			    		<td>&nbsp;</td>
			    	</tr>-->
				<!-- <tr>
			    		<td width="100px" align="center">通讯类型:</td>
			    		<td  align="left">
			    		 <input type="text" id="crcCommunicateType" name="crcCommunicateType" />
			    		<select id="crcCommunicateType" name="crcCommunicateType">
			    				
			    				<option >TCP</option>
			    				<option >UDP</option>
			    				<option >串口</option>
			    				<option >GPRS</option>
			    			</select></td>
			    		<td>&nbsp;</td>
			    	</tr> -->


				<tr>

					<td width="100px" align="center">采集通讯地址:</td>
					<td align="left"><input type="text" id="asstdCode"
						name="asstdCode" /> <font color="red">*</font></td>
					<td>&nbsp;</td>
				</tr>

				<tr>
					<td width="100px" align="center">备注:</td>
					<td><textarea rows="4" style="width: 200px;"
							id="asstdBackups" name="asstdBackups"></textarea></td>
					<td>&nbsp;</td>
				</tr>
			</table>
		</form>
	</div>

	<!-- 终端配置添加页 -->
	<div id="divAddS"
		style="display: none; text-align: center; padding: 5px;">
		<form id="addsForms" method="post">
			<h1 align="center">请填写计量终端详细信息</h1>
			<input class="easyui-textbox" type="hidden" id="aid" name="aid">
			<input class="easyui-textbox" type="hidden" id="bid" name="bid">
			<div style="margin-bottom: 20px">
				<input class="easyui-textbox" id="cdtTerminalName" name="cdtTerminalName"
					style="width: 80%" data-options="label:'计量终端名称:',required:true">
			</div>
			<div style="margin-bottom: 20px">
				<select class="easyui-combobox" id="ctmId"  name="ctmId"
					label="计量模型:" style="width: 80%">
				</select>
			</div>
			<div style="margin-bottom: 20px">
				<input class="easyui-textbox" id="ctdCodes" name="ctdCodes"
					style="width: 80%" data-options="label:'计量终端编号:',required:true">
			</div>
			<div style="margin-bottom: 20px">
				<input class="easyui-textbox" id="ctdAddr"
					name="ctdAddr" style="width: 80%"
					data-options="label:'计量终端地址:',required:true">
			</div>
			<div style="margin-bottom: 20px;border: 0px solid red;text-align: left;margin-left: 10%">
				 <label style="text-align: left;border: 0px solid red;">计量终端状态：</label>
				<input type="radio" id="test" name="cdtTerminalStatus" value="0" checked="checked">新增</input> 
				<input type="radio"  name="cdtTerminalStatus" value="1">不是</input>
				<input type="radio"  name="cdtTerminalStatus" value="2" >测通</input> 
				<input type="radio"  name="cdtTerminalStatus" value="3" >正常</input> 
				<input type="radio"  name="cdtTerminalStatus" value="4" >停用</input> 
			</div>
			<div style="margin-bottom: 20px;border: 0px solid red;text-align: left;margin-left: 10%">
				 <label style="text-align: left;border: 0px solid red;">虚/实终端状态：</label>
				<input
					type="radio" id="cdtIsinvented" name="cdtIsinvented" value="0" checked="true">虚</input> <input
					type="radio" id="cdtIsinvented" name="cdtIsinvented" value="1">实</input>
			</div>
			<div style="margin-bottom: 20px">
				<input class="easyui-textbox" id="cdtFormular"
					name="cdtFormular" style="width: 80%"
					data-options="label:'电流比例:',required:true">
			</div>
			<div style="margin-bottom: 20px">
				<input class="easyui-textbox" id="cdtFormularid"
					name="cdtFormularid" style="width: 80%"
					data-options="label:'电压比例:',required:true">
			</div>
		</form>
	</div>

</body>
</html>