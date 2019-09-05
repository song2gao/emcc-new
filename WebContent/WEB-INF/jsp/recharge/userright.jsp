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
<title>用户权限管理-中惠元景能耗监测平台</title>
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
	href="http://www.jeasyui.com/easyui/themes/default/easyui.css"></link>
<script type="text/javascript" src="/emcc-new/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="/emcc-new/js/page.js"></script>
<script type="text/javascript"
	src="http://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>

<STYLE type="text/css">
.box-shadow-2 {
	-webkit-box-shadow: 0 0 10px #1d1f24;
	-moz-box-shadow: 0 0 20px #1d1f24;
	box-shadow: 0 0 20px #1d1f24;
}
</style>
</head>

<body>
	<!--  用户权限管理 -->
	<div class="wrap-fluid">
		<!-- 内容板块 -->
		<div class="col-sm-10 box-shadow-2"
			style="float: left; width: 98.5%; border: 0px solid red; margin: 0.5%; height: 48%;">
			<table id="dg" align="center" title="用户权限信息" striped="true"
				rownumbers="true" class="easyui-datagrid"
				style="width: 100%; height: 100%;" toolbar="#toolbar"
				pagination="true" rownumbers="true" fitColumns="true"
				singleSelect="true">
				<thead>
					<tr>
						<th field="rightsId" width="10%" align="center">权限编号：</th>
						<th field="rightsName" width="10%" align="center">权限名称：</th>
						<th field="rightsStyle" width="20%" align="center">权限规则：</th>
						<th field="userNote" width="20%" align="center">权限备注：</th>
					</tr>
				</thead>
			</table>
			<div id="toolbar">
				<a href="javascript:void(0)" class="easyui-linkbutton" width="200px"
					iconCls="icon-add" style="padding-left: 3%;" plain="true"
					onclick="newUser()">添加权限信息</a> <a href="javascript:void(0)"
					class="easyui-linkbutton" width="10%" iconCls="icon-edit"
					style="padding-left: 1.5%;" plain="true" onclick="editUser()">修改权限信息</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" width="10%"
					iconCls="icon-remove" style="padding-left: 2.5%;" plain="true"
					onclick="destroyUser()">删除权限信息</a>
			</div>

			<div id="dlg" class="easyui-dialog" style="width: 400px"
				closed="true" buttons="#dlg-buttons">
				<form id="fm" method="post" novalidate
					style="margin: 0; padding: 20px 50px">
					<div
						style="margin-bottom: 20px; font-size: 14px; border-bottom: 0px solid #ccc; text-align: center;">权限信息</div>

					<div style="margin-bottom: 10px">
						<input name="rightsName" class="easyui-textbox" required="true"
							label="权限名称:" style="width: 100%">
					</div>
					<div style="margin-bottom: 10px">
						<input name="rightsStyle" class="easyui-textbox" required="true"
							label="权限规则:" style="width: 100%">
					</div>
				</form>
			</div>
			<div id="dlg-buttons">
				<a href="javascript:void(0)" class="easyui-linkbutton c6"
					iconCls="icon-ok" onclick="saveUser()" style="width: 90px">确定</a> <a
					href="javascript:void(0)" class="easyui-linkbutton"
					iconCls="icon-cancel"
					onclick="javascript:$('#dlg').dialog('close')" style="width: 90px">取消</a>
			</div>
			<!-- 用户权限 JS -->
			<script type="text/javascript">
				var pubId = "";
				var args = {};
				args.pageSize = 5;
				args.pageIndex = 1;
				args.pageList = [ 5, 10, 15, 20, 25 ];
				$(function() {
					BingData(
							"#dg",
							args,
							'${pageContext.request.contextPath}/userRight/dataUserRights',
							null);
					BingData(
							"#dd",
							args,
							' ${pageContext.request.contextPath}/rechargeUser/dataUser',
							null);
					newUsers();
				});

				//点击权限 关联用户信息
				function newUsers() {
					$("#dg").datagrid(
							{
								onLoadSuccess : function(data) {
									alert("data");
									$('#dg').datagrid('selectRow', 2);
								},
								onClickRow : function() { //单击进行操作的方法
									var row = $('#dg').datagrid('getSelected');//获取选中行的数据
									pubId = row.rightsId;
									BingData("#dd", args,
											'${pageContext.request.contextPath}/userRight/toDataRightsAndUser?rightsId='
													+ row.rightsId, null);
								}
							});
				}

				//当前权限用户查询 searchUser?search='+search
				function serchUser() {

					var serch = $("#serch").val();
					if (pubId == "") {
						BingData("#dd", args,
								'${pageContext.request.contextPath}/rechargeUser/searchUser?search='
										+ serch, null);
					} else {
						BingData("#dd", args,
								'toMonitorRecharge.action?m=toSearchSRights&serch='
										+ serch + '&rightsId=' + pubId, null);
					}

				}
				var url;

				//新建用户权限
				function newUser() {
					$('#dlg').dialog('open').dialog('center').dialog(
							'setTitle', '新建用户权限信息');
					$('#fm').form('clear');
					url = '${pageContext.request.contextPath}/userRight/toDataAddRights';
				}

				function editUser() {
					var row = $('#dg').datagrid('getSelected');
					if (row == null) {
						$.messager.alert('注意!', '请选择一个权限修改!', 'warning');
					} else {
						if (row) {
							$('#dlg').dialog('open').dialog('center').dialog(
									'setTitle', '修改用户权限信息');
							$('#fm').form('load', row);
							url = '${pageContext.request.contextPath}/userRight/toDataAddRights?rightsId='
									+ row.rightsId;
						}
					}
				}

				function saveUser() {
					$('#fm')
							.form(
									'submit',
									{
										url : url,
										onSubmit : function() {
											return $(this).form('validate');
										},
										success : function(result) {
											if (result == "error") {
												$.messager.show({
													title : 'Error',
													msg : result.errorMsg
												});
											} else {
												$('#dlg').dialog('close'); // close the dialog
												$('#dg').datagrid('reload'); // reload the user data
												BingData(
														"#dg",
														args,
														'${pageContext.request.contextPath}/userRight/dataUserRights',
														null);
											}
										}
									});
				}
				//删除用户权限 
				function destroyUser() {
					var row = $('#dg').datagrid('getSelected');
					if (row == null) {
						$.messager.alert('注意!', '请选择一个用户删除!', 'warning');
					} else {
						if (row) {
							$
									.ajax({
										url : "${pageContext.request.contextPath}/userRight/toDataRightsAndUser",
										data : {
											rightsId : row.rightsId
										},
										type : "post",
										success : function(result) {
											console.info(result);
											alert(result.size);
											if (result.size == 0) {
												$.messager
														.confirm(
																'删除权限!',
																'你确定要删除这个权限吗?',
																function(r) {
																	if (r) {
																		$
																				.ajax({
																					url : "${pageContext.request.contextPath}/userRight/toDelRightsById",
																					data : {
																						rightsId : row.rightsId
																					},
																					type : "post",
																					success : function(
																							result) {
																						if (result == "success") {
																							$(
																									'#dg')
																									.datagrid(
																											'reload'); // reload the user data
																							BingData(
																									"#dg",
																									args,
																									'toMonitorRecharge.action?m=toDataRights',
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
											} else {
												$.messager.alert('注意!',
														'请先删除该权限下的所有用户信息!',
														'warning');
											}
										}
									});

						}
					}
				}
			</script>
		</div>
		<!-- 菜单栏 -->
		<div id="toolbar2">
			<a href="javascript:void(0)" class="easyui-linkbutton" width="200px"
				iconCls="icon-add" style="padding-left: 2%;" plain="true"
				onclick="newUser2()">添加当前权限用户</a> <a href="javascript:void(0)"
				class="easyui-linkbutton" width="10%" iconCls="icon-edit"
				plain="true" onclick="editUser2()">修改当前权限用户</a> <a
				href="javascript:void(0)" class="easyui-linkbutton" width="10%"
				iconCls="icon-remove" plain="true" onclick="destroyUser2()">删除当前权限用户</a>
			<input name="search" id="serch" type="text" class="easyui-textbox"
				data-options="prompt:'请输入用户姓名或手机号...'" value=""
				style="padding-left: 10px; width: 200px; height: 25px; font-size: 12px; margin-top: 2px;" />

			<a href="javascript:void(0)" class="easyui-linkbutton" width="10%"
				iconCls="icon-search" onclick="serchUser()" plain="true">查询权限用户</a>
		</div>
		<!-- 表格 -->
		<div class="col-sm-10 box-shadow-2"
			style="float: left; width: 98.5%; border: 0px solid red; margin-left: 0.5%; height: 48%;">
			<table id="dd" align="center" class="easyui-datagrid" title="当前权限用户"
				striped="true" rownumbers="true" style="width: 100%; height: 100%;"
				toolbar="#toolbar2" pagination="true" rownumbers="true"
				fitColumns="true" singleSelect="true">
				<thead>
					<tr>
						<th field="userId" width="10%" align="center">电表编号：</th>
						<th field="userName" width="10%" align="center">用户姓名：</th>
						<th field="rightsId" width="10%" align="center">用户权限：</th>
						<th field="userAmount" width="10%" align="center">账户余额：</th>
						<th field="userTel" width="20%" align="center">联系方式：</th>
						<th field="userAddress" width="20%" align="center">联系地址：</th>
						<th field="userNote" width="20%" align="center">备注：</th>
					</tr>
				</thead>
			</table>
		</div>
		<div id="dlg2" class="easyui-dialog" style="width: 400px"
			closed="true" buttons="#dlg-buttons2">
			<form id="fm2" method="post" novalidate
				style="margin: 0; padding: 20px 50px">
				<div
					style="margin-bottom: 20px; font-size: 14px; border-bottom: 0px solid #ccc; text-align: center;">用户信息</div>

				<div style="margin-bottom: 10px">
					<input name="userName" class="easyui-textbox" required="true"
						label="用户姓名:" style="width: 100%">
				</div>
				<div style="margin-bottom: 10px">
					<input name="userAmount" class="easyui-textbox" required="true"
						label="账户余额:" style="width: 100%">
				</div>
				<div style="margin-bottom: 10px">
					<input name="rightsId" class="easyui-textbox" required="true"
						label="设置用户权限级别:" style="width: 100%">
				</div>
				<div style="margin-bottom: 10px">
					<input name="userTel" class="easyui-textbox" required="true"
						validType="tel" label="电话:" style="width: 100%">
				</div>
				<div style="margin-bottom: 10px">
					<input name="userAddress" class="easyui-textbox" required="true"
						validType="address" label="地址:" style="width: 100%">
				</div>
				<div style="margin-bottom: 10px">
					<input name="userNote" class="easyui-textbox" required="true"
						validType="note" label="备注:" style="width: 100%">
				</div>
			</form>
		</div>
		<div id="dlg-buttons2">
			<a href="javascript:void(0)" class="easyui-linkbutton c6"
				iconCls="icon-ok" onclick="saveUser2()" style="width: 90px">确定</a> <a
				href="javascript:void(0)" class="easyui-linkbutton"
				iconCls="icon-cancel"
				onclick="javascript:$('#dlg2').dialog('close')" style="width: 90px">取消</a>
		</div>
		<!-- 用户信息JS -->
		<script type="text/javascript">
			var urls;
			//新建用户信息
			function newUser2() {
				$('#dlg2').dialog('open').dialog('center').dialog('setTitle',
						'新建用户信息');
				$('#fm2').form('clear');
				urls = '${pageContext.request.contextPath}/rechargeUser/addUser';
			}
			//修改用户信息
			function editUser2() {
				var row = $('#dd').datagrid('getSelected');
				if (row == null) {
					$.messager.alert('注意!', '请选择一个权限用户修改!', 'warning');
				} else {
					if (row) {
						$('#dlg2').dialog('open').dialog('center').dialog(
								'setTitle', '修改用户信息');
						$('#fm2').form('load', row);
						urls = '${pageContext.request.contextPath}/rechargeUser/addUser?userId='
								+ row.userId;
					}
				}
			}
			//返回添加 修改
			function saveUser2() {
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
										} else {
											$('#dlg2').dialog('close'); // close the dialog
											$('#dd').datagrid('reload'); // reload the user data
											if (pubId == "") {
												BingData(
														"#dd",
														args,
														' ${pageContext.request.contextPath}/rechargeUser/dataUser',
														null);
											} else {
												BingData("#dd", args,
														'toMonitorRecharge.action?m=toDataRightsAndUser&rightsId='
																+ pubId, null);
											}
										}
									}
								});
			}
			//删除用户
			function destroyUser2() {
				var row = $('#dd').datagrid('getSelected');
				if (row == null) {
					$.messager.alert('注意!', '请选择一个权限用户删除!', 'warning');
				} else {
					if (row) {
						$.messager
								.confirm(
										'删除用户',
										'你确定想要删除这个用户吗?',
										function(r) {
											if (r) {
												$
														.ajax({
															url : "toMonitorRecharge.action?m=toDelUserById",
															data : {
																userId : row.userId
															},
															type : "post",
															success : function(
																	result) {
																console
																		.info(result);
																if (result == "success") {
																	$('#dd')
																			.datagrid(
																					'reload'); // reload the user data
																	BingData(
																			"#dd",
																			args,
																			'toMonitorRecharge.action?m=toDataAllUser',
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
			}
		</script>

	</div>
</body>
</html>
