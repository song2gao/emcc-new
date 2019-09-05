/*
 * 用能单位维护  js
 * 企业信息维护
 * 朱亚彬
 */

/**
 * 页面加载
 */
var args = {};
$(function() {
	// 全查询页面
	InitTreeData();
	args.enegryId = 1;
	InitRightInfo(args);
	// 添加企业信息
	addForm();
	// 删除企业信息
	delUnit();
	// 修改企业信息
	uppUnit();

});

/**
 * 页面全查询
 */
function InitTreeData() {
	$('#MyTree').tree({
		url : 'treeInfo',
		checkbox : false,
		animate : true,
		onBeforeExpand : function(node) {
			$('#MyTree').tree('options').url = 'tree/treeId&eid=' + node.id;
		},
		onClick : function(node) {// 单击某个树节点,对应的Tabs发生数据变化

			$("#dataDiv :text").attr("disabled", "disabled");
			// $("#dataDiv :text").val('');
			// $('#euiConsumeBand').val('');

			// alert($("#dataDiv :text").attr("disabled"));
			$("#euiConsumeBand").attr("disabled", "disabled");
			$("#euiBackups").attr("disabled", "disabled");
			$('#treeid').val(node.id);
			$('#treename').val(node.text);

			args.enegryId = node.id;
			InitRightInfo(args);
		}
	});
}
/**
 * 页面内容加载
 * 
 * @param args
 */
function InitRightInfo(args) {
	$
			.ajax({
				url : "enegryInfo",
				type : "POST",
				async : true,
				dataType : "json",
				data : args,
				success : function(data) {
					$("#dataDiv :text").attr("disabled", "disabled");
					if (data == "") {
						alert("无该企业下的信息！！");
					} else {

						$("#titile").html(data.eneUnit.euiNames);
						$('#euiId').val(data.eneUnit.id);

						if (data.eneUnit.euiParentid == "ROOT") {
							$('#parentName2').attr('style', 'display:none');
							$('#parentName1').attr('style', 'display:none');
						} else {
							$('#parentName2').attr('style', 'display::block');
							$('#parentName1').attr('style', 'display::block');
							$('#parentName').val(data.eneUnit.parentName);
						}
						// $('#parentName').val(data.eneUnit.parentName);
						// alert(data.eneUnit.euiParentid)
						$('#euiCode').val(data.eneUnit.euiCode);
						$('#euiNames').val(data.eneUnit.euiNames);
						$('#euiRepresentative').val(
								data.eneUnit.euiRepresentative);

						$('#euiBelongIndustry').val(
								data.eneUnit.euiBelongIndustry);
						$('#euiBelongIndustry1').val(
								data.eneUnit.euiBelongIndustry1);
						// alert(data.eneUnit.euiBelongIndustry);

						$('#euiBelongDistrct').val(
								data.eneUnit.euiBelongDistrct);
						$('#euiBelongDistrct1').val(
								data.eneUnit.euiBelongDistrct1);
						// alert(data.eneUnit.euiBelongDistrct);

						$('#euiConsumeBand').val(data.eneUnit.euiConsumeBand);
						$('#euiLocation').val(data.eneUnit.euiLocation);
						$('#euiContentWay').val(data.eneUnit.euiContentWay);
						$('#euiBuildingArea').val(data.eneUnit.euiBuildingArea);
						$('#euiHoldPerson').val(data.eneUnit.euiHoldPerson);
						$('#euiChargeDepartment').val(
								data.eneUnit.euiChargeDepartment);
						$('#euiBackups').val(data.eneUnit.euiBackups);

						
					}
				}
			});
}

/**
 * 添加企业信息
 */

function addForm() {
	$('#addForm').click(
			function() {
				// 清理添加界面
				$('#ff').form('clear');
				$('#divAdd').dialog('open').dialog('center').dialog('setTitle',
						'添加企业信息资料');
			});
}

/**
 * 删除企业信息
 */

function delUnit() {
	// 删除
	$("#deleteButton").click(
			function() {
				var node = $("#MyTree").tree("getSelected"); // 当前选中节点
				var eid = $('#treeid').val();

				if (node == null) {
					$.messager.alert('提示', "请选择节点!", 'question');
					return;
				}
				$.messager.confirm('提示', '确定删除?', function(r) {
					if (r) {
						// alert('ok');
						$.ajax({
							data : {
								"eid" : eid
							},
							async : true,
							url : 'enegryUnit/deleteEnegryInfo', // 提交给哪个执行

							success : function(data) {
								if (data == "0") {
									$.messager.alert('提示',
											'当前企业含有子企业,请先删除子企业!', 'warning');
									return;
								} else if (data == "1") {
									$.messager.alert('提示', '删除成功!', 'info');
									$('#treeid').val("");
									InitTreeData();
									args.enegryId = 1;
									InitRightInfo(args);

								} else if (data == "3") {
									$.messager.alert('提示', '请先删除该企业的采集器',
											'warning');
									return;
								} else if (data == "4") {
									$.messager.alert('提示', '请先删除该企业的的员工',
											'warning');
									return;
								}

								else if (data == "2") {
									// alert('删除失败!');
									$.messager.alert('提示', '删除失败', 'warning');
									return;

								}
							}
						});

					} else {
						// alert("Cancel");
						return;
					}
				});

			});

};

/**
 * 修改企业信息
 */
function uppUnit() {
	//修改前将该ID下的信息填充
	$("#btnupdate").click(
			function() {
				var node = $("#MyTree").tree('getSelected');
				if (node == null) {
					alert("请先选择一个企业");
				} else {
					$('#divAdd').dialog('open').dialog('center').dialog(
							'setTitle', '修改企业信息资料');
					$.ajax({
						type : 'post',
						dataType : "json",
						data : {
							"eid" : node.id
						},
						url : 'enegryUnit/unitByID',
						success : function(data) {
							console.info(data);
							// alert(data.unitinfo.id);
							$('#unitID').textbox('setValue', data.unitinfo.id);

							$('#unitCode').textbox('setValue',
									data.unitinfo.euiCode);

							$('#euiNames1').textbox('setValue',
									data.unitinfo.euiNames);
							$('#euiBelongIndustry2').textbox('setValue',
									data.unitinfo.euiBelongIndustry);
							$('#euiContentWay2').textbox('setValue',
									data.unitinfo.euiContentWay);
							$('#euiHoldPerson1').textbox('setValue',
									data.unitinfo.euiHoldPerson);
							$('#euiConsumeBand1').textbox('setValue',
									data.unitinfo.euiConsumeBand);
							$('#parentNames').textbox('setValue',
									data.unitinfo.euiParentid);

							$('#euiRepresentative2').textbox('setValue',
									data.unitinfo.euiRepresentative);
							$('#euiBelongDistrct2').textbox('setValue',
									data.unitinfo.euiBelongDistrct);
							$('#euiLocation2').textbox('setValue',
									data.unitinfo.euiLocation);
							$('#euiBuildingArea2').textbox('setValue',
									data.unitinfo.euiBuildingArea);
							$('#euiChargeDepartment2').textbox('setValue',
									data.unitinfo.euiChargeDepartment);
							$('#euiBackups2').textbox('setValue',
									data.unitinfo.euiBackups);

						}
					})
				}

			});
};
/**
 * 表单提交
 */
function submitForm() {
	$('#ff').form('submit', {
		success : function(data) {
			if (data == 1) {

				$('#divAdd').dialog("close");

				$.messager.alert('操作提示信息', '添加企业单位信息成功！', 'info');

				InitTreeData();
			}if (data == 2) {

				$('#divAdd').dialog("close");

				$.messager.alert('操作提示信息', '修改企业单位信息成功！', 'info');

				InitTreeData();
			} else {
				$('#divAdd').dialog("close");

				$.messager.alert('操作提示信息', '添加企业单位信息失败！', 'error');

				InitTreeData();
			}

		}
	});

}
/**
 * 表单重置
 */
function clearForm() {
	$('#ff').form('clear');
}
