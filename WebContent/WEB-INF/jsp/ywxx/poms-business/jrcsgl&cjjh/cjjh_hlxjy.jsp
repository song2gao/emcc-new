<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=GBK" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>合理性校验</title>
		<link href="/emcc-web/css/poms-business/others.css" rel="stylesheet"
			type="text/css" />
		<link rel="stylesheet" type="text/css"
			href="/emcc-web/css/poms-monitor/monitroFir.css"></link>
		<link href="/emcc-web/css/poms-system/CSS.css" rel="stylesheet"
			type="text/css"></link>
		<link href="/emcc-web/css/poms-system/yxztjk.css" rel="stylesheet"
			type="text/css"></link>
		<link href="/emcc-web/css/poms-business/ptrzgl.css" rel="stylesheet"
			type="text/css"></link>
		<link rel="stylesheet" type="text/css"
			href="/emcc-web/css/poms-business/themes/default/easyui.css"></link>
		<link rel="stylesheet" type="text/css"
			href="/emcc-web/css/poms-business/themes/icon.css"></link>
		<script type="text/javascript"
			src="/emcc-web/js/poms-business/jquery-1.7.1.min.js"></script>
		<script type="text/javascript"
			src="/emcc-web/js/poms-business/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="/emcc-web/js/page.js"></script>
		<script type="text/javascript"
			src="/emcc-web/js/poms-business/jsonToTime.js"></script>
		<script type="text/javascript" src="/emcc-web/js/other.js"></script>
	</head>
	<script type="text/javascript">
	//小日历--曲线
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
	//月
	function myformatterM(date){
		var y = date.getFullYear();
	    var m = date.getMonth()+1;
	    return y+'-'+(m<10?('0'+m):m);
	}
	function myparserM(s){
		if (!s) return new Date();
	    var ss = (s.split('-'));
	    var y = parseInt(ss[0],10); 
	    var m = parseInt(ss[1],10);
	    if (!isNaN(y) && !isNaN(m)){
	    	return new Date(y,m-1);
	    } else {
	        return new Date();
	    }
	}
	//年
	function myformatterY(date){
		var y = date.getFullYear();
	    return y
	}
	function myparserY(s){
		if (!s) return new Date();
	    var ss = (s);
	    var y = parseInt(ss[0],10); 
	    if (!isNaN(y)){
	    	return new Date(y);
	    } else {
	        return new Date();
	    }
	}
	//控制radio
	function YdQ(){
	document.getElementById('t1').style.display='none';
	document.getElementById('t2').style.display='block';
	document.getElementById('t3').style.display='none';
	document.getElementById('f1').style.display='none';
	document.getElementById('f2').style.display='block';
	document.getElementById('f3').style.display='none';
	document.getElementById('ksjy').style.display='none';
	}
	function NdQ(){
	document.getElementById('t1').style.display='none';
	document.getElementById('t2').style.display='none';
	document.getElementById('t3').style.display='block';
	document.getElementById('f1').style.display='none';
	document.getElementById('f2').style.display='none';
	document.getElementById('f3').style.display='block';
	document.getElementById('ksjy').style.display='none';
	}
	function QdQ(){
	document.getElementById('t3').style.display='none';
	document.getElementById('t2').style.display='none';
	document.getElementById('t1').style.display='block';
	document.getElementById('f1').style.display='block';
	document.getElementById('f2').style.display='none';
	document.getElementById('f3').style.display='none';
	document.getElementById('ksjy').style.display='none';
	}
  	$(function(){
		InitTreeData();
		function InitTreeData(){
	      	$('#MyTree').tree({
				url:'enegryUnit.action?m=getAllEnegryInfo',	//toEnterpmTree.action
		        checkbox:false,
		        animate:true,
		        onBeforeExpand:function(node){
		       	var flogKins = 9;
		        $('#MyTree').tree('options').url = 'enegryUnit.action?m=getChildEnegryInfo&eid=' + node.id+'&ss='+flogKins;
		        },
		        onClick:function(node){
		        }
		    });
		}
  	});
	</script>
	<script type="text/javascript">
	function mergeCellsByField(tableID, colList) {
	    var ColArray = colList.split(",");
	    var tTable = $("#" + tableID);
	    var TableRowCnts = tTable.datagrid("getRows").length;
	    var tmpA;
	    var tmpB;
	    var PerTxt = "";
	    var CurTxt = "";
	    var alertStr = "";
	    for (j = ColArray.length - 1; j >= 0; j--) {
	        PerTxt = "";
	        tmpA = 1;
	        tmpB = 0;
	        for (i = 0; i <= TableRowCnts; i++) {
	            if (i == TableRowCnts) {
	                CurTxt = "";
	            }else {
	                CurTxt = tTable.datagrid("getRows")[i][ColArray[j]];
	            }if (PerTxt == CurTxt) {
	                tmpA += 1;
	            }else {
	                tmpB += tmpA;
	                tTable.datagrid("mergeCells", {
	                    index: i - tmpA,
	                    field: ColArray[j],　　//合并字段
	                    rowspan: tmpA,
	                    colspan: null
	                });
	                tmpA = 1;
	            }
	            PerTxt = CurTxt;
	        }
	    }
	}
	  	function GetData(){
			var args={};
			var node =$("#MyTree").tree("getSelected"); 
			if(node==null){
				$.messager.alert("警告","请选择一个表计");
				return false;
			}
			var ss = node.id;
			args.ss = ss;
			//args.pageIndex=1;//页索引
			//args.pageSize=150;//页容量为30
			var onj = document.getElementsByName("what");
			for(var i = 0;i<onj.length;i++){
				if(onj[i].checked){
					var ip = onj[i].value;
					if(ip=="曲线"){
						if($("#startTime").datebox('getValue')==""||$("#startTime").datebox('getValue')==null){
							$.messager.alert("警告","请输入一个观察的起始时间");
							return false;
						}else if($("#endTime").datebox('getValue')==""||$("#endTime").datebox('getValue')==null){
							$.messager.alert("警告","请输入一个观察的结束时间");
							return false;
						}
						var flog="KsJyQ";
						args.flog = flog;
						args.staTime = $("#startTime").datebox('getValue');
						args.endTime = $("#endTime").datebox('getValue');
						BingData("#gd",args,"toCjsjjh.action?m=CheckingBefore",null);
						}
					else if(ip=="月"){
						if($("#startTimeM").datebox('getValue')==""||$("#startTimeM").datebox('getValue')==null){
							$.messager.alert("警告","请输入一个观察时间");
							return false;
						}else if($("#endTimeM").datebox('getValue')==""||$("#endTimeM").datebox('getValue')==null){
							$.messager.alert("警告","请输入一个观察的结束时间");
							return false;
						}
						var flog="KsJyM";
						args.flog = flog;
						args.staTimeM = $("#startTimeM").datebox('getValue');
						args.endTimeM = $("#endTimeM").datebox('getValue');
						BingData("#gd",args,"toCjsjjh.action?m=CheckingBefore",null);
						}
					else if(ip=="年"){
						if($("#startTimeY").datebox('getValue')==""||$("#startTime").datebox('getValue')==null){
							$.messager.alert("警告","请输入一个观察时间");
							return false;
						}else if($("#endTimeY").datebox('getValue')==""||$("#endTimeY").datebox('getValue')==null){
							$.messager.alert("警告","请输入一个观察的结束时间");
							return false;
						}
						var flog="KsJyY";
						args.flog = flog;
						args.staTimeY = $("#startTimeY").datebox('getValue');
						args.endTimeY = $("#endTimeY").datebox('getValue');
						BingData("#gd",args,"toCjsjjh.action?m=CheckingBefore",null);
						}
				}
			}
			document.getElementById('ksjy').style.display='none';
		}
	  	$(function(){
			$('#gd').datagrid({
			singleSelect: false,
			//pagination:true,
			fitColumns:true,
			columns: [[
				{ title: 'id',field: 'id',hidden: true,sortable:true, width: 100,formatter: function (value, rowData, rowIndex) {return value}}, 
				{ title: '参数', field: 'trueName',sortable:true, width: 250,formatter: function (value, rowData, rowIndex) {return value}}, 
				{ title: '时间', field: 'curve_storage_time',sortable:true, width: 250,formatter: function (value, rowData, rowIndex) {return value}}, 
				{ title: '月MSA', field: 'days_freezing_msa_codes',hidden:true,sortable:true, width: 250},
				{ title: '参数编码A', field: 'point_codes',sortable:true,hidden: true, width: 250},
				{ title: '参数编码B', field: 'days_freezing_point_codes',hidden: true,sortable:true, width: 250},
				{ title: '是否校验', field: 'isCheck',sortable:true, width: 300,styler: function (value, rowData, rowIndex) {if(value=="是"){return 'font-weight: bold;color:blue;';}}}, 
				{ title: '参数标示', field: 'flog',hidden: true,sortable:true, width: 250}
				]],
				rownumbers : true,
				remoteSort : false,
				sortName : 'flog',
				onLoadSuccess:function (data){
					$('#gd').datagrid('selectRow',0);
					var row=$('#gd').datagrid('getRows');
					if (data.rows.length>0)
						{
							//调用mergeCellsByField()合并单元格
							mergeCellsByField("gd","trueName,point_codes");
				    	}
					document.getElementById('ksjy').style.display='block';
					}
			});
		});
	</script>
	<body>
		<div id="main" style="padding: 0px;">
			<div id="ssjs_left">
				<div class="yhgltreeDiv" align="left">
					<ul class="easyui-tree" style="margin-left: 3px" id="MyTree"></ul>
				</div>
			</div>
			<div align="left" id="ssjs_right"
				style="width: 78%; height: 560px;">
				<div id="sjbd_right_top" style="width: 1098px; height: 50px;">
					<table id="t1" align="left" border="0" class="ybfont">
						<tr>
							<td>
								&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
								<font id="startft" face="幼圆">起始时间：</font>
							</td>
							<td>
								<input type="text" id="startTime" name="startTime" width="80px;"
									class="easyui-datebox" value="2013-10-16"
									data-options="formatter:myformatter,parser:myparser" />
							</td>
						</tr>
					</table>
					<!-- 隐藏 月-->
					<div>
						<table id="t2" style="display: none;" align="left" border="0"
							class="ybfont">
							<tr>
								<td>
									&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
									<font id="startft" face="幼圆">起始时间：</font>
								</td>
								<td>
									<input id="startTimeM" name="startTimeM" width="80px;"
										class="easyui-datebox" value="2012-01-01"
										data-options="formatter:myformatterM,parser:myparserM" />
								</td>
							</tr>
						</table>
					</div>
					<!-- 隐藏 年-->
					<div>
						<table id="t3" style="display: none;" align="left" border="0"
							class="ybfont">
							<tr>
								<td>
									&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
									<font id="startft" face="幼圆">起始时间：</font>
								</td>
								<td>
									<input style="display: none;" id="startTimeY" name="startTimeY"
										width="80px;" class="easyui-datebox" value="2008-01-01"
										data-options="formatter:myformatterY,parser:myparserY" />
								</td>
							</tr>
						</table>
					</div>
					<div id="gundan">
						<table id="f1" align="left" border="0" class="ybfont">
							<tr>
								<td>
									&emsp;&emsp;&emsp;&emsp;&emsp;
									<font id="endft" face="幼圆">结束时间</font>
								</td>
								<td>
									<input type="text" id="endTime" name="endTime" width="80px;"
										class="easyui-datebox" value="2013-10-18"
										data-options="formatter:myformatter,parser:myparser" />
								</td>
							</tr>
						</table>
						<table id="f2" style="display: none;" align="left" border="0"
							class="ybfont">
							<tr>
								<td>
									&emsp;&emsp;&emsp;&emsp;&emsp;
									<font id="endft" face="幼圆">结束时间</font>
								</td>
								<td>
									<input type="text" id="endTimeM" name="endTimeM" width="80px;"
										class="easyui-datebox" value="2013-12-01"
										data-options="formatter:myformatterM,parser:myparserM" />
								</td>
							</tr>
						</table>
						<table id="f3" style="display: none;" align="left" border="0"
							class="ybfont">
							<tr>
								<td>
									&emsp;&emsp;&emsp;&emsp;&emsp;
									<font id="endft" face="幼圆">结束时间</font>
								</td>
								<td>
									<input type="text" id="endTimeY" name="endTimeY" width="80px;"
										class="easyui-datebox" value="2014-01-01"
										data-options="formatter:myformatterY,parser:myparserY" />
								</td>
							</tr>
						</table>
					</div>
					<table id="t3" align="left" class="ybfont" style="right: 80px;"
						border="0">
						<tr>
							<td>
								&nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;
								<input type="button" id="sjfx" class="thg" value="数据分析"
									onclick="GetData()" />
							</td>
							<td>
								<input style="display: none;" type="button" id="ksjy"
									class="thg" value="开始校验" onclick="BeginCheck()" />
							</td>
						</tr>
					</table>
					<br />
					<br />
					<table id="t4" align="left" class="ybfont" border="0">
						<tr>
							<td colspan="5">
								&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
								<input id="Curve" name="what" type="radio" value="曲线"
									checked="checked" onclick="QdQ()" />
								曲线&emsp;
								<input id="Month" name="what" type="radio" value="月"
									onclick="YdQ()" />
								月&emsp;
								<input id="Year" name="what" type="radio" value="年"
									onclick="NdQ()" />
								年 &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
								<font id="aTalking" color="red"></font>
							</td>
						</tr>
					</table>
				</div>
				<table id="gd" class="easyui-datagrid"
					style="width: 1098px; height: 470px" toolbar="#toolbar"
					rownumbers="true" fitColumns="true" singleSelect="true">
				</table>
				<!-- 曲线 -->
				<div id="divRgTb" style="display: none;">
					<font color="red" id="qfont"></font>
					<table id="gds" class="easyui-datagrid" 
						style="width: 1260px; height: 400px" toolbar="#toolbar"
						rownumbers="true" fitColumns="true" singleSelect="true">
					</table>
				</div>
				<!-- 月 -->
				<div id="divRgTbMon" style="display: none;">
					<font color="red" id="yfont"> </font>
					<table id="gdsMon" class="easyui-datagrid"
						style="width: 1260px; height: 400px" toolbar="#toolbar"
						rownumbers="true" fitColumns="true" singleSelect="true">
					</table>
				</div>
				<!-- 年 -->
				<div id="divRgTbYear" style="display: none;">
					<font color="red" id="nfont"> </font>
					<table id="gdsYear" class="easyui-datagrid"
						style="width: 1260px; height: 400px" toolbar="#toolbar"
						rownumbers="true" fitColumns="true" singleSelect="true">
					</table>
				</div>

			</div>
		</div>
	</body>
	<script type="text/javascript">
		//校验通过否?变色函数
		function parseStr1(value){
			var idx = value.indexOf("+"); 
			if(idx!="-1"){ 
				var str2 =value.split("+");
				var vone=str2[0];
				var vtwo=str2[1]; 
				if (vtwo=="1") {
					return "<font color='GREEN'>"+vone+"</font>"; 
				}else{
					return "<font color='#871F78'>"+vone+"</font>"; 
				}
			}else{
				return value;
			}
		}
		//曲线详情
			$('#gds').datagrid({
				singleSelect: false,
				//pagination:true,
				fitColumns:false,
				rownumbers : true,
				remoteSort : false,
				sortName : 'flog',
				columns: [[
					{ title: 'id',field: 'id',hidden: true,sortable:true, width: 100,formatter: function (value, rowData, rowIndex) {return value}}, 
					{ title: '参数', field: 'trueName',sortable:true, width: 150,formatter: function (value, rowData, rowIndex) {return value}}, 
					{ title: '时间', field: 'curve_storage_time',sortable:true, width: 165,formatter: function (value, rowData, rowIndex) {return value}}, 
					{ title: '编码', field: 'point_codes',hidden: true,sortable:true, width: 250,formatter: function (value, rowData, rowIndex) {return value}}, 
					{ title: '是否校验', field: 'isCheck',sortable:true, width: 70,styler: function (value, rowData, rowIndex) {if(value=="是"){return 'font-weight: bold;color:blue;';}}}, 
					{ title: '0:00', field: 'point1',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '0:15', field: 'point2',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '0:30', field: 'point3',width: 80,editor:'text',formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '0:45', field: 'point4',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '1:00', field: 'point5',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '1:15', field: 'point6',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '1:30', field: 'point7',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '1:45', field: 'point8',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '2:00', field: 'point9',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '2:15', field: 'point10',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},
					{ title: '2:30', field: 'point11',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '2:45', field: 'point12',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '3:00', field: 'point13',width: 80,editor:'text',formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '3:15', field: 'point14',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '3:30', field: 'point15',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '3:45', field: 'point16',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '4:00', field: 'point17',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '4:15', field: 'point18',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '4:30', field: 'point19',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '4:45', field: 'point20',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},
					{ title: '5:00', field: 'point21',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '5:15', field: 'point22',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '5:30', field: 'point23',width: 80,editor:'text',formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '5:45', field: 'point24',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '6:00', field: 'point25',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '6:15', field: 'point26',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '6:30', field: 'point27',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '6:45', field: 'point28',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '7:00', field: 'point29',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '7:15', field: 'point30',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},
					{ title: '7:30', field: 'point31',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '7:45', field: 'point32',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '8:00', field: 'point33',width: 80,editor:'text',formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '8:15', field: 'point34',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '8:30', field: 'point35',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '8:45', field: 'point36',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '9:00', field: 'point37',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '9:15', field: 'point38',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '9:30', field: 'point39',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '9:45', field: 'point40',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},
					{ title: '10:00', field: 'point41',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '10:15', field: 'point42',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '10:30', field: 'point43',width: 80,editor:'text',formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '10:45', field: 'point44',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '11:00', field: 'point45',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '11:15', field: 'point46',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '11:30', field: 'point47',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '11:45', field: 'point48',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '12:00', field: 'point49',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '12:15', field: 'point50',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},
					{ title: '12:30', field: 'point51',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '12:45', field: 'point52',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '13:00', field: 'point53',width: 80,editor:'text',formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '13:15', field: 'point54',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '13:30', field: 'point55',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '13:45', field: 'point56',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '14:00', field: 'point57',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '14:15', field: 'point58',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '14:30', field: 'point59',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '14:45', field: 'point60',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},
					{ title: '15:00', field: 'point61',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '15:15', field: 'point62',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '15:30', field: 'point63',width: 80,editor:'text',formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '15:45', field: 'point64',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '16:00', field: 'point65',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '16:15', field: 'point66',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '16:30', field: 'point67',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '16:45', field: 'point68',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '17:00', field: 'point69',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '17:15', field: 'point70',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},
					{ title: '17:30', field: 'point71',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '17:45', field: 'point72',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '18:00', field: 'point73',width: 80,editor:'text',formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '18:15', field: 'point74',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '18:30', field: 'point75',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '18:45', field: 'point76',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '19:00', field: 'point77',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '19:15', field: 'point78',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '19:30', field: 'point79',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '19:45', field: 'point80',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},
					{ title: '20:00', field: 'point81',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '20:15', field: 'point82',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '20:30', field: 'point83',width: 80,editor:'text',formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '20:45', field: 'point84',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '21:00', field: 'point85',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '21:15', field: 'point86',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '21:30', field: 'point87',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '21:45', field: 'point88',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '22:00', field: 'point89',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '22:15', field: 'point90',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},
					{ title: '22:30', field: 'point91',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '22:45', field: 'point92',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '23:00', field: 'point93',width: 80,editor:'text',formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '23:15', field: 'point94',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '23:30', field: 'point95',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '23:45', field: 'point96',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},
					{ title: '参数标示', field: 'flog',hidden: true,sortable:true, width: 250}
					]],
					onLoadSuccess:function (data){
						$('#gds').datagrid('selectRow',0);
						var row=$('#gds').datagrid('getRows');
						if (data.rows.length>0)
							{	//调用mergeCellsByField()合并单元格
								mergeCellsByField("gds","trueName");
					    	}
						document.getElementById('ksjy').style.display='block';
					}
				});
		  //月详情
			$('#gdsMon').datagrid({
				singleSelect: false,
				//pagination:true,
				fitColumns:false,
				rownumbers : true,
				remoteSort : false,
				sortName : 'flog',
				columns: [[
					{ title: 'id',field: 'id',hidden: true,sortable:true, width: 100,formatter: function (value, rowData, rowIndex) {return value}}, 
					{ title: '参数', field: 'trueName',sortable:true, width: 150,formatter: function (value, rowData, rowIndex) {return value}}, 
					{ title: '编码', field: 'days_freezing_point_codes',hidden: true,sortable:true, width: 100,formatter: function (value, rowData, rowIndex) {return value}}, 
					{ title: '时间', field: 'curve_storage_time',sortable:true, width: 165,formatter: function (value, rowData, rowIndex) {return value}}, 
					{ title: '是否校验', field: 'isCheck',sortable:true, width: 70,styler: function (value, rowData, rowIndex) {if(value=="是"){return 'font-weight: bold;color:blue;';}}}, 
					{ title: '第一天', field: 'p1',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '第二天', field: 'p2',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '第三天', field: 'p3',width: 80,editor:'text',formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '第四天', field: 'p4',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '第五天', field: 'p5',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '第六天', field: 'p6',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '第七天', field: 'p7',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '第八天', field: 'p8',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '第九天', field: 'p9',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '第十天', field: 'p10',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},
					{ title: '第十一天', field: 'p11',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '第十二天', field: 'p12',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '第十三天', field: 'p13',width: 80,editor:'text',formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '第十四天', field: 'p14',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '第十五天', field: 'p15',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '第十六天', field: 'p16',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '第十七天', field: 'p17',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '第十八天', field: 'p18',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '第十九天', field: 'p19',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '第二十天', field: 'p20',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},
					{ title: '第二十一天', field: 'p21',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '第二十二天', field: 'p22',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '第二十三天', field: 'p23',width: 80,editor:'text',formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '第二十四天', field: 'p24',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '第二十五天', field: 'p25',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '第二十六天', field: 'p26',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '第二十七天', field: 'p27',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '第二十八天', field: 'p28',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '第二十九天', field: 'p29',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '第三十天', field: 'p30',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},
					{ title: '第三十一天', field: 'p31',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},
					{ title: '参数标示', field: 'flog',hidden: true,sortable:true, width: 250}
					]],
					onLoadSuccess:function (data){
						$('#gdsMon').datagrid('selectRow',0);
						var row = $('#gdsMon').datagrid('getRows');
						if (data.rows.length>0)
							{
								//调用mergeCellsByField()合并单元格
								mergeCellsByField("gdsMon","trueName");
					    	}  
						document.getElementById('ksjy').style.display='block';
					}
				});
			
			//年详情
			$('#gdsYear').datagrid({
				singleSelect: false,
				//pagination:true,
				fitColumns:false,
				rownumbers : true,
				remoteSort : false,
				sortName : 'flog',
				columns: [[
					{ title: 'id',field: 'id',hidden: true,sortable:true, width: 100,formatter: function (value, rowData, rowIndex) {return value}}, 
					{ title: '参数', field: 'trueName',sortable:true, width: 150,formatter: function (value, rowData, rowIndex) {return value}}, 
					{ title: '编码', field: 'days_freezing_point_codes',hidden: true,sortable:true, width: 100,formatter: function (value, rowData, rowIndex) {return value}}, 
					{ title: '时间', field: 'curve_storage_time',sortable:true, width: 165,formatter: function (value, rowData, rowIndex) {return value}}, 
					{ title: '是否校验', field: 'isCheck',sortable:true, width: 70,styler: function (value, rowData, rowIndex) {if(value=="是"){return 'font-weight: bold;color:blue;';}}}, 
					{ title: '第一月', field: 'p1',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '第二月', field: 'p2',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '第三月', field: 'p3',width: 80,editor:'text',formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '第四月', field: 'p4',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '第五月', field: 'p5',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '第六月', field: 'p6',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '第七月', field: 'p7',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '第八月', field: 'p8',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '第九月', field: 'p9',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '第十月', field: 'p10',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},
					{ title: '第十一月', field: 'p11',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},{ title: '第十二月', field: 'p12',editor:'text',width: 80,formatter: function (value, rowData, rowIndex) {return parseStr1(value);}},
					{ title: '参数标示', field: 'flog',hidden: true,sortable:true, width: 250}
					]],
					onLoadSuccess:function (data){
						$('#gdsYear').datagrid('selectRow',0);
						var row=$('#gdsYear').datagrid('getRows');
						if (data.rows.length>0)
							{
								//调用mergeCellsByField()合并单元格
								mergeCellsByField("gdsYear","trueName");
					    	} 
						document.getElementById('ksjy').style.display='block';
					}
				});
			//开始校验--月
			$("#JyY").click(function(){		
				alert("asd");
			});
			//开始校验--年
			$("#JyN").click(function(){		
				alert("asd");
			});
			//准备校验
			function BeginCheck(){
				var node =$("#gd").datagrid("getSelected");
				if(node==null){
					$.messager.alert("提示","请选择一个或多个参数");
					return false;
				}
				var onj = document.getElementsByName("what");
				for(var i = 0;i<onj.length;i++){
					if(onj[i].checked){
						var ip = onj[i].value;
						if(ip=="曲线"){
							//获取所有行信息
							//var node =$("#MyTree").tree("getSelected"); 
							$("#divRgTb").show();
							document.getElementById('qfont').innerText=" ";
							document.getElementById('divRgTbMon').style.display='none';
							document.getElementById('divRgTbYear').style.display='none';
							GetDataD();
							$("#divRgTb").dialog({
							     title:'数据校验-曲线',
							     modal:true,
							     draggable:true,
							     width:1280,
							     height:520,
							     buttons:[{
								   	  text:'确定',
								   	  handler:function(){
							    	 document.getElementById('divRgTb').style.display='none';
							    	 $('#divRgTb').dialog('close');
							    	 GetData();
									   	  }
								     }]
							   });
							}
						else if(ip=="月"){
							$("#divRgTbMon").show();
							document.getElementById('yfont').innerText=" ";
							document.getElementById('divRgTb').style.display='none';
							document.getElementById('divRgTbYear').style.display='none';
							GetDataD();
							$("#divRgTbMon").dialog({
							     title:'数据校验-月',
							     modal:true,
							     draggable:true,
							     width:1280,
							     height:530,
							     buttons:[{
								   	  text:'确定',
								   	  handler:function(){
							    	 document.getElementById('divRgTbMon').style.display='none';
							    	 $('#divRgTbMon').dialog('close');
							    	 GetData();
									   	  }
								     }]
							   });
							}
						else if(ip=="年"){
							$("#divRgTbYear").show();
							document.getElementById('nfont').innerText=" ";
							document.getElementById('divRgTb').style.display='none';
							document.getElementById('divRgTbMon').style.display='none';
							GetDataD();
							$("#divRgTbYear").dialog({
							     title:'数据校验-年',
							     modal:true,
							     draggable:true,
							     width:1280,
							     height:530,
							     buttons:[{
								   	  text:'确定',
								   	  handler:function(){
							    	 	document.getElementById('divRgTbYear').style.display='none';
							    	 	$('#divRgTbYear').dialog('close');
							    	 	GetData();
									  }
								 }]
							});
						}
					}
				}
			}

			//数据详情
			function GetDataD(){
				var args={};
				var node =$("#MyTree").tree("getSelected"); 
				var ss = node.id;
				var ids= [];
				var times=[];
				var nname =[];
				var gdnode =$('#gd').datagrid("getSelections"); 
				var onj = document.getElementsByName("what");
				for(var i = 0;i<onj.length;i++){
					if(onj[i].checked){
						var ip = onj[i].value;
						if(ip=="曲线"){
								var node =$("#MyTree").tree("getSelected"); 
								var ss = node.id;
								var qcheck=[];
								var qtime=[];
								var qcode=[];
								var trname=[];
								var floggs=[];
								var supp = $('#gd').datagrid("getSelections");
								var s = $('#gd').datagrid("getSelected");
								var marks='jyQx';
								var squt;
								for(var i = 0;i<supp.length;i++){
									qcheck.push(supp[i].isCheck);			//是否校验
									qtime.push(supp[i].curve_storage_time);	//时间
									qcode.push(supp[i].point_codes);		//编码
									trname.push(supp[i].trueName);			//中文编码
									floggs.push(supp[i].flog);			//排序
								}
								if(isFirefox=navigator.userAgent.indexOf("Firefox")>0){
									squt='FireFox';
								}
								var args={}; 
								BingData("#gds",args,"toCjsjjh.action?m=toChecking&qcheck="+qcheck+"&qtime="+qtime+"&qcode="+qcode+"&ss="+ss+"&squt="+squt+"&trname="+trname+"&marks="+marks+"&floggs="+floggs,null);
								document.getElementById('qfont').innerText=" 绿色为校验通过,紫色为校验失败    (1.该测点值不符合校验条件,2.该测点值尚未记录)";
							}
						else if(ip=="月"){	//日冻结，时间标示为唯一的
								document.getElementById('nfont').innerText=" ";
								var node =$("#MyTree").tree("getSelected"); 
								var ss = node.id;
								var qcheck=[];
								var qtime=[];
								var qcode=[];
								var trname=[];
								var floggs=[];
								var supp = $('#gd').datagrid("getSelections");
								var s = $('#gd').datagrid("getSelected");
								var marks='jyYf';
								var squt;
								for(var i = 0;i<supp.length;i++){
									qcheck.push(supp[i].isCheck);						//是否校验
									qtime.push(supp[i].curve_storage_time);				//时间
									qcode.push(supp[i].days_freezing_point_codes);		//编码
									trname.push(supp[i].trueName);						//中文编码
									floggs.push(supp[i].flog);							//排序
								}
								if(isFirefox=navigator.userAgent.indexOf("Firefox")>0){
									squt='FireFox';
								} 
								var args={}; 
								BingData("#gdsMon",args,"toCjsjjh.action?m=toChecking&qcheck="+qcheck+"&qtime="+qtime+"&qcode="+qcode+"&ss="+ss+"&squt="+squt+"&trname="+trname+"&marks="+marks+"&floggs="+floggs,null);
								document.getElementById('yfont').innerText=" 绿色为校验通过,紫色为校验失败  (1.该测点值不符合校验条件,2.该测点值尚未记录)";
							}
						else if(ip=="年"){
							var node =$("#MyTree").tree("getSelected"); 
							var ss = node.id;
							var qcheck=[];
							var qtime=[];
							var qcode=[];
							var trname=[];
							var floggs=[];
							var supp = $('#gd').datagrid("getSelections");
							var s = $('#gd').datagrid("getSelected");
							var marks='jyNf';
							var squt;
							for(var i = 0;i<supp.length;i++){
								qcheck.push(supp[i].isCheck);						//是否校验
								qtime.push(supp[i].curve_storage_time);				//时间
								qcode.push(supp[i].days_freezing_point_codes);		//编码
								trname.push(supp[i].trueName);						//中文编码
								floggs.push(supp[i].flog);							//排序
							}
							if(isFirefox=navigator.userAgent.indexOf("Firefox")>0){
								squt='FireFox';
							} 
							var args={}; 
							BingData("#gdsYear",args,"toCjsjjh.action?m=toChecking&qcheck="+qcheck+"&qtime="+qtime+"&qcode="+qcode+"&ss="+ss+"&squt="+squt+"&trname="+trname+"&marks="+marks+"&floggs="+floggs,null);
							document.getElementById('nfont').innerText=" 绿色为校验通过,紫色为校验失败  (1.该测点值不符合校验条件,2.该测点值尚未记录)";
						}
					}
				}
			}
	</script>
</html>
