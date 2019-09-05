<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta>
<title>报警信息管理-中惠元景能耗监测平台</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!-- Le styles -->
<link rel="stylesheet" type="text/css"
	href="/emcc-new/css/themes/color.css"></link>
<link rel="stylesheet" type="text/css" href="/emcc-new/css/icon.css">
<link rel="stylesheet" type="text/css"
	href="/emcc-new/css/themes/easyui.css">
<link rel="stylesheet" href="/emcc-new/assets/css/bootstrap.css">
<script type="text/javascript" src="/emcc-new/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="/emcc-new/js/page.js"></script>
<script type="text/javascript"
	src="/emcc-new/css/themes/jquery.easyui.min.js"></script>

<script type="text/javascript">
	var args = {};
	args.pageSize = 5;
	args.pageIndex = 1;
	args.pageList = [ 5, 10, 15, 20, 35 ];
	$(function() {

		BingData("#dg", args,
				'${pageContext.request.contextPath}/alarm/toDataAllAlarm', null);
		BingSelect();
		var d = new Date();
		var str = d.getFullYear() + "-" + (d.getMonth() + 1) + "-"
				+ d.getDate();
		$("#date").datebox('setValue', str);
	});

	//工单优先级
	function BingSelect() {
		$("#oasPriority").combobox({
			onChange : function() {
				var st = $('#oasPriority').combobox('getValue');
				$("#oasPrioritys").val(st);
			}
		})
		$("#userName").combobox({
			onChange : function() {
				var st = $('#userName').combobox('getValue');
				$("#userNames").val(st);
			}
		})
		//alert($("#cc").combobox('getValue'));
		//$("#oasPriority").combobox('setValue',row.oasPriority);

	}
	//工单优先级
	function isyou(val) {
		var res = "";
		if (val == "1") {
			res = '<span style="color:red;">' + "一级警报" + '</span>';
		} else if (val == "2") {
			res = '<span style="color:red;">' + "二级警报" + '</span>';
		} else if (val == "3") {
			res = '<span style="color:red;">' + "三级警报" + '</span>';
		} else {
			res = "";
		}
		return res;
	}
	//报警信息类别
	function isStyle(val) {
		var res = "";
		if (val == "1") {
			res = "系统报警";
		} else if (val == "2") {
			res = '<span style="color:blue;">' + "人工报警" + '</span>';
		} else {
			res = "";
		}
		return res;
	}
	//是否处理
	function isDeal(val) {
		var res = "";
		if (val == "1") {
			res = "<span class='btn btn-success' >已处理</span>";
		} else if (val == "2") {
			res = '<span>'
					+ "<button type='button' class='btn btn-danger' onclick='isOK()''>未处理</button>"
					+ '</span>';
		} else {
			res = "";
		}
		return res;
	}

</script>
<script type="text/javascript">
$.extend($.fn.datagrid.methods, {  
    editCell: function(jq,param){  
        return jq.each(function(){  
            var opts = $(this).datagrid('options');  
            var fields = $(this).datagrid('getColumnFields',true).concat($(this).datagrid('getColumnFields'));  
            for(var i=0; i<fields.length; i++){  
                var col = $(this).datagrid('getColumnOption', fields[i]);  
                col.editor1 = col.editor;  
                if (fields[i] != param.field){  
                    col.editor = null;  
                }  
            }  
            $(this).datagrid('beginEdit', param.index);  
            for(var i=0; i<fields.length; i++){  
                var col = $(this).datagrid('getColumnOption', fields[i]);  
                col.editor = col.editor1;  
            }  
        });  
    }  
});  
  
/* 单元格可编辑 */  
var tab='#dg';  
var editIndex = undefined;  
function endEditing() {// 该方法用于关闭上一个焦点的editing状态  
    if (editIndex == undefined) {  
        return true  
    }  
    if ($(tab).datagrid('validateRow', editIndex)) {  
        $(tab).datagrid('endEdit', editIndex);  
        editIndex = undefined;  
        return true;  
    } else {  
        return false;  
    }  
      
};  
/**单击事件*/  
function singleClink() {  
    endEditing();  
}  
  
/** 双击编辑 */  
function DbclkCommentCell(index, field, value) {  
    if (endEditing()) {  
        $(tab).datagrid('selectRow', index).datagrid('editCell', {index:index,field:field});  
        editIndex = index;  
    }  
};  
// 单元格失去焦点执行的方法  
function onAfterEdit(index, row, changes) {  
    var updated = $(tab).datagrid('getChanges', 'updated');  
    if (updated.length < 1) {  
        editRow = undefined;  
        $(tab).datagrid('unselectAll');  
        return;  
    } else {  
        $(tab).datagrid('acceptChanges');  
        // 传值,可做在线编辑功能 
        submitForm(index, row, changes);
    }  
}; 
function submitForm(index, row, changes){
	console.info(row);
	var test=JSON.stringify(row)
	console.info(test);
	$.ajax({
		url : "${pageContext.request.contextPath}/alarm/uppAlarm",
	    data:{"test":test}, 
		type : "post",
		success : function(result) {

			console.info(result);
		},error:function(d){
			alert(d);
		}
	});
}

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
		var value = y + '-' + (m < 10 ? ('0' + m) : m) + '-'
				+ (d < 10 ? ('0' + d) : d);
		return value;
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
	<!--  报警信息管理 -->
	<div class="wrap-fluid">
		<!-- 内容板块 -->

		<div class="col-sm-10 box-shadow-2"
			style="float: left; width: 100%; border: 0px solid red; height: 98%;">
			<table id="dg" align="center" title="报警信息" class="easyui-datagrid"
				style="width: 100%; height: 100%;" toolbar="#toolbar"
				pagination="true" fitColumns="true" singleSelect="true"
				striped="true" rownumbers="true" checkOnSelect="true" selectOnCheck="true"
				data-options="onDblClickCell:DbclkCommentCell,onAfterEdit:onAfterEdit,onClickCell:singleClink">
				<thead>
					<tr>
						<th data-options="field:'ck',checkbox:true"></th>
						<th field="id" width="12%" align="center">工单编号：</th>
						<th field="oasPriority" width="7%" formatter="isyou" editor="{type:'combobox',options:{required:true,formatter:isyou}}"
							align="center">工单优先级：</th>
						<th field="umName" width="6%" align="center" editor="{type:'combobox',options:{formatter:comboboxUser}}" formatter="comboboxUser">工单发起人：</th>
						<input type="hidden" name="userId" id="userId" />
						<th field="oasSheetType" width="6%" formatter="isStyle" editor="combobox"
							align="center">报警类别：</th>
						<th field="oasProposer" width="5%" 
							align="center" editor="combobox">工单处理人：</th>

						<th field="proposeTime" width="8%" align="center" editor="{type:'datebox',options:{required:true,formatter:myformatter,parser:myparser}}">提出时间：</th>

						<th field="proposeContent" width="15%" align="center" editor="textarea">工单内容：</th>

						<th field="needComplteTime" width="10%" align="center" editor="datebox">预计完成时间：</th>

						<th field="solveContent" width="10%" align="center" editor="textarea">处理内容：</th>
						<th field="complteTime" width="10%" align="center" editor="datebox">完成时间：</th>
						<th field="dealStatus" width="10%" formatter="isDeal" editor="combobox"
							align="center">是否处理：</th>
					</tr>
				</thead>
			</table>
			<div id="toolbar"
				style="text-align: left; border: 0px solid red; width: 100%;">
				<div style="border: 0px solid; width: 100%; margin-top: 0.1%;">
					<select class="easyui-combobox" id="alarminfo" panelHeight="auto"
						style="margin-left: 2%; width: 10%;">
						<option value="">所有报警信息</option>
						<option value="1">系统报警</option>
						<option value="2">人工报警</option>
					</select> <select class="easyui-combobox" id="isok" panelHeight="auto"
						style="margin-left: 1%; width: 10%;">
						<option value="">所有处理信息</option>
						<option value="1">已处理</option>
						<option value="2">未处理</option>
					</select> <input class="easyui-datebox" style="margin-left: 1%; width: 8%;"
						data-options="formatter:myformatter,parser:myparser" id="date"
						value="2017-8-23"> <input id="search" type="text"
						class="easyui-textbox" data-options="prompt:'请输入工单发起人查询...'"
						style="padding-left: 10px; width: 200px; height: 25px; font-size: 12px;"
						value="" /> <a href="javascript:void(0)"
						class="easyui-linkbutton" width="10%" iconCls="icon-search"
						onclick="searchUser()">查询</a> </br> <a href="javascript:void(0)"
						class="easyui-linkbutton" width="200px" iconCls="icon-add"
						plain="true" onclick="newUser()">添加报警信息</a> <a
						href="javascript:void(0)" class="easyui-linkbutton" width="10%"
						iconCls="icon-remove" plain="true" onclick="destroyUser()">删除报警信息</a>

				</div>
				<!-- 报警信息弹出层 -->
				<div id="dlg" class="easyui-dialog" style="width: 34%; height: 75%;"
					closed="true" buttons="#dlg-buttons">
					<form id="fm" method="post" novalidate
						style="margin: 0; padding: 20px 50px">
						<div
							style="margin-bottom: 10px; font-size: 14px; border-bottom: 0px solid #ccc; text-align: center;">工单信息</div>
						<input type="hidden" name="sheetID" id="sheetID" /> <input
							type="hidden" name="oasSheetType" id="oasSheetType" value="2" />
						<input type="hidden" name="dealStatus" id="dealStatus" value="2" />
						<div
							style="margin-top: 10px; border: 0px solid blue; height: 65%;">
							<div style="width: 90%; border: 0px solid red;">
								<input label="工单发起人:" id="userName" name="umName"
									panelHeight="auto"
									data-options="required:true,missingMessage:'请选择用户'"
									style="width: 90%; border: 1px solid red;"> <input
									type="hidden" name="userNames" id="userNames" />
							</div>
							<div style="width: 90%; border: 0px solid red;margin-top: 10px;">
								<input label="指定处理人:" id="oasProposers" name="oasProposer"
									panelHeight="auto"
									data-options="required:true,missingMessage:'请选择用户'"
									style="width: 90%; border: 1px solid red;"> <input
									type="hidden" name="userNames" id="userNames" />
							</div>
							<div style="width: 90%; border: 0px solid red; margin-top: 5px;">
								<select label="工单优先级:" class="easyui-combobox" id="oasPriority"
									name="oasPriority" panelHeight="auto"
									style="margin-left: 1%; width: 90%;"
									data-options="required:true,missingMessage:'请选择优先级'">
									<option value="1">一级警报</option>
									<option value="2">二级警报</option>
									<option value="3">三级警报</option>
								</select> <input type="hidden" name="oasPrioritys" id="oasPrioritys" />
							</div>
							<div
								style="border: 0px solid red; width: 100%; height: 60%; margin-top: 5px;">
								<label>工单内容:</label>
								<textarea name="proposeContent" id="proposeContent"	
									class="easyui-textarea"
									data-options="required:true,missingMessage:'请输入报警内容'"
									required="true"
									style="width: 70%; height: 100%; margin-left: 25%;"></textarea>
							</div>
							<div style="margin-top: 10%; width: 100%; float: left; border: 0px solid red;">
								<input label="预计完成时间:" name="needComplteTime"
									id="needComplteTime" value="2017-11-08" class="easyui-datebox"
									data-options="formatter:myformatter,parser:myparser"
									style="width: 90%;" />
							</div>
						</div>
					</form>
				</div>
				<div id="dlg-buttons">
					<a href="javascript:void(0)" class="easyui-linkbutton c6"
						iconCls="icon-ok" onclick="saveAlarm()" style="width: 90px">确定</a>
					<a href="javascript:void(0)" class="easyui-linkbutton"
						iconCls="icon-cancel"
						onclick="javascript:$('#dlg').dialog('close')" style="width: 90px">取消</a>
				</div>

				<!-- 处理工单弹出层 -->
				<div id="dlg2" class="easyui-dialog"
					style="width: 50%; height: 75%;" closed="true"
					buttons="#dlg-buttons2">
					<form id="fm2" method="post" novalidate
						style="margin: 0; padding: 20px 50px; width: 100%;">
						<div
							style="margin-bottom: 10px; font-size: 14px; border-bottom: 0px solid #ccc; text-align: center;">工单处理信息</div>
						<div
							style="margin-top: 10px; border: 0px solid; height: 30%; width: 100%;">
							<input type="hidden" name="id" id="alarmId" />
							<input type="hidden" name="oasSheetType" id="oasSheetType2" /> <input
								type="hidden" name="dealStatus" id="dealStatus2" /> <input
								type="hidden" name="proposeTime" id="proposeTime2" /> <input
								type="hidden" name="oasPriority" id="oasPriority2" />
							<div
								style="border: 0px solid red; width: 40%; height: 70%; float: right;">
								<label>工单内容:</label>
								<textarea name="proposeContent" id="proposeContent2"
									class="easyui-textarea"
									data-options="required:true,missingMessage:'请输入报警内容'"
									required="true"
									style="width: 90%; height: 100%; margin-left: 1%;"></textarea>
							</div>
							<div style="width: 45%; border: 0px solid red;">
								<input name="umName" id="userName2" class="easyui-textbox"
									panelHeight="auto" label="工单发起人:"  readonly="readonly"
									style="width: 90%; text-align: center;">
							</div>
							<div style="margin-top: 8%; width: 45%; border: 0px solid red;">
								<input label="预计完成时间:" name="needComplteTime" readonly="readonly"
									id="needComplteTime2" value="2017-08-03" class="easyui-datebox"
									data-options="formatter:myformatter,parser:myparser"
								 style="width: 90%; text-align: center;" />
									
							</div>
						</div>
						<hr />

						<div style="border: 0px solid; height: 35%; width: 100%;">
							<div
								style="border: 0px solid red; width: 40%; height: 80%; float: right;">
								<label>处理内容:</label>
								<textarea name="solveContent" id="solveContent"
									class="easyui-textarea" 
									data-options="required:true,missingMessage:'请输入报警内容'"
									required="true"
									style="width: 90%; height: 100%; margin-left: 1%;"></textarea>
							</div>
							<div style="width: 45%; border: 0px solid blue;">
								<input label="处理人:" id="oasProposer2" name="oasProposer"
									panelHeight="auto" class="easyui-textbox" readonly="readonly"
									data-options="required:true,missingMessage:'请选择提出人'"
									style="width: 90%; border: 1px solid red; text-align: center;">
							</div>
							<div style="margin-top: 7%; width: 45%; border: 0px solid red;">
								<input label="处理完成时间:" name="complteTime" id="complteTime"
									value="2017-08-03" class="easyui-datebox"
									data-options="formatter:myformatter,parser:myparser"
									editable="false" style="width: 90%; text-align: center;" />
							</div>
						</div>
					</form>
				</div>
				<div id="dlg-buttons2">
					<a href="javascript:void(0)" class="easyui-linkbutton c6"
						iconCls="icon-ok" onclick="saveOK()" style="width: 90px">确定处理</a>
					<a href="javascript:void(0)" class="easyui-linkbutton"
						iconCls="icon-cancel"
						onclick="javascript:$('#dlg2').dialog('close')"
						style="width: 90px">取消处理</a>
				</div>
				<!-- JS -->
				<script type="text/javascript">
					//用户条件查询
					function searchUser() {

						var search = $("#search").val();
						var alarminfo = $("#alarminfo").val();
						var isok = $("#isok").val();
						var date = $("#date").val();
						//alert("报警信息：" + alarminfo + "处理选择：" + isok + "时间日期：" + date + "查询条件：" + search);
						BingData("#dg", args,
								'${pageContext.request.contextPath}/alarm/toSearchAlarm?search='
										+ search + '&alarminfo=' + alarminfo
										+ '&isok=' + isok + '&date=' + date,
								null);
					}
					var url;
					var urls;
					function comboboxUser(val){
						
	                     alert(val);
	                           
	
					}
					//新建报警信息
					function newUser() {
						$('#dlg').dialog('open').dialog('center').dialog(
								'setTitle', '新建工单信息');
						$.getJSON('${pageContext.request.contextPath}/alarm/finByAll',
										function(json) {
											$('#userName').combobox({
												data : json.list,
												valueField : 'id',
												textField : 'loginName'
											});
											$('#userName').combobox('select',json.list[0].id);
											$('#oasProposers').combobox({
												data : json.list,
												valueField : 'id',
												textField : 'loginName'
											});
											$('#oasProposers').combobox('select',json.list[0].id);
										});
						var d = new Date();
						var str = d.getFullYear() + "-" + (d.getMonth() + 1)
								+ "-" + d.getDate();
						console.info(str);
						$("#complteTime").datebox('setValue', str);

						url = '${pageContext.request.contextPath}/alarm/addAlarm';
					}
					//点击是否处理
					function isOK() {
						var row = $('#dg').datagrid('getSelected');
						if (row != null) {
							
							$('#dlg2').dialog('open').dialog('center').dialog(
									'setTitle', '工单处理信息');
							$("#userName2").textbox("setValue", row.umName);
							$('#userName2').textbox('textbox').attr('readonly',true);
							$("#oasProposer2").textbox("setValue", row.oasProposer);
							$('#oasProposer2').textbox('textbox').attr('readonly',true);
							var d = new Date();
							var str = d.getFullYear() + "-"
									+ (d.getMonth() + 1) + "-" + d.getDate();
							$("#complteTime").datebox('setValue', str);
							$("#proposeContent2").val(row.proposeContent);
							$("#oasSheetType2").val(row.oasSheetType);
							$("#alarmId").val(row.id);
							$("#dealStatus2").val(row.dealStatus);
							$("#proposeTime2").val(row.proposeTime);
							$("#oasPriority2").val(row.oasPriority);
							urls = '${pageContext.request.contextPath}/alarm/addAlarm?sheetID='
								+ row.id;
						} else {
							$.messager.alert('注意!', '请选择一个处理信息!', 'warning');
						}
					}
					//修改用户信息
					function editUser() {
						if (test[index]) {

						}
						;
						var row = $('#dg').datagrid('getSelected');
						if (row != null) {
							$('#dlg').dialog('open').dialog('center').dialog(
									'setTitle', '修改工单信息');
							$.getJSON('toMonitorAlarm.action?m=toAllUser',
									function(json) {
										$('#userName').combobox({
											data : json.list,
											value : row.userName,
											valueField : 'id',
											textField : 'loginName'
										});
									});
							$("#userNames").val(row.userId);
							$("#proposeContent").val(row.proposeContent);
							$("#oasPriority").combobox('setValue',
									row.oasPriority);
							//$("#oasProposer").combobox('setValue',row.oasProposer);

							var o = "";
							var year = row.needComplteTime.year + 1900;
							var month = row.needComplteTime.month + 1;
							var date = row.needComplteTime.date;
							o = year + "-" + month + "-" + date;
							$("#needComplteTime").datebox('setValue', o);

							url = '${pageContext.request.contextPath}/alarm/addAlarm?id='
									+ row.id;
						} else {
							$.messager.alert('注意!', '请选择一个报警信息修改!', 'warning');
						}
					}
					//返回添加 修改
					function saveAlarm() {
						$('#fm')
								.form(
										'submit',
										{
											url : url,
											onSubmit : function() {
												//alert($("#userName").val());
												return $(this).form('validate');
											},
											success : function(result) {
												if (result == "error") {
													$.messager.show({
														title : 'Error',
														msg : result.errorMsg
													});
													$("#fm").form('reset');
												} else {
													$("#fm").form('reset');
													$('#dlg').dialog('close'); // close the dialog
													$('#dg').datagrid('reload'); // reload the user data
													$("#recordAmount").val("");
													BingData(
															"#dg",
															args,
															'${pageContext.request.contextPath}/alarm/toDataAllAlarm',
															null);
												}
											}
										});
					}
					//返回添加 修改
					function saveOK() {
						$('#fm2')
								.form(
										'submit',
										{
											url : urls,
											onSubmit : function() {
												return $(this).form('validate');
											},
											success : function(result) {
												if (result == "error") {
													$.messager.show({
														title : 'Error',
														msg : result.errorMsg
													});
													$("#fm").form('reset');
												} else {
													$('#dlg2').dialog('close'); // close the dialog
													$('#dg').datagrid('reload'); // reload the user data
													$("#fm").form('reset');
													BingData(
															"#dg",
															args,
															'${pageContext.request.contextPath}/alarm/toDataAllAlarm',
															null);
												}
											},error:function(data){
												//alert(data);
											}
										});
					}
					//删除用户
					function destroyUser() {
						//var row = $('#dg').datagrid('getSelected');
						var row = $('#dg').datagrid("getSelections");//返回选中多行  
						  
						if(row.length==0){  
							alert("请至少选择一行数据!");  
						return false;  
						}  
						var ids=[];  
						for (var i = 0; i < row.length; i++) {  
						        //获取自定义table 的中的checkbox值  
						         var id=row[i].id;   //OTRECORDID这个是你要在列表中取的单个id   
						         ids.push(id); //然后把单个id循环放到ids的数组中  
						    }
						
						if (row == null) {
							$.messager.alert('注意!', '请选择一个报警记录删除!', 'warning');
						} else {
							$.messager
									.confirm(
											'删除报警信息',
											'你确定想要删除这条报警信息吗?',
											function(r) {
												if (r) {
													$.ajax({
																url : "${pageContext.request.contextPath}/alarm/toDelAlarmById",
																data : {
																	"array[]" : ids
																},
																type : "post",
																success : function(
																		result) {

																	console
																			.info(result);
																	if (result == "success") {
																		$.messager
																				.alert(
																						'提示',
																						'删除成功！',
																						'Warning');
																		$('#dg')
																				.datagrid(
																						'reload'); // reload the user data
																		BingData(
																				"#dg",
																				args,
																				'${pageContext.request.contextPath}/alarm/toDataAllAlarm',
																				null);
																	} else {
																		$.messager
																				.show({ // show error message
																					title : 'Error',
																					msg : result.errorMsg
																				});
																	}
																}
															});

												}
											});

						}
					}
				</script>
			</div>
		</div>
	</div>
</body>
</html>
