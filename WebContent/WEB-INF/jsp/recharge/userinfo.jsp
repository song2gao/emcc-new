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
		<title>用户信息管理-中惠元景能耗监测平台</title>
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
           		args.pageSize=15;
           		args.pageIndex=1;
           		args.pageList=[15,30,45,60,75];
		    $(function(){
		    	BingData("#dg", args, 'dataUser', null);
		    });
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
		<!--  用户信息管理 -->
		<div class="wrap-fluid">
			<!-- 内容板块 -->
			<div class="col-sm-10 box-shadow-2" style="float:left;width:98.5%;border: 0px solid red ;margin: 0.5%;height:98%;">
				<table id="dg" align="center" title="用户信息" class="easyui-datagrid"  style="width:100%;height:100%;" toolbar="#toolbar" 
				pagination="true" fitColumns="true" singleSelect="true" striped="true" rownumbers="true"  >
				<thead>
					<tr>
						<th field="userId" width="10%" align="center">电表编号：</th>
						<th field="userName" width="15%" align="center">用户姓名：</th>
						<th field="rightId" width="12%" align="center">用户权限：</th>
						<th field="userAmount" width="10%" align="center" >账户余额：</th>
						<th field="userTel" width="20%" align="center">联系方式：</th>
						<th field="userAddress" width="20%" align="center">联系地址：</th>
						<th field="userNote" width="12%" align="center">备注：</th>
					</tr>
				</thead>
			</table>
			<div id="toolbar"  style="text-align: left;border: 0px solid red;width: 100%;">
			<div style="border: 0px solid;width: 100%;">
				<a href="javascript:void(0)" class="easyui-linkbutton" width="200px" iconCls="icon-add" plain="true" onclick="newUser()">添加用户</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" width="10%" iconCls="icon-edit" plain="true" onclick="editUser()">修改用户</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" width="10%" iconCls="icon-remove" plain="true" onclick="destroyUser()">删除用户</a>
				
				<input id="search" type="text" class="easyui-textbox"  data-options="prompt:'请输入用户姓名或手机号...'" 
				style="padding-left:10px;width:200px; height:25px;font-size:12px;"  value="" />
				<a href="javascript:void(0)" class="easyui-linkbutton" width="10%" iconCls="icon-search" plain="true" onclick="searchUser()" >查询用户</a>
				
				<div style="text-align: center;border: 0px solid;width: 20%;float: right;">
					<input name="Fruit" type="checkbox" value="" class="easyui-linkbutton" onclick="OweUser()" width="10%"/>仅查询欠费用户
					<a href="javascript:void(0)" class="easyui-linkbutton" width="10%" iconCls="icon-chongzhi" plain="true" onclick="recharge()">充值金额</a>
				</div>
			</div>
			<!-- 用户信息弹出层 -->
			<div id="dlg" class="easyui-dialog" style="width:400px" closed="true" buttons="#dlg-buttons">
				<form id="fm" method="post" novalidate style="margin:0;padding:20px 50px">
					<div style="margin-bottom:20px;font-size:14px;border-bottom:0px solid #ccc;text-align: center;">用户信息</div>
					
					<div style="margin-bottom:10px">
						<input name="userName" class="easyui-textbox" data-options="required:true,missingMessage:'请输入用户姓名'" required="true" label="用户姓名:" style="width:100%">
					</div>
					<div style="margin-bottom:10px">
						<input name="userAmount" class="easyui-textbox" data-options="required:true,missingMessage:'请输入账户金额'" required="true" label="账户余额:" style="width:100%">
					</div>
					<div style="margin-bottom:10px">
						<input name="rightsId" class="easyui-textbox" required="true" data-options="required:true,missingMessage:'请设置用户权限级别'" label="设置用户权限级别:" style="width:100%">
					</div>
					<div style="margin-bottom:10px">
						<input name="userTel" class="easyui-textbox" required="true" data-options="required:true,missingMessage:'请输入手机号'" validType="tel" label="联系方式:" style="width:100%">
					</div>
					<div style="margin-bottom:10px">
						<input name="userAddress" class="easyui-textbox" required="true" data-options="required:true,missingMessage:'请输入地址'" validType="address" label="地址:" style="width:100%">
					</div>
					<div style="margin-bottom:10px">
						<input name="userNote" class="easyui-textbox" required="true" validType="note" data-options="required:true,missingMessage:'请输入备注'" label="备注:" style="width:100%">
					</div>
				</form>
			</div>
			<div id="dlg-buttons">
				<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveUser()" style="width:90px">确定</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
			</div>
			<!-- JS -->
			<script type="text/javascript">
				
				//用户条件查询
				function searchUser() {
					
					var search=$("#search").val();
					BingData("#dg", args, 'searchUser?search='+search, null);
				}
				
				//仅查询欠费用户
				function OweUser() {
					if($("input[type='checkbox']").is(':checked')){
						BingData("#dg", args, 'numUser', null);					
					}else{
						BingData("#dg", args, 'dataUser', null);
					}	
				}
				//充值用户金额
				function recharge() {
					var row = $('#dg').datagrid('getSelected');
					if(row==null){
						$.messager.alert('注意!','请选择一个用户充值!','warning');
					}else{
												
						if(row) {
							$("#recordAmount").textbox("setValue", "");
							$('#dlg2').dialog('open').dialog('center').dialog('setTitle', '充值用户金额');
							$('#fm2').form('load', row);
							url = 'dataUser';
						}
					}
				}
				var url;
				//新建用户信息
				function newUser() {
					$('#dlg').dialog('open').dialog('center').dialog('setTitle', '新建用户信息');
					$('#fm').form('clear');
					url = 'addUser';
				}
				//修改用户信息
				function editUser() {
					var row = $('#dg').datagrid('getSelected');
					if(row==null){
						$.messager.alert('注意!','请选择一个用户修改!','warning');
					}else{
						if(row) {
							$('#dlg').dialog('open').dialog('center').dialog('setTitle', '修改用户信息');
							$('#fm').form('load', row);
							url = 'addUser?userId=' + row.userId;
						}
					}
				}
				//返回添加 
				function saveRecord() {
					$('#fm2').form('submit', {
						url: url,
						onSubmit: function() {
							return $(this).form('validate');
						},
						success: function(result) {
							if(result=="error") {
								$.messager.show({
									title: 'Error',
									msg: result.errorMsg
								});
							} else {
								$('#dlg2').dialog('close'); // close the dialog
								$('#dg').datagrid('reload'); // reload the user data
								BingData("#dg", args, 'dataUser', null);
							}
						}
					});
				}
				//返回添加 修改
				function saveUser() {
					$('#fm').form('submit', {
						url: url,
						onSubmit: function() {
							return $(this).form('validate');
						},
						success: function(result) {
							if(result=="error") {
								$.messager.show({
									title: 'Error',
									msg: result.errorMsg
								});
							} else {
								$('#dlg').dialog('close'); // close the dialog
								$('#dg').datagrid('reload'); // reload the user data
								$("#recordAmount").val("");
								BingData("#dg", args, 'dataUser', null);
							}
						}
					});
				}
				//删除用户
				function destroyUser() {
					var row = $('#dg').datagrid('getSelected');
					if(row==null){
						$.messager.alert('注意!','请选择一个用户删除!','warning');
					}else{
												$.ajax({
														url:"delByFind",
														data:{userId:row.userId},
														type:"post",
														success:function(result){
														if(result=="success") {
														
														if(row) {
															$.messager.confirm('删除用户', '你确定想要删除这个用户吗?', function(r) {
																if(r) {
																	$.ajax({
																		url:"delUser",
																		data:{userId:row.userId},
																		type:"post",
																		success:function(result){
																			if(result=="success") {
																			$('#dg').datagrid('reload'); // reload the user data
																			BingData("#dg", args, 'dataUser', null);
																		} else {
																			$.messager.show({ // show error message
																				title: 'Error',
																				msg: result.errorMsg
																			});
																		}
																		}
																	});
																	
																		
																}
															});
														}
														
														} else {
															$.messager.alert('注意!','请先删除该用户下的充值记录和消费明细!','warning');
														}
														}
													});
					
					}
				}
			</script>
			</div>
			
			<!-- 弹出层金额 -->
			<div id="dlg2" class="easyui-dialog" style="width:400px" closed="true" buttons="#dlg-buttons2">
				<form id="fm2" method="post" novalidate style="margin:0;padding:20px 50px" align="center">
					<div style="margin-bottom:20px;font-size:14px;border-bottom:0px solid #ccc;text-align: center;">充值信息</div>
					<div style="margin-bottom:10px">
						<input name="userId" class="easyui-textbox" required="true" label="电表编号:" style="width:100%;border:0px" readonly="readonly" align="center">
					</div>
					<div style="margin-bottom:10px">
						<input name="userName" class="easyui-textbox" required="true" label="用户姓名:" readonly="readonly" style="width:100%">
					</div>
					<div style="margin-bottom:10px">
						<input name="userAmount" class="easyui-textbox" required="true" label="当前账户余额:" readonly="readonly" style="width:100%">
					</div>
					<div style="margin-bottom:10px">
						<input name="recordAmount" id="recordAmount" class="easyui-textbox" allowBlank="false"
						 required="true" label="充值金额:" style="width:100%" data-options="required:true,missingMessage:'请输入充值金额'">
					</div>
				</form>
			</div>
			<div id="dlg-buttons2">
				<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveRecord()" style="width:90px">充值</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg2').dialog('close')" style="width:90px">取消</a>
			</div>
		</div>
	</div>
	</body>
</html>
