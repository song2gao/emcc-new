<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>用能单位维护——人员信息维护</title>
</head>
<link rel="stylesheet" type="text/css"
	href="/emcc-new/css/themes/easyui.css">
<link rel="stylesheet" type="text/css" href="/emcc-new/css/icon.css">
<link rel="stylesheet" type="text/css"
	href="/emcc-new/css/themes/demo.css">
<script type="text/javascript" src="/emcc-new/css/themes/jquery.min.js"></script>
<script type="text/javascript" src="/emcc-new/css/themes/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/emcc-new/js/page.js"></script>
<script type="text/javascript" src="/emcc-new/js/poms-unit/metermodel-index.js"></script>
<script type="text/javascript" src="/emcc-new/js/easyui-lang-zh_CN.js"></script>
<body style="height:560px">
	<div id="main" style="border:0px solid red;width:100%;height:560px">
			<table id="dd" style="height:40%"></table>
			
			<table id="tt" style="height:60%"></table>
		<div id="divThemes" 
		style="display: none; text-align: center; padding: 5px">
		<form id="ff" method="post">
		<input class="easyui-textbox" type="hidden" id="pid" name="id">
			<h1 align="center">请填写员工详细信息</h1>
			<div style="margin-bottom: 10px">
				<input class="easyui-textbox" id="piCodes" name="piCodes"
					style="width: 80%" data-options="label:'员工编码:',required:true">
			</div>
			<div style="margin-bottom: 10px">
				<input class="easyui-textbox" id="piName" name="piName"
					style="width: 80%" data-options="label:'员工姓名:',required:true">
			</div>
			<div style="margin-bottom: 10px;border: 0px solid red;text-align: left;margin-left: 10%">
				 <label style="text-align: left;border: 0px solid red;">性&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
				<span class="radioSpan">
				<input
					type="radio" id="piSex" name="piSex" value="0" checked="true">男</input> <input
					type="radio" id="piSex" name="piSex" value="1">女</input>
				</span>
			</div>
			<div style="margin-bottom: 10px">
				<input class="easyui-textbox" id="piAge" name="piAge"
					style="width: 80%" data-options="label:'年龄:',required:true">
			</div>
			<div style="margin-bottom: 10px">
				<select class="easyui-combobox" id="euiId" name="euiId"
					label="用能单位" style="width: 80%">
				</select>
			</div>
			<div style="margin-bottom: 10px">
				<input class="easyui-textbox" id="piEmail" name="piEmail"
					style="width: 80%" data-options="label:'邮箱:',required:true">
			</div>
			<div style="margin-bottom: 10px">
				<input class="easyui-textbox" id="piMobile" name="piMobile"
					style="width: 80%" data-options="label:'联系方式:',required:true">
			</div>
			<div style="margin-bottom: 10px">
				<input class="easyui-textbox" id="plLocation" name="plLocation"
					style="width: 80%" data-options="label:'家庭住址:',required:true">
			</div>
		</form>
	</div>
	</div>
</body>
</html>