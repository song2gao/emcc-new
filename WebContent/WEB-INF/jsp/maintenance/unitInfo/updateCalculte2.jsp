<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="main.java.PomsCalculateTerminalDevice"%>
<%@page import="com.gs.common.util.DateUtils"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加计量表信息</title>
</head>
<link href="/emcc-web/css/poms-system/xtqygl.css" rel="stylesheet"
	type="text/css" />
<link href="/emcc-web/css/poms-unit/bdcss.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" type="text/css"
	href="/emcc-web/component/jquery-easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="/emcc-web/component/jquery-easyui/themes/icon.css">




<script type="text/javascript"
	src="/emcc-web/js/poms-system/jquery-1.7.2.js"></script>
<script type="text/javascript"
	src="/emcc-web/component/jquery-easyui/jquery-1.7.2.min.js"></script>
<script type="text/javascript"
	src="/emcc-web/js/poms-business/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/emcc-web/js/page.js"></script>
<script type="text/javascript" src="/emcc-web/js/jquery.form.js"></script>
<script type="text/javascript"
	src="/emcc-web/js/poms-business/jsonToTime.js"></script>
<body>
	<%
	PomsCalculateTerminalDevice pc =(PomsCalculateTerminalDevice)request.getAttribute("pc");
%>
	<!-- 计量终端配置页 -->
	<form id="calForm" method="post" action="#">
		<input type="hidden" name="qyid" id="qyid"
			value="<%=(String)request.getAttribute("qyid")%>" /> <input
			type="hidden" name="cjqid" id="cjqid"
			value="<%=(String)request.getAttribute("cjqid")%>" /> <input
			type="hidden" name="euiNames" id="euiNames"
			value="<%=(String)request.getAttribute("euiNames")%>" /> <input
			type="hidden" name="isChecked" id="isChecked"
			value="<%=pc.getCdtIsinvented()%>" /> <input type="hidden"
			name="modelid" id="modelid" value="" /> <input type="hidden"
			name="jlbid" id="jlbid" value="<%=pc.getId()%>" />

		<table>
			<tr>
				<td colspan="5" height="10px"></td>
			</tr>
			<tr>
				<td colspan="5" style="width: 100%;">
					<table>
						<tr>
							<td width="150px" align="right">计量终端编号:</td>
							<td align="left"><input type="text" id="ctdCodes"
								name="ctdCodes" value="<%=pc.getCtdCodes() %>"
								disabled="disabled" /></td>

							<td width="150px" align="right">企业:</td>
							<td align="left"><input type="text" id="uqy" name="uqy"
								disabled=true
								value="<%=(String)request.getAttribute("euiNames")%>" /></td>
							<td>&nbsp;</td>
						</tr>
						<tr>

							<td width="150px" align="right">计量终端模型:</td>
							<td align="left"><input id="model" disabled="disabled"
								name="model" value="" readonly="readonly" /> <input
								type="hidden" id="codeid" value="" /></td>
							<td width="150px" align="right">计量终端柜编号:</td>
							<td align="left"><input type="text" id="cdtTerminalName"
								name="cdtTerminalName" value="<%=pc.getCdtTerminalName() %>"
								disabled="disabled" /></td>
							<td>&nbsp;</td>
						</tr>
						<tr>

							<td width="150px" align="right">计量表终端地址(PN):</td>
							<td align="left"><input type="text" id="cdtProtocalAddr"
								name="cdtProtocalAddr" value="<%=pc.getCdtProtocalAddr()%>" /></td>
							<td width="150px" align="right">计量终端回路名称:</td>
							<td align="left"><input type="text" id="cdtMeasureLoop"
								name="cdtMeasureLoop" value="<%=pc.getCdtMeasureLoop() %>"
								disabled="disabled" /></td>

							<td>&nbsp;</td>
						</tr>

						<tr>
							<td width="150px" align="right">测量终端类型:</td>
							<td align="left"><select id="cdtTerminalStatus"
								name="cdtTerminalStatus"
								style="width: 150px; text-align: center;">

							</select></td>
							<td width="150px" align="right">一类数据(FN):</td>
							<!--  <td  align="left"><input type="text" id="cdtProtocalFunCode" name="cdtProtocalFunCode" value="<%=pc.getCdtProtocalFunCode() %>" disabled="disabled"/></td>-->
							<td><select id="cdtProtocalFunCode"
								name="cdtProtocalFunCode" class="easyui-validatebox"
								style="width: 160px;" /></select>
								<div id="ss">
									<div style="color: #99BBE8; background: #fafafa; padding: 5px;">一类数据(FN):</div>
									<input id="all" type="checkbox" class="easyui-validatebox"
										value="all" /><span>全选</span><br /> <input id="chk1_Item"
										type="checkbox" name="cdtProtocalFunCode"
										class="easyui-validatebox" value="F2" /><span>F2</span><br />
									<input id="chk2_Item" type="checkbox" name="cdtProtocalFunCode"
										class="easyui-validatebox" value="F7" /><span>F7</span><br />
									<input id="chk3_Item" type="checkbox" name="cdtProtocalFunCode"
										class="easyui-validatebox" value="F8" /><span>F8</span><br />
									<input id="chk4_Item" type="checkbox" name="cdtProtocalFunCode"
										class="easyui-validatebox" value="F9" /><span>F9</span><br />
									<input id="chk5_Item" type="checkbox" name="cdtProtocalFunCode"
										class="easyui-validatebox" value="F11" /><span>F11</span><br />
									<input id="chk6_Item" type="checkbox" name="cdtProtocalFunCode"
										class="easyui-validatebox" value="F25" /><span>F25</span><br />
									<input id="chk7_Item" type="checkbox" name="cdtProtocalFunCode"
										class="easyui-validatebox" value="F26" /><span>F26</span><br />
									<input id="chk8_Item" type="checkbox" name="cdtProtocalFunCode"
										class="easyui-validatebox" value="F27" /><span>F27</span><br />
									<input id="chk9_Item" type="checkbox" name="cdtProtocalFunCode"
										class="easyui-validatebox" value="F28" /><span>F28</span><br />
									<input id="chk10_Item" type="checkbox"
										name="cdtProtocalFunCode" class="easyui-validatebox"
										value="F29" /><span>F29</span><br /> <input id="chk11_Item"
										type="checkbox" name="cdtProtocalFunCode"
										class="easyui-validatebox" value="F30" /><span>F30</span><br />
									<input id="chk12_Item" type="checkbox"
										name="cdtProtocalFunCode" class="easyui-validatebox"
										value="F41" /><span>F41</span><br /> <input id="chk13_Item"
										type="checkbox" name="cdtProtocalFunCode"
										class="easyui-validatebox" value="F42" /><span>F42</span><br />
									<input id="chk14_Item" type="checkbox"
										name="cdtProtocalFunCode" class="easyui-validatebox"
										value="F43" /><span>F43</span><br /> <input id="chk15_Item"
										type="checkbox" name="cdtProtocalFunCode"
										class="easyui-validatebox" value="F44" /><span>F44</span><br />
									<input id="chk16_Item" type="checkbox"
										name="cdtProtocalFunCode" class="easyui-validatebox"
										value="F45" /><span>F45</span><br /> <input id="chk17_Item"
										type="checkbox" name="cdtProtocalFunCode"
										class="easyui-validatebox" value="F46" /><span>F46</span><br />
									<input id="chk18_Item" type="checkbox"
										name="cdtProtocalFunCode" class="easyui-validatebox"
										value="F47" /><span>F47</span><br /> <input id="chk19_Item"
										type="checkbox" name="cdtProtocalFunCode"
										class="easyui-validatebox" value="F48" /><span>F48</span><br />
									<input id="chk20_Item" type="checkbox"
										name="cdtProtocalFunCode" class="easyui-validatebox"
										value="F57" /><span>F57</span><br /> <input id="chk21_Item"
										type="checkbox" name="cdtProtocalFunCode"
										class="easyui-validatebox" value="F127" /><span>F127</span><br />
									<input id="chk22_Item" type="checkbox"
										name="cdtProtocalFunCode" class="easyui-validatebox"
										value="F128" /><span>F128</span><br /> <input id="chk23_Item"
										type="checkbox" name="cdtProtocalFunCode"
										class="easyui-validatebox" value="F129" /><span>F129</span><br />
									<input id="chk24_Item" type="checkbox"
										name="cdtProtocalFunCode" class="easyui-validatebox"
										value="F130" /><span>F130</span><br /> <input id="chk25_Item"
										type="checkbox" name="cdtProtocalFunCode"
										class="easyui-validatebox" value="F131" /><span>F131</span><br />
									<input id="chk26_Item" type="checkbox"
										name="cdtProtocalFunCode" class="easyui-validatebox"
										value="F132" /><span>F132</span><br /> <input id="chk27_Item"
										type="checkbox" name="cdtProtocalFunCode"
										class="easyui-validatebox" value="F137" /><span>F137</span><br />
									<input id="chk28_Item" type="checkbox"
										name="cdtProtocalFunCode" class="easyui-validatebox"
										value="F138" /><span>F138</span><br /> <input id="chk29_Item"
										type="checkbox" name="cdtProtocalFunCode"
										class="easyui-validatebox" value="F139" /><span>F139</span><br />
									<input id="chk30_Item" type="checkbox"
										name="cdtProtocalFunCode" class="easyui-validatebox"
										value="F140" /><span>F140</span><br /> <input id="chk31_Item"
										type="checkbox" name="cdtProtocalFunCode"
										class="easyui-validatebox" value="F141" /><span>F141</span><br />

								</div> <!--  <input type="text" id="funcode2" name="funcode2" class="easyui-validatebox"/> -->

							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td width="150px" align="right">二类日曲线数据(FN):</td>
							<!--  <td  align="left"><input type="text" id="cdtProtocalSecFunCode" name="cdtProtocalSecFunCode"  value="<%=pc.getCdtProtocalSecFunCode() %>" disabled="disabled"/></td>-->
							<td><select id="cdtProtocalSecFunCode"
								name="cdtProtocalSecFunCode" class="easyui-validatebox"
								style="width: 160px;" /></select>
								<div id="ss1">
									<div style="color: #99BBE8; background: #fafafa; padding: 5px;">二类日曲线数据(FN):</div>
									<input id="all11" type="checkbox" class="easyui-validatebox"
										value="all" /><span>全选</span><br /> <input id="chk1_Items"
										type="checkbox" name="cdtProtocalSecFunCode"
										class="easyui-validatebox" value="F5" /><span>F5</span><br />
									<input id="chk2_Items" type="checkbox"
										name="cdtProtocalSecFunCode" class="easyui-validatebox"
										value="F6" /><span>F6</span><br /> <input id="chk3_Items"
										type="checkbox" name="cdtProtocalSecFunCode"
										class="easyui-validatebox" value="F7" /><span>F7</span><br />
									<input id="chk4_Items" type="checkbox"
										name="cdtProtocalSecFunCode" class="easyui-validatebox"
										value="F8" /><span>F8</span><br /> <input id="chk5_Items"
										type="checkbox" name="cdtProtocalSecFunCode"
										class="easyui-validatebox" value="F21" /><span>F21</span><br />
									<input id="chk6_Items" type="checkbox"
										name="cdtProtocalSecFunCode" class="easyui-validatebox"
										value="F22" /><span>F22</span><br /> <input id="chk7_Items"
										type="checkbox" name="cdtProtocalSecFunCode"
										class="easyui-validatebox" value="F23" /><span>F23</span><br />
									<input id="chk8_Items" type="checkbox"
										name="cdtProtocalSecFunCode" class="easyui-validatebox"
										value="F24" /><span>F24</span><br /> <input id="chk9_Items"
										type="checkbox" name="cdtProtocalSecFunCode"
										class="easyui-validatebox" value="F26" /><span>F26</span><br />
									<input id="chk10_Items" type="checkbox"
										name="cdtProtocalSecFunCode" class="easyui-validatebox"
										value="F27" /><span>F27</span><br /> <input id="chk11_Items"
										type="checkbox" name="cdtProtocalSecFunCode"
										class="easyui-validatebox" value="F29" /><span>F29</span><br />
									<input id="chk12_Items" type="checkbox"
										name="cdtProtocalSecFunCode" class="easyui-validatebox"
										value="F32" /><span>F32</span><br /> <input id="chk13_Items"
										type="checkbox" name="cdtProtocalSecFunCode"
										class="easyui-validatebox" value="F34" /><span>F34</span><br />
									<input id="chk14_Items" type="checkbox"
										name="cdtProtocalSecFunCode" class="easyui-validatebox"
										value="F35" /><span>F35</span><br /> <input id="chk15_Items"
										type="checkbox" name="cdtProtocalSecFunCode"
										class="easyui-validatebox" value="F40" /><span>F40</span><br />
									<input id="chk16_Items" type="checkbox"
										name="cdtProtocalSecFunCode" class="easyui-validatebox"
										value="F45" /><span>F45</span><br /> <input id="chk17_Items"
										type="checkbox" name="cdtProtocalSecFunCode"
										class="easyui-validatebox" value="F46" /><span>F46</span><br />
									<input id="chk18_Items" type="checkbox"
										name="cdtProtocalSecFunCode" class="easyui-validatebox"
										value="F49" /><span>F49</span><br /> <input id="chk19_Items"
										type="checkbox" name="cdtProtocalSecFunCode"
										class="easyui-validatebox" value="F51" /><span>F51</span><br />
									<input id="chk20_Items" type="checkbox"
										name="cdtProtocalSecFunCode" class="easyui-validatebox"
										value="F81" /><span>F81</span><br /> <input id="chk21_Items"
										type="checkbox" name="cdtProtocalSecFunCode"
										class="easyui-validatebox" value="F82" /><span>F82</span><br />
									<input id="chk22_Items" type="checkbox"
										name="cdtProtocalSecFunCode" class="easyui-validatebox"
										value="F83" /><span>F83</span><br /> <input id="chk23_Items"
										type="checkbox" name="cdtProtocalSecFunCode"
										class="easyui-validatebox" value="F84" /><span>F84</span><br />
									<input id="chk24_Items" type="checkbox"
										name="cdtProtocalSecFunCode" class="easyui-validatebox"
										value="F85" /><span>F85</span><br /> <input id="chk25_Items"
										type="checkbox" name="cdtProtocalSecFunCode"
										class="easyui-validatebox" value="F86" /><span>F86</span><br />
									<input id="chk26_Items" type="checkbox"
										name="cdtProtocalSecFunCode" class="easyui-validatebox"
										value="F87" /><span>F87</span><br /> <input id="chk27_Items"
										type="checkbox" name="cdtProtocalSecFunCode"
										class="easyui-validatebox" value="F88" /><span>F88</span><br />
									<input id="chk28_Items" type="checkbox"
										name="cdtProtocalSecFunCode" class="easyui-validatebox"
										value="F89" /><span>F89</span><br /> <input id="chk29_Items"
										type="checkbox" name="cdtProtocalSecFunCode"
										class="easyui-validatebox" value="F90" /><span>F90</span><br />
									<input id="chk30_Items" type="checkbox"
										name="cdtProtocalSecFunCode" class="easyui-validatebox"
										value="F91" /><span>F91</span><br /> <input id="chk31_Items"
										type="checkbox" name="cdtProtocalSecFunCode"
										class="easyui-validatebox" value="F92" /><span>F92</span><br />
									<input id="chk32_Items" type="checkbox"
										name="cdtProtocalSecFunCode" class="easyui-validatebox"
										value="F93" /><span>F93</span><br /> <input id="chk33_Items"
										type="checkbox" name="cdtProtocalSecFunCode"
										class="easyui-validatebox" value="F94" /><span>F94</span><br />
									<input id="chk34_Items" type="checkbox"
										name="cdtProtocalSecFunCode" class="easyui-validatebox"
										value="F95" /><span>F95</span><br /> <input id="chk35_Items"
										type="checkbox" name="cdtProtocalSecFunCode"
										class="easyui-validatebox" value="F97" /><span>F97</span><br />
									<input id="chk36_Items" type="checkbox"
										name="cdtProtocalSecFunCode" class="easyui-validatebox"
										value="F98" /><span>F98</span><br /> <input id="chk37_Items"
										type="checkbox" name="cdtProtocalSecFunCode"
										class="easyui-validatebox" value="F99" /><span>F99</span><br />
									<input id="chk38_Items" type="checkbox"
										name="cdtProtocalSecFunCode" class="easyui-validatebox"
										value="F100" /><span>F100</span><br /> <input id="chk39_Items"
										type="checkbox" name="cdtProtocalSecFunCode"
										class="easyui-validatebox" value="F101" /><span>F101</span><br />
									<input id="chk40_Items" type="checkbox"
										name="cdtProtocalSecFunCode" class="easyui-validatebox"
										value="F102" /><span>F102</span><br /> <input id="chk41_Items"
										type="checkbox" name="cdtProtocalSecFunCode"
										class="easyui-validatebox" value="F103" /><span>F103</span><br />
									<input id="chk42_Items" type="checkbox"
										name="cdtProtocalSecFunCode" class="easyui-validatebox"
										value="F104" /><span>F104</span><br /> <input id="chk43_Items"
										type="checkbox" name="cdtProtocalSecFunCode"
										class="easyui-validatebox" value="F105" /><span>F105</span><br />
									<input id="chk44_Items" type="checkbox"
										name="cdtProtocalSecFunCode" class="easyui-validatebox"
										value="F106" /><span>F106</span><br /> <input id="chk45_Items"
										type="checkbox" name="cdtProtocalSecFunCode"
										class="easyui-validatebox" value="F107" /><span>F107</span><br />
									<input id="chk46_Items" type="checkbox"
										name="cdtProtocalSecFunCode" class="easyui-validatebox"
										value="F108" /><span>F108</span><br /> <input id="chk47_Items"
										type="checkbox" name="cdtProtocalSecFunCode"
										class="easyui-validatebox" value="F109" /><span>F109</span><br />
									<input id="chk48_Items" type="checkbox"
										name="cdtProtocalSecFunCode" class="easyui-validatebox"
										value="F110" /><span>F110</span><br /> <input id="chk49_Items"
										type="checkbox" name="cdtProtocalSecFunCode"
										class="easyui-validatebox" value="F111" /><span>F111</span><br />
									<input id="chk50_Items" type="checkbox"
										name="cdtProtocalSecFunCode" class="easyui-validatebox"
										value="F112" /><span>F112</span><br /> <input id="chk51_Items"
										type="checkbox" name="cdtProtocalSecFunCode"
										class="easyui-validatebox" value="F145" /><span>F145</span><br />
									<input id="chk52_Items" type="checkbox"
										name="cdtProtocalSecFunCode" class="easyui-validatebox"
										value="F146" /><span>F146</span><br /> <input id="chk53_Items"
										type="checkbox" name="cdtProtocalSecFunCode"
										class="easyui-validatebox" value="F147" /><span>F147</span><br />
									<input id="chk54_Items" type="checkbox"
										name="cdtProtocalSecFunCode" class="easyui-validatebox"
										value="F148" /><span>F148</span><br /> <input id="chk55_Items"
										type="checkbox" name="cdtProtocalSecFunCode"
										class="easyui-validatebox" value="F153" /><span>F153</span><br />
									<input id="chk56_Items" type="checkbox"
										name="cdtProtocalSecFunCode" class="easyui-validatebox"
										value="F161" /><span>F161</span><br /> <input id="chk57_Items"
										type="checkbox" name="cdtProtocalSecFunCode"
										class="easyui-validatebox" value="F162" /><span>F162</span><br />
									<input id="chk58_Items" type="checkbox"
										name="cdtProtocalSecFunCode" class="easyui-validatebox"
										value="F163" /><span>F163</span><br /> <input id="chk59_Items"
										type="checkbox" name="cdtProtocalSecFunCode"
										class="easyui-validatebox" value="F164" /><span>F164</span><br />
									<input id="chk60_Items" type="checkbox"
										name="cdtProtocalSecFunCode" class="easyui-validatebox"
										value="F177" /><span>F177</span><br /> <input id="chk61_Items"
										type="checkbox" name="cdtProtocalSecFunCode"
										class="easyui-validatebox" value="F178" /><span>F178</span><br />
									<input id="chk62_Items" type="checkbox"
										name="cdtProtocalSecFunCode" class="easyui-validatebox"
										value="F179" /><span>F179</span><br /> <input id="chk63_Items"
										type="checkbox" name="cdtProtocalSecFunCode"
										class="easyui-validatebox" value="F180" /><span>F180</span><br />
									<input id="chk64_Items" type="checkbox"
										name="cdtProtocalSecFunCode" class="easyui-validatebox"
										value="F281" /><span>F281</span><br /> <input id="chk65_Items"
										type="checkbox" name="cdtProtocalSecFunCode"
										class="easyui-validatebox" value="F282" /><span>F282</span><br />
									<input id="chk66_Items" type="checkbox"
										name="cdtProtocalSecFunCode" class="easyui-validatebox"
										value="F283" /><span>F283</span><br /> <input id="chk67_Items"
										type="checkbox" name="cdtProtocalSecFunCode"
										class="easyui-validatebox" value="F284" /><span>F284</span><br />
									<input id="chk68_Items" type="checkbox"
										name="cdtProtocalSecFunCode" class="easyui-validatebox"
										value="F285" /><span>F285</span><br /> <input id="chk69_Items"
										type="checkbox" name="cdtProtocalSecFunCode"
										class="easyui-validatebox" value="F286" /><span>F286</span><br />
									<input id="chk70_Items" type="checkbox"
										name="cdtProtocalSecFunCode" class="easyui-validatebox"
										value="F287" /><span>F287</span><br /> <input id="chk71_Items"
										type="checkbox" name="cdtProtocalSecFunCode"
										class="easyui-validatebox" value="F288" /><span>F288</span><br />
									<input id="chk72_Items" type="checkbox"
										name="cdtProtocalSecFunCode" class="easyui-validatebox"
										value="F289" /><span>F289</span><br />
								</div> <!--  <input type="text" id="secfuncode2" name="secfuncode2" class="easyui-validatebox"/>-->
							</td>


							<td width="150px" align="right">二类日冻结数据(FN):</td>
							<!-- <td  align="left"><input type="text" id="cdtProtocalSecdayFunCode" name="cdtProtocalSecdayFunCode"  value="<%=pc.getCdtProtocalSecdayFunCode()%>" disabled="disabled"/></td> -->
							<td><select id="cdtProtocalSecdayFunCode"
								class="easyui-validatebox" data-options="width:160"
								name="cdtProtocalSecdayFunCode"></select>
								<div id="ss2">
									<div style="color: #99BBE8; background: #fafafa; padding: 5px;">二类日冻结数据(FN)</div>
									<input id="all12" type="checkbox" class="easyui-validatebox"
										value="all3" /><span>全选</span><br /> <input id="che1_Items1"
										type="checkbox" name="cdtProtocalSecdayFunCode"
										class="easyui-validatebox" value="F5" /><span>F5</span><br />
									<input id="che2_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F6" /><span>F6</span><br /> <input id="che3_Items1"
										type="checkbox" name="cdtProtocalSecdayFunCode"
										class="easyui-validatebox" value="F7" /><span>F7</span><br />
									<input id="che4_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F8" /><span>F8</span><br /> <input id="che5_Items1"
										type="checkbox" name="cdtProtocalSecdayFunCode"
										class="easyui-validatebox" value="F21" /><span>F21</span><br />
									<input id="che6_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F22" /><span>F22</span><br /> <input id="che7_Items1"
										type="checkbox" name="cdtProtocalSecdayFunCode"
										class="easyui-validatebox" value="F23" /><span>F23</span><br />
									<input id="che8_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F24" /><span>F24</span><br /> <input id="che9_Items1"
										type="checkbox" name="cdtProtocalSecdayFunCode"
										class="easyui-validatebox" value="F26" /><span>F26</span><br />
									<input id="che10_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F27" /><span>F27</span><br /> <input id="che11_Items1"
										type="checkbox" name="cdtProtocalSecdayFunCode"
										class="easyui-validatebox" value="F29" /><span>F29</span><br />
									<input id="che12_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F32" /><span>F32</span><br /> <input id="che13_Items1"
										type="checkbox" name="cdtProtocalSecdayFunCode"
										class="easyui-validatebox" value="F34" /><span>F34</span><br />
									<input id="che14_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F35" /><span>F35</span><br /> <input id="che15_Items1"
										type="checkbox" name="cdtProtocalSecdayFunCode"
										class="easyui-validatebox" value="F40" /><span>F40</span><br />
									<input id="che16_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F45" /><span>F45</span><br /> <input id="che17_Items1"
										type="checkbox" name="cdtProtocalSecdayFunCode"
										class="easyui-validatebox" value="F46" /><span>F46</span><br />
									<input id="che18_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F49" /><span>F49</span><br /> <input id="che19_Items1"
										type="checkbox" name="cdtProtocalSecdayFunCode"
										class="easyui-validatebox" value="F51" /><span>F51</span><br />
									<input id="che20_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F81" /><span>F81</span><br /> <input id="che21_Items1"
										type="checkbox" name="cdtProtocalSecdayFunCode"
										class="easyui-validatebox" value="F82" /><span>F82</span><br />
									<input id="che22_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F83" /><span>F83</span><br /> <input id="che23_Items1"
										type="checkbox" name="cdtProtocalSecdayFunCode"
										class="easyui-validatebox" value="F84" /><span>F84</span><br />
									<input id="che24_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F85" /><span>F85</span><br /> <input id="che25_Items1"
										type="checkbox" name="cdtProtocalSecdayFunCode"
										class="easyui-validatebox" value="F86" /><span>F86</span><br />
									<input id="che26_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F87" /><span>F87</span><br /> <input id="che27_Items1"
										type="checkbox" name="cdtProtocalSecdayFunCode"
										class="easyui-validatebox" value="F88" /><span>F88</span><br />
									<input id="che28_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F89" /><span>F89</span><br /> <input id="che29_Items1"
										type="checkbox" name="cdtProtocalSecdayFunCode"
										class="easyui-validatebox" value="F90" /><span>F90</span><br />
									<input id="che30_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F91" /><span>F91</span><br /> <input id="che31_Items1"
										type="checkbox" name="cdtProtocalSecdayFunCode"
										class="easyui-validatebox" value="F92" /><span>F92</span><br />
									<input id="che32_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F93" /><span>F93</span><br /> <input id="che33_Items1"
										type="checkbox" name="cdtProtocalSecdayFunCode"
										class="easyui-validatebox" value="F94" /><span>F94</span><br />
									<input id="che34_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F95" /><span>F95</span><br /> <input id="che35_Items1"
										type="checkbox" name="cdtProtocalSecdayFunCode"
										class="easyui-validatebox" value="F97" /><span>F97</span><br />
									<input id="che36_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F98" /><span>F98</span><br /> <input id="che37_Items1"
										type="checkbox" name="cdtProtocalSecdayFunCode"
										class="easyui-validatebox" value="F99" /><span>F99</span><br />
									<input id="che38_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F100" /><span>F100</span><br /> <input
										id="che39_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F101" /><span>F101</span><br /> <input
										id="che40_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F102" /><span>F102</span><br /> <input
										id="che41_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F103" /><span>F103</span><br /> <input
										id="che42_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F104" /><span>F104</span><br /> <input
										id="che43_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F105" /><span>F105</span><br /> <input
										id="che44_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F106" /><span>F106</span><br /> <input
										id="che45_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F107" /><span>F107</span><br /> <input
										id="che46_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F108" /><span>F108</span><br /> <input
										id="che47_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F109" /><span>F109</span><br /> <input
										id="che48_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F110" /><span>F110</span><br /> <input
										id="che49_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F111" /><span>F111</span><br /> <input
										id="che50_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F112" /><span>F112</span><br /> <input
										id="che51_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F145" /><span>F145</span><br /> <input
										id="che52_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F146" /><span>F146</span><br /> <input
										id="che53_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F147" /><span>F147</span><br /> <input
										id="che54_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F148" /><span>F148</span><br /> <input
										id="che55_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F153" /><span>F153</span><br /> <input
										id="che56_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F161" /><span>F161</span><br /> <input
										id="che57_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F162" /><span>F162</span><br /> <input
										id="che58_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F163" /><span>F163</span><br /> <input
										id="che59_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F164" /><span>F164</span><br /> <input
										id="che60_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F177" /><span>F177</span><br /> <input
										id="che61_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F178" /><span>F178</span><br /> <input
										id="che62_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F179" /><span>F179</span><br /> <input
										id="che63_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F180" /><span>F180</span><br /> <input
										id="che64_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F281" /><span>F281</span><br /> <input
										id="che65_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F282" /><span>F282</span><br /> <input
										id="che66_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F283" /><span>F283</span><br /> <input
										id="che67_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F284" /><span>F284</span><br /> <input
										id="che68_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F285" /><span>F285</span><br /> <input
										id="che69_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F286" /><span>F286</span><br /> <input
										id="che70_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F287" /><span>F287</span><br /> <input
										id="che71_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F288" /><span>F288</span><br /> <input
										id="che72_Items1" type="checkbox"
										name="cdtProtocalSecdayFunCode" class="easyui-validatebox"
										value="F289" /><span>F289</span><br />
								</div> <!--  <input type="text" id="secdayfuncode2" name="secdayfuncode2" class="easyui-validatebox"/>-->
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td width="150px" align="right">二类月冻结数据(FN):</td>
							<!--  <td  align="left"><input type="text" id="cdtProtocalSecmonFunCode" name="cdtProtocalSecmonFunCode"  value="<%=pc.getCdtProtocalSecmonFunCode()%>" disabled="disabled"/></td>-->
							<td><select id="cdtProtocalSecmonFunCode"
								class="easyui-validatebox" data-options="width:160"
								name="cdtProtocalSecmonFunCode"></select>
								<div id="ss3">
									<div style="color: #99BBE8; background: #fafafa; padding: 5px;">二类月冻结数据(FN)</div>
									<input id="all13" type="checkbox" class="easyui-validatebox"
										value="all13" /><span>全选</span><br /> <input id="chc1_Items2"
										type="checkbox" name="cdtProtocalSecmonFunCode"
										class="easyui-validatebox" value="F5" /><span>F5</span><br />
									< <input id="chc2_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F6" /><span>F6</span><br /> <input id="chc3_Items2"
										type="checkbox" name="cdtProtocalSecmonFunCode"
										class="easyui-validatebox" value="F7" /><span>F7</span><br />
									<input id="chc4_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F8" /><span>F8</span><br /> <input id="chc5_Items2"
										type="checkbox" name="cdtProtocalSecmonFunCode"
										class="easyui-validatebox" value="F21" /><span>F21</span><br />
									<input id="chc6_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F22" /><span>F22</span><br /> <input id="chc7_Items2"
										type="checkbox" name="cdtProtocalSecmonFunCode"
										class="easyui-validatebox" value="F23" /><span>F23</span><br />
									<input id="chc8_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F24" /><span>F24</span><br /> <input id="chc9_Items2"
										type="checkbox" name="cdtProtocalSecmonFunCode"
										class="easyui-validatebox" value="F26" /><span>F26</span><br />
									<input id="chc10_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F27" /><span>F27</span><br /> <input id="chc11_Items2"
										type="checkbox" name="cdtProtocalSecmonFunCode"
										class="easyui-validatebox" value="F29" /><span>F29</span><br />
									<input id="chc12_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F32" /><span>F32</span><br /> <input id="chc13_Items2"
										type="checkbox" name="cdtProtocalSecmonFunCode"
										class="easyui-validatebox" value="F34" /><span>F34</span><br />
									<input id="chc14_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F35" /><span>F35</span><br /> <input id="chc15_Items2"
										type="checkbox" name="cdtProtocalSecmonFunCode"
										class="easyui-validatebox" value="F40" /><span>F40</span><br />
									<input id="chc16_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F45" /><span>F45</span><br /> <input id="chc17_Items2"
										type="checkbox" name="cdtProtocalSecmonFunCode"
										class="easyui-validatebox" value="F46" /><span>F46</span><br />
									<input id="chc18_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F49" /><span>F49</span><br /> <input id="chc19_Items2"
										type="checkbox" name="cdtProtocalSecmonFunCode"
										class="easyui-validatebox" value="F51" /><span>F51</span><br />
									<input id="chc20_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F81" /><span>F81</span><br /> <input id="chc21_Items2"
										type="checkbox" name="cdtProtocalSecmonFunCode"
										class="easyui-validatebox" value="F82" /><span>F82</span><br />
									<input id="chc22_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F83" /><span>F83</span><br /> <input id="chc23_Items2"
										type="checkbox" name="cdtProtocalSecmonFunCode"
										class="easyui-validatebox" value="F84" /><span>F84</span><br />
									<input id="chc24_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F85" /><span>F85</span><br /> <input id="chc25_Items2"
										type="checkbox" name="cdtProtocalSecmonFunCode"
										class="easyui-validatebox" value="F86" /><span>F86</span><br />
									<input id="chc26_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F87" /><span>F87</span><br /> <input id="chc27_Items2"
										type="checkbox" name="cdtProtocalSecmonFunCode"
										class="easyui-validatebox" value="F88" /><span>F88</span><br />
									<input id="chc28_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F89" /><span>F89</span><br /> <input id="chc29_Items2"
										type="checkbox" name="cdtProtocalSecmonFunCode"
										class="easyui-validatebox" value="F90" /><span>F90</span><br />
									<input id="chc30_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F91" /><span>F91</span><br /> <input id="chc31_Items2"
										type="checkbox" name="cdtProtocalSecmonFunCode"
										class="easyui-validatebox" value="F92" /><span>F92</span><br />
									<input id="chc32_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F93" /><span>F93</span><br /> <input id="chc33_Items2"
										type="checkbox" name="cdtProtocalSecmonFunCode"
										class="easyui-validatebox" value="F94" /><span>F94</span><br />
									<input id="chc34_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F95" /><span>F95</span><br /> <input id="chc35_Items2"
										type="checkbox" name="cdtProtocalSecmonFunCode"
										class="easyui-validatebox" value="F97" /><span>F97</span><br />
									<input id="chc36_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F98" /><span>F98</span><br /> <input id="chc37_Items2"
										type="checkbox" name="cdtProtocalSecmonFunCode"
										class="easyui-validatebox" value="F99" /><span>F99</span><br />
									<input id="chc38_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F100" /><span>F100</span><br /> <input
										id="chc39_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F101" /><span>F101</span><br /> <input
										id="chc40_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F102" /><span>F102</span><br /> <input
										id="chc41_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F103" /><span>F103</span><br /> <input
										id="chc42_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F104" /><span>F104</span><br /> <input
										id="chc43_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F105" /><span>F105</span><br /> <input
										id="chc44_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F106" /><span>F106</span><br /> <input
										id="chc45_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F107" /><span>F107</span><br /> <input
										id="chc46_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F108" /><span>F108</span><br /> <input
										id="chc47_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F109" /><span>F109</span><br /> <input
										id="chc48_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F110" /><span>F110</span><br /> <input
										id="chc49_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F111" /><span>F111</span><br /> <input
										id="chc50_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F112" /><span>F112</span><br /> <input
										id="chc51_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F145" /><span>F145</span><br /> <input
										id="chc52_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F146" /><span>F146</span><br /> <input
										id="chc53_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F147" /><span>F147</span><br /> <input
										id="chc54_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F148" /><span>F148</span><br /> <input
										id="chc55_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F153" /><span>F153</span><br /> <input
										id="chc56_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F161" /><span>F161</span><br /> <input
										id="chc57_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F162" /><span>F162</span><br /> <input
										id="chc58_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F163" /><span>F163</span><br /> <input
										id="chc59_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F164" /><span>F164</span><br /> <input
										id="chc60_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F177" /><span>F177</span><br /> <input
										id="chc61_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F178" /><span>F178</span><br /> <input
										id="chc62_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F179" /><span>F179</span><br /> <input
										id="chc63_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F180" /><span>F180</span><br /> <input
										id="chc64_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F281" /><span>F281</span><br /> <input
										id="chc65_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F282" /><span>F282</span><br /> <input
										id="chc66_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F283" /><span>F283</span><br /> <input
										id="chc67_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F284" /><span>F284</span><br /> <input
										id="chc68_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F285" /><span>F285</span><br /> <input
										id="chc69_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F286" /><span>F286</span><br /> <input
										id="chc70_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F287" /><span>F287</span><br /> <input
										id="chc71_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F288" /><span>F288</span><br /> <input
										id="chc72_Items2" type="checkbox"
										name="cdtProtocalSecmonFunCode" class="easyui-validatebox"
										value="F289" /><span>F289</span><br />
								</div> <!--  <input type="text" id="secmonfuncode2" name="secmonfuncode2" class="easyui-validatebox"/>-->
							</td>


							<td width="150px" align="right">计量终端初始值:</td>
							<td align="left"><input type="text" id="cdtInitValue"
								name="cdtInitValue" value="<%=pc.getCdtInitValue() %>"
								disabled="disabled" /></td>

							<td>&nbsp;</td>
						</tr>
						<tr>
							<td width="150px" align="right">计量终端厂家:</td>
							<td align="left"><input type="text" id="cdtTerminalIndustry"
								name="cdtTerminalIndustry"
								value="<%=pc.getCdtTerminalIndustry() %>" disabled="disabled" /></td>
							<td width="150px" align="right">计量终端检定周期:</td>
							<td align="left"><input type="text" id="cdtCheckPeriod"
								name="cdtCheckPeriod" value="<%=pc.getCdtCheckPeriod() %>"
								disabled="disabled" /></td>

							<td>&nbsp;</td>
						</tr>
						<tr>
							<td width="150px" align="right">计量终端出厂编号:</td>
							<td align="left"><input type="text" id="cdtProductionCode"
								name="cdtProductionCode" value="<%=pc.getCdtProductionCode() %>"
								disabled="disabled" /></td>
							<td width="150px" align="right">添加时间:</td>
							<td align="left"><input type="text" id="cdtAddTime"
								name="cdtAddTime" class="easyui-datebox"
								data-options="formatter:myformatter,parser:myparser"
								style="width: 150px;" /></td>

						</tr>
						<tr>

							<td width="150px" align="right">计量表类型:</td>
							<td align="left"><input type="radio" id="cdtIsinvented1"
								name="cdtIsinvented" value="0" checked="checked"
								onclick="showMpBsDetail()" />实终端 <input type="radio"
								id="cdtIsinvented" name="cdtIsinvented" value="1"
								onclick="showMpBsDetail()" />虚终端</td>
							<td width="150px" align="right">下次检定日期:</td>
							<td align="left"><input type="text" id="cdtNextCheckTime"
								name="cdtNextCheckTime" class="easyui-datebox"
								data-options="formatter:myformatter,parser:myparser"
								style="width: 150px;" disabled="disabled" /></td>
							<td><input type="hidden" id="pclcParentId"
								name="pclcParentId" value="<%=pc.getPclcParentId() %>" /> <input
								type="hidden" id="pclcCalculateBand" name="pclcCalculateBand"
								value="<%=pc.getPclcCalculateBand()%>" /> <input type="hidden"
								id="pclcEnergyType" name="pclcEnergyType"
								value="<%=pc.getPclcEnergyType() %>" /></td>
							<td>&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="5" style="width: 100%;">
					<!-- 实终端 BEGIN-->
					<table id="zd0">
						<!--
							<tr>
					    		<td width="150px" align="right">计量表底数:</td>
					    		<td  align="left"><input type="text" id="cdtInitValue" name="cdtInitValue" value="<%=pc.getCdtInitValue() %>"/></td>
					    		<td width="150px" align="right">生产厂家:</td>
					    		<td  align="left"><input type="text" id="cdtTerminalIndustry" name="cdtTerminalIndustry" value="<%=pc.getCdtTerminalIndustry() %>"/></td>
					    		<td>&nbsp;</td>
					    	</tr>
					    	<tr>
					    		<td width="150px" align="right">检定周期:</td>
					    		<td  align="left"><input type="text" id="cdtCheckPeriod" name="cdtCheckPeriod" value="<%=pc.getCdtCheckPeriod() %>"/></td>
					    		<td width="150px" align="right">出厂编号:</td>
					    		<td  align="left"><input type="text" id="cdtProductionCode" name="cdtProductionCode" value="<%=pc.getCdtProductionCode() %>"/></td>
					    		<td>&nbsp;</td>
					    	</tr>
					    	<tr>
					    	
					    		<td width="150px" align="right">添加时间:</td>
					    		<td  align="left"><input type="text" id="cdtAddTime" name="cdtAddTime" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser"  style="width:150px;" /></td>
					    		<td width="150px" align="right">下次检定日期:</td>
					    		<td  align="left"><input type="text" id="cdtNextCheckTime" name="cdtNextCheckTime" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" style="width:150px;" /></td>
					    		<td>&nbsp;</td>
					    	</tr>
					    	
					    	<tr>
					    	
					    		<td width="100px" align="right">计算公式:</td>
					    		<td  align="left" colspan="3">
					    			<textarea rows="3" cols="4" id="cdtFormular" name="cdtFormular" style="width: 400px"></textarea>	
					    		</td>
					    		<td>&nbsp;</td>
					    	</tr>
					    	 -->
					</table> <!-- 实终端 END -->

				</td>
			</tr>
			<tr>
				<td id="w1" colspan="5"
					style="display: none; width: 700px; margin-left: 0px;">
					<!-- 虚终端 BEGIN -->
					<table align="center" border="1" cellpadding="0" cellspacing="0"
						width="700px" bordercolordark="#FFFFFF"
						style="border: thin solid;">
						<!-- 			
	             		<tr>
							<td colspan="5" >
								公式：
							</td>
						</tr>
						 -->
						<tr>
							<td>公式：</td>
							<td colspan="4" align="left"><textarea name="formularName"
									id="formularName" cols="60" rows="3" readonly><%=pc.getCdtFormular() %></textarea>
								<input name="formularNameId" id="formularNameId" type="hidden" />
								<input name="formularNameIdS" id="formularNameIdS" type="hidden"
								value="<%=pc.getCdtFormularid() %>" /></td>
						</tr>
						<tr>
							<td colspan="5" align="left">
								<table border="1" cellpadding="0" cellspacing="0"
									style="border: thin solid; border-color: gray;">
									<tr>
										<td style="width: 12%">运算符号</td>
										<td style="width: 87%">
											<button type="button" value="+" id="buttona" name="buttont"
												onclick="add(this)" style="cursor: pointer; width: 30px" />
											+
											</button>
											<button type="button" value="-" id="buttonb" name="buttonb"
												onclick="add(this)" style="cursor: pointer; width: 30px" />
											-
											</button>
											<button type="button" value="*" id="buttonc" name="buttonc"
												onclick="add(this)" style="cursor: pointer; width: 30px" />
											*
											</button>
											<button type="button" value="\" id="buttond" name="buttond"
												onclick="add(this)" style="cursor: pointer; width: 30px" />
											/
											</button>
											<button type="button" value="(" id="buttone" name="buttone"
												onclick="add(this)" style="cursor: pointer; width: 30px" />
											(
											</button>
											<button type="button" value=")" id="buttonf" name="buttonf"
												onclick="add(this)" style="cursor: pointer; width: 30px" />
											)
											</button>
											<button type="button" value="." id="buttong" name="buttonf"
												onclick="add(this)" style="cursor: pointer; width: 30px" />
											.
											</button>


											<button type="button" value="1" id="button1" name="button1"
												onclick="add(this)" style="cursor: pointer; width: 30px">
												1</button>
											<button type="button" value="2" id="button2" name="button2"
												onclick="add(this)" style="cursor: pointer; width: 30px">
												2</button>
											<button type="button" value="3" id="button3" name="button3"
												onclick="add(this)" style="cursor: pointer; width: 30px" />
											3
											</button>
											<button type="button" value="4" id="button4" name="button4"
												onclick="add(this)" style="cursor: pointer; width: 30px" />
											4
											</button>
											<button type="button" value="5" id="button5" name="button5"
												onclick="add(this)" style="cursor: pointer; width: 30px" />
											5
											</button>
											<button type="button" value="6" id="button6" name="button6"
												onclick="add(this)" style="cursor: pointer; width: 30px" />
											6
											</button>
											<button type="button" value="7" id="button7" name="button7"
												onclick="add(this)" style="cursor: pointer; width: 30px" />
											7
											</button>
											<button type="button" value="8" id="button8" name="button8"
												onclick="add(this)" style="cursor: pointer; width: 30px" />
											8
											</button>
											<button type="button" value="9" id="button9" name="button9"
												onclick="add(this)" style="cursor: pointer; width: 30px" />
											9
											</button>
											<button type="button" value="0" id="button0" name="button0"
												onclick="add(this)" style="cursor: pointer; width: 30px" />
											0
											</button>
											<button type="button" value="max" id="buttonMax"
												name="buttonMax" onclick="add(this)"
												style="cursor: pointer; width: 30px" /> max
											</button>
											<button type="button" value="avg" id="buttonAvg"
												name="buttonAvg" onclick="add(this)"
												style="cursor: pointer; width: 30px" /> avg
											</button>
											<button type="button" value="min" id="buttonMin"
												name="buttonMin" onclick="add(this)"
												style="cursor: pointer; width: 30px" /> min
											</button>
											<button type="button" value="diff" id="buttonDiff"
												name="buttonDiff" onclick="add(this)"
												style="cursor: pointer; width: 30px" /> diff
											</button>
											<button type="button" value="sum" id="buttonSum"
												name="buttonSum" onclick="add(this)"
												style="cursor: pointer; width: 35px" /> sum
											</button>
										</td>
										<td style="width: 8%"><input type="button" value="退后"
											id="buttonth" name="buttonth" onclick="backoff()"
											icon='icon-back' /> <input type="button" value="清除"
											id="buttonq" name="buttonq" onclick="cleanFormular()"
											icon='icon-delete' /></td>
									</tr>
								</table>
							</td>
						</tr>

						<tr>
							<td colspan="5" align="left">
								<table border="1" width="100%" cellpadding="0" cellspacing="0"
									style="border: thin solid; border-color: gray;">
									<tr>
										<td align="left" style="width: 10%">因子选择：</td>
										<td style="width: 70%"><input type="text"
											id="factorSelect" name="factorSelect" size="50"
											maxlength="150" readonly /> <input type="hidden"
											id="factorSelectID" name="factorSelectID" size="50"
											maxlength="150" readonly /> <input type="hidden"
											id="factorSelectIDS" name="factorSelectIDS" size="50"
											maxlength="150" readonly /></td>
										<td style="width: 10%"><input type="button"
											name="buttonqd" onclick="yinzi()" ; value="确定"
											icon='icon-save' /></td>
										<td style="width: 10%"><input type="button" value="清除"
											name="buttonq" onclick="clean()" icon='icon-delete' /></td>
									</tr>
								</table>
							</td>
						</tr>

						<tr>
							<td align="left" style="width: 10%">因子属性：</td>
							<TD align="left" colspan="4"><input type="hidden" size="12"
								name="application1" maxlength="50" /> <input type="button"
								size="12" onclick="addFactor('cal')" value="计量仪表"
								name="application" maxlength="50" icon='icon-add' /></TD>
						</tr>

					</table> <!-- 虚终端 END -->
				</td>
			</tr>

		</table>
		<table style="width: 100%">
			<tr>
				<td width="100px" align="right">备注:</td>
				<td align="left" colspan="4"><textarea rows="3" cols="4"
						id="cdtBackups" name="cdtBackups" style="width: 400px"> <%=pc.getCdtBackups() %></textarea>
				</td>
			</tr>
			<tr>
				<td width="100px"></td>
				<td align="left" colspan="4"><input type="submit" value="保存"
					id="aButton" class="btnClass" /> <input type="button" value="取消"
					id="cButton" class="btnClass" /></td>
			</tr>
		</table>
	</form>
	<table id="ff" style="height: 180px;"></table>
	<div id="divChedian" style="display: none;">
		编码：<input type="text" id="txtCode" /> <input type="button"
			id="btnFind" value="搜索" />
		<div id="cedian"></div>
	</div>
	<div id="ss" style="height: 330px; display: none;">
		<table id="ca" style="height: 260px;"></table>
	</div>
</body>
<script type="text/javascript">
 
     //去掉input里面的null
       $(function(){
	$('input').each(function(index, element) {
        if($(this).val() == 'null'){
			$(this).val('');
		}
    });
});
		//规范日期格式	
		function myformatter(date){
			var y = date.getFullYear();
		    var m = date.getMonth()+1;
		    var d = date.getDate();
		    return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
		}
		function myparser(s){
			if (!s) return new Date();
		    var ss = (s.split('-'));
		    var y = parseInt(ss[0],10);
		    var m = parseInt(ss[1],10);
		    var d = parseInt(ss[2],10);
		    if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
		    	return new Date(y,m-1,d);
		    } else {
		        return new Date();
		    }
		}

		//格式化日期
	 	function formatDate(date) {
	 	        return date.getFullYear() + "-" + (date.getMonth() +1) + "-" + date.getDate();
	 	}
	 	
		
	//获取选中的radio值
	function ShowTemp()
	{
	  var complete=new Array(2);
      var eless = document.getElementsByName("indury");
   	  for(var i=0;i<eless.length;i++)
   	  {
    	if(eless[i].checked){
     		complete[0]=eless[i].attributes["title"].value
     		complete[1]=eless[i].value
     		break;
    	}
   	  }
   	 return complete;
    }
		

		//实点、虚点层级交换
		 function showMpBsDetail(){
				//var cdtIsinvented = document.getElementById ("cdtIsinvented").value;
				
				var cdtIsinvented=$("input[name='cdtIsinvented']:checked").val();
				var objDiv = document.getElementById ("w1");
				var zd0 = document.getElementById ("zd0");
				if (cdtIsinvented==1){ 
					zd0.style.display="none";
					objDiv.style.display = "block"; 
				}else{ 
					objDiv.style.display = "none";
					zd0.style.display="block";
				}
			}
		//模型联动	
		 function checkModel(){
				var modelID=$('#model').val()
				GetDataff(modelID);
		}
		//返回计量表信息，并赋予
			function addFactor(data){
				var qyid=$('#qyid').val();//获取企业的ID
				$('#ss').show();
				GetDataee2();//加载列表
				$('#ss').dialog({  
					title:'选择计量表', 
			   	 	modal:true,
			   	 	width:600,
			   	 	draggable:false,
			   	 	buttons: [{
						text: '确定',
						iconCls: 'icon-ok', 
							handler: function() {
			   	 				var row=$('#ca').datagrid('getSelected');
			   	 				if(row !=null){
									var ret = row.cdtTerminalName+"-"+row.cdtid;
				   	 				
					   	 			if(ret!=null){
					   					//alert('ss');
					   					if(data=="cal"){
					   						var arr=ret.split("-");
					   						if(arr[0].split(",").length>1){
					   							alert("只能选择一个");
					   							return;
					   						}
					   						if($("#factorSelectID").val().indexOf("-1")>0||$("#factorSelectID").val().indexOf("-2")>0){
					   								alert("已经存在因子属性,不能重复添加或首应添加因子属性！");
					   								return;
					   						}
					   						$("#factorSelectID").val(arr[1]+"-1");
					   						$("#factorSelect").val(arr[0]);
					   						$("#factorSelectIDS").val(arr[1]);
					   					}
					   				}
				   	 				}
			   	 				$('#ss').dialog('close');
							}
						},
						{
							text: '取消',
								handler: function() {
									$('#ss').dialog('close');
							 		
								}
							}
						] 
				});
	 		}
	 		
			var symbols = new Array();
			var symbolIds = new Array();
			var symbolDisplayIds = new Array();
			function cleanFormular(){
				$("#formularName").val("");
				$("#formularNameId").val("");
				$("#formularNameIdS").val("");
				symbols = [];
				symbolIds = [];
				symbolDisplayIds = [];
			}
			function backoff(){
				symbols.pop();
				symbolIds.pop();
				symbolDisplayIds.pop();
				
			}
			function backoff(){
				symbols.pop();
				symbolIds.pop();
				symbolDisplayIds.pop();
				refresh();
			}
			//公式刷新
			function add(t){
				symbols.push(t.value);
				symbolIds.push(t.value);
				symbolDisplayIds.push(t.value);
				refresh();
			}
			function refresh(){
				$("#formularName").val("");
				$("#formularNameId").val("");
				$("#formularNameIdS").val("");
				for(var k=0;k<symbols.length;k++){
			    	$("#formularName").val($("#formularName").val()+symbols[k]);			
			    }
			    for(var h=0;h<symbolIds.length;h++){
			    	$("#formularNameId").val($("#formularNameId").val()+symbolIds[h]);
			    }
			    for(var n=0;n<symbolDisplayIds.length;n++){
			    	$("#formularNameIdS").val($("#formularNameIdS").val()+symbolDisplayIds[n]);
			    }
			}
			function yinzi(){		
			    symbols.push("{"+$("#factorSelect").val().replace("#","的")+"}");
			    symbolIds.push("{"+$("#factorSelectID").val()+"}");
			    symbolDisplayIds.push("{"+$("#factorSelectIDS").val()+"}");
			    refresh();
			    clean();		    
			}
			function clean(){
				$("#factorSelectID").val("");
				$("#factorSelect").val("");
				$("#factorSelectIDS").val("");
			}

			function GetDataee2(){
				var args={};
				args.pageIndex=1;//页索引
				args.pageSize=10;//页容量
				var qyId=$("#qyid").val();
				args.qyId=qyId;
				BingData("#ca",args,"calculateTerminalDevice.action?m=getMultiCal",null);
			}
	 		
			$('#ca').datagrid( {
				striped : true,
				fitColumns: true, //自适应列的大小
				pagination: true,
				rownumbers: false,
				singleSelect:true,//设置单选、多选。true单选，false 多选。
				columns : [ [ {field : 'cdtMeasureLoop',title : '计量终端回路名称',width : 100},
							  {field : 'mdcModuleName',title : '计量模型',width : 100},
							  {field : 'ctdCodes',title : '计量终端序号PN',width : 100},
							  {field : 'cdtProtocalFunCode',title : '通信协议功能FN',width : 100},
							  {field : 'cdtTerminalStatus',title : '计量终端状态',width : 100,formatter: function (value, rowData, rowIndex) {if (value==0) {return "新增";} else if(value=="1"){return "测试";}else if(value=="2"){return "测通";}else if(value=="3"){return "正常";}else if(value=="4"){return "停用";} }},
							  {field : 'cdtIsinvented',title : '虚/实终端',width : 100,formatter: function(value, rowData, rowIndex){if(value==0){return "实";}else if(value==1){return "虚";} } }
							  
					     	  ] ]
			});
			 //---------------------------------------------------------------------------------------------------------
  //修改。。。                
                  $(function(){
                          $('#cdtProtocalFunCode,#cdtProtocalSecFunCode,#cdtProtocalSecdayFunCode,#cdtProtocalSecmonFunCode').combo({
                  //        required:true,
                          editable:false,
                          multiple:true               
                             });
                          $('#ss').appendTo($('#cdtProtocalFunCode').combo('panel'));   
                          $('#ss1').appendTo($('#cdtProtocalSecFunCode').combo('panel'));  
                          $('#ss2').appendTo($('#cdtProtocalSecdayFunCode').combo('panel'));  
                          $('#ss3').appendTo($('#cdtProtocalSecmonFunCode').combo('panel')); 
                                $("#ss input").click(function(){
                            var _value11="";
                            var _text11="";                
                             $("[name=cdtProtocalFunCode]:input:checked").each(function(){
                        _value11+=$(this).val()+",";
                        _text11+=$(this).next("span").text()+",";
                           });
                                  
                         //设置下拉选中值
                      var upylFNva=_value11.substring(0, _value11.length-1);
                      var upylFNte=_text11.substring(0, _text11.length-1);
                      $('#cdtProtocalFunCode').combo('setValue', upylFNva).combo('setText', upylFNte);               
                          }); 
                            $("#ss1 input").click(function(){
                            var _value12="";
                            var _text12="";                
                             $("[name=cdtProtocalSecFunCode]:input:checked").each(function(){
                        _value12+=$(this).val()+",";
                        _text12+=$(this).next("span").text()+",";
                           });
                          
                         //设置下拉选中值
                          var upelrFNva=_value12.substring(0, _value12.length-1);
                      var upelrFNte=_text12.substring(0, _text12.length-1);
                      $('#cdtProtocalSecFunCode').combo('setValue', upelrFNva).combo('setText', upelrFNte);               
                          }); 
                        
                        
                        
                            $("#ss2 input").click(function(){
                            var _value13="";
                            var _text13="";                
                             $("[name=cdtProtocalSecdayFunCode]:input:checked").each(function(){
                        _value13+=$(this).val()+",";
                        _text13+=$(this).next("span").text()+",";
                           });
                          
                         //设置下拉选中值
                      var upelrdFNva=_value13.substring(0, _value13.length-1)
                      var upelrdFNte=_text13.substring(0, _text13.length-1)
                      $('#cdtProtocalSecdayFunCode').combo('setValue', upelrdFNva).combo('setText', upelrdFNte);               
                          }); 
                          
                        $("#ss3 input").click(function(){
                            var _value14="";
                            var _text14="";                
                             $("[name=cdtProtocalSecmonFunCode]:input:checked").each(function(){
                        _value14+=$(this).val()+",";
                        _text14+=$(this).next("span").text()+",";
                           });
                          
                         //设置下拉选中值
                       var upelydFNva=_value14.substring(0, _value14.length-1)
                      var upelydFNte=_text14.substring(0, _text14.length-1)
                      $('#cdtProtocalSecmonFunCode').combo('setValue', upelydFNva).combo('setText', upelydFNte);               
                          }); 
                          
                          
                              
                  //全选
         //1类数据修改----------------------------------
                   $(function () { 
                        //全选或全不选 
                         $("#all").click(function () {//当点击全选框时 
                          var flag = $("#all").attr("checked");//判断全选按钮的状态 
                           $("[id$='Item']").each(function () {//查找每一个Id以Item结尾的checkbox 
                              if(flag){
                           $(this).attr("checked", flag);//选中或者取消选中 
                           }else{
                           $(this).removeAttr("checked");//全部取消
                           
                           }
                           $(this).attr("checked", flag);//选中或者取消选中 
                             var _value11="";
                            var _text11="";                
                             $("[name=cdtProtocalFunCode]:input:checked").each(function(){
                        _value11+=$(this).val()+",";
                        _text11+=$(this).next("span").text()+",";
                           });
                          
                         //设置下拉选中值
                      $('#cdtProtocalFunCode').combo('setValue', _value11).combo('setText', _text11);
                             }); 
                              }); 
                            //如果全部选中勾上全选框，全部选中状态时取消了其中一个则取消全选框的选中状态 
                            $("[id$='Item']").each(function () { 
                                  $(this).click(function () { 
                                     $("#all").attr("checked", "checked");                                     
                                        if ($("[id$='Item']:checked").length == $("[id$='Item']").length) { 
                                            } 
                                       else $("#all").removeAttr("checked"); 
                                        }); 
                                      }); 
                            }); 
                       //--------------------------------------------------
                       
         //2类日曲线数据-------------------------------------------------
                          $(function () { 
                        //全选或全不选 
                         $("#all11").click(function () {//当点击全选框时 
                          var flag = $("#all11").attr("checked");//判断全选按钮的状态 
                           $("[id$='Items']").each(function () {//查找每一个Id以Item结尾的checkbox 
                              if(flag){
                           $(this).attr("checked", flag);//选中或者取消选中 
                           }else{
                           $(this).removeAttr("checked");//全部取消
                           
                           }
                           $(this).attr("checked", flag);//选中或者取消选中 
                             var _value12="";
                            var _text12="";                
                             $("[name=cdtProtocalSecFunCode]:input:checked").each(function(){
                        _value12+=$(this).val()+",";
                        _text12+=$(this).next("span").text()+",";
                           });
                          
                         //设置下拉选中值
                      $('#cdtProtocalSecFunCode').combo('setValue', _value12).combo('setText', _text12);
                             }); 
                              }); 
                            //如果全部选中勾上全选框，全部选中状态时取消了其中一个则取消全选框的选中状态 
                            $("[id$='Items']").each(function () { 
                                  $(this).click(function () { 
                                     $("#all11").attr("checked", "checked");                                     
                                        if ($("[id$='Items']:checked").length == $("[id$='Items']").length) { 
                                            } 
                                       else $("#all11").removeAttr("checked"); 
                                        }); 
                                      }); 
                            }); 
                       //-------------------------------------------------
          //2类日冻结数据------------------------------------------------
                           $(function () { 
                        //全选或全不选 
                         $("#all12").click(function () {//当点击全选框时 
                          var flag = $("#all12").attr("checked");//判断全选按钮的状态 
                           $("[id$='Items1']").each(function () {//查找每一个Id以Item结尾的checkbox 
                              if(flag){
                           $(this).attr("checked", flag);//选中或者取消选中 
                           }else{
                           $(this).removeAttr("checked");//全部取消
                           
                           }
                           $(this).attr("checked", flag);//选中或者取消选中 
                             var _value13="";
                            var _text13="";                
                             $("[name=cdtProtocalSecdayFunCode]:input:checked").each(function(){
                        _value13+=$(this).val()+",";
                        _text13+=$(this).next("span").text()+",";
                           });
                          
                         //设置下拉选中值
                      $('#cdtProtocalSecdayFunCode').combo('setValue', _value13).combo('setText', _text13);
                             }); 
                              }); 
                            //如果全部选中勾上全选框，全部选中状态时取消了其中一个则取消全选框的选中状态 
                            $("[id$='Items1']").each(function () { 
                                  $(this).click(function () { 
                                     $("#all12").attr("checked", "checked");                                     
                                        if ($("[id$='Items1']:checked").length == $("[id$='Items1']").length) { 
                                            } 
                                       else $("#all12").removeAttr("checked"); 
                                        }); 
                                      }); 
                            }); 
                       //-------------------------------------------------
                       
          //2类月冻结数据------------------------------------
                     $(function () { 
                        //全选或全不选 
                         $("#all13").click(function () {//当点击全选框时 
                          var flag = $("#all13").attr("checked");//判断全选按钮的状态 
                           $("[id$='Items2']").each(function () {//查找每一个Id以Item结尾的checkbox 
                              if(flag){
                           $(this).attr("checked", flag);//选中或者取消选中 
                           }else{
                           $(this).removeAttr("checked");//全部取消
                           
                           }
                           $(this).attr("checked", flag);//选中或者取消选中 
                             var _value14="";
                            var _text14="";                
                             $("[name=cdtProtocalSecmonFunCode]:input:checked").each(function(){
                        _value14+=$(this).val()+",";
                        _text14+=$(this).next("span").text()+",";
                           });
                          
                         //设置下拉选中值
                      $('#cdtProtocalSecmonFunCode').combo('setValue', _value14).combo('setText', _text14);
                             }); 
                              }); 
                            //如果全部选中勾上全选框，全部选中状态时取消了其中一个则取消全选框的选中状态 
                            $("[id$='Items2']").each(function () { 
                                  $(this).click(function () { 
                                     $("#all13").attr("checked", "checked");                                     
                                        if ($("[id$='Items2']:checked").length == $("[id$='Items2']").length) { 
                                            } 
                                       else $("#all13").removeAttr("checked"); 
                                        }); 
                                      }); 
                            }); 
           //--------------------------------------------------
                  });
		$(function(){
				var objDiv = document.getElementById ("w1");
				var zd0 = document.getElementById ("zd0");
				
				//初始化判断实、虚点
				var ischecked =$('#isChecked').val();
				if(ischecked=="0"){
					$('#formularName').val('');
					$('#formularNameIdS').val('');
					
					$("input[type=radio][value=0]").attr("checked",'checked'); 
					//$('#cdtFormular').val("<%=pc.getCdtFormular()%>");
					objDiv.style.display = "none";
					zd0.style.display="block";
				}else{
					//如果是虚点则清空以下文本框的值
					$('#cdtInitValue').val('0');
					$('#cdtTerminalIndustry').val('');
					$('#cdtCheckPeriod').val('');
					$('#cdtProductionCode').val('');
					$('#cdtAddTime').val('');
					$('#cdtNextCheckTime').val('');
					//$('#cdtFormular').val('');
					
					$("input[type=radio][value=1]").attr("checked",'checked'); 
					zd0.style.display="none";
					objDiv.style.display = "block"; 
				}
			
	      	 //循环计量表类型
	      	 var arr = ["新增", "测试", "测通","正常","停用"];
	      	 $('#cdtTerminalStatus').html("<option value='-1'>选择标记类型</option>"); 
			  $.each(arr, function(i,val){
				  	$('#cdtTerminalStatus').append("<option value='"+i+"'>"+val+"</option>");
			  });
			  $('#cdtProtocalFunCode').val('<%=pc.getCdtProtocalFunCode()%>');
			 $('#cdtTerminalStatus').val('<%=pc.getCdtTerminalStatus()%>');
		/// $("[name=cdtProtocalFunCode]:input:checked").removeAttr("checked"); 
		 //$("[name=cdtProtocalSecFunCode]:input:checked").removeAttr("checked");
		// $("[name=cdtProtocalSecdayFunCode]:input:checked").removeAttr("checked");
		 //$("[name=cdtProtocalSecmonFunCode]:input:checked").removeAttr("checked");
		
			   var s=('<%=pc.getCdtProtocalFunCode()%>');
			   var ps=('<%=pc.getCdtProtocalSecFunCode() %>');
			   var fs=('<%=pc.getCdtProtocalSecdayFunCode()%>');
			   var ns=('<%=pc.getCdtProtocalSecmonFunCode()%>');
			    
			    $('#cdtProtocalFunCode').combo('setValue', s).combo('setText',s); 
			    $('#cdtProtocalSecFunCode').combo('setValue', ps).combo('setText',ps); 
			    $('#cdtProtocalSecdayFunCode').combo('setValue', fs).combo('setText',fs); 
			    $('#cdtProtocalSecmonFunCode').combo('setValue', ns).combo('setText',ns); 
	 	 	 //初始化日期控件
	 	   	// $("#cdtAddTime").datebox({ formatter: formatDate });
		     //$("#cdtNextCheckTime").datebox({ formatter: formatDate });
		    $("#cdtAddTime").datebox('setValue','<%=DateUtils.dateToString(pc.getCdtAddTime()) %>');
		   	$("#cdtNextCheckTime").datebox('setValue','<%=DateUtils.dateToString(pc.getCdtNextCheckTime())%>');

		   <%
		   	if(pc.getPomsCalculateTerminalModel() !=null){
		   		%>
		   		$('#model').val('<%=pc.getPomsCalculateTerminalModel().getCtmNames()%>');
		   		$('#codeid').val('<%=pc.getPomsCalculateTerminalModel().getId()%>');

		   		<%
		   	}
		   %>
		   	
				//关闭窗口
		      	 $('#cButton').click(function(){
					//window.close();
		      		window.parent.$('#iframeUpdateId').dialog('close');
			     });
			     
		     	//保存计量表信息
			     $('#aButton').click(function(){
			    		//var model=$('#model').val();
			    		$DisSelects = $("input[disabled='disabled']");
			    		$DisSelects.attr("disabled", false); 
			    		var model=$('#codeid').val();
						var qyid=$('#qyid').val();
						var cjqid=$('#cjqid').val();
						var jlbid=$('#jlbid').val();
						var jlpid=$('#cdtCheckPeriod').val();
						var pid="<%=pc.getPclcParentId()%>
	"

							var ctdCodes = $('#ctdCodes').val();//计量表编号

							var cdtTerminalName = $('#cdtTerminalName').val();//计量终端名称
							var cdtMeasureLoop = $('#cdtMeasureLoop').val();//计量回路
							var cdtIsinvented = document
									.getElementsByName("cdtIsinvented");
							if (ctdCodes == "") {
								$.messager.alert("提示", "计量终端编号不能为空", "warning",
										null);
								return false;
							} else if (cdtTerminalName == "") {
								$.messager.alert("提示", "计量终端柜编号不能为空!",
										"warning", null);
								return false;
							} else if (cdtIsinvented == 0) {
								if (cdtInitValue != "") {
									var re = /^\d+\.?\d*$/;
									if (!re.test(cdtInitValue)) {
										$.messager.alert("提示",
												"计量终端初始值只能输入整数,请重新输入",
												"warning", null);
										return false;
									}

								} else if (jlpid == "") {
									$.messager.alert("提示", "计量终端柜编号不能为空!",
											"warning", null);
									return false;
								}
								if (jlpid != "") {

									var reg = new RegExp("^[0-9]*$");
									if (!reg.test(cdtCheckPeriod)) {
										$.messager.alert("提示",
												"计量终端检定周期只能输入数字", "warning",
												null);
										return false;
									}
								}
							}

							var options = {
								url : "calculateTerminalDevice.action?m=updateCalculte&qyid="
										+ qyid
										+ "&cjqid="
										+ cjqid
										+ "&jlbid="
										+ jlbid
										+ "&modelid="
										+ model
										+ "&pd="
										+ pid,
								async : false,
								dataType : "json",
								timeout : 1000,
								success : function(data) {
									if (data.flag == true) {
										$.messager.alert("提示", "更新成功!", "info",
												function() {
													window.parent.$(
															'#iframeUpdateId')
															.dialog('close');
													window.parent.GetDataee(
															qyid, cjqid);
												});

									} else {
										$.messager.alert("提示", "更新失败!", "info",
												function() {
													window.parent.$(
															'#iframeUpdateId')
															.dialog('close');
												});

									}
								}
							}

							$('#calForm').ajaxForm(options);

						});

		//加载计量表设备参数表
		// GetDataff();
	});
</script>
</html>