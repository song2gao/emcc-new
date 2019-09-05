
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>计量终端模型</title>
		<script type="text/javascript" src="/emcc-web/js/other.js"></script>
		<link href="/emcc-web/css/poms-system/CSS.css" rel="stylesheet"
			type="text/css"></link>
		<link href="/emcc-web/css/poms-system/yxztjk.css" rel="stylesheet"
			type="text/css"></link>
		<link href="/emcc-web/css/poms-business/ptrzgl.css" rel="stylesheet"
			type="text/css"></link>
		<link href="/emcc-web/css/poms-business/themes/default/easyui.css"
			rel="stylesheet" type="text/css"></link>
		<link href="/emcc-web/css/poms-business/themes/icon.css"
			rel="stylesheet" type="text/css"></link>
		<script type="text/javascript"
			src="/emcc-web/js/poms-business/jquery-1.7.1.min.js"></script>
		<script type="text/javascript"
			src="/emcc-web/js/poms-business/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="/emcc-web/js/page.js"></script>
		<script type="text/javascript"
			src="/emcc-web/js/poms-business/jsonToTime.js"></script>
		<script type="text/javascript"
			src="/emcc-web/js/poms-business/btn123ABC.js"></script>
	</head>
	<body>
		<!-- 模型 -->
		<div align="left" id="three_top" style="width: 100%;">
			<form>
				<table id="tbls1" align="left">
					<tr>
						<td>
							<span style="width: 40px;"></span> 名&nbsp;&nbsp;&nbsp;&nbsp;称：
						</td>
						<td>
							<input type="text" name="name" id="name" />
						</td>
						<td>
							<span style="width: 25px;"></span> 类&nbsp;&nbsp;&nbsp;&nbsp;型：
						</td>
						<td>
							<input type="text" name="types" id="types" />
						</td>
						<td>
							&emsp;&emsp;&emsp;&emsp;&emsp;
							<input type="button" value="查询" class="searchButton"
								id="searchButton" name="searchButton" style="cursor: pointer;"
								onmousemove=this.style.color onmouseout=this.style.color />
						</td>
						<td>
							&emsp;&emsp;&emsp;
							<input type="button" value="新建模型" class="addButton"
								id="addButton" name="addButton" style="cursor: pointer;"
								onmousemove=this.style.color onmouseout=this.style.color />
							<!-- 添加表计模型 -->
							<script type="text/javascript">
									$(function() {
										$("#addButton").click(function() {
											$("[name=funcode]:input:checked").removeAttr("checked");
											$("[name=secfuncode]:input:checked").removeAttr("checked");
											$("[name=secdayfuncode]:input:checked").removeAttr("checked");
											$("[name=secmonfuncode]:input:checked").removeAttr("checked");
											$.ajax( {
												data : {
													"type" : "engrgytype"
												},
												type : 'post',
												dataType : "json",
												url : 'CodeManagementAction.action?m=getCodeByParentId',
												success : function(data) {
													$("#ctype").empty();
													$.each(data.lst, function(i, item) {
													var op = $("__tag_3664$25_"
														+ item.cmName
														+ "__tag_3664$68_");
													//$("#ctype").append(op);
													$("<option value='"+item.cmId+"'>"+item.cmName+"</option>").appendTo("#ctype");
											});
										}
									});
									$('#fmid').form('clear');
									$('#dd').show();
									$('#dd').dialog({
												title : '新建计量终端模型',
												modal : true,
												draggable : true,
												buttons : [ {
													text : '',
													iconCls : 'icon-ok',
													handler : function() {
														$('#fmid').form({
															url : "toJlzd.action?m=toAddModel",
															dataType : "json",
															async : false,
															onSubmit : function() {
																if ($.trim($('#ccode').val()) == "") {
																					$.messager.alert("提示","编码不能为空");
																					$('#ccode').focus();
																					return false;
																				}
																if ($.trim($('#cname').val()) == "") {
																					$.messager.alert("提示","名称不能为空");
																					$('#cname').focus();
																					return false;
																				}
																				if ($.trim($('#ctype').val()) == "") {
																					$.messager.alert("提示","类型不能为空");
																					$('#ctype').focus();
																					return false;
																				}
																			},
																			success : function(data) {
																				if (data == "{}") {
																					$.messager.alert("提示","添加失败");
																				} else {
																					$.messager.alert("提示","添加成功");
																					$('#dd').dialog('close');
																					GetData();
																				}
																			}
																		});
																	$('#fmid').submit();
													}
												} ]
											});
						});
	});
</script>
						</td>
						<td>
							&emsp;&emsp;&emsp;
							<input type="button" value="修改" class="editButton"
								id="editButton" name="editButton" style="cursor: pointer;"
								onmousemove=this.style.color onmouseout=this.style.color />
						</td>
						<td>
							&emsp;&emsp;&emsp;
							<input type="button" value="删除" class="deleteButton"
								id="deleteButton" name="deleteButton" style="cursor: pointer;"
								onmousemove=this.style.color onclick=deleteVEN()
								onmouseout=this.style.color;; />
						</td>
					</tr>
				</table>
			</form>
		</div>
		<table id="gd" class="easyui-datagrid"
			style="width: 1410px;; height: 225px" toolbar="#toolbar"
			rownumbers="true" fitColumns="true" singleSelect="true">
		</table>
		<!-- 模型添加 -->
		<div id="dd" style="width: 500px; height: 400px; display: none;">
			<form id="fmid" method="post">
				<br />
				<br />
				<table id="addModeTable" align="center" width="390">
					<tr>
						<td>
							<input type="hidden" id="cid" name="cid"
								class="easyui-validatebox" />
						</td>
					</tr>
					<tr>
						<td>
							<font color="red">*</font>计量终端模型编码:
						</td>
						<td>
							<input type="text" id="ccode" name="ccode"
								class="easyui-validatebox" />
						</td>
					</tr>
					<tr>
						<td>
							<font color="red">*</font>计量终端模型名称:
						</td>
						<td>
							<input type="text" id="cname" name="cname"
								class="easyui-validatebox" />
						</td>
					</tr>
					<tr>
						<td>
							<font color="red">*</font>计量终端能源类型:
						</td>
						<td>
							<select id="ctype" name="ctype" style="width: 156px;"></select>
						</td>
					</tr>
					<tr>
						<td>
							<font color="red">*</font>一类数据(FN):
						</td>
						<td>
							<select id="funcode" class="easyui-validatebox"
								data-options="width:160" name="funcode"></select>
							<div id="sp">
								<div style="color: #99BBE8; background: #fafafa; padding: 5px;">
									一类数据(FN):
								</div>
								<input id="all1" type="checkbox" class="easyui-validatebox"
									value="all1" />
								<span>全选</span>
								<br />
								<input id="chk1_Item1" type="checkbox" name="funcode"
									class="easyui-validatebox" value="F2" />
								<span>F2</span>
								<br />
								<input id="chk2_Item1" type="checkbox" name="funcode"
									class="easyui-validatebox" value="F7" />
								<span>F7</span>
								<br />
								<input id="chk3_Item1" type="checkbox" name="funcode"
									class="easyui-validatebox" value="F8" />
								<span>F8</span>
								<br />
								<input id="chk4_Item1" type="checkbox" name="funcode"
									class="easyui-validatebox" value="F9" />
								<span>F9</span>
								<br />
								<input id="chk5_Item1" type="checkbox" name="funcode"
									class="easyui-validatebox" value="F11" />
								<span>F11</span>
								<br />
								<input id="chk6_Item1" type="checkbox" name="funcode"
									class="easyui-validatebox" value="F25" />
								<span>F25</span>
								<br />
								<input id="chk7_Item1" type="checkbox" name="funcode"
									class="easyui-validatebox" value="F26" />
								<span>F26</span>
								<br />
								<input id="chk8_Item1" type="checkbox" name="funcode"
									class="easyui-validatebox" value="F27" />
								<span>F27</span>
								<br />
								<input id="chk9_Item1" type="checkbox" name="funcode"
									class="easyui-validatebox" value="F28" />
								<span>F28</span>
								<br />
								<input id="chk10_Item1" type="checkbox" name="funcode"
									class="easyui-validatebox" value="F29" />
								<span>F29</span>
								<br />
								<input id="chk11_Item1" type="checkbox" name="funcode"
									class="easyui-validatebox" value="F30" />
								<span>F30</span>
								<br />
								<input id="chk12_Item1" type="checkbox" name="funcode"
									class="easyui-validatebox" value="F41" />
								<span>F41</span>
								<br />
								<input id="chk13_Item1" type="checkbox" name="funcode"
									class="easyui-validatebox" value="F42" />
								<span>F42</span>
								<br />
								<input id="chk14_Item1" type="checkbox" name="funcode"
									class="easyui-validatebox" value="F43" />
								<span>F43</span>
								<br />
								<input id="chk15_Item1" type="checkbox" name="funcode"
									class="easyui-validatebox" value="F44" />
								<span>F44</span>
								<br />
								<input id="chk16_Item1" type="checkbox" name="funcode"
									class="easyui-validatebox" value="F45" />
								<span>F45</span>
								<br />
								<input id="chk17_Item1" type="checkbox" name="funcode"
									class="easyui-validatebox" value="F46" />
								<span>F46</span>
								<br />
								<input id="chk18_Item1" type="checkbox" name="funcode"
									class="easyui-validatebox" value="F47" />
								<span>F47</span>
								<br />
								<input id="chk19_Item1" type="checkbox" name="funcode"
									class="easyui-validatebox" value="F48" />
								<span>F48</span>
								<br />
								<input id="chk20_Item1" type="checkbox" name="funcode"
									class="easyui-validatebox" value="F57" />
								<span>F57</span>
								<br />
								<input id="chk21_Item1" type="checkbox" name="funcode"
									class="easyui-validatebox" value="F127" />
								<span>F127</span>
								<br />
								<input id="chk22_Item1" type="checkbox" name="funcode"
									class="easyui-validatebox" value="F128" />
								<span>F128</span>
								<br />
								<input id="chk23_Item1" type="checkbox" name="funcode"
									class="easyui-validatebox" value="F129" />
								<span>F129</span>
								<br />
								<input id="chk24_Item1" type="checkbox" name="funcode"
									class="easyui-validatebox" value="F130" />
								<span>F130</span>
								<br />
								<input id="chk25_Item1" type="checkbox" name="funcode"
									class="easyui-validatebox" value="F131" />
								<span>F131</span>
								<br />
								<input id="chk26_Item1" type="checkbox" name="funcode"
									class="easyui-validatebox" value="F132" />
								<span>F132</span>
								<br />
								<input id="chk27_Item1" type="checkbox" name="funcode"
									class="easyui-validatebox" value="F137" />
								<span>F137</span>
								<br />
								<input id="chk28_Item1" type="checkbox" name="funcode"
									class="easyui-validatebox" value="F138" />
								<span>F138</span>
								<br />
								<input id="chk39_Item1" type="checkbox" name="funcode"
									class="easyui-validatebox" value="F139" />
								<span>F139</span>
								<br />
								<input id="chk30_Item1" type="checkbox" name="funcode"
									class="easyui-validatebox" value="F140" />
								<span>F140</span>
								<br />
								<input id="chk31_Item1" type="checkbox" name="funcode"
									class="easyui-validatebox" value="F141" />
								<span>F141</span>
								<br />
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<font color="red">*</font>二类日曲线数据(FN):
						</td>
						<td>
							<select id="secfuncode" class="easyui-validatebox"
								data-options="width:160" name="secfuncode"></select>
							<div id="sp1">
								<div style="color: #99BBE8; background: #fafafa; padding: 5px;">
									二类日曲线数据(FN)
								</div>
								<input id="all2" type="checkbox" class="easyui-validatebox"
									value="all2" />
								<span>全选</span>
								<br />
								<input id="chk1_1_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F5" />
								<span>F5</span>
								<br />
								<input id="chk1_2_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F6" />
								<span>F6</span>
								<br />
								<input id="chk1_3_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F7" />
								<span>F7</span>
								<br />
								<input id="chk1_4_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F8" />
								<span>F8</span>
								<br />
								<input id="chk1_5_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F21" />
								<span>F21</span>
								<br />
								<input id="chk1_6_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F22" />
								<span>F22</span>
								<br />
								<input id="chk1_7_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F23" />
								<span>F23</span>
								<br />
								<input id="chk1_8_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F24" />
								<span>F24</span>
								<br />
								<input id="chk1_9_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F26" />
								<span>F26</span>
								<br />
								<input id="chk1_10_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F27" />
								<span>F27</span>
								<br />
								<input id="chk1_11_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F29" />
								<span>F29</span>
								<br />
								<input id="chk1_12_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F32" />
								<span>F32</span>
								<br />
								<input id="chk1_13_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F34" />
								<span>F34</span>
								<br />
								<input id="chk1_14_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F35" />
								<span>F35</span>
								<br />
								<input id="chk1_15_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F40" />
								<span>F40</span>
								<br />
								<input id="chk1_16_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F45" />
								<span>F45</span>
								<br />
								<input id="chk1_17_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F46" />
								<span>F46</span>
								<br />
								<input id="chk1_18_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F49" />
								<span>F49</span>
								<br />
								<input id="chk1_19_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F51" />
								<span>F51</span>
								<br />
								<input id="chk1_20_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F81" />
								<span>F81</span>
								<br />
								<input id="chk1_21_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F82" />
								<span>F82</span>
								<br />
								<input id="chk1_22_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F83" />
								<span>F83</span>
								<br />
								<input id="chk1_23_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F84" />
								<span>F84</span>
								<br />
								<input id="chk1_24_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F85" />
								<span>F85</span>
								<br />
								<input id="chk1_25_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F86" />
								<span>F86</span>
								<br />
								<input id="chk1_26_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F87" />
								<span>F87</span>
								<br />
								<input id="chk1_27_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F88" />
								<span>F88</span>
								<br />
								<input id="chk1_28_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F89" />
								<span>F89</span>
								<br />
								<input id="chk1_29_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F90" />
								<span>F90</span>
								<br />
								<input id="chk1_30_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F91" />
								<span>F91</span>
								<br />
								<input id="chk1_31_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F92" />
								<span>F92</span>
								<br />
								<input id="chk1_32_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F93" />
								<span>F93</span>
								<br />
								<input id="chk1_33_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F94" />
								<span>F94</span>
								<br />
								<input id="chk1_34_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F95" />
								<span>F95</span>
								<br />
								<input id="chk1_35_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F97" />
								<span>F97</span>
								<br />
								<input id="chk1_36_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F98" />
								<span>F98</span>
								<br />
								<input id="chk1_37_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F99" />
								<span>F99</span>
								<br />
								<input id="chk1_38_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F100" />
								<span>F100</span>
								<br />
								<input id="chk1_39_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F101" />
								<span>F101</span>
								<br />
								<input id="chk1_40_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F102" />
								<span>F102</span>
								<br />
								<input id="chk1_41_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F103" />
								<span>F103</span>
								<br />
								<input id="chk1_42_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F104" />
								<span>F104</span>
								<br />
								<input id="chk1_43_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F105" />
								<span>F105</span>
								<br />
								<input id="chk1_44_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F106" />
								<span>F106</span>
								<br />
								<input id="chk1_45_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F107" />
								<span>F107</span>
								<br />
								<input id="chk1_46_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F108" />
								<span>F108</span>
								<br />
								<input id="chk1_47_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F109" />
								<span>F109</span>
								<br />
								<input id="chk1_48_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F110" />
								<span>F110</span>
								<br />
								<input id="chk1_49_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F111" />
								<span>F111</span>
								<br />
								<input id="chk1_50_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F112" />
								<span>F112</span>
								<br />
								<input id="chk1_51_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F145" />
								<span>F145</span>
								<br />
								<input id="chk1_52_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F146" />
								<span>F146</span>
								<br />
								<input id="chk1_53_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F147" />
								<span>F147</span>
								<br />
								<input id="chk1_54_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F148" />
								<span>F148</span>
								<br />
								<input id="chk1_55_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F153" />
								<span>F153</span>
								<br />
								<input id="chk1_56_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F161" />
								<span>F161</span>
								<br />
								<input id="chk1_57_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F162" />
								<span>F162</span>
								<br />
								<input id="chk1_58_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F163" />
								<span>F163</span>
								<br />
								<input id="chk1_59_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F164" />
								<span>F164</span>
								<br />
								<input id="chk1_60_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F177" />
								<span>F177</span>
								<br />
								<input id="chk1_61_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F178" />
								<span>F178</span>
								<br />
								<input id="chk1_62_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F179" />
								<span>F179</span>
								<br />
								<input id="chk1_63_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F180" />
								<span>F180</span>
								<br />
								<input id="chk1_64_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F281" />
								<span>F281</span>
								<br />
								<input id="chk1_65_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F282" />
								<span>F282</span>
								<br />
								<input id="chk1_66_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F283" />
								<span>F283</span>
								<br />
								<input id="chk1_67_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F284" />
								<span>F284</span>
								<br />
								<input id="chk1_68_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F285" />
								<span>F285</span>
								<br />
								<input id="chk1_69_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F286" />
								<span>F286</span>
								<br />
								<input id="chk1_70_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F287" />
								<span>F287</span>
								<br />
								<input id="chk1_71_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F288" />
								<span>F288</span>
								<br />
								<input id="chk1_72_Item2" type="checkbox" name="secfuncode"
									class="easyui-validatebox" value="F289" />
								<span>F289</span>
								<br />

							</div>
							<!--   <input type="text" id="secfuncode" name="secfuncode" class="easyui-validatebox"/>-->

						</td>
					</tr>
					<tr>
						<td>
							<font color="red">*</font>二类日冻结数据(FN):
						</td>
						<td>
							<select id="secdayfuncode" class="easyui-validatebox"
								data-options="width:160" name="secdayfuncode"></select>
							<div id="sp2">
								<div style="color: #99BBE8; background: #fafafa; padding: 5px;">
									二类日冻结数据(FN)
								</div>
								<input id="all3" type="checkbox" class="easyui-validatebox"
									value="all3" />
								<span>全选</span>
								<br />

								<input id="che1_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F5" />
								<span>F5</span>
								<br />
								<input id="che2_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F6" />
								<span>F6</span>
								<br />
								<input id="che3_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F7" />
								<span>F7</span>
								<br />
								<input id="che4_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F8" />
								<span>F8</span>
								<br />
								<input id="che5_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F21" />
								<span>F21</span>
								<br />
								<input id="che6_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F22" />
								<span>F22</span>
								<br />
								<input id="che7_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F23" />
								<span>F23</span>
								<br />
								<input id="che8_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F24" />
								<span>F24</span>
								<br />
								<input id="che9_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F26" />
								<span>F26</span>
								<br />
								<input id="che10_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F27" />
								<span>F27</span>
								<br />
								<input id="che11_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F29" />
								<span>F29</span>
								<br />
								<input id="che12_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F32" />
								<span>F32</span>
								<br />
								<input id="che13_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F34" />
								<span>F34</span>
								<br />
								<input id="che14_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F35" />
								<span>F35</span>
								<br />
								<input id="che15_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F40" />
								<span>F40</span>
								<br />
								<input id="che16_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F45" />
								<span>F45</span>
								<br />
								<input id="che17_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F46" />
								<span>F46</span>
								<br />
								<input id="che18_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F49" />
								<span>F49</span>
								<br />
								<input id="che19_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F51" />
								<span>F51</span>
								<br />
								<input id="che20_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F81" />
								<span>F81</span>
								<br />
								<input id="che21_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F82" />
								<span>F82</span>
								<br />
								<input id="che22_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F83" />
								<span>F83</span>
								<br />
								<input id="che23_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F84" />
								<span>F84</span>
								<br />
								<input id="che24_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F85" />
								<span>F85</span>
								<br />
								<input id="che25_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F86" />
								<span>F86</span>
								<br />
								<input id="che26_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F87" />
								<span>F87</span>
								<br />
								<input id="che27_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F88" />
								<span>F88</span>
								<br />
								<input id="che28_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F89" />
								<span>F89</span>
								<br />
								<input id="che29_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F90" />
								<span>F90</span>
								<br />
								<input id="che30_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F91" />
								<span>F91</span>
								<br />
								<input id="che31_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F92" />
								<span>F92</span>
								<br />
								<input id="che32_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F93" />
								<span>F93</span>
								<br />
								<input id="che33_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F94" />
								<span>F94</span>
								<br />
								<input id="che34_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F95" />
								<span>F95</span>
								<br />
								<input id="che35_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F97" />
								<span>F97</span>
								<br />
								<input id="che36_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F98" />
								<span>F98</span>
								<br />
								<input id="che37_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F99" />
								<span>F99</span>
								<br />
								<input id="che38_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F100" />
								<span>F100</span>
								<br />
								<input id="che39_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F101" />
								<span>F101</span>
								<br />
								<input id="che40_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F102" />
								<span>F102</span>
								<br />
								<input id="che41_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F103" />
								<span>F103</span>
								<br />
								<input id="che42_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F104" />
								<span>F104</span>
								<br />
								<input id="che43_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F105" />
								<span>F105</span>
								<br />
								<input id="che44_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F106" />
								<span>F106</span>
								<br />
								<input id="che45_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F107" />
								<span>F107</span>
								<br />
								<input id="che46_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F108" />
								<span>F108</span>
								<br />
								<input id="che47_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F109" />
								<span>F109</span>
								<br />
								<input id="che48_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F110" />
								<span>F110</span>
								<br />
								<input id="che49_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F111" />
								<span>F111</span>
								<br />
								<input id="che50_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F112" />
								<span>F112</span>
								<br />
								<input id="che51_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F145" />
								<span>F145</span>
								<br />
								<input id="che52_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F146" />
								<span>F146</span>
								<br />
								<input id="che53_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F147" />
								<span>F147</span>
								<br />
								<input id="che54_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F148" />
								<span>F148</span>
								<br />
								<input id="che55_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F153" />
								<span>F153</span>
								<br />
								<input id="che56_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F161" />
								<span>F161</span>
								<br />
								<input id="che57_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F162" />
								<span>F162</span>
								<br />
								<input id="che58_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F163" />
								<span>F163</span>
								<br />
								<input id="che59_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F164" />
								<span>F164</span>
								<br />
								<input id="che60_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F177" />
								<span>F177</span>
								<br />
								<input id="che61_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F178" />
								<span>F178</span>
								<br />
								<input id="che62_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F179" />
								<span>F179</span>
								<br />
								<input id="che63_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F180" />
								<span>F180</span>
								<br />
								<input id="che64_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F281" />
								<span>F281</span>
								<br />
								<input id="che65_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F282" />
								<span>F282</span>
								<br />
								<input id="che66_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F283" />
								<span>F283</span>
								<br />
								<input id="che67_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F284" />
								<span>F284</span>
								<br />
								<input id="che68_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F285" />
								<span>F285</span>
								<br />
								<input id="che69_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F286" />
								<span>F286</span>
								<br />
								<input id="che70_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F287" />
								<span>F287</span>
								<br />
								<input id="che71_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F288" />
								<span>F288</span>
								<br />
								<input id="che72_Item3" type="checkbox" name="secdayfuncode"
									class="easyui-validatebox" value="F289" />
								<span>F289</span>
								<br />
							</div>
							<!--   <input type="text" id="secdayfuncode" name="secdayfuncode" class="easyui-validatebox"/>-->

						</td>
					</tr>
					<tr>
						<td>
							<font color="red">*</font>二类月冻结数据(FN):
						</td>
						<td>
							<select id="secmonfuncode" class="easyui-validatebox"
								data-options="width:160" name="secmonfuncode"></select>
							<div id="sp3">
								<div style="color: #99BBE8; background: #fafafa; padding: 5px;">
									二类月冻结数据(FN)
								</div>
								<input id="all4" type="checkbox" class="easyui-validatebox"
									value="all4" />
								<span>全选</span>
								<br />


								<input id="che1_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F5" />
								<span>F5</span>
								<br />
								<input id="chc2_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F6" />
								<span>F6</span>
								<br />
								<input id="chc3_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F7" />
								<span>F7</span>
								<br />
								<input id="chc4_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F8" />
								<span>F8</span>
								<br />
								<input id="chc5_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F21" />
								<span>F21</span>
								<br />
								<input id="chc6_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F22" />
								<span>F22</span>
								<br />
								<input id="chc7_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F23" />
								<span>F23</span>
								<br />
								<input id="chc8_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F24" />
								<span>F24</span>
								<br />
								<input id="chc9_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F26" />
								<span>F26</span>
								<br />
								<input id="chc10_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F27" />
								<span>F27</span>
								<br />
								<input id="chc11_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F29" />
								<span>F29</span>
								<br />
								<input id="chc12_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F32" />
								<span>F32</span>
								<br />
								<input id="chc13_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F34" />
								<span>F34</span>
								<br />
								<input id="chc14_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F35" />
								<span>F35</span>
								<br />
								<input id="chc15_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F40" />
								<span>F40</span>
								<br />
								<input id="chc16_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F45" />
								<span>F45</span>
								<br />
								<input id="chc17_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F46" />
								<span>F46</span>
								<br />
								<input id="chc18_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F49" />
								<span>F49</span>
								<br />
								<input id="chc19_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F51" />
								<span>F51</span>
								<br />
								<input id="chc20_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F81" />
								<span>F81</span>
								<br />
								<input id="chc21_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F82" />
								<span>F82</span>
								<br />
								<input id="chc22_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F83" />
								<span>F83</span>
								<br />
								<input id="chc23_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F84" />
								<span>F84</span>
								<br />
								<input id="chc24_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F85" />
								<span>F85</span>
								<br />
								<input id="chc25_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F86" />
								<span>F86</span>
								<br />
								<input id="chc26_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F87" />
								<span>F87</span>
								<br />
								<input id="chc27_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F88" />
								<span>F88</span>
								<br />
								<input id="chc28_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F89" />
								<span>F89</span>
								<br />
								<input id="chc29_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F90" />
								<span>F90</span>
								<br />
								<input id="chc30_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F91" />
								<span>F91</span>
								<br />
								<input id="chc31_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F92" />
								<span>F92</span>
								<br />
								<input id="chc32_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F93" />
								<span>F93</span>
								<br />
								<input id="chc33_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F94" />
								<span>F94</span>
								<br />
								<input id="chc34_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F95" />
								<span>F95</span>
								<br />
								<input id="chc35_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F97" />
								<span>F97</span>
								<br />
								<input id="chc36_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F98" />
								<span>F98</span>
								<br />
								<input id="chc37_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F99" />
								<span>F99</span>
								<br />
								<input id="chc38_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F100" />
								<span>F100</span>
								<br />
								<input id="chc39_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F101" />
								<span>F101</span>
								<br />
								<input id="chc40_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F102" />
								<span>F102</span>
								<br />
								<input id="chc41_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F103" />
								<span>F103</span>
								<br />
								<input id="chc42_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F104" />
								<span>F104</span>
								<br />
								<input id="chc43_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F105" />
								<span>F105</span>
								<br />
								<input id="chc44_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F106" />
								<span>F106</span>
								<br />
								<input id="chc45_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F107" />
								<span>F107</span>
								<br />
								<input id="chc46_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F108" />
								<span>F108</span>
								<br />
								<input id="chc47_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F109" />
								<span>F109</span>
								<br />
								<input id="chc48_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F110" />
								<span>F110</span>
								<br />
								<input id="chc49_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F111" />
								<span>F111</span>
								<br />
								<input id="chc50_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F112" />
								<span>F112</span>
								<br />
								<input id="chc51_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F145" />
								<span>F145</span>
								<br />
								<input id="chc52_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F146" />
								<span>F146</span>
								<br />
								<input id="chc53_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F147" />
								<span>F147</span>
								<br />
								<input id="chc54_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F148" />
								<span>F148</span>
								<br />
								<input id="chc55_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F153" />
								<span>F153</span>
								<br />
								<input id="chc56_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F161" />
								<span>F161</span>
								<br />
								<input id="chc57_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F162" />
								<span>F162</span>
								<br />
								<input id="chc58_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F163" />
								<span>F163</span>
								<br />
								<input id="chc59_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F164" />
								<span>F164</span>
								<br />
								<input id="chc60_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F177" />
								<span>F177</span>
								<br />
								<input id="chc61_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F178" />
								<span>F178</span>
								<br />
								<input id="chc62_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F179" />
								<span>F179</span>
								<br />
								<input id="chc63_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F180" />
								<span>F180</span>
								<br />
								<input id="chc64_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F281" />
								<span>F281</span>
								<br />
								<input id="chc65_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F282" />
								<span>F282</span>
								<br />
								<input id="chc66_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F283" />
								<span>F283</span>
								<br />
								<input id="chc67_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F284" />
								<span>F284</span>
								<br />
								<input id="chc68_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F285" />
								<span>F285</span>
								<br />
								<input id="chc69_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F286" />
								<span>F286</span>
								<br />
								<input id="chc70_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F287" />
								<span>F287</span>
								<br />
								<input id="chc71_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F288" />
								<span>F288</span>
								<br />
								<input id="chc72_Item4" type="checkbox" name="secmonfuncode"
									class="easyui-validatebox" value="F289" />
								<span>F289</span>
								<br />
							</div>
							<!--  <input type="text" id="secmonfuncode" name="secmonfuncode" class="easyui-validatebox"/>-->

						</td>
					</tr>
					<tr>
						<td>
							备注:
						</td>
						<td>
							<textarea rows="4" cols="20" id="cbackup" name="cbackup"></textarea>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<!-- 模型修改 -->
		<div id="uu" style="width: 500px; height: 400px; display: none;">
			<form id="updateForm" method="post">
				<br />
				<br />
				<table id="addModeTable" align="center" width="390">
					<tr>
						<td>
							<input type="hidden" id="cid2" name="cid2"
								class="easyui-validatebox" />
						</td>
					</tr>
					<tr>
						<td>
							<font color="red">*</font>计量终端模型编码:
						</td>
						<td>
							<input type="text" id="ccode2" name="ccode2"
								class="easyui-validatebox" />
						</td>
					</tr>
					<tr>
						<td>
							<font color="red">*</font>计量终端模型名称:
						</td>
						<td>
							<input type="text" id="cname2" name="cname2"
								class="easyui-validatebox" />
						</td>
					</tr>
					<tr>
						<td>
							<font color="red">*</font>计量能源类型:
						</td>
						<td>
							<select id="ctype2" name="ctype2" style="width: 156px;"></select>
						</td>
					</tr>
					<tr>
						<td>
							<font color="red">*</font>一类数据(FN):
						</td>
						<td>
							<select id="funcode2" name="funcode2" class="easyui-validatebox"
								style="width: 160px;" /></select>
							<div id="ss">
								<div style="color: #99BBE8; background: #fafafa; padding: 5px;">
									一类数据(FN):
								</div>
								<input id="all" type="checkbox" class="easyui-validatebox"
									value="all" />
								<span>全选</span>
								<br />
								<input id="chk1_Item" type="checkbox" name="funcode2"
									class="easyui-validatebox" value="F2" />
								<span>F2</span>
								<br />
								<input id="chk2_Item" type="checkbox" name="funcode2"
									class="easyui-validatebox" value="F7" />
								<span>F7</span>
								<br />
								<input id="chk3_Item" type="checkbox" name="funcode2"
									class="easyui-validatebox" value="F8" />
								<span>F8</span>
								<br />
								<input id="chk4_Item" type="checkbox" name="funcode2"
									class="easyui-validatebox" value="F9" />
								<span>F9</span>
								<br />
								<input id="chk5_Item" type="checkbox" name="funcode2"
									class="easyui-validatebox" value="F11" />
								<span>F11</span>
								<br />
								<input id="chk6_Item" type="checkbox" name="funcode2"
									class="easyui-validatebox" value="F25" />
								<span>F25</span>
								<br />
								<input id="chk7_Item" type="checkbox" name="funcode2"
									class="easyui-validatebox" value="F26" />
								<span>F26</span>
								<br />
								<input id="chk8_Item" type="checkbox" name="funcode2"
									class="easyui-validatebox" value="F27" />
								<span>F27</span>
								<br />
								<input id="chk9_Item" type="checkbox" name="funcode2"
									class="easyui-validatebox" value="F28" />
								<span>F28</span>
								<br />
								<input id="chk10_Item" type="checkbox" name="funcode2"
									class="easyui-validatebox" value="F29" />
								<span>F29</span>
								<br />
								<input id="chk11_Item" type="checkbox" name="funcode2"
									class="easyui-validatebox" value="F30" />
								<span>F30</span>
								<br />
								<input id="chk12_Item" type="checkbox" name="funcode2"
									class="easyui-validatebox" value="F41" />
								<span>F41</span>
								<br />
								<input id="chk13_Item" type="checkbox" name="funcode2"
									class="easyui-validatebox" value="F42" />
								<span>F42</span>
								<br />
								<input id="chk14_Item" type="checkbox" name="funcode2"
									class="easyui-validatebox" value="F43" />
								<span>F43</span>
								<br />
								<input id="chk15_Item" type="checkbox" name="funcode2"
									class="easyui-validatebox" value="F44" />
								<span>F44</span>
								<br />
								<input id="chk16_Item" type="checkbox" name="funcode2"
									class="easyui-validatebox" value="F45" />
								<span>F45</span>
								<br />
								<input id="chk17_Item" type="checkbox" name="funcode2"
									class="easyui-validatebox" value="F46" />
								<span>F46</span>
								<br />
								<input id="chk18_Item" type="checkbox" name="funcode2"
									class="easyui-validatebox" value="F47" />
								<span>F47</span>
								<br />
								<input id="chk19_Item" type="checkbox" name="funcode2"
									class="easyui-validatebox" value="F48" />
								<span>F48</span>
								<br />
								<input id="chk20_Item" type="checkbox" name="funcode2"
									class="easyui-validatebox" value="F57" />
								<span>F57</span>
								<br />
								<input id="chk21_Item" type="checkbox" name="funcode2"
									class="easyui-validatebox" value="F127" />
								<span>F127</span>
								<br />
								<input id="chk22_Item" type="checkbox" name="funcode2"
									class="easyui-validatebox" value="F128" />
								<span>F128</span>
								<br />
								<input id="chk23_Item" type="checkbox" name="funcode2"
									class="easyui-validatebox" value="F129" />
								<span>F129</span>
								<br />
								<input id="chk24_Item" type="checkbox" name="funcode2"
									class="easyui-validatebox" value="F130" />
								<span>F130</span>
								<br />
								<input id="chk25_Item" type="checkbox" name="funcode2"
									class="easyui-validatebox" value="F131" />
								<span>F131</span>
								<br />
								<input id="chk26_Item" type="checkbox" name="funcode2"
									class="easyui-validatebox" value="F132" />
								<span>F132</span>
								<br />
								<input id="chk27_Item" type="checkbox" name="funcode2"
									class="easyui-validatebox" value="F137" />
								<span>F137</span>
								<br />
								<input id="chk28_Item" type="checkbox" name="funcode2"
									class="easyui-validatebox" value="F138" />
								<span>F138</span>
								<br />
								<input id="chk29_Item" type="checkbox" name="funcode2"
									class="easyui-validatebox" value="F139" />
								<span>F139</span>
								<br />
								<input id="chk30_Item" type="checkbox" name="funcode2"
									class="easyui-validatebox" value="F140" />
								<span>F140</span>
								<br />
								<input id="chk31_Item" type="checkbox" name="funcode2"
									class="easyui-validatebox" value="F141" />
								<span>F141</span>
								<br />

							</div>
							<!--  <input type="text" id="funcode2" name="funcode2" class="easyui-validatebox"/> -->

						</td>
					</tr>
					<tr>
						<td>
							<font color="red">*</font>二类日曲线数据(FN):
						</td>
						<td>
							<select id="secfuncode2" name="secfuncode2"
								class="easyui-validatebox" style="width: 160px;" /></select>
							<div id="ss1">
								<div style="color: #99BBE8; background: #fafafa; padding: 5px;">
									二类日曲线数据(FN):
								</div>
								<input id="all11" type="checkbox" class="easyui-validatebox"
									value="all" />
								<span>全选</span>
								<br />
								<input id="chk1_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F5" />
								<span>F5</span>
								<br />
								<input id="chk2_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F6" />
								<span>F6</span>
								<br />
								<input id="chk3_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F7" />
								<span>F7</span>
								<br />
								<input id="chk4_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F8" />
								<span>F8</span>
								<br />
								<input id="chk5_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F21" />
								<span>F21</span>
								<br />
								<input id="chk6_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F22" />
								<span>F22</span>
								<br />
								<input id="chk7_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F23" />
								<span>F23</span>
								<br />
								<input id="chk8_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F24" />
								<span>F24</span>
								<br />
								<input id="chk9_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F26" />
								<span>F26</span>
								<br />
								<input id="chk10_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F27" />
								<span>F27</span>
								<br />
								<input id="chk11_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F29" />
								<span>F29</span>
								<br />
								<input id="chk12_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F32" />
								<span>F32</span>
								<br />
								<input id="chk13_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F34" />
								<span>F34</span>
								<br />
								<input id="chk14_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F35" />
								<span>F35</span>
								<br />
								<input id="chk15_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F40" />
								<span>F40</span>
								<br />
								<input id="chk16_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F45" />
								<span>F45</span>
								<br />
								<input id="chk17_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F46" />
								<span>F46</span>
								<br />
								<input id="chk18_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F49" />
								<span>F49</span>
								<br />
								<input id="chk19_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F51" />
								<span>F51</span>
								<br />
								<input id="chk20_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F81" />
								<span>F81</span>
								<br />
								<input id="chk21_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F82" />
								<span>F82</span>
								<br />
								<input id="chk22_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F83" />
								<span>F83</span>
								<br />
								<input id="chk23_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F84" />
								<span>F84</span>
								<br />
								<input id="chk24_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F85" />
								<span>F85</span>
								<br />
								<input id="chk25_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F86" />
								<span>F86</span>
								<br />
								<input id="chk26_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F87" />
								<span>F87</span>
								<br />
								<input id="chk27_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F88" />
								<span>F88</span>
								<br />
								<input id="chk28_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F89" />
								<span>F89</span>
								<br />
								<input id="chk29_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F90" />
								<span>F90</span>
								<br />
								<input id="chk30_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F91" />
								<span>F91</span>
								<br />
								<input id="chk31_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F92" />
								<span>F92</span>
								<br />
								<input id="chk32_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F93" />
								<span>F93</span>
								<br />
								<input id="chk33_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F94" />
								<span>F94</span>
								<br />
								<input id="chk34_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F95" />
								<span>F95</span>
								<br />
								<input id="chk35_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F97" />
								<span>F97</span>
								<br />
								<input id="chk36_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F98" />
								<span>F98</span>
								<br />
								<input id="chk37_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F99" />
								<span>F99</span>
								<br />
								<input id="chk38_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F100" />
								<span>F100</span>
								<br />
								<input id="chk39_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F101" />
								<span>F101</span>
								<br />
								<input id="chk40_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F102" />
								<span>F102</span>
								<br />
								<input id="chk41_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F103" />
								<span>F103</span>
								<br />
								<input id="chk42_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F104" />
								<span>F104</span>
								<br />
								<input id="chk43_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F105" />
								<span>F105</span>
								<br />
								<input id="chk44_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F106" />
								<span>F106</span>
								<br />
								<input id="chk45_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F107" />
								<span>F107</span>
								<br />
								<input id="chk46_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F108" />
								<span>F108</span>
								<br />
								<input id="chk47_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F109" />
								<span>F109</span>
								<br />
								<input id="chk48_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F110" />
								<span>F110</span>
								<br />
								<input id="chk49_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F111" />
								<span>F111</span>
								<br />
								<input id="chk50_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F112" />
								<span>F112</span>
								<br />
								<input id="chk51_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F145" />
								<span>F145</span>
								<br />
								<input id="chk52_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F146" />
								<span>F146</span>
								<br />
								<input id="chk53_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F147" />
								<span>F147</span>
								<br />
								<input id="chk54_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F148" />
								<span>F148</span>
								<br />
								<input id="chk55_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F153" />
								<span>F153</span>
								<br />
								<input id="chk56_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F161" />
								<span>F161</span>
								<br />
								<input id="chk57_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F162" />
								<span>F162</span>
								<br />
								<input id="chk58_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F163" />
								<span>F163</span>
								<br />
								<input id="chk59_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F164" />
								<span>F164</span>
								<br />
								<input id="chk60_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F177" />
								<span>F177</span>
								<br />
								<input id="chk61_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F178" />
								<span>F178</span>
								<br />
								<input id="chk62_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F179" />
								<span>F179</span>
								<br />
								<input id="chk63_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F180" />
								<span>F180</span>
								<br />
								<input id="chk64_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F281" />
								<span>F281</span>
								<br />
								<input id="chk65_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F282" />
								<span>F282</span>
								<br />
								<input id="chk66_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F283" />
								<span>F283</span>
								<br />
								<input id="chk67_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F284" />
								<span>F284</span>
								<br />
								<input id="chk68_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F285" />
								<span>F285</span>
								<br />
								<input id="chk69_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F286" />
								<span>F286</span>
								<br />
								<input id="chk70_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F287" />
								<span>F287</span>
								<br />
								<input id="chk71_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F288" />
								<span>F288</span>
								<br />
								<input id="chk72_Items" type="checkbox" name="secfuncode2"
									class="easyui-validatebox" value="F289" />
								<span>F289</span>
								<br />
							</div>
							<!--  <input type="text" id="secfuncode2" name="secfuncode2" class="easyui-validatebox"/>-->
						</td>
					</tr>
					<tr>
						<td>
							<font color="red">*</font>二类日冻结数据:
						</td>
						<td>
							<select id="secdayfuncode2" class="easyui-validatebox"
								data-options="width:160" name="secdayfuncode2"></select>
							<div id="ss2">
								<div style="color: #99BBE8; background: #fafafa; padding: 5px;">
									二类日冻结数据(FN)
								</div>
								<input id="all12" type="checkbox" class="easyui-validatebox"
									value="all3" />
								<span>全选</span>
								<br />
								<input id="che1_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F5" />
								<span>F5</span>
								<br />
								<input id="che2_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F6" />
								<span>F6</span>
								<br />
								<input id="che3_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F7" />
								<span>F7</span>
								<br />
								<input id="che4_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F8" />
								<span>F8</span>
								<br />
								<input id="che5_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F21" />
								<span>F21</span>
								<br />
								<input id="che6_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F22" />
								<span>F22</span>
								<br />
								<input id="che7_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F23" />
								<span>F23</span>
								<br />
								<input id="che8_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F24" />
								<span>F24</span>
								<br />
								<input id="che9_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F26" />
								<span>F26</span>
								<br />
								<input id="che10_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F27" />
								<span>F27</span>
								<br />
								<input id="che11_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F29" />
								<span>F29</span>
								<br />
								<input id="che12_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F32" />
								<span>F32</span>
								<br />
								<input id="che13_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F34" />
								<span>F34</span>
								<br />
								<input id="che14_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F35" />
								<span>F35</span>
								<br />
								<input id="che15_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F40" />
								<span>F40</span>
								<br />
								<input id="che16_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F45" />
								<span>F45</span>
								<br />
								<input id="che17_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F46" />
								<span>F46</span>
								<br />
								<input id="che18_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F49" />
								<span>F49</span>
								<br />
								<input id="che19_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F51" />
								<span>F51</span>
								<br />
								<input id="che20_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F81" />
								<span>F81</span>
								<br />
								<input id="che21_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F82" />
								<span>F82</span>
								<br />
								<input id="che22_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F83" />
								<span>F83</span>
								<br />
								<input id="che23_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F84" />
								<span>F84</span>
								<br />
								<input id="che24_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F85" />
								<span>F85</span>
								<br />
								<input id="che25_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F86" />
								<span>F86</span>
								<br />
								<input id="che26_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F87" />
								<span>F87</span>
								<br />
								<input id="che27_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F88" />
								<span>F88</span>
								<br />
								<input id="che28_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F89" />
								<span>F89</span>
								<br />
								<input id="che29_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F90" />
								<span>F90</span>
								<br />
								<input id="che30_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F91" />
								<span>F91</span>
								<br />
								<input id="che31_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F92" />
								<span>F92</span>
								<br />
								<input id="che32_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F93" />
								<span>F93</span>
								<br />
								<input id="che33_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F94" />
								<span>F94</span>
								<br />
								<input id="che34_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F95" />
								<span>F95</span>
								<br />
								<input id="che35_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F97" />
								<span>F97</span>
								<br />
								<input id="che36_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F98" />
								<span>F98</span>
								<br />
								<input id="che37_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F99" />
								<span>F99</span>
								<br />
								<input id="che38_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F100" />
								<span>F100</span>
								<br />
								<input id="che39_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F101" />
								<span>F101</span>
								<br />
								<input id="che40_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F102" />
								<span>F102</span>
								<br />
								<input id="che41_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F103" />
								<span>F103</span>
								<br />
								<input id="che42_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F104" />
								<span>F104</span>
								<br />
								<input id="che43_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F105" />
								<span>F105</span>
								<br />
								<input id="che44_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F106" />
								<span>F106</span>
								<br />
								<input id="che45_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F107" />
								<span>F107</span>
								<br />
								<input id="che46_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F108" />
								<span>F108</span>
								<br />
								<input id="che47_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F109" />
								<span>F109</span>
								<br />
								<input id="che48_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F110" />
								<span>F110</span>
								<br />
								<input id="che49_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F111" />
								<span>F111</span>
								<br />
								<input id="che50_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F112" />
								<span>F112</span>
								<br />
								<input id="che51_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F145" />
								<span>F145</span>
								<br />
								<input id="che52_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F146" />
								<span>F146</span>
								<br />
								<input id="che53_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F147" />
								<span>F147</span>
								<br />
								<input id="che54_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F148" />
								<span>F148</span>
								<br />
								<input id="che55_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F153" />
								<span>F153</span>
								<br />
								<input id="che56_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F161" />
								<span>F161</span>
								<br />
								<input id="che57_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F162" />
								<span>F162</span>
								<br />
								<input id="che58_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F163" />
								<span>F163</span>
								<br />
								<input id="che59_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F164" />
								<span>F164</span>
								<br />
								<input id="che60_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F177" />
								<span>F177</span>
								<br />
								<input id="che61_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F178" />
								<span>F178</span>
								<br />
								<input id="che62_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F179" />
								<span>F179</span>
								<br />
								<input id="che63_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F180" />
								<span>F180</span>
								<br />
								<input id="che64_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F281" />
								<span>F281</span>
								<br />
								<input id="che65_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F282" />
								<span>F282</span>
								<br />
								<input id="che66_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F283" />
								<span>F283</span>
								<br />
								<input id="che67_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F284" />
								<span>F284</span>
								<br />
								<input id="che68_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F285" />
								<span>F285</span>
								<br />
								<input id="che69_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F286" />
								<span>F286</span>
								<br />
								<input id="che70_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F287" />
								<span>F287</span>
								<br />
								<input id="che71_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F288" />
								<span>F288</span>
								<br />
								<input id="che72_Items1" type="checkbox" name="secdayfuncode2"
									class="easyui-validatebox" value="F289" />
								<span>F289</span>
								<br />
							</div>
							<!--  <input type="text" id="secdayfuncode2" name="secdayfuncode2" class="easyui-validatebox"/>-->
						</td>
					</tr>
					<tr>
						<td>
							<font color="red">*</font>二类月冻结数据:
						</td>
						<td>
							<select id="secmonfuncode2" class="easyui-validatebox"
								data-options="width:160" name="secmonfuncode2"></select>
							<div id="ss3">
								<div style="color: #99BBE8; background: #fafafa; padding: 5px;">
									二类月冻结数据(FN)
								</div>
								<input id="all13" type="checkbox" class="easyui-validatebox"
									value="all13" />
								<span>全选</span>
								<br />
								<input id="chc1_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F5" />
								<span>F5</span>
								<br />
								<input id="chc2_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F6" />
								<span>F6</span>
								<br />
								<input id="chc3_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F7" />
								<span>F7</span>
								<br />
								<input id="chc4_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F8" />
								<span>F8</span>
								<br />
								<input id="chc5_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F21" />
								<span>F21</span>
								<br />
								<input id="chc6_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F22" />
								<span>F22</span>
								<br />
								<input id="chc7_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F23" />
								<span>F23</span>
								<br />
								<input id="chc8_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F24" />
								<span>F24</span>
								<br />
								<input id="chc9_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F26" />
								<span>F26</span>
								<br />
								<input id="chc10_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F27" />
								<span>F27</span>
								<br />
								<input id="chc11_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F29" />
								<span>F29</span>
								<br />
								<input id="chc12_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F32" />
								<span>F32</span>
								<br />
								<input id="chc13_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F34" />
								<span>F34</span>
								<br />
								<input id="chc14_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F35" />
								<span>F35</span>
								<br />
								<input id="chc15_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F40" />
								<span>F40</span>
								<br />
								<input id="chc16_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F45" />
								<span>F45</span>
								<br />
								<input id="chc17_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F46" />
								<span>F46</span>
								<br />
								<input id="chc18_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F49" />
								<span>F49</span>
								<br />
								<input id="chc19_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F51" />
								<span>F51</span>
								<br />
								<input id="chc20_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F81" />
								<span>F81</span>
								<br />
								<input id="chc21_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F82" />
								<span>F82</span>
								<br />
								<input id="chc22_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F83" />
								<span>F83</span>
								<br />
								<input id="chc23_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F84" />
								<span>F84</span>
								<br />
								<input id="chc24_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F85" />
								<span>F85</span>
								<br />
								<input id="chc25_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F86" />
								<span>F86</span>
								<br />
								<input id="chc26_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F87" />
								<span>F87</span>
								<br />
								<input id="chc27_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F88" />
								<span>F88</span>
								<br />
								<input id="chc28_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F89" />
								<span>F89</span>
								<br />
								<input id="chc29_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F90" />
								<span>F90</span>
								<br />
								<input id="chc30_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F91" />
								<span>F91</span>
								<br />
								<input id="chc31_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F92" />
								<span>F92</span>
								<br />
								<input id="chc32_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F93" />
								<span>F93</span>
								<br />
								<input id="chc33_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F94" />
								<span>F94</span>
								<br />
								<input id="chc34_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F95" />
								<span>F95</span>
								<br />
								<input id="chc35_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F97" />
								<span>F97</span>
								<br />
								<input id="chc36_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F98" />
								<span>F98</span>
								<br />
								<input id="chc37_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F99" />
								<span>F99</span>
								<br />
								<input id="chc38_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F100" />
								<span>F100</span>
								<br />
								<input id="chc39_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F101" />
								<span>F101</span>
								<br />
								<input id="chc40_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F102" />
								<span>F102</span>
								<br />
								<input id="chc41_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F103" />
								<span>F103</span>
								<br />
								<input id="chc42_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F104" />
								<span>F104</span>
								<br />
								<input id="chc43_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F105" />
								<span>F105</span>
								<br />
								<input id="chc44_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F106" />
								<span>F106</span>
								<br />
								<input id="chc45_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F107" />
								<span>F107</span>
								<br />
								<input id="chc46_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F108" />
								<span>F108</span>
								<br />
								<input id="chc47_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F109" />
								<span>F109</span>
								<br />
								<input id="chc48_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F110" />
								<span>F110</span>
								<br />
								<input id="chc49_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F111" />
								<span>F111</span>
								<br />
								<input id="chc50_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F112" />
								<span>F112</span>
								<br />
								<input id="chc51_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F145" />
								<span>F145</span>
								<br />
								<input id="chc52_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F146" />
								<span>F146</span>
								<br />
								<input id="chc53_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F147" />
								<span>F147</span>
								<br />
								<input id="chc54_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F148" />
								<span>F148</span>
								<br />
								<input id="chc55_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F153" />
								<span>F153</span>
								<br />
								<input id="chc56_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F161" />
								<span>F161</span>
								<br />
								<input id="chc57_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F162" />
								<span>F162</span>
								<br />
								<input id="chc58_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F163" />
								<span>F163</span>
								<br />
								<input id="chc59_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F164" />
								<span>F164</span>
								<br />
								<input id="chc60_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F177" />
								<span>F177</span>
								<br />
								<input id="chc61_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F178" />
								<span>F178</span>
								<br />
								<input id="chc62_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F179" />
								<span>F179</span>
								<br />
								<input id="chc63_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F180" />
								<span>F180</span>
								<br />
								<input id="chc64_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F281" />
								<span>F281</span>
								<br />
								<input id="chc65_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F282" />
								<span>F282</span>
								<br />
								<input id="chc66_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F283" />
								<span>F283</span>
								<br />
								<input id="chc67_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F284" />
								<span>F284</span>
								<br />
								<input id="chc68_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F285" />
								<span>F285</span>
								<br />
								<input id="chc69_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F286" />
								<span>F286</span>
								<br />
								<input id="chc70_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F287" />
								<span>F287</span>
								<br />
								<input id="chc71_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F288" />
								<span>F288</span>
								<br />
								<input id="chc72_Items2" type="checkbox" name="secmonfuncode2"
									class="easyui-validatebox" value="F289" />
								<span>F289</span>
								<br />
							</div>
							<!--  <input type="text" id="secmonfuncode2" name="secmonfuncode2" class="easyui-validatebox"/>-->
						</td>
					</tr>
					<tr>
						<td>
							备注:
						</td>
						<td>
							<textarea rows="4" cols="20" id="cbackup2" name="cbackup2"></textarea>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<!-- ****************************************************************************************************** -->
		<!-- 测点-->
		<div align="left" id="three_top">
			<form>
				<table id="tbls1" align="left">
					<tr>
						<td>
							&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
							<input type="button" value="新建测点" class="btnA" id="btnA"
								name="btnA" style="cursor: pointer;"
								onmousemove=this.style.color onmouseout=this.style.color />
							<!-- 添加测点 -->
							<script>
							$(function(){
								$("#btnA").click(function(){
									$('#fpid').form('clear');
									var row = $('#gd').datagrid('getSelected');
									$("#selectes1").val();
									$("#ccid").val(row.id);
									var rodid = row.id;
									var s = row.ctmNames;
									//alert(s);
									$('#selectes1').val(s);
									//alert("#dp");
									$('#dp').show();
									$('#dp').dialog({
										title : '新建测点',
										modal : true,
										draggable : true,
										buttons : [{
											text : '',
											iconCls : 'icon-ok',
											handler : function(){
												$('#fpid').form({
													url : "toJlzdPoints.action?m=toAddPoints",
													dataType : "json",
													async : false,
													onSubmit : checkpoint,
													success : function(data){
														if (data == "{}") {
															$.messager.alert("提示", "添加失败!");
														} else {
															$.messager.alert("提示", "添加成功!");
															$('#dp').dialog('close');
															var row = $('#gd').datagrid('getSelected');
															var rowid = row.id;
															GetDataC(rowid)
														}
													}
												});
												GetData();
												$('#fpid').submit();
											}
										}]
									});
							});	
						});
						</script>
							<!--添加测点   进行表单验证-->
							<script>
				   function checkpoint(){
				   		if ($.trim($('#pcode').val()) == "") {
							$.messager.alert("提示", "编码不能为空!");
							$('#pcode').focus();
							return false;
						}
						if ($.trim($('#pname').val()) == "") {
							$.messager.alert("提示", "名称不能为空!");
							$('#pname').focus();
							return false;
						}
						if ($.trim($('#pname').val()) == "") {
							$.messager.alert("提示", "名称不能为空!");
							$('#pname').focus();
							return false;
						}
					}
				</script>
						</td>
						<td>
							&emsp;&emsp;&emsp;
							<input type="button" value="修改" class="btnB" id="btnB"
								name="btnB" style="cursor: pointer;"
								onmousemove=this.style.color onmouseout=this.style.color />
						</td>
						<td>
							&emsp;&emsp;&emsp;
							<input type="button" value="删除" class="btnC" id="btnC"
								name="btnC" style="cursor: pointer;"
								onmousemove=this.style.color onmouseout=this.style.color />
						</td>
					</tr>
				</table>
			</form>
		</div>


		<!-- 测点添加 -->
		<div id="dp" style="width: 750px; height: 500px; display: none;">
			<form id="fpid" method="post">
				<br />
				<br />
				<table id="addPoinTable" align="center" width="650">
					<tr>
						<td>
							模型名称:
						</td>
						<td>
							<input type="text" id="selectes1" disabled=""
								style="width: 155px;" />
							<input type="hidden" name="ccid" id="ccid" value="" />
						</td>
						<td>
							<!--  <font color="red">*</font>-->
							是否需要存储:
						</td>
						<td>
							<select id="pisave" name="pisave" class="easyui-validatebox">
								<option value="是" selected="selected">
									是
								</option>
								<option value="否">
									否
								</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							<input type="hidden" id="pid" name="pid"
								class="easyui-validatebox" />
						</td>
					</tr>
					<tr>
						<td>
							<font color="red">*</font>编码:
						</td>
						<td>
							<input type="text" id="pcode" name="pcode"
								class="easyui-validatebox" />
						</td>
						<td>
							<!--  <font color="red">*</font>-->
							类型:
						</td>
						<td>
							<select id="ptype" name="ptype" class="easyui-validatebox">
								<option value="0" selected="selected">
									模拟量
								</option>
								<option value="1">
									开关量
								</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							<font color="red">*</font>名称:
						</td>
						<td>
							<input type="text" id="pname" name="pname"
								class="easyui-validatebox" />
						</td>
						<td>
							<!--  <font color="red">*</font>-->
							统计类型:
						</td>
						<td>
							<select id="psavtyp" name="psavtyp" class="easyui-validatebox">
								<option value="0" selected="selected">
									累计
								</option>
								<option value="1">
									瞬时
								</option>
								<option value="2">
									统计
								</option>
								<option value="3">
									状态
								</option>
								<option value="4">
									事件
								</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							<font color="red">*</font>单位:
						</td>
						<td>
							<input type="text" id="punit" name="punit"
								class="easyui-validatebox" />
						</td>
						<td>
							<!--  <font color="red">*</font>-->
							存储周期:
						</td>
						<td>
							<select id="psavtim" name="psavtim" class="easyui-validatebox">
								<option value="15分钟" selected="selected">
									15分钟
								</option>
								<option value="30分钟">
									30分钟
								</option>
								<option value="1小时">
									1小时
								</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							PLC地址:
						</td>
						<td>
							<input type="text" id="plcaddress" name="plcaddress"
								class="easyui-validatebox" />
						</td>
						<td>
							<!--  <font color="red">*</font>-->
							存储方式:
						</td>
						<td>
							<select id="psavfor" name="psavfor" class="easyui-validatebox">
								<option value="和值" selected="selected">
									和值
								</option>
								<option value="差值">
									差值
								</option>
								<option value="最大值">
									最大值
								</option>
								<option value="原始值">
									原始值
								</option>
								<option value="平均值">
									平均值
								</option>
							</select>

	        	 			
						</td>
					</tr>
					<tr>
						<td>
							MOD地址:
						</td>
						<td>
							<input type="text" id="modaddress" name="modaddress"
								class="easyui-validatebox" />
						</td>
						<td>
							是否校验:
						</td>
						<td>
							<input id="isChecking" name="isChecking"
								class="easyui-validatebox" onclick=ruleded();;; />
						</td>
						<td>
							<input style="display: none;" id="isCheckingID"
								name="isCheckingID" class="easyui-validatebox"
								onclick=ruleded();;; />
						</td>
					</tr>
					<tr>
						<td>
							上限:
						</td>
						<td>
							<input type="text" id="pup" name="pup" class="easyui-validatebox" />
						</td>

						<td>
							下限:
						</td>
						<td>
							<input type="text" id="pdown" name="pdown"
								class="easyui-validatebox" />
						</td>

					</tr>
					<tr>
						<td>
							上上限:
						</td>
						<td>
							<input type="text" id="pupup" name="pupup"
								class="easyui-validatebox" />
						</td>
						<td>
							下下限:
						</td>
						<td>
							<input type="text" id="pdowndo" name="pdowndo"
								class="easyui-validatebox" />
						</td>
					</tr>
					<tr>
						<td>
							公式:
						</td>
						<td>
							<input type="text" id="pformul" name="pformul"
								class="easyui-validatebox" />
						</td>
						<td>
							排序:
						</td>
						<td>
							<input type="text" id="porder" name="porder"
								class="easyui-validatebox" />
						</td>
					</tr>
					<tr>
						<td>
							备注:
						</td>
						<td rowspan="3" colspan="3">
							<textarea rows="5" cols="60" id="pbackup" name="pbackup"></textarea>
						</td>
					</tr>
				</table>

				<div id="divChedian" style="display: none;">
					编码：
					<input type="text" id="txtCode" />
					<input type="button" id="btnFind" value="搜索" />
					<table id="mygdfind" class="easyui-datagrid"
				style="width: 480px; height: 390px" toolbar="#toolbar"
				rownumbers="true" fitColumns="true" singleSelect="true">
			</table>
				</div>
				<div id="divUnit" style="display: none;">
					单位：
					<input type="text" id="txtCodeu" />
					<input type="button" id="btnFindu" value="搜索" />
					<table id="mygddanwei" class="easyui-datagrid"
				style="width: 480px; height: 390px" toolbar="#toolbar"
				rownumbers="true" fitColumns="true" singleSelect="true">
			</table>
				</div>

			</form>
		</div>
		<!-- ****************************************************************************************************************************************************** -->
		<!-- I：选择规则 -->
		<div id="RulDiv" style="display: none;">
			<table style="font-size: 12px; font-style: '幼圆'">
				<tr>
					<td>
						&emsp;&emsp;&emsp;&emsp;&emsp;
						<img src="/emcc-web/image/poms-business/opens.png"
							style="cursor: pointer" onclick=addRule();;; />
						<span style="cursor: pointer" onclick=addRule();>添加规则</span>
					</td>
					<td>
						&emsp;&emsp;
						<img src="/emcc-web/image/poms-business/dbsns.png"
							style="cursor: pointer" onclick=deleteRule();;; />
						<span style="cursor: pointer" onclick=deleteRule();>删除规则</span>
					</td>
					<td>
						&emsp;&emsp;
						<img src="/emcc-web/image/poms-business/glamp.png"
							style="cursor: pointer" onclick=gin();;; />
						<span style="cursor: pointer" onclick=gin();>添加条件</span>
					</td>
				</tr>
			</table>
			<table id="RulTb" class="easyui-datagrid"
				style="width: 800px; height: 370px" toolbar="#toolbar"
				rownumbers="true" fitColumns="true" singleSelect="true">
			</table>
		</div>
		<!-- I.A：添加规则 -->
		<div id="addRuleDiv" style="display: none;">
			<form id="addRuleForm" method="post">
				<table style="font-size: 12px; font-style: '幼圆'">
					<tr>
						<td>
							<font color="red">*</font>规则编码：
						</td>
						<td>
							<input id="ruleCode" name="ruleCode" />
						</td>
					</tr>
					<tr>
						<td>
							<font color="red">*</font>规则名称：
						</td>
						<td>
							<input id="ruleName" name="ruleName" />
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;规则描述：
						</td>
						<td>
							<textarea rows="3" cols="17" id="ruleCdms" name="ruleCdms"></textarea>
					</tr>
				</table>
			</form>
		</div>
		<!-- II：数据校验 -->
		<div id="isCheckedDiv" style="display: none;">
			<table style="font-size: 12px; font-style: '幼圆'">
				<tr>
					<td>
						&emsp;&emsp;&emsp;&emsp;
						<font id="fRule" color="red"></font>
					</td>
					<td>
						&emsp;&emsp;&emsp;
						<img src="/emcc-web/image/poms-business/opens.png"
							style="cursor: pointer" onclick=addACheck();;; />
						<span id="befor" style="cursor: pointer" onclick=addACheck();>添加校验条件</span>
					</td>
					<td>
						&emsp;&emsp;
						<img src="/emcc-web/image/poms-business/dbsns.png"
							style="cursor: pointer" onclick=deleteACheck();;; />
						<span id="after" style="cursor: pointer" onclick=deleteACheck();>删除校验条件</span>
					</td>
				</tr>
			</table>
			<table id="isCheckedTb" class="easyui-datagrid"
				style="width: 800px; height: 370px" toolbar="#toolbar"
				rownumbers="true" fitColumns="true" singleSelect="true">
			</table>
		</div>

		<!-- III：添加前/后置条件-->
		<div id="addChecking" style="display: none;">
			<input id="iddes" style="display: none;" />
			<input id="keyiddes" style="display: none;" />
			<form method="post" id="fffjkl">
				<table style="font-size: 12px; font-style: '幼圆'; width: 800px"
					border="0">
					<tr>
						<td>
							<font color="red">*</font>表达式：
						</td>
						<td>
							<textarea readonly="readonly" id="expression" rows="0" cols="25"></textarea>
						</td>
						<td>
							<input id="ConditionVS" class="bds" onclick=inputngA(this);;;
								type="button" value="(" style="width: 45" />
							<input id="ConditionVS" class="bds" onclick=inputngA(this);;;
								type="button" value="待求值" style="width: 45" />
							<input id="ConditionVS" class="bds" onclick=inputngA(this);;;
								type="button" value=")" style="width: 45" />
							<input id="ConditionVS" class="bds" onclick=inputngA(this);;;
								type="button" value="平均值" style="width: 45" />
							<input id="ConditionVS" class="bds" onclick=inputngA(this);;;
								type="button" value="上一值" style="width: 45" />
							<input id="ConditionVS" class="bds" onclick=inputngA(this);;;
								type="button" value="+" />
							<input id="ConditionVS" class="bds" onclick=inputngA(this);;;
								type="button" value="-" />
							<input id="ConditionVS" class="bds" onclick=inputngA(this);;;
								type="button" value="*" />
							<input id="ConditionVS" class="bds" onclick=inputngA(this);;;
								type="button" value="/" />
							<input id="ConditionVS" class="bds" onclick=inputngA(this);;;
								type="button" value="%" />
						</td>
						<td align="right">
							<input type="button" onclick=backedsA();;; value="回删" />
							<input type="button" onclick=clearedsA();;; value="清空" />
						</td>
					</tr>
					<tr>
						<td colspan="4">
							&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
							<input id="ConditionVS" class="bds" onclick=inputngA(this);;;
								type="button" value="0" />
							<input id="ConditionVS" class="bds" onclick=inputngA(this);;;
								type="button" value="1" />
							<input id="ConditionVS" class="bds" onclick=inputngA(this);;;
								type="button" value="2" />
							<input id="ConditionVS" class="bds" onclick=inputngA(this);;;
								type="button" value="3" />
							<input id="ConditionVS" class="bds" onclick=inputngA(this);;;
								type="button" value="4" />
							<input id="ConditionVS" class="bds" onclick=inputngA(this);;;
								type="button" value="5" />
							<input id="ConditionVS" class="bds" onclick=inputngA(this);;;
								type="button" value="6" />
							<input id="ConditionVS" class="bds" onclick=inputngA(this);;;
								type="button" value="7" />
							<input id="ConditionVS" class="bds" onclick=inputngA(this);;;
								type="button" value="8" />
							<input id="ConditionVS" class="bds" onclick=inputngA(this);;;
								type="button" value="9" />
							<input id="ConditionVS" class="bds" onclick=inputngA(this);;;
								type="button" value="." />
						</td>
					</tr>
					<tr>
						<td>
							<font color="red">*</font>运算符：
						</td>
						<td>
							<textarea readonly="readonly" id="operator" rows="0" cols="25"></textarea>
						</td>
						<td>
							<input id="ConditionVS" class="ysf" onclick=inputngB(this);;;
								type="button" value=">" />
							<input id="ConditionVS" class="ysf" onclick=inputngB(this);;;
								type="button" value="&lt;" />
							<input id="ConditionVS" class="ysf" onclick=inputngB(this);;;
								type="button" value="=" />
							<input id="ConditionVS" class="ysf" onclick=inputngB(this);;;
								type="button" value=">=" />
							<input id="ConditionVS" class="ysf" onclick=inputngB(this);;;
								type="button" value="&lt;=" />
							<input id="ConditionVS" class="ysf" onclick=inputngB(this);;;
								type="button" value="≠" />
						</td>
						<td align="right">
							<input type="button" onclick=backedsB();;; value="回删" />
							<input type="button" onclick=clearedsB();;; value="清空" />
						</td>
					</tr>
					<tr>
						<td>
							<font color="red">*</font>期望值：
						</td>
						<td>
							<textarea readonly="readonly" id="wantvalue" rows="0" cols="25"></textarea>
						</td>
						<td>
							<input id="ConditionVS" class="qwz" onclick=inputngC(this);;;
								type="button" value="0" />
							<input id="ConditionVS" class="qwz" onclick=inputngC(this);;;
								type="button" value="1" />
							<input id="ConditionVS" class="qwz" onclick=inputngC(this);;;
								type="button" value="2" />
							<input id="ConditionVS" class="qwz" onclick=inputngC(this);;;
								type="button" value="3" />
							<input id="ConditionVS" class="qwz" onclick=inputngC(this);;;
								type="button" value="4" />
							<input id="ConditionVS" class="qwz" onclick=inputngC(this);;;
								type="button" value="5" />
							<input id="ConditionVS" class="qwz" onclick=inputngC(this);;;
								type="button" value="6" />
							<input id="ConditionVS" class="qwz" onclick=inputngC(this);;;
								type="button" value="7" />
							<input id="ConditionVS" class="qwz" onclick=inputngC(this);;;
								type="button" value="8" />
							<input id="ConditionVS" class="qwz" onclick=inputngC(this);;;
								type="button" value="9" />
							<input id="ConditionVS" class="qwz" onclick=inputngC(this);;;
								type="button" value="." />
							<input id="ConditionVS" class="qwz" onclick=inputngC(this);;;
								type="button" value="-" />
						</td>
						<td align="right">
							<input type="button" onclick=backedsC();;; value="回删" />
							<input type="button" onclick=clearedsC();;; value="清空" />
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;逻辑关系：
						</td>
						<td>
							<textarea readonly="readonly" id="conditions" rows="0" cols="25"></textarea>
						</td>
						<td>
							<input id="ConditionVS" class="gx" onclick=inputngD(this);;;
								type="button" style="width: 35" value="AND" />
							<input id="ConditionVS" class="gx" onclick=inputngD(this);;;
								type="button" style="width: 35" value="OR" />
						</td>
						<td align="right">
							<input type="button" onclick=backedsD();;; value="回删" />
							<input type="button" onclick=clearedsD();;; value="清空" />
						</td>
					</tr>
					<tr>
						<td>
							<font color="red">*</font>条件排序：
						</td>
						<td>
							<input id="ordereds" />
						</td>
					</tr>
				</table>
			</form>
		</div>

		<script type="text/javascript">
	//*************************
	//规则表格
	//*************************
	var bds = new Array();
	var ysf = new Array();
	var qwz = new Array();
	var gx = new Array();

	function inputngA(t) {
		bds.push(t.value);
		refreshA();
	}
	function inputngB(t) {
		ysf.push(t.value);
		refreshB();
	}
	function inputngC(t) {
		qwz.push(t.value);
		refreshC();
	}
	function inputngD(t) {
		gx.push(t.value);
		refreshD();
	}
	//公式刷新
	function refreshA() {
		$('#fffjkl').form('clear');
		//$("#fffjkl").val("");
		for ( var k = 0; k < bds.length; k++) {
			if (bds[k] == "待求值") { //待求值由编码值改为X
				//bds[k] = "{"+$('#pcode').val()+"}";
				//if($('#pcode').val()==""||$('#pcode').val()==null){
				//	bds[k] = "{"+$('#pcodes').val()+"}";
				//}
				bds[k] = "{" + "X" + "}";
			} else if (bds[k] == "平均值") {
				bds[k] = "{" + "Average" + "}";
			} else if (bds[k] == "上一值") {
				bds[k] = "{" + "BeVal" + "}";
			}
			$("#expression").val($("#expression").val() + bds[k]);
		}
	}
	function refreshB() {
		$("#operator").val("");
		for ( var k = 0; k < ysf.length; k++) {
			$("#operator").val($("#operator").val() + ysf[k]);
		}
	}
	function refreshC() {
		$("#wantvalue").val("");
		for ( var k = 0; k < qwz.length; k++) {
			$("#wantvalue").val($("#wantvalue").val() + qwz[k]);
		}
	}
	function refreshD() {
		$("#conditions").val("");
		for ( var k = 0; k < gx.length; k++) {
			$("#conditions").val($("#conditions").val() + gx[k]);
		}
	}
	//公式清空
	function clearedsA() {
		$("#expression").val("");
		bds = [];
	}
	function clearedsB() {
		$("#operator").val("");
		ysf = [];
	}
	function clearedsC() {
		$("#wantvalue").val("");
		qwz = [];
	}
	function clearedsD() {
		$("#conditions").val("");
		gx = [];
	}
	//公式后退
	function backedsA() {
		bds.pop();
		refreshA();
	}
	function backedsB() {
		ysf.pop();
		refreshB();
	}
	function backedsC() {
		qwz.pop();
		refreshC();
	}
	function backedsD() {
		gx.pop();
		refreshD();
	}

	function ruleded() {
		if ($.trim($('#pcode').val()) == "" && $.trim($('#pcodes').val()) == "") {
			$.messager.alert("提示", "校验之前，编码不能为空!");
			$('#pcode').focus();
			return false;
		} else {
			$("#RulDiv").show();
			GetFindDataRule();
			$("#RulDiv")
					.dialog(
							{
								title : '数据规则',
								modal : true,
								draggable : true,
								width : 820,
								height : 470,
								buttons : [ {
									text : '确定',
									handler : function() {
										document.getElementById('RulDiv').style.display = 'none';
										$('#RulDiv').dialog('close');
										var gdnode = $('#RulTb').datagrid(
												"getSelections");
										var ids = [];
										var idd = [];
										for ( var i = 0; i < gdnode.length; i++) {
											ids
													.push(gdnode[i].verificationName);
											idd.push(gdnode[i].id);
										}
										for ( var j = 0; j <= ids.length; j++) {
											$("#isChecking").html("");
											var anb = ids + ",";
											var ss = anb.substring(0,
													anb.length - 1)
											document
													.getElementById('isChecking').innerText = ss;
											document
													.getElementById('UpChecking').innerText = ss;
										}
										for ( var j = 0; j <= ids.length; j++) {
											$("#isCheckingID").html("");
											var ans = idd + ",";
											var sj = ans.substring(0,
													ans.length - 1)
											document
													.getElementById('isCheckingID').innerText = sj;
											document
													.getElementById('UpCheckingID').innerText = sj;
										}
									}
								} ]
							});
		}
	}
	function addRule() {
		$("#addRuleDiv").show();
		$('#addRuleForm').form('clear');
		$("#addRuleDiv").dialog( {
			title : '添加规则',
			modal : true,
			draggable : true,
			width : 320,
			height : 200,
			buttons : [ {
				text : '确定',
				handler : function() {
					$('#addRuleForm').form( {
						url : "toJlzdPoints.action?m=toaddRuled",
						dataType : "json",
						async : false,
						onSubmit : function() {
							if ($.trim($('#ruleCode').val()) == "") {
								$.messager.alert("提示", "规则编码不能为空");
								$('#ruleCode').focus();
								return false;
							}
							if ($.trim($('#ruleName').val()) == "") {
								$.messager.alert("提示", "规则名称不能为空");
								$('#ruleName').focus();
								return false;
							}
						},
						success : function(data) {
							if (data == "{}") {
								$.messager.alert("提示", "添加失败");
							} else {
								$.messager.alert("提示", "添加成功");
								$('#addRuleDiv').dialog('close');
								GetFindDataRule();
							}
						}
					});
					$('#addRuleForm').submit();
				}
			} ]
		});
	}
	function deleteRule() {
		var ids = [];
		var gdnode = $('#RulTb').datagrid("getSelections");
		for ( var i = 0; i < gdnode.length; i++) {
			ids.push(gdnode[i].id);
		}
		$.ajax( {
			url : "toJlzdPoints.action?m=todeleteRule&ids=" + ids,
			type : "POST",
			dataType : "json",
			data : {
				"ids" : ids
			},
			success : function(data) {
				if (data == "{}") {
					$.messager.alert("提示", "删除失败,未知原因");
				} else if (data.date == 1) {
					$.messager.alert("提示", "删除失败,因已选规则，与测点或校验条件关联！");
				} else if (data == 0) {
					$.messager.alert("提示", "删除成功");
					$('#addRuleDiv').dialog('close');
					GetFindDataRule();
				}
				GetFindDataRule();
			}
		});
	}
	function GetFindDataRule() {
		var args = {};
		args.ccid = $("#ccid").val();
		BingData("#RulTb", args, "toJlzdPoints.action?m=toFindDataRuled", null);
	}
	$(function() {
		//初始化table	
		$('#RulTb').datagrid( {
			fitColumns : true, //自适应列的大小
			singleSelect : false,
			pagination : false,
			columns : [ [ {
				title : 'Id',
				field : 'id',
				hidden : true,
				formatter : function(value, rowData, rowIndex) {
					return value
				}
			}, {
				title : '规则名称',
				field : 'verificationName',
				width : 300,
				formatter : function(value, rowData, rowIndex) {
					return value
				}
			}, {
				title : '描述',
				field : 'dnrvDescription',
				width : 150,
				formatter : function(value, rowData, rowIndex) {
					return value
				}
			}
			//{ title: '排序', field: 'ctmBackups',hidden: true, width: 300,formatter: function (value, rowData, rowIndex) {return value}}
			] ],
			//双击出现公示表格
			onDblClickRow : function(rowIndex) {
				gin();
			}
		});
	});
	function gin() {
		var gdnode = $('#RulTb').datagrid("getSelections");
		if (gdnode.length > 1 || gdnode.length == 0) {
			$.messager.alert("提示", "请选择一条规则，进行添加条件。");
		} else {
			var Ruledd = $('#RulTb').datagrid('getSelected');
			var names = Ruledd.verificationName;
			var ids = Ruledd.id;
			och(names, ids);
		}
	}
	//*************************
	//数据校验公式表格
	//*************************
	function och(names, ids) {
		$("#isCheckedDiv").show();
		document.getElementById('fRule').innerText = "当前规则：" + names;
		$("#isCheckedDiv")
				.dialog(
						{
							title : '数据校验',
							modal : true,
							draggable : true,
							width : 820,
							height : 470,
							buttons : [ {
								text : '确定',
								handler : function() {
									document.getElementById('isCheckedDiv').style.display = 'none';
									$('#isCheckedDiv').dialog('close');
								}
							} ]
						});
		GetDataIsCk(ids);
	}
	function GetDataIsCk(ids) {
		var args = {};
		args.ccid = $("#ccid").val();
		BingData("#isCheckedTb", args,
				"toJlzdPoints.action?m=toDataChecking&ids=" + ids, null);
	}
	$(function() {
		//初始化table	
		$('#isCheckedTb').datagrid( {
			fitColumns : true, //自适应列的大小
			singleSelect : true,
			pagination : false,
			columns : [ [ {
				title : 'Id',
				field : 'id',
				hidden : true,
				formatter : function(value, rowData, rowIndex) {
					return value
				}
			}, {
				title : '所属规则',
				field : 'pomsDataNonRationalVerification',
				hidden : true,
				formatter : function(value, rowData, rowIndex) {
					return value.id
				}
			}, {
				title : '表达式',
				field : 'porvrExpression',
				width : 400,
				formatter : function(value, rowData, rowIndex) {
					return value
				}
			}, {
				title : '运算符',
				field : 'porvrRelationSymbol',
				width : 150,
				formatter : function(value, rowData, rowIndex) {
					return value
				}
			}, {
				title : '期望值',
				field : 'porvrExpectValue',
				width : 80,
				formatter : function(value, rowData, rowIndex) {
					return value
				}
			}, {
				title : '逻辑关系',
				field : 'porvrLogicSymbol',
				width : 150,
				formatter : function(value, rowData, rowIndex) {
					return value
				}
			}, {
				title : '排序',
				field : 'porvrOrder',
				width : 80,
				formatter : function(value, rowData, rowIndex) {
					return value
				}
			} ] ],
			onDblClickRow : function(rowIndex) {
				var row = $('#isCheckedTb').datagrid('getSelected');
				var ides = row.id;
				addECheck(ides);
			}
		});
	});
	//*************************
	//添加数据校验公式
	//*************************
	function addACheck() {
		$("#addChecking").form('clear');
		$("#addChecking").show();
		$("#addChecking")
				.dialog(
						{
							title : '添加校验条件',
							modal : true,
							draggable : true,
							width : 850,
							height : 300,
							buttons : [ {
								text : '确定',
								handler : function() {
									if ($('#expression').val() == "") {
										$.messager.alert("提示", "表达式不能为空!");
										$('#expression').focus();
										return false;
									}
									if ($('#operator').val() == "") {
										$.messager.alert("提示", "运算符不能为空!");
										$('#operator').focus();
										return false;
									}
									if ($('#wantvalue').val() == "") {
										$.messager.alert("提示", "期望值不能为空!");
										$('#wantvalue').focus();
										return false;
									}
									if ($('#ordereds').val() == "") {
										$.messager.alert("提示", "条件排序不能为空!");
										$('#ordereds').focus();
										return false;
									}
									if (!/^[0-9]*$/.test($('#ordereds').val())) {
										$.messager.alert("提示", "条件排序只能为数字!");
										$('#ordereds').focus();
										return false;
									}

									var Ruledd = $('#RulTb').datagrid(
											'getSelected');
									var ids = Ruledd.id;
									var ordereds = $("#ordereds").val();
									var expression = $("#expression").val();
									var operator = $("#operator").val();
									var wantvalue = $("#wantvalue").val();
									var conditions = $("#conditions").val();
									$
											.ajax( {
												url : "toJlzdPoints.action?m=toAddDataChecking",
												type : "POST",
												dataType : "json",
												data : {
													"ids" : ids,
													"expr" : expression,
													"oper" : operator,
													"wanv" : wantvalue,
													"cond" : conditions,
													"orde" : ordereds
												},
												success : function(data) {
													document
															.getElementById('addChecking').style.display = 'none';
													$('#addChecking').dialog(
															'close');
													GetDataIsCk(ids);
												}
											});
								}
							} ]
						});
	}
	function addECheck(ides) {
		if (ides == null) {
			$.messager.alert("提示", "请选择一个'条件'再做修改操作!");
			return false;
		}
		$("#addChecking").form('clear');
		//获取选中的用户信息
		$.ajax( {
			url : "toJlzdPoints.action?m=toUpDataIdChecking",
			type : "POST",
			dataType : "json",
			timeout : 1000,
			data : {
				"ides" : ides
			},
			success : function(data) {
				$('#iddes').val(data.list[0].id);
				$('#keyiddes').val(
						data.list[0].pomsDataNonRationalVerification.id);
				$('#expression').val(data.list[0].porvrExpression);
				$('#operator').val(data.list[0].porvrRelationSymbol);
				$('#wantvalue').val(data.list[0].porvrExpectValue);
				$('#conditions').val(data.list[0].porvrLogicSymbol);
				$('#ordereds').val(data.list[0].porvrOrder);
			}
		});
		$("#addChecking").show();
		$("#addChecking")
				.dialog(
						{
							title : '修改后置条件',
							modal : true,
							draggable : true,
							width : 850,
							height : 300,
							buttons : [ {
								text : '确定',
								handler : function() {
									if ($('#expression').val() == "") {
										$.messager.alert("提示", "表达式不能为空!");
										$('#expression').focus();
										return false;
									}
									if ($('#operator').val() == "") {
										$.messager.alert("提示", "运算符不能为空!");
										$('#operator').focus();
										return false;
									}
									if ($('#wantvalue').val() == "") {
										$.messager.alert("提示", "期望值不能为空!");
										$('#wantvalue').focus();
										return false;
									}
									if ($('#ordereds').val() == "") {
										$.messager.alert("提示", "条件排序不能为空!");
										$('#ordereds').focus();
										return false;
									}
									var Ruledd = $('#RulTb').datagrid(
											'getSelected');
									var ids = Ruledd.id;
									var iddes = $("#iddes").val();
									var keyiddes = $("#keyiddes").val();
									var ordereds = $("#ordereds").val();
									var expression = $("#expression").val();
									var operator = $("#operator").val();
									var wantvalue = $("#wantvalue").val();
									var conditions = $("#conditions").val();
									$
											.ajax( {
												url : "toJlzdPoints.action?m=toUpDataChecking",
												type : "POST",
												dataType : "json",
												data : {
													"iddes" : iddes,
													"keyiddes" : keyiddes,
													"expr" : expression,
													"oper" : operator,
													"wanv" : wantvalue,
													"cond" : conditions,
													"orde" : ordereds
												},
												success : function(data) {
													document
															.getElementById('addChecking').style.display = 'none';
													$('#addChecking').dialog(
															'close');
													GetDataIsCk(ids);
												}
											});
									GetDataIsCk(ids);
								}
							} ]
						});
		//GetDataIsCk(ids);
	}
	function deleteACheck() {
		var Ruledd = $('#RulTb').datagrid('getSelected');
		var ids = Ruledd.id;
		var pcids = $('#isCheckedTb').datagrid('getSelected');
		var idsq = pcids.id;
		if (idsq == null || idsq == "") {
			$.messager.alert("提示", "请选择一条校验条件，进行删除。");
		}
		$.ajax( {
			url : "toJlzdPoints.action?m=todeleteCheckCon&idsq=" + idsq,
			type : "POST",
			dataType : "json",
			data : {
				"ids" : ids
			},
			success : function(data) {
				if (data == "{}") {
					$.messager.alert("提示", "删除失败,未知原因");
				} else if (data == 0) {
					$.messager.alert("提示", "删除成功");
					$('#addRuleDiv').dialog('close');
					GetDataIsCk(ids);
				}
				GetDataIsCk(ids);
			}
		});

	}
</script>



		<!-- 测点修改 -->
		<div id="dps" style="width: 700px; height: 500px; display: none;">
			<form id="fpuid" method="post">
				<br />
				<br />
				<table id="updatePoinTable" align="center" width="650">
					<%--<tr>
	        	 			<td>模型:</td>
	        	 			<td>
	        	 				<input type="text" id="selectes2"  disabled ="true" style="width:155px;"/>
	        	 				<input type="hidden" name="ccid" id="ccid" value="" />
	        	 			</td>
	        	 			<td>
	        	 				<select id="select" name="id" style="width: 155px"></select>
	        	 			</td>
	        	 		</tr>
	        	 		--%>
					<tr>
						<td>
							<input type="hidden" id="pids" name="pids"
								class="easyui-validatebox" />
						</td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td>
							<font color="red">*</font>是否需要存储:
						</td>
						<td>
							<select id="pisaves" name="pisaves" class="easyui-validatebox">
								<option value="是" selected="selected">
									是
								</option>
								<option value="否">
									否
								</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							<font color="red">*</font>编码:
						</td>
						<td>
							<input type="text" id="pcodes" name="pcodes"
								class="easyui-validatebox" />
						</td>
						<td>
							<font color="red">*</font>类型:
						</td>
						<td>
							<select id="ptypes" name="ptypes" class="easyui-validatebox">
								<option value="0" selected="selected">
									模拟量
								</option>
								<option value="1">
									开关量
								</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							<font color="red">*</font>名称:
						</td>
						<td>
							<input type="text" id="pnames" name="pnames"
								class="easyui-validatebox" />
						</td>
						<td>
							<font color="red">*</font>统计类型:
						</td>
						<td>
							<select id="psavtyps" name="psavtyps" class="easyui-validatebox">
								<option value="0" selected="selected">
									累计
								</option>
								<option value="1">
									瞬时
								</option>
								<option value="2">
									统计
								</option>
								<option value="3">
									状态
								</option>
								<option value="4">
									事件
								</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							<font color="red">*</font>单位:
						</td>
						<td>
							<input type="text" id="punits" name="punits"
								class="easyui-validatebox" />
						</td>
						<td>
							<font color="red">*</font>存储周期:
						</td>
						<td>
							<select id="psavtims" name="psavtims" class="easyui-validatebox">
								<option value="15分钟" selected="selected">
									15分钟
								</option>
								<option value="30分钟">
									30分钟
								</option>
								<option value="1小时">
									1小时
								</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							PLC地址:
						</td>
						<td>
							<input type="text" id="plcaddressud" name="plcaddress"
								class="easyui-validatebox" />
						</td>
						<td>
							<font color="red">*</font>存储方式:
						</td>
						<!-- 
	        	 			 <td id="testid">
	        	 			</td>
	        	 			 -->
						<td>
							<select id="psavforasd" name="psavforasd"
								class="easyui-validatebox">
								<option value="和值" selected="selected">
									和值
								</option>
								<option value="差值">
									差值
								</option>
								<option value="最大值">
									最大值
								</option>
								<option value="原始值">
									原始值
								</option>
								<option value="平均值">
									平均值
								</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							MOD地址:
						</td>
						<td>
							<input type="text" id="modaddressud" name="modaddress"
								class="easyui-validatebox" />
						</td>
						<td>
							是否校验:
						</td>
						<td>
							<input id="UpChecking" name="UpChecking"
								class="easyui-validatebox" onclick=ruleded();;; />
						</td>
						<td>
							<input style="display: none;" id="UpCheckingID"
								name="UpCheckingID" class="easyui-validatebox"
								onclick=ruleded();;; />
						</td>
					</tr>

					<tr>
						<td>
							长度:
						</td>
						<td>
							<input type="text" id="porders" name="porders"
								class="easyui-validatebox" />
						</td>
						<td>
							公式:
						</td>
						<td>
							<input type="text" id="pformuls" name="pformuls"
								class="easyui-validatebox" />
						</td>
					</tr>
					<tr>
						<td>
							上上限:
						</td>
						<td>
							<input type="text" id="pupups" name="pupups"
								class="easyui-validatebox" />
						</td>
						<td>
							下下限:
						</td>
						<td>
							<input type="text" id="pdowndos" name="pdowndos"
								class="easyui-validatebox" />
						</td>
					</tr>
					<tr>
						<td>
							下限:
						</td>
						<td>
							<input type="text" id="pdowns" name="pdowns"
								class="easyui-validatebox" />
						</td>
						<td>
							上限:
						</td>
						<td>
							<input type="text" id="pups" name="pups"
								class="easyui-validatebox" />
						</td>
						
					</tr>
					<tr>
						<td>
							备注:
						</td>
						<td rowspan="3" colspan="3">
							<textarea rows="5" cols="60" id="pbackups" name="pbackups"></textarea>
							<input type="hidden" id="pcodes22" name="pcodes22" />
						</td>
					</tr>
				</table>
				<div id="divChedians" style="display: none;">
					编码：
					<input type="text" id="txtCodes" />
					<input type="button" id="btnFinds" value="搜索" />
					<div id="cedians">
					</div>
				</div>
			</form>
		</div>
		<table id="gd2" class="easyui-datagrid"
			style="width: 1410px; height: 225px" toolbar="#toolbar"
			rownumbers="true" fitColumns="true" singleSelect="true">
		</table>


		<!-- 执行操作（模型） -->
		<script type="text/javascript">
	//select
	function check() {
		document.getElementById("select").value = "${g.id}";
	}
	$(function(){
		$('#mygdfind').datagrid( {
			title : '测点选择',
			//fitColumns: true, //自适应列的大小
			singleSelect : true,
			pagination : true,
			columns : [ [ {
				title : 'id',
				field : 'cmId',
				hidden : true,
				formatter : function(value, rowData, rowIndex) {
					return value
				}
				}, {
					title : '编码',
					field : 'cmCode',
					width : 25,
					formatter : function(value, rowData, rowIndex) {
						return value
					}
				} , {
					title : '名称',
					field : 'cmName',
					width : 25,
					formatter : function(value, rowData, rowIndex) {
						return value
					}
			}] ],
			onDblClickRow : function(rowIndex, rowData) {
				if (rowData != null) {
					$("#pcode").val(rowData.cmCode);
					$("#pname").val(rowData.cmName);
					$('#divChedian').dialog('close');
				}
			}
		});
		$('#mygddanwei').datagrid( {
			title : '单位选择',
			//fitColumns: true, //自适应列的大小
			singleSelect : true,
			pagination : true,
			columns : [ [ {
				title : 'id',
				field : 'cmId',
				hidden : true,
				formatter : function(value, rowData, rowIndex) {
					return value
				}
				}, {
					title : '编码',
					field : 'cmCode',
					width : 25,
					formatter : function(value, rowData, rowIndex) {
						return value
					}
				} , {
					title : '名称',
					field : 'cmName',
					width : 25,
					formatter : function(value, rowData, rowIndex) {
						return value
					}
			}] ],
			onDblClickRow : function(rowIndex, rowData) {
				if (rowData != null) {
					//$("#pcode").val(rowData.cmCode);
					$("#punit").val(rowData.cmName);
					$('#divUnit').dialog('close');
				}
			}
		});
	});
	//选择单位
	$("#punit").click(function() {
		$("#divUnit").show();	
		$("#divUnit").dialog( {
				title : '选择单位类型',
				modal : true,
				draggable : true,
				width : 500,
				height : 500,
				buttons : [ {
					text : '确定',
					handler : function() {
						var radiovalue = ShowTemp();
						$("#punit").val(radiovalue[0]);
						$('#divUnit').dialog('close');
					}
				}, {
					text : '取消',
					handler : function() {
						$('#divUnit').dialog('close');
					}
				} ]
		});
		var row = $('#gd').datagrid('getSelected');
		var args={};
		args.codeid = row.ctmEnergyType;
		BingData('#mygddanwei', args,"CodeManagementAction.action?m=getCodesUnitMo", null);
	});
	$("#btnFindu").click(function() {
		var cmName = $("#txtCodeu").val();
		var row = $('#gd').datagrid('getSelected');
		var codeid = row.ctmEnergyType;
		var args={};
		args.codeid = row.ctmEnergyType;
		args.cmName=cmName;
		BingData('#mygddanwei', args,"CodeManagementAction.action?m=getCodesUnitMo", null);
	});

	//选择编码
	$("#pcode").click(function() {
		$("#divChedian").show();
		//获取选中的radio值
		function ShowTemp() {
			var complete = new Array(3);
			var eless = document.getElementsByName("indury");
			for ( var i = 0; i < eless.length; i++) {
				if (eless[i].checked) {
					complete[0] = eless[i].attributes["title"].value
					complete[1] = eless[i].value
					break;
				}
			}
			return complete;
		}
		$("#divChedian").dialog( {
			title : '选择编码类型',
			modal : true,
			draggable : true,
			width : 500,
			height : 500,
			buttons : [ {
				text : '确定',
				handler : function() {
					var radiovalue = $("#mygdfind").datagrid("getSelected");
					$("#pname").val(radiovalue.cmName);
					$("#pcode").val(radiovalue.cmCode);
					$('#divChedian').dialog('close');

				}
			}, {
				text : '取消',
				handler : function() {
				$('#divChedian').dialog('close');
			}
		} ]
	});
	var row = $('#gd').datagrid('getSelected');
	var args={};
	args.codeid = row.ctmEnergyType;
	args.cmName="";
		//BingData("#mygdfind", args, "toJlzdPoints.action?m=toFindPointsById", null);
	BingData('#mygdfind', args,"toJlzdPoints.action?m=getCodeLikeNamess", null);
});
	$("#btnFind").click(function() {
		var cmName = $("#txtCode").val();
		var row = $('#gd').datagrid('getSelected');
		var args={};
		args.codeid = row.ctmEnergyType;
		args.cmName=cmName;
		//BingData("#mygdfind", args, "toJlzdPoints.action?m=toFindPointsById", null);
		BingData('#mygdfind', args,"toJlzdPoints.action?m=getCodeLikeNamess", null);
	});

	//修改
	//$.ajax( {
	//data : {
	//"type" : "engrgytype"
	//},
	//type : 'post',
	//dataType : "json",
	//url : 'CodeManagementAction.action?m=getCodeByParentId',
	//success : function(data) {
	//$("#ctype2").empty();
	//$.each(data.lst, function(i, item) {
	//var op = $("__tag_3710$25_" + item.cmName + "__tag_3710$70_");
	//$("#ctype2").append(op);
	//});
	//}
	//});
	$("#editButton").click(function() {
		alert();
		$("[name=funcode2]:input:checked").removeAttr("checked");
		$("[name=secfuncode2]:input:checked").removeAttr("checked");
		$("[name=secdayfuncode2]:input:checked").removeAttr("checked");
		$("[name=secmonfuncode2]:input:checked").removeAttr("checked");
		$('#updateForm').form('clear');
		var row = $('#gd').datagrid('getSelected');
		if (row == null) {
			$.messager.alert("提示", "请选择一个'编码'再做修改操作!");
			return false;
		}
		//获取选中的用户信息
			$.ajax( {
				url : "toJlzd.action?m=toById",
				type : "POST",
				dataType : "json",
				timeout : 1000,
				data : {
					"id" : row.id
				},
				success : function(data) {
					var en = data.ppp;
					$('#cid2').val(en.id);
					$('#ccode2').val(en.ctmCodes);
					$('#cname2').val(en.ctmNames);
					$('#ctype2').val(en.ctmEnergyType);
					$('#cbackup2').val(en.ctmBackups);
					//	$('#funcode2').html("123456");
					//	$('#funcode2').append("__tag_3741$39_"+en.ctmProtocalFunCode+"__tag_3741$90_"); 
					$('#funcode2').combo('setValue', en.ctmProtocalFunCode)
							.combo('setText', en.ctmProtocalFunCode);
					// 		$('#secfuncode2').val(en.ctmProtocalSecFunCode);
					$('#secfuncode2').combo('setValue',
							en.ctmProtocalSecFunCode).combo('setText',
							en.ctmProtocalSecFunCode);
					//  		$('#secdayfuncode2').val(en.ctmProtocalSecdayFunCode);
					$('#secdayfuncode2').combo('setValue',
							en.ctmProtocalSecdayFunCode).combo('setText',
							en.ctmProtocalSecdayFunCode);
					//		$('#secmonfuncode2').val(en.ctmProtocalSecmonFunCode);
					$('#secmonfuncode2').combo('setValue',
							en.ctmProtocalSecmonFunCode).combo('setText',
							en.ctmProtocalSecmonFunCode);
				}
			});
			$('#uu').show();
			$('#uu').dialog( {
				title : '修改计量终端模型',
				modal : true,
				draggable : true,
				buttons : [ {
					text : '',
					iconCls : 'icon-ok',
					handler : function() {
						if (confirm("如果修改此模型,能耗负荷有用到该模型也将会被修改。")) {
							$('#updateForm').form( {

								url : "toJlzd.action?m=toUpdateModel",
								dataType : "json",
								async : false,
								onSubmit : function() {
									//进行表单验证  
								if ($.trim($('#ccode2').val()) == "") {
									$.messager.alert("提示", "编码不能为空!");
									$('#ccode2').focus();
									return false;
								}
								if ($.trim($('#cname2').val()) == "") {
									$.messager.alert("提示", "名称不能为空!");
									$('#cname2').focus();
									return false;
								}
								if ($.trim($('#ctype2').val()) == "") {
									$.messager.alert("提示", "类型不能为空!");
									$('#ctype2').focus();
									return false;
								}
							},
							success : function(data) {
								if (data == "{}") {
									$.messager.alert("提示", "修改失败!");
								} else {
									$.messager.alert("提示", "修改成功!");
									$('#uu').dialog('close');
									GetData();
								}
							}
							});
						}
						$('#updateForm').submit();
					}
				} ]
			});
		});
	//删除模型

	function deleteVEN() {
		var row = $('#gd').datagrid('getSelected');
		var pid = row.id;
		if (row == null) {
			$.messager.alert("提示", "请选择一个'模型'再进行删除!");
			return false;
		}
		if (confirm("请在确定该模型下没有关联计量终端设备的情况下删除。要删除该模型吗?")) {
			if (confirm("请再次确删除该模型认及其下子测点")) {
				$.ajax( {
					url : "toJlzd.action?m=toDeleteModel&pid=" + pid,
					type : "POST",
					dataType : "json",
					timeout : 1000,
					data : {
						"id" : row.id
					}
				});
				GetData();
				$("#gd").datagrid("loadData", []);
				GetData();
			}
		}
	}
</script>
<script>
	$(function(){
		$("#btnFinds").click(function(){
			var cmName = $("#txtCodes").val();
			var row = $('#gd').datagrid('getSelected');
			var codeid = $('#pcodes').val();
			$.ajax( {
				data : {"cmName" : cmName,"codeid" : codeid},
				type : 'post',
				dataType : "json",
				url : 'CodeManagementAction.action?m=getCodeLikeNames',
				success : function(data) {
					var num = 1;
					$("#cedians").empty();
					$.each(data.lst,function(i, item) {
						var vs = $("<div style='display:block;width:45%;height:auto;float:left;'>__tag_3897$87_"
							 	+ item.cmName
						 		+ "__tag_3897$231_");
						if (num % 2 == 0) {
							vs.append($("__tag_3899$24_"));
						}
						$("#cedians").append(vs);
						num++;
					});
				}
			});
		});
	});

		
	});
</script>
		<!-- 执行操作（测点） -->
		<script type="text/javascript">
	//选择编码
	$("#pcodes").click(
					function() {
						$("#divChedians").show();
						var rows = $('#gd2').datagrid('getSelected');
						var codeid = rows.mmpCodes
						$.ajax( {
									data : {
										"codeid" : codeid
									},
									type : 'post',
									dataType : "json",
									url : 'CodeManagementAction.action?m=getCodebypNames',
									success : function(data) {
										var num = 1;
										$("#cedians").empty();
										$.each(data.lst,function(i, item) {
															var v = $("<div style='width:45%;float:left;'>__tag_3829$60_"
																	+ item.cmName
																	+ "__tag_3829$190_");
															//var v2 = $("<div style='width:45%;float:left;display:none'>__tag_3830$75_"+item.cmBackupone+"__tag_3830$222_");
															if (num % 2 == 0) {
																v
																		.append($("__tag_3832$23_"));
																//	v2.append($("__tag_3833$26_"));
															}
															$("#cedians")
																	.append(v);
															//$("#cedian").append(v2);
															num++;
														});
									}
								});

						//获取选中的radio值
						function ShowTemp() {
							var complete = new Array(3);
							var eless = document.getElementsByName("indury");
							//var elessss = document.getElementsByName("induryss");
							for ( var i = 0; i < eless.length; i++) {
								if (eless[i].checked) {
									complete[0] = eless[i].attributes["title"].value
									complete[1] = eless[i].value
									//complete[2]=elessss[i].value
									break;
								}
							}
							return complete;
						}
						$("#divChedians").dialog( {
							title : '选择编码类型',
							modal : true,
							draggable : true,
							width : 500,
							height : 500,
							buttons : [ {
								text : '确定',
								handler : function() {
									var radiovalue = ShowTemp();
									$("#pnames").val(radiovalue[0]);
									$("#pcodes").val(radiovalue[1]);
									$("#punits").val(radiovalue[2]);
									$('#divChedians').dialog('close');
								}
							}, {
								text : '取消',
								handler : function() {
									$('#divChedians').dialog('close');
								}
							} ]
						});
					});

	//修改
	$("#btnB").click(function() {
				var row = $('#gd2').datagrid('getSelected');
				var rows = $('#gd').datagrid('getSelected');
				//var rowid= row.id;

					if (row == null) {
						alert('请选择一个测点!');
						return false;
					}
					//获取选中的用户信息

					$
							.ajax( {
								url : "toJlzdPoints.action?m=findPointsIds",
								type : "POST",
								dataType : "json",
								timeout : 1000,
								data : {
									"ids" : rows.id,
									"id" : row.id,
									"ss" : row.ctmNames
								},
								success : function(data) {
									var en = data.ppp;
									var sn = data.ooo;
									var sbv = [];
									var abq = [];
									for ( var i = 0; i < sn.length; i++) {
										sbv += sn[i].verificationName + ",";
										abq += sn[i].id + ",";
									}
									if (sn.length > 0) {
										var sjid = abq.substring(0,
												abq.length - 1)
										var sjname = sbv.substring(0,
												sbv.length - 1)
										$('#UpChecking').val(sjname);
										$('#UpCheckingID').val(sjid);
									} else {
										$('#UpChecking').val("");
										$('#UpCheckingID').val("");
									}
									$('#pids').val(en.id);
									$('#id').val(
											en.pomsCalculateTerminalModel.id);
									$('#pcodes').val(en.mmpCodes);
									$('#pcodes22').val(en.mmpCodes);
									$('#pnames').val(en.mmpNames);
									$('#pbackups').val(en.mmpBackups);
									$('#pisaves').val(en.mmpIssave);
									$('#ptypes').val(en.mmpType);
									$('#pformuls').val(en.mmpFormular);
									$('#pups').val(en.mmpUpValue);
									$('#pupups').val(en.mmpUperLine);
									$('#pdowns').val(en.mmpDownValue);
									$('#pdowndos').val(en.mmpDownerLine);
									$('#punits').val(en.mmpUnits);
									$('#porders').val(en.mmpOrders);
									$('#modaddressud').val(en.modAddress);
									$('#plcaddressud').val(en.plcAddress);
									$('#psavfor').val(en.mmpSaveStyle);
									var style = en.mmpSaveStyle;
									var styles = style.split('，');
									//下拉
									var ccname = data.ppp;
									var combo = "__tag_4050$21_-- 请选择 --__tag_4050$49_"
									combo += "__tag_4051$16___tag_4371$30_${g.ctmNames}__tag_4052$31___tag_4372$45_";
									$("#select").html("");
									$("#select").html(combo);
									$('#psavtims').val(en.mmpSaveInterval);
									$('#psavtyps').val(en.mmpStatisticType);
									$('#psavforasd').val(en.mmpSaveStyle);
								}
							});

					$('#dps').show();

					$('#dps')
							.dialog(
									{
										title : '修改',
										modal : true,
										draggable : true,
										buttons : [ {
											text : '',
											iconCls : 'icon-ok',
											handler : function() {
												var rows = $('#gd').datagrid(
														'getSelected');

												var id = rows.id;
												var c = $('#pcodes22').val();

												if (confirm("如果能耗负荷有用到该模型下的测点，那么能耗负荷的测点也将会随着修改。")) {
													$('#fpuid')
															.form(
																	{

																		url : "toJlzdPoints.action?m=toUpdatePoints&id="
																				+ id
																				+ "&pcodes22="
																				+ $(
																						'#pcodes22')
																						.val(),

																		url : "toJlzdPoints.action?m=toUpdatePoints&id="
																				+ id,
																		dataType : "json",
																		async : false,
																		onSubmit : function() {

																			if ($.trim($(
																							'#pcodes')
																							.val()) == "") {
																				$.messager
																						.alert(
																								"提示",
																								"编码不能为空!");
																				$(
																						'#pcode')
																						.focus();
																				return false;
																			}
																			if ($.trim($('#pnames')
																							.val()) == "") {
																				$.messager.alert(
																								"提示",
																								"名称不能为空!");
																				$('#pname').focus();
																				return false;
																			}
																			if ($.trim($(
																							'#punits')
																							.val()) == "") {
																				$.messager
																						.alert(
																								"提示",
																								"单位不能为空!");
																				$(
																						'#punit')
																						.focus();
																				return false;
																			}
																			if ($
																					.trim($(
																							'#ptypes')
																							.val()) == "") {
																				$.messager
																						.alert(
																								"提示",
																								"类型不能为空!");
																				$(
																						'#ptype')
																						.focus();
																				return false;
																			}
																			if ($
																					.trim($(
																							'#psavtyps')
																							.val()) == "") {
																				$.messager
																						.alert(
																								"提示",
																								"统计类型不能为空!");
																				$(
																						'#psavtyp')
																						.focus();
																				return false;
																			}
																			if ($
																					.trim($(
																							'#psavtims')
																							.val()) == "") {
																				$.messager
																						.alert(
																								"提示",
																								"存储周期不能为空!");
																				$(
																						'#psavtim')
																						.focus();
																				return false;
																			}
																			if ($
																					.trim($(
																							'#psavforasd')
																							.val()) == "") {
																				$.messager
																						.alert(
																								"提示",
																								"存储方式不能为空!");
																				$(
																						'#psavforasd')
																						.focus();
																				return false;
																			}
																		},
																		success : function(
																				data) {
																			if (data == "{}") {
																				$.messager
																						.alert(
																								"提示",
																								"修改失败!");
																			} else {
																				$.messager
																						.alert(
																								"提示",
																								"修改成功!");
																				$(
																						'#dps')
																						.dialog(
																								'close');
																				//$('#fpuid').datagrid('clear');
																				var row = $(
																						'#gd')
																						.datagrid(
																								'getSelected');
																				var rowid = row.id;

																				GetDataC(rowid)
																			}
																		}
																	});
													GetData();
												}
												$('#fpuid').submit();

											}
										} ]
									});
				});
	//删除
	$("#btnC").click(function() {
		var row = $('#gd2').datagrid('getSelected');
		if (row == null) {
			$.messager.alert("警告", "请选择一个测点再进行删除!");
			return false;
		}
		if (confirm("如果能耗负荷有用到该模型的测点，那么能耗负荷的测点也将会被删除。")) {
			$.ajax( {
				url : "toJlzdPoints.action?m=toDeletePoints",
				type : "POST",
				dataType : "json",
				timeout : 1000,
				data : {
					"id" : row.id
				}
			});
			GetData();
		}
	});

	//选择单位
	$("#punits")
			.click(
					function() {
						$("#divUnit").show();
						var row = $('#gd').datagrid('getSelected');
						var codeid = row.ctmEnergyType
						$
								.ajax( {
									data : {
										"codeid" : codeid
									},
									type : 'post',
									dataType : "json",
									url : 'CodeManagementAction.action?m=getCodeUnits',
									success : function(data) {
										var num = 1;
										$("#cedianu").empty();
										$
												.each(
														data.lst,
														function(i, item) {
															var v = $("<div style='width:45%;float:left;'>__tag_4159$62_"
																	+ item.cmName
																	+ "__tag_4159$193_");
															if (num % 2 == 0) {
																v
																		.append($("__tag_4161$25_"));
															}
															$("#cedianu")
																	.append(v);
															num++;
														});
									}
								});
						//获取选中的radio值
						function ShowTemp() {
							var complete = new Array(3);
							var eless = document.getElementsByName("indunit");
							for ( var i = 0; i < eless.length; i++) {
								if (eless[i].checked) {
									complete[0] = eless[i].attributes["title"].value
									complete[1] = eless[i].value
									break;
								}
							}
							return complete;
						}
						$("#divUnit").dialog( {
							title : '选择单位类型',
							modal : true,
							draggable : true,
							width : 500,
							height : 500,
							buttons : [ {
								text : '确定',
								handler : function() {
									var radiovalue = ShowTemp();
									$("#punits").val(radiovalue[0]);
									$('#divUnit').dialog('close');
								}
							}, {
								text : '取消',
								handler : function() {
									$('#divUnit').dialog('close');
								}
							} ]
						});
					});
	$("#btnFindu").click(function() {
						var cmName = $("#txtCodeu").val();
						var row = $('#gd').datagrid('getSelected');
						var codeid = row.ctmEnergyType;
						$.ajax( {
									data : {
										"cmName" : cmName
									},
									type : 'post',
									dataType : "json",
									url : 'CodeManagementAction.action?m=getCodesUnitMo',
									success : function(data) {
										var num = 1;
										$("#cedianu").empty();
										$.each(data.lst,function(i, item) {
											var vs = $("<div style='display:block;width:45%;height:auto;float:left;'>__tag_4217$88_"
													+ item.cmName
													+ "__tag_4217$232_");
											if (num % 2 == 0) {
												vs.append($("__tag_4219$25_"));
											}
											$("#cedianu").append(vs);
												num++;
										});
									}
						});
	});
</script>
<script>
</script>
		<script type="text/javascript">
	//页面加载时给提交时间赋值为当前时间
	$(function() {
		//初始化table	
		$('#gd').datagrid( {
			title : '模型定义',
			//fitColumns: true, //自适应列的大小
			singleSelect : true,
			pagination : true,
			columns : [ [ {
				title : 'Id',
				field : 'id',
				hidden : true,
				formatter : function(value, rowData, rowIndex) {
					return value
				}
			}, {
				title : '编码',
				field : 'ctmCodes',
				width : 25,
				formatter : function(value, rowData, rowIndex) {
					return value
				}
			}, {
				title : '名称',
				field : 'ctmNames',
				width : 25,
				formatter : function(value, rowData, rowIndex) {
					return value
				}
			}, {
				title : '类型',
				field : 'ctmEnergyType',
				width : 25,
				formatter : function(value, rowData, rowIndex) {
					return value
				}
			}, {
				title : '备注',
				field : 'ctmBackups',
				width : 100,
				formatter : function(value, rowData, rowIndex) {
					return value
				}
			} ] ],
			//按模型查测点
			onLoadSuccess : function(data) {
				$('#gd').datagrid('selectRow', 0);
				var row = $('#gd').datagrid('getSelected');
				if (row != null) {
					GetDataC(row.id);
				}
			},
			onSelect : function(rowIndex, rowData) {
				if (rowData != null) {
					GetDataC(rowData.id);
				}
			}
		});
		//点击查询按钮时，根据条件查询信息
		$("#searchButton").click(function() {
			//获取后台数据
				$("#gd").datagrid("loadData", []);
				GetData();
			});
		GetData();
	});
	//模型
	function GetData() {
		var args = {};
		args.name = $("#name").val();
		args.types = $("#types").val();
		args.pageIndex = 1;//页索引
		args.pageSize = 5;//页容量为5
		BingData("#gd", args, "toJlzd.action?m=toFindModelMo", null);
	}
	function GetDataC(rowid) {
		var args = {};
		args.pageIndex = 1;//页索引
		args.pageSize = 10;//页容量为5
		args.rowid = rowid;
		BingData("#gd2", args, "toJlzdPoints.action?m=toFindPointsById", null);
	}
	$(function() {
		$('#funcode,#secfuncode,#secdayfuncode,#secmonfuncode').combo( {
			//        required:true,
			editable : false,
			multiple : true

		});
		$('#sp').appendTo($('#funcode').combo('panel'));
		$('#sp1').appendTo($('#secfuncode').combo('panel'));
		$('#sp2').appendTo($('#secdayfuncode').combo('panel'));
		$('#sp3').appendTo($('#secmonfuncode').combo('panel'));

		$("#sp input").click(function() {
			var _value = "";
			var _text = "";
			$("[name=funcode]:input:checked").each(function() {
				_value += $(this).val() + ",";
				_text += $(this).next("span").text() + ",";

			});
			//设置下拉选中值
				var addylFNva = _value.substring(0, _value.length - 1)
				var addylFNte = _text.substring(0, _text.length - 1)
				$('#funcode').combo('setValue', addylFNva).combo('setText',
						addylFNte);

			});
		//1类数据多选-------------------------------------------
		$(function() {
			//全选或全不选 
			$("#all1").click(function() {//当点击全选框时 
						var flag = $("#all1").attr("checked");//判断全选按钮的状态 
						$("[id$='Item1']").each(function() {//查找每一个Id以Item结尾的checkbox 
									if (flag) {
										$(this).attr("checked", flag);//选中或者取消选中 
									} else {
										$(this).removeAttr("checked");//全部取消
									}
									$(this).attr("checked", flag);//选中或者取消选中 
									var _value = "";
									var _text = "";
									$("[name=funcode]:input:checked").each(
											function() {
												_value += $(this).val() + ",";
												_text += $(this).next("span")
														.text()
														+ ",";
											});

									//设置下拉选中值
									$('#funcode').combo('setValue', _value)
											.combo('setText', _text);
								});
					});
			//如果全部选中勾上全选框，全部选中状态时取消了其中一个则取消全选框的选中状态 
			$("[id$='Item1']")
					.each(
							function() {
								$(this)
										.click(
												function() {
													$("#all1").attr("checked",
															"checked");
													if ($("[id$='Item1']:checked").length == $("[id$='Item1']").length) {
													} else
														$("#all1").removeAttr(
																"checked");
												});
							});
		});

		//---------------------------------------------      

		$("#sp1 input").click(function() {
			var _value1 = "";
			var _text1 = "";
			$("[name=secfuncode]:input:checked").each(function() {
				_value1 += $(this).val() + ",";
				_text1 += $(this).next("span").text() + ",";

			});
			//设置下拉选中值
				var addelrFNva = _value1.substring(0, _value1.length - 1)
				var addelrFNte = _text1.substring(0, _text1.length - 1)
				$('#secfuncode').combo('setValue', addelrFNva).combo('setText',
						addelrFNte);

			});
		//2类曲线多选------------------------------------------------------
		$(function() {
			//全选或全不选 
			$("#all2").click(function() {//当点击全选框时 
						var flag = $("#all2").attr("checked");//判断全选按钮的状态 
						$("[id$='Item2']").each(function() {//查找每一个Id以Item结尾的checkbox 
									if (flag) {
										$(this).attr("checked", flag);//选中或者取消选中 
									} else {
										$(this).removeAttr("checked");//全部取消

									}
									$(this).attr("checked", flag);//选中或者取消选中 
									var _value1 = "";
									var _text1 = "";
									$("[name=secfuncode]:input:checked").each(
											function() {
												_value1 += $(this).val() + ",";
												_text1 += $(this).next("span")
														.text()
														+ ",";
											});

									//设置下拉选中值
									$('#secfuncode').combo('setValue', _value1)
											.combo('setText', _text1);
								});
					});
			//如果全部选中勾上全选框，全部选中状态时取消了其中一个则取消全选框的选中状态 
			$("[id$='Item2']")
					.each(
							function() {
								$(this)
										.click(
												function() {
													$("#all2").attr("checked",
															"checked");
													if ($("[id$='Item2']:checked").length == $("[id$='Item2']").length) {
													} else
														$("#all2").removeAttr(
																"checked");
												});
							});
		});
		//------------------------------------------------------
		$("#sp2 input").click(function() {
			var _value2 = "";
			var _text2 = "";
			$("[name=secdayfuncode]:input:checked").each(function() {
				_value2 += $(this).val() + ",";
				_text2 += $(this).next("span").text() + ",";

			});
			//设置下拉选中值
				var addelrdFNva = _value2.substring(0, _value2.length - 1)
				var addelrdFNte = _text2.substring(0, _text2.length - 1)
				$('#secdayfuncode').combo('setValue', addelrdFNva).combo(
						'setText', addelrdFNte);

			});
		//2类日冻结数据------------------------------------------------------
		$(function() {
			//全选或全不选 
			$("#all3").click(function() {//当点击全选框时 
						var flag = $("#all3").attr("checked");//判断全选按钮的状态 
						$("[id$='Item3']").each(function() {//查找每一个Id以Item结尾的checkbox 
									if (flag) {
										$(this).attr("checked", flag);//选中或者取消选中 
									} else {
										$(this).removeAttr("checked");//全部取消

									}
									$(this).attr("checked", flag);//选中或者取消选中 
									var _value2 = "";
									var _text2 = "";
									$("[name=secdayfuncode]:input:checked")
											.each(
													function() {
														_value2 += $(this)
																.val()
																+ ",";
														_text2 += $(this).next(
																"span").text()
																+ ",";
													});

									//设置下拉选中值
									$('#secdayfuncode').combo('setValue',
											_value2).combo('setText', _text2);
								});
					});
			//如果全部选中勾上全选框，全部选中状态时取消了其中一个则取消全选框的选中状态 
			$("[id$='Item3']")
					.each(
							function() {
								$(this)
										.click(
												function() {
													$("#all3").attr("checked",
															"checked");
													if ($("[id$='Item3']:checked").length == $("[id$='Item3']").length) {
													} else
														$("#all3").removeAttr(
																"checked");
												});
							});
		});
		//------------------------------------------------------
		$("#sp3 input").click(function() {
			var _value3 = "";
			var _text3 = "";
			$("[name=secmonfuncode]:input:checked").each(function() {
				_value3 += $(this).val() + ",";
				_text3 += $(this).next("span").text() + ",";

			});
			//设置下拉选中值
				var addelydFNva = _value3.substring(0, _value3.length - 1)
				var addelydFNte = _text3.substring(0, _text3.length - 1)
				$('#secmonfuncode').combo('setValue', addelydFNva).combo(
						'setText', addelydFNte);

			});
		//2类月冻结数据----------------------------------------------
		$(function() {
			//全选或全不选 
			$("#all4").click(function() {//当点击全选框时 
						var flag = $("#all4").attr("checked");//判断全选按钮的状态 
						$("[id$='Item4']").each(function() {//查找每一个Id以Item结尾的checkbox 
									if (flag) {
										$(this).attr("checked", flag);//选中或者取消选中 
									} else {
										$(this).removeAttr("checked");//全部取消

									}
									$(this).attr("checked", flag);//选中或者取消选中 
									var _value3 = "";
									var _text3 = "";
									$("[name=secmonfuncode]:input:checked")
											.each(
													function() {
														_value3 += $(this)
																.val()
																+ ",";
														_text3 += $(this).next(
																"span").text()
																+ ",";
													});

									//设置下拉选中值
									$('#secmonfuncode').combo('setValue',
											_value3).combo('setText', _text3);
								});
					});
			//如果全部选中勾上全选框，全部选中状态时取消了其中一个则取消全选框的选中状态 
			$("[id$='Item4']")
					.each(
							function() {
								$(this)
										.click(
												function() {
													$("#all4").attr("checked",
															"checked");
													if ($("[id$='Item4']:checked").length == $("[id$='Item4']").length) {
													} else
														$("#all4").removeAttr(
																"checked");
												});
							});
		});
		//-----------------------------------------------
	});
	//---------------------------------------------------------------------------------------------------------
	//修改。。。                
	$(function() {
		$('#funcode2,#secfuncode2,#secdayfuncode2,#secmonfuncode2').combo( {
			//        required:true,
			editable : false,
			multiple : true
		});
		$('#ss').appendTo($('#funcode2').combo('panel'));
		$('#ss1').appendTo($('#secfuncode2').combo('panel'));
		$('#ss2').appendTo($('#secdayfuncode2').combo('panel'));
		$('#ss3').appendTo($('#secmonfuncode2').combo('panel'));
		$("#ss input").click(function() {
			var _value11 = "";
			var _text11 = "";
			$("[name=funcode2]:input:checked").each(function() {
				_value11 += $(this).val() + ",";
				_text11 += $(this).next("span").text() + ",";
			});

			//设置下拉选中值
				var upylFNva = _value11.substring(0, _value11.length - 1);
				var upylFNte = _text11.substring(0, _text11.length - 1);
				$('#funcode2').combo('setValue', upylFNva).combo('setText',
						upylFNte);
			});
		$("#ss1 input").click(function() {
			var _value12 = "";
			var _text12 = "";
			$("[name=secfuncode2]:input:checked").each(function() {
				_value12 += $(this).val() + ",";
				_text12 += $(this).next("span").text() + ",";
			});

			//设置下拉选中值
				var upelrFNva = _value12.substring(0, _value12.length - 1);
				var upelrFNte = _text12.substring(0, _text12.length - 1);
				$('#secfuncode2').combo('setValue', upelrFNva).combo('setText',
						upelrFNte);
			});

		$("#ss2 input").click(function() {
			var _value13 = "";
			var _text13 = "";
			$("[name=secdayfuncode2]:input:checked").each(function() {
				_value13 += $(this).val() + ",";
				_text13 += $(this).next("span").text() + ",";
			});

			//设置下拉选中值
				var upelrdFNva = _value13.substring(0, _value13.length - 1)
				var upelrdFNte = _text13.substring(0, _text13.length - 1)
				$('#secdayfuncode2').combo('setValue', upelrdFNva).combo(
						'setText', upelrdFNte);
			});

		$("#ss3 input").click(function() {
			var _value14 = "";
			var _text14 = "";
			$("[name=secmonfuncode2]:input:checked").each(function() {
				_value14 += $(this).val() + ",";
				_text14 += $(this).next("span").text() + ",";
			});

			//设置下拉选中值
				var upelydFNva = _value14.substring(0, _value14.length - 1)
				var upelydFNte = _text14.substring(0, _text14.length - 1)
				$('#secmonfuncode2').combo('setValue', upelydFNva).combo(
						'setText', upelydFNte);
			});
		//全选
		//1类数据修改----------------------------------
		$(function() {
			//全选或全不选 
			$("#all").click(function() {//当点击全选框时 
						var flag = $("#all").attr("checked");//判断全选按钮的状态 
						$("[id$='Item']").each(function() {//查找每一个Id以Item结尾的checkbox 
									if (flag) {
										$(this).attr("checked", flag);//选中或者取消选中 
									} else {
										$(this).removeAttr("checked");//全部取消

									}
									$(this).attr("checked", flag);//选中或者取消选中 
									var _value11 = "";
									var _text11 = "";
									$("[name=funcode2]:input:checked")
											.each(
													function() {
														_value11 += $(this)
																.val()
																+ ",";
														_text11 += $(this)
																.next("span")
																.text()
																+ ",";
													});

									//设置下拉选中值
									$('#funcode2').combo('setValue', _value11)
											.combo('setText', _text11);
								});
					});
			//如果全部选中勾上全选框，全部选中状态时取消了其中一个则取消全选框的选中状态 
			$("[id$='Item']")
					.each(
							function() {
								$(this)
										.click(
												function() {
													$("#all").attr("checked",
															"checked");
													if ($("[id$='Item']:checked").length == $("[id$='Item']").length) {
													} else
														$("#all").removeAttr(
																"checked");
												});
							});
		});
		//--------------------------------------------------

		//2类日曲线数据-------------------------------------------------
		$(function() {
			//全选或全不选 
			$("#all11")
					.click(function() {//当点击全选框时 
								var flag = $("#all11").attr("checked");//判断全选按钮的状态 
								$("[id$='Items']")
										.each(function() {//查找每一个Id以Item结尾的checkbox 
													if (flag) {
														$(this).attr("checked",
																flag);//选中或者取消选中 
													} else {
														$(this).removeAttr(
																"checked");//全部取消

													}
													$(this).attr("checked",
															flag);//选中或者取消选中 
													var _value12 = "";
													var _text12 = "";
													$(
															"[name=secfuncode2]:input:checked")
															.each(
																	function() {
																		_value12 += $(
																				this)
																				.val()
																				+ ",";
																		_text12 += $(
																				this)
																				.next(
																						"span")
																				.text()
																				+ ",";
																	});

													//设置下拉选中值
													$('#secfuncode2').combo(
															'setValue',
															_value12).combo(
															'setText', _text12);
												});
							});
			//如果全部选中勾上全选框，全部选中状态时取消了其中一个则取消全选框的选中状态 
			$("[id$='Items']")
					.each(
							function() {
								$(this)
										.click(
												function() {
													$("#all11").attr("checked",
															"checked");
													if ($("[id$='Items']:checked").length == $("[id$='Items']").length) {
													} else
														$("#all11").removeAttr(
																"checked");
												});
							});
		});
		//-------------------------------------------------
		//2类日冻结数据------------------------------------------------
		$(function() {
			//全选或全不选 
			$("#all12")
					.click(function() {//当点击全选框时 
								var flag = $("#all12").attr("checked");//判断全选按钮的状态 
								$("[id$='Items1']")
										.each(function() {//查找每一个Id以Item结尾的checkbox 
													if (flag) {
														$(this).attr("checked",
																flag);//选中或者取消选中 
													} else {
														$(this).removeAttr(
																"checked");//全部取消

													}
													$(this).attr("checked",
															flag);//选中或者取消选中 
													var _value13 = "";
													var _text13 = "";
													$(
															"[name=secdayfuncode2]:input:checked")
															.each(
																	function() {
																		_value13 += $(
																				this)
																				.val()
																				+ ",";
																		_text13 += $(
																				this)
																				.next(
																						"span")
																				.text()
																				+ ",";
																	});

													//设置下拉选中值
													$('#secdayfuncode2').combo(
															'setValue',
															_value13).combo(
															'setText', _text13);
												});
							});
			//如果全部选中勾上全选框，全部选中状态时取消了其中一个则取消全选框的选中状态 
			$("[id$='Items1']")
					.each(
							function() {
								$(this)
										.click(
												function() {
													$("#all12").attr("checked",
															"checked");
													if ($("[id$='Items1']:checked").length == $("[id$='Items1']").length) {
													} else
														$("#all12").removeAttr(
																"checked");
												});
							});
		});
		//-------------------------------------------------

		//2类月冻结数据------------------------------------
		$(function() {
			//全选或全不选 
			$("#all13")
					.click(function() {//当点击全选框时 
								var flag = $("#all13").attr("checked");//判断全选按钮的状态 
								$("[id$='Items2']")
										.each(function() {//查找每一个Id以Item结尾的checkbox 
													if (flag) {
														$(this).attr("checked",
																flag);//选中或者取消选中 
													} else {
														$(this).removeAttr(
																"checked");//全部取消

													}
													$(this).attr("checked",
															flag);//选中或者取消选中 
													var _value14 = "";
													var _text14 = "";
													$(
															"[name=secmonfuncode2]:input:checked")
															.each(
																	function() {
																		_value14 += $(
																				this)
																				.val()
																				+ ",";
																		_text14 += $(
																				this)
																				.next(
																						"span")
																				.text()
																				+ ",";
																	});

													//设置下拉选中值
													$('#secmonfuncode2').combo(
															'setValue',
															_value14).combo(
															'setText', _text14);
												});
							});
			//如果全部选中勾上全选框，全部选中状态时取消了其中一个则取消全选框的选中状态 
			$("[id$='Items2']")
					.each(
							function() {
								$(this)
										.click(
												function() {
													$("#all13").attr("checked",
															"checked");
													if ($("[id$='Items2']:checked").length == $("[id$='Items2']").length) {
													} else
														$("#all13").removeAttr(
																"checked");
												});
							});
		});
		//--------------------------------------------------
	});
</script>
		<!-- 初始化table	 -->
		<script type="text/javascript">
	//页面加载时给提交时间赋值为当前时间
	$(function() {
		//
		$('#gd2').datagrid(
						{
							title : '测点列表',
							fitColumns : false, //自适应列的大小
							singleSelect : true,
							pagination : true,
							columns : [ [
									{
										title : 'Id',
										width : 100,
										hidden : true,
										field : 'id'
									},
									{
										title : '模型',
										width : 250,
										field : 'ctmNames',
										formatter : function(value, rowData,
												rowIndex) {
											return new Object(
													rowData["pomsCalculateTerminalModel"]).ctmNames;
										}
									},
									{
										title : '模型编码',
										width : 350,
										hidden : true,
										field : 'pomsCalculateTerminalModel',
										formatter : function(value, rowData,
												rowIndex) {
											return value.id
										}
									}, {
										title : '编码',
										width : 100,
										field : 'mmpCodes'
									}, {
										title : '测点名称',
										width : 250,
										field : 'mmpNames'
									}, {
										title : '单位',
										width : 80,
										field : 'mmpUnits'
									}, {
										title : 'PLC地址',
										width : 80,
										field : 'plcAddress'
									}, {
										title : 'modbus地址',
										width : 80,
										field : 'modAddress'
									}, {
										title : '公式',
										width : 100,
										field : 'mmpFormular'
									}, {
										title : '是否储存',
										width : 70,
										field : 'mmpIssave'
									}, {
										title : '存储方式',
										width : 80,
										field : 'mmpSaveStyle'
									}, {
										title : '备注',
										width : 280,
										field : 'mmpBackups'
									} ] ]
						});
		GetDataC();
	});
</script>
	</body>
</html>
