/*
 * 运维业务管理  js
 * 计量终端模型
 * 朱亚彬
 */
/*
 * 页面加载
 */
var qyid = "";
var mname = "";
var mcodes = "";
var euiIds = 1;
$(function() {

	// 加载easyUI表格
	table();
	GetData();
	GetDataRefresh(qyid);
	// 添加人员信息
	addPerson();
	// 删除人员信息
	delPerson();
	// 修改人员信息
	uppPerson();
	// //验证
	// check();
	// //查询
	// select();
	$('#search').linkbutton({
		iconCls : 'icon-search'
	});

});

/**
 * table dd 查询条件方法
 */
function GetData() {
	var args = {};
	test.pname = mname;
	test.pcodes = mcodes;
	args.pageIndex = 1;// 页索引
	args.pageSize = 5;// 页容量
	BingData("#dd", args, "meter/meter", null);
}
/**
 * 根据ID全查询所有
 * 
 * @param qyid
 */
function GetDataRefresh(qyid) {
	var test = {};
	test.qyid = qyid;
	test.pageIndex = 1;// 页索引
	test.pageSize = 10;// 页容量
	test.pname = mname;
	test.pcodes = mcodes;
	BingData("#tt", test, "meter/measurPoint", null);
}

/**
 * 将所有数据打印出 table表格中
 */
function table() {
	$('#tt')
			.datagrid(
					{
						title : '模型测点表',
						striped : true,
						fitColumns : true, // 自适应列的大小
						pagination : true,
						rownumbers : true,
						singleSelect : true,// 设置单选、多选。true单选，false 多选。
						editors : 'predefined editors',
						columns : [ [ {
							field : 'mmpCodes',
							title : '测点编码',
							width : 100
						}, {
							field : 'mmpNames',
							title : '测点名称',
							width : 100
						}, {
							field : 'modAddress',
							title : '测点地址',
							width : 100
						}, {
							field : 'mmpLength',
							title : '寄存器长度',
							width : 100
						}, {
							field : 'mmpUnits',
							title : '测点计量单位',
							width : 100
						}, {
							field : 'mmpFormular',
							title : '测点计量公式',
							width : 100
						}, {
							field : 'mmpIssave',
							title : '是否保存',
							width : 100,
							formatter : function(value, rowData, rowIndex) {
								if (value == "0") {
									return "否"
								} else {
									return "是"
								}
							}
						}, {
							field : 'mmpIsct',
							title : '是否计算CT',
							width : 100,
							formatter : function(value, rowData, rowIndex) {
								if (value == "0") {
									return "否"
								} else {
									return "是"
								}
							}
						}, {
							field : 'mmpIspt',
							title : '是否计算PT',
							width : 100,
							formatter : function(value, rowData, rowIndex) {
								if (value == "0") {
									return "否"
								} else {
									return "是"
								}
							}
						}, {
							field : 'plLocation',
							title : '地址',
							width : 100
						}

						] ],
						toolbar : [
								{
									text : '添加用户信息',
									iconCls : 'icon-add',
									handler : function() {
										addCustomer();
									}
								},
								'-',
								{
									text : '修改用户信息',
									iconCls : 'icon-edit',
									handler : function() {
										updateCustomer();
									}
								},
								'-',
								{
									text : '删除用户信息',
									iconCls : 'icon-remove',
									handler : function() {
										delCustomer();
									}
								},
								'-',
								{
									iconCls : 'icon-search',
									text : '<input  style="border: 0;margin: 0;padding: 4px;white-space: normal;" placeholder="请输入查询..."/>',
								} ],
						pagination : true

					});
	$('#tt').datagrid('getPager').pagination({// 分页栏下方文字显示
		displayMsg : '当前显示从第{from}条到{to}条 共{total}条记录',
		pageList : [ 5, 10, 15, 20, 30 ],
		onBeforeRefresh : function(pageNumber, pageSize) {
			$(this).pagination('loading');
			// alert('pageNumber:'+pageNumber+',pageSize:'+pageSize);
			$(this).pagination('loaded');
		}
	});
	// 点击查询按钮时，根据条件查询信息
	$("#search").click(function() {
		// 获取后台数据
		// $("#tt").datagrid("loadData",[]);
		GetData()
	});
	$("#ibtn").click(function() {
		// 获取后台数据
		// $("#tt").datagrid("loadData",[]);
		tan()
	});
	// 计量模型终端
	$('#dd')
			.datagrid(
					{
						title : '计量模型终端',
						striped : true,
						fitColumns : true, // 自适应列的大小
						pagination : true,
						rownumbers : true,
						singleSelect : true,// 设置单选、多选。true单选，false 多选。
						editors : 'predefined editors',
						columns : [ [ {
							field : 'ctmCodes',
							title : '模型终端编码',
							width : 100
						}, {
							field : 'ctmNames',
							title : '模型终端名称',
							width : 100
						}, {
							field : 'ctmEnergyType',
							title : '模型编码',
							width : 100
						}, {
							field : 'ctmBackups',
							title : '模型终端备注',
							width : 100
						}, ] ],
						toolbar : [
								{
									text : '添加模型终端信息',
									iconCls : 'icon-add',
									handler : function() {
										addCustomer();
									}
								},
								'-',
								{
									text : '修改模型终端信息',
									iconCls : 'icon-edit',
									handler : function() {
										updateCustomer();
									}
								},
								'-',
								{
									text : '删除模型终端信息',
									iconCls : 'icon-remove',
									handler : function() {
										delCustomer();
									}
								},
								'-',
								{
									iconCls : 'icon-search',
									text : '<input id="searchModel" style="border: 0;margin: 0;padding: 4px;white-space: normal;" placeholder="模糊条件查询..."/>',
									handler : function() {
										var ss=$("#searchModel").val();
										alert(ss);
									}
								} ],

						pagination : true

					});
	$('#dd').datagrid('getPager').pagination({// 分页栏下方文字显示
		displayMsg : '当前显示从第{from}条到{to}条 共{total}条记录',
		pageList : [ 5, 10, 15, 20, 30 ],
		onBeforeRefresh : function(pageNumber, pageSize) {
			$(this).pagination('loading');
			// alert('pageNumber:'+pageNumber+',pageSize:'+pageSize);
			$(this).pagination('loaded');
		}
	});
	// 点击查询按钮时，根据条件查询信息
	$("#search").click(function() {
		// 获取后台数据
		// $("#tt").datagrid("loadData",[]);
		GetData()
	});
	$("#ibtn").click(function() {
		// 获取后台数据
		// $("#tt").datagrid("loadData",[]);
		tan()
	});
}
/**
 * 删除 人员信息
 */
function delPerson() {
	$('#del').click(
			function() {// 删除方法
				var row = $('#tt').datagrid('getSelected');
				if (row == null) {
					$.messager.alert('警告', '请选择人员!');
					return;
				}
				$.messager.confirm('提示', '确定要删除选中的数据吗?', function(r) {
					if (r) {
						test = row.euiId;
						var args = {};
						args.pid = row.id;
						args.piCodes = row.piCodes;
						$.ajax({
							url : "person/delPerson",
							type : "POST",
							dataType : "json",
							async : true,
							data : args,
							success : function(data) {
								if (data) {
									// callback(data);
									// GetData();
									GetDataRefresh(euiIds);
									$.messager.alert('提示', '删除成功,人员关联用户也已删除!',
											"info", function() {
											});
								} else {
									$.messager.alert('提示', "删除失败,该人员已关联用户!");
									return;
								}
							}
						});
					}
				});
			});
}

/**
 * 添加 人员信息
 */
function addPerson() {
	// 新增人员信息
	$('#addButton')
			.click(
					function() {
						piCodesTemp = null;
						var test = "";
						$('#divThemes input[type="text"]').val('');
						$('#divThemes select').text('');

						$('#divThemes').show();
						// 加载企业
						$
								.ajax({
									url : "treeInfo",
									type : "post",
									dataType : "json",
									success : function(data) { // 放入下拉框
										console.info(data);
										var rdo = "<option value='-1'>--选择企业--</option>";
										// for (var i = 0; i < data.length; i++)
										// {

										$("#euiId").combobox({
											data : data,
											valueField : 'id',
											textField : 'text'
										});
										$('#euiId').combobox('select',
												data[0].id);
										// }

									}
								});
						$('#divThemes')
								.dialog(
										{
											title : '添加人员',
											modal : true,
											width : 400,
											draggable : true,
											buttons : [
													{
														text : '提交',
														iconCls : 'icon-ok',
														handler : function() {
															test = $("#euiId")
																	.combobox(
																			'getValues')[0];
															$('#ff')
																	.form(
																			'submit',
																			{
																				url : "person/savePerson",
																				dataType : "json",
																				async : false,
																				onSubmit : function() {
																					// 进行表单验证
																					return check();

																				},
																				success : function(
																						data) {
																					if (data == 'success') {
																						$.messager
																								.alert(
																										"提示",
																										"添加成功!",
																										"info",
																										function() {
																											GetDataRefresh(test);
																											$(
																													'#divThemes')
																													.dialog(
																															'close');
																											$(
																													'#ff')
																													.form(
																															'clear');
																										});

																					} else if (data == 'error') {
																						$.messager
																								.alert(
																										"提示",
																										"添加失败!",
																										"info",
																										function() {
																											$(
																													'#divThemes')
																													.dialog(
																															'close');
																											$(
																													'#ff')
																													.form(
																															'clear');
																										});
																					}
																				}
																			});
															// $('#ff').submit();
															// $('#divThemes').dialog('close');
														}
													},
													{
														text : '取消',
														handler : function() {
															$('#divThemes')
																	.dialog(
																			'close');
															$('#ff').form(
																	'clear');
														}
													} ]
										});
					});

}

/**
 * 修改 人员信息
 */
function uppPerson() {
	// 更新人员信息
	$('#editButton')
			.click(
					function() {
						var row = $('#tt').datagrid('getSelected');

						if (row != null) {
							// alert(row.piCodes);
							piCodesTemp = row.piCodes;
							$('#pid').textbox('setValue', row.id);

							$('#piCodes').textbox('setValue', row.piCodes);

							$('#piName').textbox('setValue', row.piName);
							$('#piAge').textbox('setValue', row.piAge);
							$('#piEmail').textbox('setValue', row.piEmail);
							$('#piMobile').textbox('setValue', row.piMobile);
							$('#plLocation')
									.textbox('setValue', row.plLocation);

							if (row.piSex == "0") {
								$("input[type=radio][value=0]").attr("checked",
										'checked');
							} else {
								$("input[type=radio][value=1]").attr("checked",
										'checked');
							}
							var result = "";
							var reultId = "";
							$
									.ajax({
										url : "treeInfo",
										type : "post",
										dataType : "json",
										success : function(data) { // 放入下拉框
											console.info(data);
											var rdo = "<option value='-1'>--选择企业--</option>";
											// for (var i = 0; i < data.length;
											// i++) {

											$("#euiId").combobox({
												data : data,
												valueField : 'id',
												textField : 'text'
											});
											$('#euiId').combobox('select',
													row.euiId);
											// }

										}
									});
							// $('#euiId').combobox('select',result);
							$("#unitid option[value='" + result + "']").attr(
									"selected", "selected"); // 设置Select的Text值为jQuery的项选中

							$('#divThemes').show();
							$('#divThemes')
									.dialog(
											{
												title : '修改人员信息',
												modal : true,
												width : 400,
												draggable : true,
												buttons : [
														{
															text : '提交',
															iconCls : 'icon-ok',
															handler : function() {
																test = $(
																		"#euiId")
																		.combobox(
																				'getValues')[0];
																$('#ff')
																		.form(
																				'submit',
																				{
																					url : "person/savePerson",
																					dataType : "json",
																					async : false,
																					onSubmit : function() {
																						// 进行表单验证
																						return check();
																					},
																					success : function(
																							data) {

																						if (data == 'success') {
																							$.messager
																									.alert(
																											"提示",
																											"更新成功!",
																											"info",
																											null);
																							GetDataRefresh(euiIds);
																							$(
																									'#tt')
																									.datagrid(
																											'selectRow',
																											reultId);//
																							$(
																									'#divThemes')
																									.dialog(
																											'close');
																							$(
																									'#ff')
																									.form(
																											'clear');

																						} else if (data == 'error') {
																							$.messager
																									.alert(
																											"提示",
																											"更新失败!",
																											"info",
																											null);
																							$(
																									'#divThemes')
																									.dialog(
																											'close');
																							$(
																									'#ff')
																									.form(
																											'clear');
																						}
																					}
																				});
															}
														},
														{
															text : '取消',
															handler : function() {
																$('#divThemes')
																		.dialog(
																				'close');
																$('#ff')
																		.form(
																				'clear');
															}
														} ]
											});
						} else {
							$.messager.alert("提示", "请选择一个人员!", "info", null);
						}

					});
}
/**
 * check 验证条件
 */
function check() {

	if ($('#piCodes').val() == "") {
		$.messager.alert("提示", "请填写编码!", "warning", null);
		return false;
	}

	if ($('#piName').val() == "") {
		$.messager.alert("提示", "请填写姓名!", "warning", null);
		return false;
	}

	if ($('#unitid').val() == '-1') {
		$.messager.alert("提示", "请选择用能单位!", "warning", null);
		return false;
	}

	if ($('#piEmail').val() == "") {
		$.messager.alert("提示", "请填写邮箱!", "warning", null);
		return false;
	} else {
		var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
		if (!reg.test($('#piEmail').val())) {
			$.messager.alert("提示", "Email格式错误!", "warning", null);
			return false;
		}
	}

	return true;
}
/**
 * 查询
 */
// function select(){
// // var pname="";
// // var pcodes="";
// $("input",$("#pName").next("span")).blur(function(){
// alert($(this).val());
// pname=$(this).val();
// })
// $("input",$("#pCodes").next("span")).blur(function(){
// alert($(this).val());
// pcodes=$(this).val();
// })
//	
// if(pname!=""&&pcodes!=""){
//		
// GetDataRefresh(1);
// }else{
// pname="";
// pcodes="";
// alert("select");
// GetDataRefresh(1);
// }
//	
// }
function onSelectName() {
	var search = $(this).val();
	pname = search;
	GetDataRefresh(euiIds);
}
function onSelectCodes() {
	var search = $(this).val();
	pcodes = search;
	GetDataRefresh(euiIds);
}
function onSearch() {
	GetDataRefresh(euiIds);
}
