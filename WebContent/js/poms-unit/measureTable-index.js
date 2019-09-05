/*
 * 测量仪表 js
 */
var unitID = "";
$(function() {
	EEDataInit();
	DDDataInit();
	CCDataInit();
	GetData();
	// 自动加载一条数据
	// GetDataee(4, 3);
	// 添加采集器事件
	addCollector();
	delCollector();
	uppCollector();

	addMeter();
	uppMeter();
	delMeter();

});
/*
 * 加载 CC DaraGrid
 */
function CCDataInit() {
	$('#cc').datagrid({
		title : '用能单位',
		striped : true,
		fitColumns : true, // 自适应列的大小
		pagination : true,
		rownumbers : false,
		border : true,
		singleSelect : true,// 设置单选、多选。true单选，false 多选。
		columns : [ [ {
			field : 'euiCode',
			title : '企业编码',
			width : 100
		}, {
			field : 'euiNames',
			title : '企业名称',
			width : 100
		}, {
			field : 'euiBelongDistrct',
			title : '所属区县',
			width : 100
		}, {
			field : 'euiBelongIndustry',
			title : '所属行业',
			width : 100
		}, {
			field : 'euiConsumeBand',
			title : '能耗等级',
			width : 100
		}, {
			field : 'euiChargeDepartment',
			title : '节能主管部门',
			width : 100
		}, {
			field : 'euiContentWay',
			title : '联系方式',
			width : 100
		}, {
			field : 'euiLocation',
			title : '地理位置',
			width : 100
		}, {
			field : 'euiBuildingArea',
			title : '建筑面积',
			width : 100
		}

		] ],
		onLoadSuccess : function(data) {
			$('#cc').datagrid('checkRow', 2);
		},
		onSelect : function(rowIndex, rowData) {
			// 点击获取企业ID加载采集器终端信息
			unitID = rowData.id;
			GetDatadd(rowData.id);
		}
	});

	$('#search').click(
			function() {
				var qy = $('#qy').val();
				// alert(qy);
				var args = {};
				args.pageIndex = 1;// 页索引
				args.pageSize = 10;// 页容量
				args.qy = qy;
				BingData("#cc", args,
						"calculateTerminalDevice.action?m=getEneUnit", null);

			});
}

/*
 * 加载 DD DaraGrid
 */
function DDDataInit() {
	$('#dd').datagrid({
		title : '采集终端信息',
		striped : true,
		fitColumns : true, // 自适应列的大小
		pagination : true,
		rownumbers : false,
		singleSelect : true,// 设置单选、多选。true单选，false 多选。
		columns : [ [ {
			field : 'asstdNames',
			title : '采集终端名称',
			width : 100
		}, {
			field : 'asstdAssembleIp',
			title : '采集通讯地址',
			width : 100
		}, {
			field : 'asstdProduction',
			title : '生产厂家',
			width : 100
		}, {
			field : 'asstdBackups',
			title : '备注',
			width : 100
		}

		] ],

		toolbar : [

		{
			text : '添加',
			iconCls : 'icon-add',
			handler : function() {
				$('#addAss').click();

			}
		}, '-', {
			text : '修改',
			iconCls : 'icon-save',
			handler : function() {

				$('#updAss').click();

			}
		}, '-', {
			text : '删除',
			iconCls : 'icon-remove',
			handler : function() {

				$('#delAss').click();

			}
		} ],
		onLoadSuccess : function(data) {
			var tal = data.total;
			if (tal > 0) {
				$('#dd').datagrid('selectRow', 3);
			} else {
				$("#ee").datagrid('loadData', new Array());
			}
		},
		onSelect : function(rowIndex, rowData) {
			GetDataee(unitID, rowData.id);
		}
	});
}

/*
 * 加载 EE DaraGrid
 */
function EEDataInit() {
	var ss = "";
	$('#ee').datagrid({
		title : '计量终端信息',
		striped : true,
		fitColumns : true, // 自适应列的大小
		pagination : true,
		rownumbers : false,
		singleSelect : false,// 设置单选、多选。true单选，false 多选。
		columns : [ [ {
			title : '全选',
			field : 'mck',
			checkbox : true,
			width : 100
		}, {
			field : 'cdtTerminalName',
			title : '计量终端回路名称',
			width : 100
		}, {
			field : 'ctmId',
			title : '计量模型',
			width : 100,
			formatter : function(value, rowData, rowIndex) {

				$.ajax({
					url : "enegryUnit/findUnitByID",
					type : "POST",
					data : {
						"eid" : value
					},
					dataType : "json",
					async : false,
					timeout : 1000,
					success : function(data) { // 放入下拉框
						ss = data.unitinfo.ctmNames;
						return ss;
					}
				});
				return ss;

			}
		}, {
			field : 'ctdCodes',
			title : '计量终端编号',
			width : 100
		}, {
			field : 'ctdAddr',
			title : '计量终端地址',
			width : 100
		}, {
			field : 'cdtTerminalStatus',
			title : '计量终端状态',
			width : 100,
			formatter : function(value, rowData, rowIndex) {
				if (value == 0) {
					return "新增";
				} else if (value == "1") {
					return "不是";
				} else if (value == "2") {
					return "测通";
				} else if (value == "3") {
					return "正常";
				} else if (value == "4") {
					return "停用";
				}
			}
		}, {
			field : 'cdtIsinvented',
			title : '虚/实终端',
			width : 100,
			formatter : function(value, rowData, rowIndex) {
				if (value == 0) {
					return "实";
				} else if (value == 1) {
					return "虚";
				}
			}
		}

		] ],
		toolbar : [

		{
			text : '添加',
			iconCls : 'icon-add',
			handler : function() {
				$('#addCal').click();

			}
		}, '-', {
			text : '修改',
			iconCls : 'icon-save',
			handler : function() {

				$('#updCal').click();

			}
		}, '-', {
			text : '删除',
			iconCls : 'icon-remove',
			handler : function() {

				$('#delCal').click();

			}
		} ],
	});
}

/*
 * 加载企业 用能单位信息
 */
function GetData() {
	var args = {};
	args.pageIndex = 1;// 页索引
	args.pageSize = 5;// 页容量
	var pagelists = [ 5, 10, 15, 20 ];
	args.pageList = pagelists;
	BingData("#cc", args, "inventory/getEneUnits", null);
}

/*
 * 联动加载 采集器终端信息
 */
function GetDatadd(argid) {

	var args = {};
	args.pageIndex = 1;// 页索引
	args.pageSize = 5;// 页容量
	var pagelists = [ 5, 10, 15, 20 ];
	args.pageList = pagelists;
	args.enegryUnitId = argid;
	BingData("#dd", args, "inventory/getAss", null);
}

/*
 * 加载 采集器终端信息
 */
function GetDataee(unitid, calculteid) {
	var args = {};
	args.pageIndex = 1;// 页索引
	args.pageSize = 5;// 页容量
	var pagelists = [ 5, 10, 15, 20 ];
	args.pageList = pagelists;
	args.unitid = 4; // 用能单位id
	args.calculteid = calculteid; // 采集终端id
	BingData("#ee", args, "inventory/getDeviceConfigs", null);
}

/*
 * 添加采集终端信息
 */
function addCollector() {
	$('#addAss')
			.click(
					function() {
						var row = $('#cc').datagrid('getSelected');
						if (row == null) {
							alert('请选择一个企业!');
							return false;
						}
						$('#unitid').val(row.euiNames);
						$('#unit').val(row.id);
						$('#divAdd').show();
						$
								.ajax({
									url : "inventory/getFrontConfig",
									type : "POST",
									dataType : "json",
									timeout : 1000,
									success : function(data) { // 放入下拉框
										var list = data.list;
										var rdo = "<option value='-1'>--选择前置机--</option>";
										// var rdo="<option ></option>";
										for (var i = 0; i < list.length; i++) {

											rdo += "<option value='"
													+ list[i].id + "'>"
													+ list[i].frontProcessorIp
													+ "</option>";
										}
										$("#qzjid").html("");
										$("#qzjid").html(rdo);
									}
								});
						$('#asstdCode').val("");
						$('#asstdNames').val("");

						$('#asstdProduction').val("");
						$('#crcAssembleIp').val("");
						$('#crcCommunicateType').val("");
						$('#crcCommunicateSerial').val("");
						$('#asstdBackups').val("");

						var args = {};
						args.eid = row.id;
						$('#divAdd')
								.dialog(
										{
											title : '添加采集器',
											modal : true,
											width : 400,
											draggable : true,
											buttons : [
													{
														text : '提交',
														iconCls : 'icon-ok',
														handler : function() {
															$('#addForm')
																	.form(
																			'submit',
																			{
																				url : "inventory/saveAssembled",
																				dataType : "json",
																				type : "post",
																				onSubmit : function() {
																					// 进行表单验证
																					if ($(
																							'#crcCommunicateSerial')
																							.val() == "") {
																						$.messager
																								.alert(
																										"提示",
																										"采集终端编号不能为空!",
																										"warning",
																										null);
																						return false;
																					}
																					if ($(
																							'#asstdNames')
																							.val() == "") {
																						$.messager
																								.alert(
																										"提示",
																										"采集终端名称不能为空!",
																										"warning",
																										null);
																						return false;
																					}
																					if ($(
																							'#asstdProduction')
																							.val() == "") {
																						$.messager
																								.alert(
																										"提示",
																										"生产厂家不能为空!",
																										"warning",
																										null);
																						return false;
																					}

																					if ($(
																							'#qzjid')
																							.val() == "") {
																						$.messager
																								.alert(
																										"提示",
																										"前置机不能为空!",
																										"warning",
																										null);

																						return false;
																					}

																					if ($(
																							'#asstdCode')
																							.val() == "") {
																						$.messager
																								.alert(
																										"提示",
																										"采集通讯地址不能为空!",
																										"warning",
																										null);
																						return false;
																					}
																					if ($(
																							'#asstdCode')
																							.val() != "") {
																						var strP = /^\d+$/;
																						var v = $(
																								'#asstdCode')
																								.val();

																					}

																				},
																				success : function(
																						data) {
																					if (data == 1) {

																						$.messager
																								.alert(
																										"提示",
																										"添加成功!",
																										"info",
																										function() {
																											$(
																													'#divAdd')
																													.dialog(
																															'close');
																											GetDatadd(row.id);
																										});

																					} else {

																						$.messager
																								.alert(
																										"提示",
																										"添加失败!",
																										"info",
																										function() {
																											$(
																													'#divAdd')
																													.dialog(
																															'close');
																										});
																					}
																				}
																			});
															// $('#addForm').submit();
															// qzjid
															// $('#divAdd').dialog('close');
														}
													},
													{
														text : '取消',
														handler : function() {
															$('#divAdd')
																	.dialog(
																			'close');
															$('#addForm').form(
																	'clear');
														}
													} ]
										});
					});
}

/*
 * 删除采集终端信息
 */
function delCollector() {
	// 采集器删除
	$('#delAss').click(
			function() {// 删除方法
				var rowUnit = $('#cc').datagrid('getSelected');
				var row = $('#dd').datagrid('getSelected');
				if (row) {
					$.messager.confirm('提示', '确定要删除选中的数据吗?', function(r) {
						if (r) {
							var args = {};
							args.pid = row.id;
							args.eid = rowUnit.id;
							$.ajax({
								url : "inventory/delAssembled",
								type : "POST",
								dataType : "json",
								async : true,
								data : args,
								success : function(data) {
									if (data) {
										$.messager.alert("提示", "删除成功!", "info",
												function() {
													GetDatadd(rowUnit.id);
												});

									} else {
										$.messager.alert("提示",
												"删除失败,采集器已关联计量终端设备!", "info",
												null);
										return;
									}
								}
							});
						}
					});//
				}
			});
}

/*
 * 修改采集终端信息
 */
function uppCollector() {
	// 采集器修改
	$('#updAss').click(
					function() {
						var rowcc = $('#cc').datagrid('getSelected');
						var rowdd = $('#dd').datagrid('getSelected');
						if (rowdd == null) {
							alert('请选择一个采集器!');
							return false;
						}
						$('#unitid').val(rowcc.euiNames);
						$('#asstdCode').val(rowdd.asstdAssembleIp);
						$('#asstdNames').val(rowdd.asstdNames);
						$('#crcCommunicateType').val(rowdd.crcCommunicateType);
						$('#asstdProduction').val(rowdd.asstdProduction);
						$('#asstdBackups').val(rowdd.asstdBackups);
						$('#crcCommunicateSerial').val(rowdd.crcCommunicateSerial);

						var args = {};
						args.pid = rowdd.id;
						args.eid = rowcc.id;
						$('#divAdd').show();
						$('#divAdd')
								.dialog(
										{
											title : '修改采集器',
											modal : true,
											width : 400,
											draggable : true,
											buttons : [
													{
														text : '提交',
														iconCls : 'icon-ok',
														handler : function() {
															$('#addForm')
																	.form(
																			'submit',
																			{
																				url : "saveOrUpdateAssembled",
																				dataType : "json",
																				data : args,
																				async : false,
																				onSubmit : function() {
																					// 进行表单验证
																					if ($(
																							'#crcCommunicateSerial')
																							.val() == "") {
																						$.messager
																								.alert(
																										"提示",
																										"采集终端编号不能为空!",
																										"warning",
																										null);
																						return false;
																					}
																					if ($(
																							'#asstdNames')
																							.val() == "") {
																						$.messager
																								.alert(
																										"提示",
																										"采集终端名称不能为空!",
																										"warning",
																										null);
																						return false;
																					}
																					if ($(
																							'#asstdProduction')
																							.val() == "") {
																						$.messager
																								.alert(
																										"提示",
																										"生产厂家不能为空!",
																										"warning",
																										null);
																						return false;
																					}

																					if ($(
																							'#qzjid')
																							.val() == "") {
																						$.messager
																								.alert(
																										"提示",
																										"前置机不能为空!",
																										"warning",
																										null);

																						return false;
																					}

																					if ($(
																							'#asstdCode')
																							.val() == "") {
																						$.messager
																								.alert(
																										"提示",
																										"采集通讯地址不能为空!",
																										"warning",
																										null);
																						return false;
																					}
																					if ($(
																							'#asstdCode')
																							.val() != "") {
																						var strP = /^\d+$/;
																						/*
																						 * var
																						 * v=$('#asstdCode').val();
																						 * var
																						 * ss
																						 * =strP.test(v);
																						 * if(ss==false){
																						 * $.messager.alert('提示','采集通讯地址请输入数字!',"warning",null);
																						 * return
																						 * false; }
																						 */
																					}

																				},
																				success : function(
																						data) {
																					if (data) {

																						$.messager
																								.alert(
																										"提示",
																										"修改成功!",
																										"info",
																										function() {
																											$(
																													'#divAdd')
																													.dialog(
																															'close');
																											GetDatadd(rowcc.id);
																										});

																					} else {

																						$.messager
																								.alert(
																										"提示",
																										"修改失败!",
																										"info",
																										function() {
																											$(
																													'#divAdd')
																													.dialog(
																															'close');
																										});
																					}
																				}
																			});
														}
													},
													{
														text : '取消',
														handler : function() {
															$('#divAdd')
																	.dialog(
																			'close');
															$('#addForm').form(
																	'clear');
														}
													} ]
										});
					});
}

/*
 * 添加计量表信息
 */
function addMeter() {

	// 计量配置页
	$('#addCal')
			.click(
					function() {
						var rowdd = $('#dd').datagrid('getSelected');
						$.ajax({
							url : "enegryUnit/findUnitModelAll",
							type : "POST",
							dataType : "json",
							async : false,
							timeout : 1000,
							success : function(data) { // 放入下拉框
								$("#ctmId").combobox({
									data : data.model,
									valueField : 'id',
									textField : 'ctmNames'
								});
								$('#ctmId')
										.combobox('select', data.model[3].id);
							}
						});

						$('#aid').textbox('setValue', rowdd.id);

						$('#divAddS').show();

						$('#divAddS')
								.dialog(
										{
											title : '添加计量终端信息',
											modal : true,
											width : 500,
											height : 520,
											draggable : true,
											buttons : [
													{
														text : '提交',
														iconCls : 'icon-ok',
														handler : function() {
															$('#addsForms')
																	.form(
																			'submit',
																			{
																				url : "inventory/saveMeter",
																				dataType : "json",
																				type : "post",
																				onSubmit : function() {
																					// 进行表单验证

																				},
																				success : function(
																						data) {
																					if (data == 1) {

																						$.messager
																								.alert(
																										"提示",
																										"添加成功!",
																										"info",
																										function() {
																											$('#addsForms').form('clear');
																											$(
																													'#divAddS')
																													.dialog(
																															'close');
																											var rowcc = $(
																													'#cc')
																													.datagrid(
																															'getSelected');
																											var rowdd = $(
																													'#dd')
																													.datagrid(
																															'getSelected');
																											GetDataee(
																													rowcc.id,
																													rowdd.id)
																										});

																					} else {

																						$.messager
																								.alert(
																										"提示",
																										"添加失败!",
																										"info",
																										function() {
																											$(
																													'#divAddS')
																													.dialog(
																															'close');
																										});
																					}
																				}
																			});

														}
													},
													{
														text : '取消',
														handler : function() {
															$('#divAddS')
																	.dialog(
																			'close');
															$('#addForms')
																	.form(
																			'clear');
														}
													} ]
										});

					});
}
/*
 * 修改计量表信息
 */
function uppMeter() {
	// 计量终端配置更新页
	$('#updCal')
			.click(
					function() {
						var rowcc = $('#cc').datagrid('getSelected');
						var rowdd = $('#dd').datagrid('getSelected');
						var rowee = $('#ee').datagrid('getSelected');

						if (rowcc != null && rowdd != null && rowee != null) {
							$('#aid').textbox('setValue', rowdd.id);
							$('#bid').textbox('setValue', rowee.id);
							
							$('#cdtTerminalName').textbox('setValue', rowee.cdtTerminalName);
							
							$.ajax({
								url : "enegryUnit/findUnitModelAll",
								type : "POST",
								dataType : "json",
								async : false,
								timeout : 1000,
								success : function(data) { // 放入下拉框
									$("#ctmId").combobox({
										data : data.model,
										valueField : 'id',
										textField : 'ctmNames'
									});
//									alert(rowee.cdtAssembleid);
									var index=rowee.cdtAssembleid;
									index = parseInt(index) + 1;
									$('#ctmId').combobox('select', index);
								}
							});
							$('#ctdCodes').textbox('setValue', rowee.ctdCodes);
							$('#ctdAddr').textbox('setValue', rowee.ctdAddr);
							var add=rowee.cdtTerminalStatus;
							//$("input[name='cdtTerminalStatus'][value="+add+"]").attr("checked",true); 
							var radios=$("input[name='cdtTerminalStatus']");
							for(i=0;i<radios.length;i++){
								if(add==$(radios[i]).val()){
									$(radios[i]).attr("checked","checked");
								}
							}
//							$('#cdtIsinvented').textbox('setValue', rowee.cdtIsinvented);
							
							$('#cdtFormular').textbox('setValue', rowee.cdtFormular);
							$('#cdtFormularid').textbox('setValue', rowee.cdtFormularid);
							
							$('#divAddS').show();
							$('#divAddS').dialog({
								title : '修改计量表信息',
								modal : true,
								width : 500,
								height : 520,
								draggable : true,
								buttons : [
											{
												text : '提交',
												iconCls : 'icon-ok',
												handler : function() {
													$('#addsForms')
															.form(
																	'submit',
																	{
																		url : "inventory/saveMeter",
																		dataType : "json",
																		type : "post",
																		onSubmit : function() {
																			// 进行表单验证

																		},
																		success : function(
																				data) {
																			if (data == 1) {

																				$.messager
																						.alert(
																								"提示",
																								"修改成功!",
																								"info",
																								function() {
																									$(
																											'#divAddS')
																											.dialog(
																													'close');
																									var rowcc = $(
																											'#cc')
																											.datagrid(
																													'getSelected');
																									var rowdd = $(
																											'#dd')
																											.datagrid(
																													'getSelected');
																									GetDataee(
																											rowcc.id,
																											rowdd.id)
																								});

																			} else {

																				$.messager
																						.alert(
																								"提示",
																								"修改失败!",
																								"info",
																								function() {
																									$(
																											'#divAddS')
																											.dialog(
																													'close');
																								});
																			}
																		}
																	});

												}
											},
											{
												text : '取消',
												handler : function() {
													$('#divAddS')
															.dialog(
																	'close');
													$('#addForms')
															.form(
																	'clear');
												}
											} ]
							});
						} else if (rowdd == null) {
							$.messager.alert("提示", "必须选择一个采集器!", "info", null);
						} else if (rowee == null) {
							$.messager.alert("提示", "必须选择一个计量表!", "info", null);
						}
					});
}

/*
 * 删除计量表信息
 */
function delMeter() {
	// 删除计量表
	$('#delCal')
			.click(
					function() {
						var rowcc = $('#cc').datagrid('getSelected');
						var rowdd = $('#dd').datagrid('getSelected');
						var rowee = $('#ee').datagrid('getSelected');

						var ee = $('#ee').datagrid('getSelections'); // 计量表的集合
						// 拼接出计量表的ID
						var calculIds = "";
						for (var i = 0; i < ee.length; i++) {
							calculIds += ee[i].id;
							if (i < ee.length - 1) {
								calculIds += "#";
							}
						}
						if (rowee != null) {
							$.messager
									.confirm(
											'提示',
											'确定要删除选中的数据吗?',
											function(r) {
												if (r) {
													var args = {};
													args.eid = rowee.id;
													args.calculIds = calculIds;
													$
															.ajax({
																url : "inventory/delCalculte",
																type : "POST",
																dataType : "json",
																async : true,
																data : args,
																success : function(
																		data) {
																	if (data == ee.length) {
																		$.messager
																				.alert(
																						"提示",
																						"测量仪表信息已删除!",
																						"info",
																						function() {
																							var rowcc = $(
																									'#cc')
																									.datagrid(
																											'getSelected');
																							var rowdd = $(
																									'#dd')
																									.datagrid(
																											'getSelected');

																							GetDataee(
																									rowcc.id,
																									rowdd.id);
																						});

																	} else {
																		$.messager
																				.alert(
																						"提示",
																						"表计关联采集器信息删除失败!",
																						"info",
																						null);
																		var rowcc = $(
																				'#cc')
																				.datagrid(
																						'getSelected');
																		var rowdd = $(
																				'#dd')
																				.datagrid(
																						'getSelected');

																		GetDataee(
																				rowcc.id,
																				rowdd.id);
																	}
																}
															});
												}
											});
						}
					});
}