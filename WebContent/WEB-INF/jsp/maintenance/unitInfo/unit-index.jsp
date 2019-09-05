<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用能单位维护——企业信息维护</title>
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

<script type="text/javascript" src="/emcc-new/js/poms-unit/unit-index.js"></script>

<body style="font-size: 12px;">
	<div id="main" class="rywh_main"
		style="margin-left: -7px; border: 0px solid;">
		<div id="rywh_left" style="border-right: 1px solid;">
			<h3 align="center">平台所有企业信息</h3>
			<div class="yhgltreeDiv" align="left">
				<ul class="easyui-tree" style="margin-left: 3px" id="MyTree">
				</ul>
			</div>
		</div>
		<div id="rywh_right" style="width: 84%; border: 0px solid;">
			<div id="rywh_right_top" align="left">
				<br /> <span style="width: 30px; padding: 20px"> <font
					class="font_cg">当前医院：<span id="titile"></span></font>
				</span>

			</div>
			<br />

			<div id="Divindustryinvolved"
				style="display: none; width: 450px; height: 300px;">
				<div id="tb">
					<ul class="easyui-tree" style="margin-left: 3px" id="MyCompanyTree">
					</ul>
				</div>
			</div>

			<div id="dataDiv" style="margin-left: 50px;">
				<form id="form1" name="form1" method="post">
					<table>
						<tr>
							<td width="80px">单位编码:</td>
							<td width="220px"><input type="text" id="euiCode"
								name="euiCode" /> <font color="red">*</font></td>
							<td id="parentName1">父单位名称:</td>
							<td id="parentName2"><input type="text" id="parentName"
								name="parentName" readonly="readonly" /> <input type="hidden"
								id="euiId" name="euiId"></td>

						</tr>
						<tr>
							<td>单位名称:</td>
							<td><input type="text" id="euiNames" name="euiNames" /> <font
								color="red">*</font></td>
							<td>法人代表:</td>
							<td><input type="text" id="euiRepresentative"
								name="euiRepresentative" /> <font color="red">*</font></td>
						</tr>
						<tr>
							<td>所属行业:</td>
							<td><input type="text" class="code" id="euiBelongIndustry1"
								name="euiBelongIndustry1" readonly /> <font color="red">*</font>
								<input type="hidden" id="euiBelongIndustry"
								name="euiBelongIndustry" value=" " /></td>
							<td>所属区县:</td>
							<td><input type="text" class="code" id="euiBelongDistrct1"
								name="euiBelongDistrct1" readonly /> <font color="red">*</font>
								<input type="hidden" id="euiBelongDistrct"
								name="euiBelongDistrct" value=" " /></td>
						</tr>
						<tr>
							<td>能耗等级:</td>
							<td><select style="width: 155px;" id="euiConsumeBand"
								name="euiConsumeBand">
									<option></option>
									<option>两千吨标准煤以下</option>
									<option>两千吨到五千吨标准煤</option>
									<option>五千吨到一万吨标准煤</option>
									<option>一万吨标准煤以上</option>
							</select> <font color="red">*</font></td>
							<td>地理位置:</td>
							<td><input type="text" id="euiLocation" name="euiLocation" /></td>
						</tr>
						<tr>
							<td>联系方式:</td>
							<td><input type="text" id="euiContentWay"
								name="euiContentWay" /></td>
							<td>建筑面积(㎡):</td>
							<td><input type="text" id="euiBuildingArea"
								name="euiBuildingArea" /> <font color="red">*</font></td>
						</tr>
						<tr>
							<td>容纳人数:</td>
							<td><input type="text" id="euiHoldPerson"
								name="euiHoldPerson" /> <font color="red">*</font></td>
							<td>节能主管部门:</td>
							<td><input type="text" id="euiChargeDepartment"
								name="euiChargeDepartment" /></td>

						</tr>
						<tr>
							<td>备注:</td>
							<td colspan="3"><textarea rows="4" style="width: 500px;"
									id="euiBackups" name="euiBackups" disabled="disabled"></textarea>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<div id="rywh_right_top" align="left">
				<br /> <span style="width: 30px; padding: 25px"> <font
					class="font_cg"></font> <input type="button" id="addForm"
					value="增加" class="btnClass" /> <input id="btnupdate" type="button"
					value="修改" class="btnClass" /> <input type="hidden" id="btnType"
					value="" /> <input type="button" id="deleteButton" value="删除"
					class="delClass" /> <input type="hidden" id="treeid" /> <input
					type="hidden" id="treename" />
			</div>
			<br />
		</div>
	</div>
	<!-- 企业信息维护添加页 -->
	<div id="divAdd" class="easyui-dialog" closed="true" closable="true"
		title="新建企业信息" width="700px" height="420px" class="easyui-panel" align="center">
		<form id="ff" method="post" action="addUnit"
			style="border: solid red 0px; text-align: left; margin-left: 3%;  top: 1%;">
			<h1 align="center">请认真填写企业信息资料</h1>
			 <input class="easyui-combobox"  type="hidden" id="unitID" name="id" >
			<div
				style="border: solid red 0px; width: 48%; height: 80%; float: left;">
				<div style="margin-bottom: 10px; border: solid red 0px;">
					<input class="easyui-textbox" id="unitCode" name="euiCode" style="width: 90%"
						data-options="label:'单位编码:',required:true">
				</div>
				<div style="margin-bottom: 10px">
					<input class="easyui-textbox" id="euiNames1" name="euiNames" style="width: 90%"
						data-options="label:'单位名称:',required:true"">
				</div>
				<div style="margin-bottom: 10px">
					<input class="easyui-textbox" id="euiBelongIndustry2" name="euiBelongIndustry1" style="width: 90%"
						data-options="label:'所属行业:',required:true">
				</div>
				<div style="margin-bottom: 10px">
					<input class="easyui-textbox" id="euiContentWay2" name="euiContentWay" style="width: 90%"
						data-options="label:'联系方式:',required:true">
				</div>
				<div style="margin-bottom: 10px">
					<input class="easyui-textbox" id="euiHoldPerson1" name="euiHoldPerson" style="width: 90%"
						data-options="label:'容纳人数:',required:true">
				</div>
				<div style="margin-bottom: 10px">
					<select class="easyui-combobox" id="euiConsumeBand1" name="euiConsumeBand" label="能耗等级"
						style="width: 90%">
						<option value="两千吨标准煤以下" selected="selected">两千吨标准煤以下</option>
						<option value="两千吨到五千吨标准煤">两千吨到五千吨标准煤</option>
						<option value="五千吨到一万吨标准煤">五千吨到一万吨标准煤</option>
						<option value="一万吨标准煤以上">一万吨标准煤以上</option>
					</select>
				</div>
			</div>
			<div
				style="border: solid blue 0px; width: 48%; height: 80%; margin-left: 49%;">
				<div style="margin-bottom: 10px; border: solid red 0px;">
					<select class="easyui-combobox" id="parentNames" name="parentName" label="父单位名称"
						style="width: 90%">
						<option value="ROOT" selected="selected">ROOT</option>
					</select>
				
				</div>
				<div style="margin-bottom: 10px">
					<input class="easyui-textbox" id="euiRepresentative2" name="euiRepresentative" style="width: 90%"
						data-options="label:'法人代表:',required:true">
				</div>
				<div style="margin-bottom: 10px">
					<input class="easyui-textbox" id="euiBelongDistrct2" name="euiBelongDistrct1" style="width: 90%"
						data-options="label:'所属区县:',required:true">
				</div>
				<div style="margin-bottom: 10px">
					<input class="easyui-textbox" id="euiLocation2" name="euiLocation" style="width: 90%"
						data-options="label:'地理位置:',required:true">
				</div>
				<div style="margin-bottom: 10px">
					<input class="easyui-textbox" id="euiBuildingArea2" name="euiBuildingArea" style="width: 90%"
						data-options="label:'建筑面积(㎡):',required:true">
				</div>
				<div style="margin-bottom: 10px">
					<input class="easyui-textbox" id="euiChargeDepartment2" name="euiChargeDepartment" style="width: 90%"
						data-options="label:'节能主管部门:',required:true">
				</div>
			</div>
			<div style="margin-bottom: 10px">
					<input class="easyui-textbox" id="euiBackups2" name="euiBackups"
						style="width: 90%; height: 60px"
						data-options="label:'备注:',multiline:true">
				</div>
		</form>
		<div style="text-align: center; padding: 5px 0">
			<a href="javascript:void(0)" class="easyui-linkbutton"
				onclick="submitForm()" style="width: 80px">提交</a> <a
				href="javascript:void(0)" class="easyui-linkbutton"
				onclick="clearForm()" style="width: 80px">重置</a>
		</div>
	</div>
</body>
</html>