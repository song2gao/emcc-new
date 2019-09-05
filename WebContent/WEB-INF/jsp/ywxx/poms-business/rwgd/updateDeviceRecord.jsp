<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.cic.domain.PomsCalculateTerminalModel"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>表计更换页</title>
<script type="text/javascript" src="/emcc-web/js/poms-system/jquery-1.7.2.js"></script>
<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/default/easyui.css"></link>
<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/icon.css"></link>
<script type="text/javascript" src="/emcc-web/js/poms-business/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/emcc-web/js/page.js"></script>
<script type="text/javascript" src="/emcc-web/js/poms-business/jsonToTime.js"></script>
<style>
td{text-align:left;padding-top: 10px;}
select{width:150px; border:1px solid #99cdff;}
input{width:150px; border:1px solid #99cdff;}
/*.datagrid-wrap panel-body{
	width: 1098px; height: 277px;
}*/
</style>
</head>
<body><center>
<div style="font-size:13px; width:1100px; margin-left:10px; margin-top:10px;  border:1px solid #000">
<div style="text-align:left;">
<form id="form1" name="form1" method="post">
<input value='<%=request.getAttribute("bjId") %>' type='hidden' id='id' name="id"/>
<input type="hidden" id="jsonStr" name="jsonStr"/> 
	<table>
		<tbody>
			<tr>
				<td width="130px;">&nbsp;&nbsp;计量表编号：</td><td><span id="cdtCodes"><%=request.getAttribute("cdtCodes") %></span><input type="text" id="cdtCo" style="display: none;" value="<%=request.getAttribute("cdtCodes") %>"/></td>
				<td width="130px;">&nbsp;&nbsp;企业用户：</td><td><span id="unitName"><%=request.getAttribute("unitName") %></span></td>
			</tr>
			<tr><td>&nbsp;&nbsp;计量终端模型：</td><td>
			<select id="modelIdStr" name="modelIdStr" style="width: 155px">
			<%
				String mo = request.getAttribute("modelId").toString();
				List<PomsCalculateTerminalModel> list = (List<PomsCalculateTerminalModel>)request.getAttribute("list");
				for(int i = 0; i < list.size(); i++){
					if(mo.equals(list.get(i).getId())){
					%>
						<option value='<%=list.get(i).getId() %>' selected='selected'><%=list.get(i).getCtmNames() %></option>
					<%
					}
					else {%>
						<option value='<%=list.get(i).getId() %>'><%=list.get(i).getCtmNames() %></option>
					<%}
				}
 			 %>
	        	
	        </select>
			</td><td></td><td></td></tr>
			<tr>
				<td>&nbsp;&nbsp;计量终端名称：</td><td><input id="cdtTerminalName" name="cdtTerminalName"/></td>
				<td>&nbsp;&nbsp;安装计量回路：</td><td><input id="cdtMeasureLoop" name="cdtMeasureLoop"/></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;计量表初始值:</td><td><input id="cdtInitValue" name="cdtInitValue"/></td>
				<td>&nbsp;&nbsp;生产厂家:</td><td><input id="cdtTerminalIndustry" name="cdtTerminalIndustry"/></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;检定周期:</td><td><input name="cdtCheckPeriod" id="cdtCheckPeriod"/></td>
				<td>&nbsp;&nbsp;出厂编号:</td><td><input name="cdtProductionCode" id="cdtProductionCode"/></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;计量表添加时间:</td><td><input name="cdtAddTime" id="cdtAddTime" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" style="width: 150px;"/></td>
				<td>&nbsp;&nbsp;下次检定周期:</td><td><input name="cdtNextCheckTime" id="cdtNextCheckTime" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" style="width: 150px;"/></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;计算公式:</td><td><input id="cdtFormular" name="cdtFormular"/></td>
				<td>&nbsp;&nbsp;是否为虚拟终端:</td><td>
					<select id="cdtIsinvented" name="cdtIsinvented">
					</select>
				</td>
			</tr>
		</tbody>
	</table>
	<div>
		<table id="tt"  class="easyui-datagrid"></table>
	</div> 
	<table>
		<tbody>
			<tr>
				<td width="130px;">&nbsp;&nbsp;原因：</td><td><textarea rows="4" cols="50" id="ctarAlterReason" name="ctarAlterReason"></textarea></td>
			</tr>
			<tr>
				<td width="130px;">&nbsp;&nbsp;备注：</td><td><textarea rows="4" cols="50" id="cdtBackups" name="cdtBackups"></textarea></td>
			</tr>
			<tr><td></td><td style="text-align: center;"><a class="easyui-linkbutton" id="saveButton" name="saveButton">&nbsp;&nbsp;保&nbsp;&nbsp;存&nbsp;&nbsp;</a></td></tr>
		</tbody>
	</table>
	</form>
</div>
</div>
</center>
<script  type="text/javascript">
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
function GetData(){
var args={};
args.bjId=$("#id").val();
args.pageIndex=1;//页索引
args.pageSize=5;//页容量
BingData("#tt",args,"toTerminalDevice.action?m=toSearchTerminalDeviceParams",null);
}
</script>
<script type="text/javascript">
$(function(){ 

	//页面加载时给提交时间赋值为当前时间
	var d = new Date();
	str = d.getFullYear()+'-'+(d.getMonth() + 1<10?('0'+(d.getMonth() + 1)):d.getMonth() + 1)+'-'+(d.getDate()<10?('0'+d.getDate()):d.getDate())
	$("#cdtAddTime").datebox('setValue',str);
	$("#cdtNextCheckTime").datebox('setValue',str);
	$.ajax({
			url: "toTerminalDevice.action?m=toSearchTerminalDeviceById",
			type:"POST",
			dataType:"json",
			timeout: 10000,
			data:{
				"bjId":$("#id").val()
				}, success: function(data){
					$("#cdtTerminalName").attr("value",data.p.cdtTerminalName);
					$("#cdtMeasureLoop").attr("value",data.p.cdtMeasureLoop);
					$("#cdtInitValue").attr("value",data.p.cdtInitValue);
					$("#cdtTerminalIndustry").attr("value",data.p.cdtTerminalIndustry);
					$("#cdtCheckPeriod").attr("value",data.p.cdtCheckPeriod);
					$("#cdtProductionCode").attr("value",data.p.cdtProductionCode);
					$("#cdtAddTime").attr("value",data.p.cdtAddTime);
					$("#cdtNextCheckTime").attr("value",data.p.cdtNextCheckTime);
					$("#cdtFormular").attr("value",data.p.cdtFormular);
					$("#cdtBackups").attr("value",data.p.cdtBackups);
					
					var rdo = "";
			        if("0" == data.p.cdtIsinvented){ // 默认选择
			        	rdo += "<option selected='selected' value='0'>实终表</option>";
			          	rdo += "<option value='1'>虚终表</option>";
			        } else{
			          	rdo += "<option value='0'>实终表</option>";
			          	rdo += "<option selected='selected' value='1'>虚终表</option>";
			        }
			        $("#cdtIsinvented").html("");
			        $("#cdtIsinvented").html(rdo);
				}
	});
	
	//初始化table	
	var lastIndex;
	
	$('#tt').datagrid({
		title: '测点列表',
		iconCls:'icon-edit',
		fitColumns: true, //自适应列的大小
		singleSelect: true, //是否选择多行
		rownumbers:true,
		collapsible:true, //收起datagrid内容
		columns: [[
		{ title: '测点编码', field: 'ctdpCodes', width: 100, editor:'text'}, 
		{ title: '测点名称', field: 'ctdpNames', width: 100, editor:'text'},
		{ title: '测点', field: 'ctdpSymbols', width: 100 ,editor:'text'},
		{ title: '测点单位', field: 'ctdpUnits', width: 100,editor:'text'},
		{ title: '测点公式', field: 'ctdpFormular', width: 200,editor:'text'},
		{ title: '是否需要存储', field: 'ctdpIssave', width: 100,editor:'text'},
		{ title: '测点类型', field: 'ctdpType', width: 100,editor:'text'},
		{ title: '存储周期', field: 'ctdpSaveInterval', width: 100,editor:'text'},
		{ title: '存储方式', field: 'ctdpSaveStyle', width: 100,editor:'text'},
		{ title: '统计类型', field: 'ctdpStatisticType', width: 100,editor:'text'},
		{ title: '上限', field: 'ctdpUpLine', width: 100,editor:'numberbox'},
		{ title: '上上限 ', field: 'ctdpUperLine', width: 100,editor:'numberbox'},
		{ title: '下限', field: 'ctdpDownLine', width: 100,editor:'numberbox'},
		{ title: '下下限', field: 'ctdpDownerLine', width: 100,editor:'numberbox'},
		{ title: '标准值', field: 'ctdpStandardVal', width: 100,editor:'numberbox'},
		{ title: '排序', field: 'ctdpOrders', width: 100,editor:'text'},
		{ title: '备注', field: 'ctdpBackups', width: 100,editor:'text'}
		]],
		pagination:true,
		pageSize:5,
		pageList: [5,10,15,20],
		striped:true,
		toolbar:[{
					text:'',
					iconCls:'icon-save',
					handler:function(){
						$('#tt').datagrid('acceptChanges');
						
					}
				},'-',{
					text:'',
					iconCls:'icon-undo',
					handler:function(){
						$('#tt').datagrid('rejectChanges');
					}
				}],
				onBeforeLoad:function(){
					$(this).datagrid('rejectChanges');
				},
				onClickRow:function(rowIndex){
					if (lastIndex != rowIndex){
						$('#tt').datagrid('endEdit', lastIndex);
						$('#tt').datagrid('beginEdit', rowIndex);
					}
					lastIndex = rowIndex;
				}
	});
	//获取后台数据
		$("#tt").datagrid("loadData",[]); 
		GetData();
});


	$("#saveButton").click(function(){
	//--------------------------------------------------
	//获取datagrid中所有的数据
			var rowDatas = $("#tt").datagrid("getRows");
			var jsonStr="";
			$.each(rowDatas,function(i,item){
			jsonStr +="{'id':'"+item.id+"','ctdpCodes':'"+item.ctdpCodes+"','ctdpNames':'"+item.ctdpNames+"','ctdpSymbols':'"+item.ctdpSymbols+"','ctdpUnits':'"+item.ctdpUnits+
				"','ctdpFormular':'"+item.ctdpFormular+"','ctdpIssave':'"+item.ctdpIssave+"','ctdpType':'"+item.ctdpType+"','ctdpSaveInterval':'"+item.ctdpSaveInterval+
				"','ctdpSaveStyle':'"+item.ctdpSaveStyle+"','ctdpStatisticType':'"+item.ctdpStatisticType+"','ctdpUpLine':'"+item.ctdpUpLine+
				"','ctdpUperLine':'"+item.ctdpUperLine+"','ctdpDownLine':'"+item.ctdpDownLine+"','ctdpDownerLine':'"+item.ctdpDownerLine+"','ctdpStandardVal':'"+item.ctdpStandardVal+
				"','ctdpOrders':'"+item.ctdpOrders+"','ctdpBackups':'"+item.ctdpBackups+"'}," ;
			});
			$("#jsonStr").attr("value",jsonStr);
	//--------------------------------------------------
		var isError = true;
		var s = $("#cdtCo").val();
		$('#form1').form({
			url:"toTerminalDevice.action?m=toUpdateTerminalDevice&ccid=<%=request.getAttribute("cdtCodes") %>",
			data:{
				"bnb":s
			},
			dataType:"json",
			async:false,
			onSubmit: function(){
				if($("#modelIdStr").val()== "-1"){
					$.messager.alert("提示","请选中模型!","info",null);
					return false;
				}
				//验证提交时间是否是日期格式(yyyy-mm-dd)
				var nowDate = $("#cdtAddTime").datebox('getValue');
				var nextCheckTime = $("#cdtNextCheckTime").datebox('getValue');
				var date_ymd= /^(\d{4})-(0\d{1}|1[0-2])-(0\d{1}|[12]\d{1}|3[01])$/; 
				var r = nowDate.match(date_ymd);
				var r1 = nextCheckTime.match(date_ymd);
				if(r == null){
					$.messager.alert("提示","计量表添加时间输入错误，请重新输入！","info",null);
					return false;
				}
				if(r1 == null){
					$.messager.alert("提示","下次检定周期输入错误，请重新输入！","info",null);
					return false;
				}
			},success:function(data){
				var j = eval("(" + data + ")"); 
				if(j.tad==1){//	data == '{"flag":true}'){
					$.messager.alert("提示","操作成功！已变更","info",function(){window.parent.$('#iframeUpdateBjDiv').dialog('close'); window.parent.$("#gd").datagrid("loadData",[]); window.parent.GetData();window.parent.$("#statusAlter").datagrid("loadData",[]); window.parent.GetData1();});
				}
				else{
					$.messager.alert("提示","操作失败！未变更","info",function(){window.parent.$('#iframeUpdateBjDiv').dialog('close');});
				}
			}  
		});  
		$('#form1').submit(); //提交表单
	});
	
</script>
</body>
</html>