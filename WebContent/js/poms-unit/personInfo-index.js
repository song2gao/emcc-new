/*
 * 用能单位维护  js
 * 人员信息维护
 * 
 * 朱亚彬
 */

/*
 * 页面加载
 */
var pname="";
var pcodes="";
var euiIds=1;
$(function() {
	
	//加载easyUI表格
	table();
	// 全查询页面
	InitTreeData();
//	GetData();
	// 添加人员信息
	addPerson();
	// 删除人员信息
	delPerson();
	// 修改人员信息
	uppPerson();
//	//验证
//	check();
//	//查询
//	select();
	$('#search').linkbutton({
	    iconCls: 'icon-search'
	});
	
});

/*
 * 页面加载
 */
function InitTreeData() {
	//加载 页面左边  tree
	$('#MyTree').tree({
		url : 'treeInfo',
		checkbox : false,
		animate : true,
		onBeforeExpand : function(node) {
			 //alert(node.id);
			$('#MyTree').tree('options').url = 'tree/person/treeId&eid=' + node.id;
		},onLoadSuccess:function(node,data){
			var test = $('#MyTree').tree('find', data[2].id);//找到id为”tt“这个树的节点id为”1“的对象
			$('#MyTree').tree('select', test.target);//设置选中该节点
		},
		onClick : function(node) {// 单击某个树节点,对应的Tabs发生数据变化
			euiIds=node.id;
			GetDataRefresh(euiIds);
		}
	});
	
	//加载 页面右边  页面内容
	GetDataRefresh(euiIds);

}
/**
 * 查询条件方法
 */
function GetData() {
	var args = {};
	args.gdType = $("#pName").val();
	args.gdState = $("#pCodes").val();
	args.pageIndex = 1;// 页索引
	args.pageSize = 10;// 页容量
	BingData("#tt", args, "personInfo.action?m=toSearchPersons", null);
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
	test.pname=pname;
	test.pcodes=pcodes;
	BingData("#tt", test, "person/person", null);
}

/**
 * 将所有数据打印出 table表格中
 */
function table(){
	$('#tt').datagrid( {
		title : '人员信息表',
		striped : true,
		fitColumns: true, //自适应列的大小
		pagination: true,
		rownumbers: true,
		singleSelect:true,//设置单选、多选。true单选，false 多选。
		editors:'predefined editors',
		columns : [ [ {field : 'euiId',title : '用能单位',width : 100,
			formatter: function(value, rowData, rowIndex){
				var result="";
				$.ajax({
					url : "enegryInfo",
					type : "post",
					data:{"enegryId":value},
					dataType : "json",
					timeout : 1000,
					async : false,
					success : function(data) { // 放入下拉框
						result= data.eneUnit.euiNames;
					}
				});
				return result;
			}},
					  {field : 'piCodes',title : '人员编码',width : 100},
					  {field : 'piName',title : '姓名',width : 100,formatter: function(value, rowData, rowIndex){return value}},
					  {field : 'piSex',title : '性别',width : 100,formatter: function(value, rowData, rowIndex){if(value=="0"){return "男" }else{return "女"}}},
					  {field : 'piAge',title : '年龄',width : 100},
					  {field : 'piMobile',title : '联系方式',width : 100},
					  {field : 'piEmail',title : '邮箱',width : 100},
					  {field : 'plLocation',title : '地址',width : 100} 
					  
				  ] ],
		pagination:true
	
	});
	$('#tt').datagrid('getPager').pagination({//分页栏下方文字显示
        displayMsg:'当前显示从第{from}条到{to}条 共{total}条记录',
        onBeforeRefresh:function(pageNumber, pageSize){
        $(this).pagination('loading');
//         alert('pageNumber:'+pageNumber+',pageSize:'+pageSize);
         $(this).pagination('loaded');
      }
       });
	//点击查询按钮时，根据条件查询信息
	$("#search").click(function(){
		//获取后台数据
		//$("#tt").datagrid("loadData",[]); 
		GetData()
	});
	$("#ibtn").click(function(){
		//获取后台数据
		//$("#tt").datagrid("loadData",[]); 
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
						test=row.euiId;
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
						var test="";
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
										//for (var i = 0; i < data.length; i++) {
										
											$("#euiId").combobox({
												 data:data,
									             valueField:'id',
									             textField:'text'
											});
											$('#euiId').combobox('select',data[0].id);
										//}
										
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
															test=$("#euiId").combobox('getValues')[0];
															$('#ff').form('submit',{
																				url : "person/savePerson",
																				dataType : "json",
																				async : false,
																				onSubmit : function() {
																					// 进行表单验证
																					return check();

																				},
																				success : function(data) {
																					if (data == 'success') {
																						$.messager.alert("提示",
																										"添加成功!",
																										"info",
																										function() {
																							GetDataRefresh(test);
																											$('#divThemes').dialog('close');
																											$('#ff').form('clear');
																										});

																					} else if (data == 'error') {
																						$.messager.alert(
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
	$('#editButton').click(function() {
						var row = $('#tt').datagrid('getSelected');
						
						if (row != null) {
							// alert(row.piCodes);
							piCodesTemp = row.piCodes;
							$('#pid').textbox('setValue',row.id);
							
							$('#piCodes').textbox('setValue',row.piCodes);
							
							$('#piName').textbox('setValue',row.piName);
							$('#piAge').textbox('setValue',row.piAge);
							$('#piEmail').textbox('setValue',row.piEmail);
							$('#piMobile').textbox('setValue',row.piMobile);
							$('#plLocation').textbox('setValue',row.plLocation);
							
							if (row.piSex == "0") {
								$("input[type=radio][value=0]").attr("checked",
										'checked');
							} else {
								$("input[type=radio][value=1]").attr("checked",
										'checked');
							}
							var result="";
							var reultId="";
							$
							.ajax({
								url : "treeInfo",
								type : "post",
								dataType : "json",
								success : function(data) { // 放入下拉框
									console.info(data);
									var rdo = "<option value='-1'>--选择企业--</option>";
									//for (var i = 0; i < data.length; i++) {
									
										$("#euiId").combobox({
											 data:data,
								             valueField:'id',
								             textField:'text'
										});
										$('#euiId').combobox('select',row.euiId);
									//}
									
								}
							});
//							$('#euiId').combobox('select',result);
							$("#unitid option[value='" + result + "']").attr(
									"selected", "selected"); // 设置Select的Text值为jQuery的项选中

							$('#divThemes').show();
							$('#divThemes')
									.dialog({
												title : '修改人员信息',
												modal : true,
												width : 400,
												draggable : true,
												buttons : [{
															text : '提交',
															iconCls : 'icon-ok',
															handler : function() {
																test=$("#euiId").combobox('getValues')[0];
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
																							$('#tt').datagrid('selectRow',reultId);//
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
//function select(){
////	var pname="";
////	var pcodes="";
//	$("input",$("#pName").next("span")).blur(function(){  
//		alert($(this).val());
//		pname=$(this).val();
//	}) 
//	$("input",$("#pCodes").next("span")).blur(function(){  
//		alert($(this).val());
//		pcodes=$(this).val();
//	}) 
//	
//	if(pname!=""&&pcodes!=""){
//		
//		GetDataRefresh(1);
//	}else{
//		pname="";
//		pcodes="";
//		alert("select");
//		GetDataRefresh(1);
//	}
//	
//}

function onSelectName(){
	var search = $(this).val();
	pname=search;
	GetDataRefresh(euiIds);
}
function onSelectCodes(){
	var search = $(this).val();
	pcodes=search;
	GetDataRefresh(euiIds);
}
function onSearch(){
	GetDataRefresh(euiIds);
}

