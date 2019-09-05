<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>数据补调</title>
    
 	<link href="/emcc-web/css/poms-business/others.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-monitor/monitroFir.css"></link>
	<link href="/emcc-web/css/poms-system/CSS.css" rel="stylesheet" type="text/css" ></link>
	<link href="/emcc-web/css/poms-system/yxztjk.css" rel="stylesheet" type="text/css"></link>
	<link href="/emcc-web/css/poms-business/ptrzgl.css" rel="stylesheet" type="text/css"></link>
	<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/default/easyui.css"></link>
	<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/icon.css"></link>
	<script type="text/javascript" src="/emcc-web/js/poms-business/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src="/emcc-web/js/poms-business/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/emcc-web/js/page.js"></script>
	<script type="text/javascript" src="/emcc-web/js/poms-business/jsonToTime.js"></script>    
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
	document.getElementById('sjbd').style.display='none';
	document.getElementById('rgbd').style.display='none';
	}
	function NdQ(){
		var item = $('#gds').datagrid('getRows');
	document.getElementById('t1').style.display='none';
	document.getElementById('t2').style.display='none';
	document.getElementById('t3').style.display='block';
	document.getElementById('f1').style.display='none';
	document.getElementById('f2').style.display='none';
	document.getElementById('f3').style.display='block';
	document.getElementById('sjbd').style.display='none';
	document.getElementById('rgbd').style.display='none';
	}
	function QdQ(){
	document.getElementById('t3').style.display='none';
	document.getElementById('t2').style.display='none';
	document.getElementById('t1').style.display='block';
	document.getElementById('f1').style.display='block';
	document.getElementById('f2').style.display='none';
	document.getElementById('f3').style.display='none';
	document.getElementById('sjbd').style.display='none';
	document.getElementById('rgbd').style.display='none';
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
						args.staTime = $("#startTime").datebox('getValue');
						args.endTime = $("#endTime").datebox('getValue');
						BingData("#gd",args,"toCjsjjh.action?m=toCurveRecord",null);
						}
					else if(ip=="月"){
						if($("#startTimeM").datebox('getValue')==""||$("#startTimeM").datebox('getValue')==null){
							$.messager.alert("警告","请输入一个观察时间");
							return false;
						}else if($("#endTimeM").datebox('getValue')==""||$("#endTimeM").datebox('getValue')==null){
							$.messager.alert("警告","请输入一个观察的结束时间");
							return false;
						}
						args.staTimeM = $("#startTimeM").datebox('getValue');
						args.endTimeM = $("#endTimeM").datebox('getValue');
						BingData("#gd",args,"toCjsjjh.action?m=toMonthRecord",null);
						}
					else if(ip=="年"){
						if($("#startTimeY").datebox('getValue')==""||$("#startTime").datebox('getValue')==null){
							$.messager.alert("警告","请输入一个观察时间");
							return false;
						}else if($("#endTimeY").datebox('getValue')==""||$("#endTimeY").datebox('getValue')==null){
							$.messager.alert("警告","请输入一个观察的结束时间");
							return false;
						}
						args.staTimeY = $("#startTimeY").datebox('getValue');
						args.endTimeY = $("#endTimeY").datebox('getValue');
						BingData("#gd",args,"toCjsjjh.action?m=toYearRecord",null);
						}
				}
			}
			//document.getElementById('sjxq').style.display='none';
			document.getElementById('sjbd').style.display='none';
			document.getElementById('rgbd').style.display='none';
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
				//{ title: '参数编码', field: 'point_codes',sortable:true, width: 250},
				{ title: '正常参数', field: 'allCount',sortable:true, width: 250,formatter: function (value, rowData, rowIndex) {return value} },
				{ title: '丢失参数', field: 'lostCount',sortable:true, width: 250,styler: function (value, rowData, rowIndex) {if(value>0){return 'font-weight: bold;color:red;';}} },
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
					},
				onSelect:function(rowIndex,rowData){
						if(rowData!=null){
						var all = rowData.allCount;
						var lost = rowData.lostCount;
						if(lost == 0){																																							
							document.getElementById('aTalking').innerText="";
						}else if(lost>0){
							//详情按钮
							//预警文字
							var ss="警告：正常参数";
							ss+=all;
							ss+="个，丢失参数";
							ss+=lost;
							ss+="个，建议数据补调完整！";
							document.getElementById('aTalking').innerText=ss;
						}
							//document.getElementById('sjxq').style.display='block';
							document.getElementById('sjbd').style.display='block';
							document.getElementById('rgbd').style.display='block';
					}
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
			<div align="left" id="ssjs_right" style="width: 78%;height: 560px;">
				<div id="sjbd_right_top" style="width: 100%;height: 50px;">
					<table id="t1" align="left" border="0" class="ybfont">
						<tr>
							<td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
								<font id="startft">起始时间：</font></td>
							<td><input type="text" id="startTime" name="startTime" value="2013-10-16" width="80px;" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser"/></td>
						</tr>
					</table>	
					<!-- 隐藏 月-->
					<div>
						<table id="t2" style="display: none;"  align="left" border="0" class="ybfont">
							<tr>
								<td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
									<font id="startft">起始时间：</font></td>
								<td>
									<input id="startTimeM" name="startTimeM" value="2013-10-16" width="80px;" class="easyui-datebox" data-options="formatter:myformatterM,parser:myparserM"/>
								</td>
							</tr>
						</table>
					</div>
					<!-- 隐藏 年-->
					<div>
						<table id="t3" style="display: none;"  align="left" border="0" class="ybfont">
							<tr>
								<td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
									<font id="startft">起始时间：</font></td>
								<td>
									<input style="display: none;" id="startTimeY" value="2013-10-16" name="startTimeY" width="80px;" class="easyui-datebox" data-options="formatter:myformatterY,parser:myparserY"/>
								</td>
							</tr>
						</table>
					</div>
					
					
					<div id="gundan">
						<table id="f1" align="left" border="0" class="ybfont">
							<tr>
								<td>&emsp;&emsp;&emsp;&emsp;&emsp;<font id="endft">结束时间</font></td>
								<td><input type="text" id="endTime" value="2013-10-18" name="endTime" width="80px;" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser"/></td>
							</tr>
						</table>
						<table id="f2" style="display: none;" align="left" border="0" class="ybfont">
							<tr>
								<td>&emsp;&emsp;&emsp;&emsp;&emsp;<font id="endft">结束时间</font></td>
								<td><input type="text" id="endTimeM" value="2013-10-18" name="endTimeM" width="80px;" class="easyui-datebox" data-options="formatter:myformatterM,parser:myparserM"/></td>
							</tr>
						</table>
						<table id="f3" style="display: none;" align="left" border="0" class="ybfont">
							<tr>
								<td>&emsp;&emsp;&emsp;&emsp;&emsp;<font id="endft">结束时间</font></td>
								<td><input type="text" id="endTimeY" value="2013-10-18" name="endTimeY" width="80px;" class="easyui-datebox" data-options="formatter:myformatterY,parser:myparserY"/></td>
							</tr>
						</table>
					</div>
					<table id="t3" align="left" class="ybfont" style="right: 80px;" border="0">
						<tr>
							<td>&nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;<input type="button" id="sjfx" class="thg" value="数据分析" onclick="GetData()"/></td>
							<td><input style="display: none;" type="button" id="sjbd" class="nothg" value="数据补调" onclick="SjBd()"/></td>
							<td><input style="display: none;" type="button" id="rgbd" class="nothg" value="人工补调" onclick="RgBd()"/></td>
						</tr>
					</table><br/><br/>
					<table id="t4" align="left" class="ybfont" border="0">
						<tr><td colspan="5">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
								<input id="Curve" name="what" type="radio" value="曲线" checked="checked" onclick="QdQ()"/>曲线&emsp;
								<input id="Month" name="what" type="radio" value="月" onclick="YdQ()"/>月&emsp;
								<input id="Year" name="what" type="radio" value="年" onclick="NdQ()"/>年
								&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
								<font id="aTalking" color="red"></font>
							</td>
						</tr>
					</table>
				</div>
				
				<table id="gd" class="easyui-datagrid" style="width:1098px;height:470px"
					toolbar="#toolbar"  rownumbers="true" fitColumns="true" singleSelect="true">
				</table>
				
				<div id="divSjXq" style="display: none;">
					<table id="gd2" class="easyui-datagrid" style="width:1280px;height:250px"
						toolbar="#toolbar"  rownumbers="true" fitColumns="true" singleSelect="true">
					</table>
				</div>
				<!-- 曲线 -->
				<div id="divRgTb" style="display: none;">
					<table id="gds" class="easyui-datagrid" style="width:1260px;height:450px"
					toolbar="#toolbar"  rownumbers="true" fitColumns="true" singleSelect="true">
					</table>
				</div>
				<!-- 月 -->
				<div id="divRgTbMon" style="display: none;">
					<table id="gdsMon" class="easyui-datagrid" style="width:1260px;height:450px"
					toolbar="#toolbar"  rownumbers="true" fitColumns="true" singleSelect="true">
					</table>
				</div>
				<!-- 年 -->
				<div id="divRgTbYear" style="display: none;">
					<table id="gdsYear" class="easyui-datagrid" style="width:1260px;height:450px"
					toolbar="#toolbar"  rownumbers="true" fitColumns="true" singleSelect="true">
					</table>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript">
		//补掉
		//1:数据补调，直接获取左边树形表计的id，发送请求，获取数。
		function SjBd(){
			var node =$("#MyTree").tree("getSelected");
			if(node==null){
				$.messager.alert("提示","请选择一个表计");
				return false;
			}else{
				var sid = node.id;
				var sTime = $("#startTime").datebox('getValue');
				var eTime = $("#endTime").datebox('getValue');
				var onj = document.getElementsByName("what");
				var ip="";
				for(var i = 0;i<onj.length;i++){
					if(onj[i].checked){
						ip = onj[i].value;
					}
				}
				//发送请求,执行补数程序
				$.ajax({
					url:"toCjsjjh.action?m=toSjBding&sid="+sid,
					type:"POST",dataType:"json",
		           	data:{
		           		"sid":sid,
		           		"sTime":sTime,
		           		"eTime":eTime,
		           		"ip":ip
		           	},
		           	success:function(data){
			           	//弹出消息
		           	}
				});
			}
		}
		//2:人工补调，弹出该标记下所有属性的96个点，标题提示，手动填报补数。
			//人工补调:DIV中数据详情
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
							for(var i = 0;i<gdnode.length;i++){
								ids.push(gdnode[i].id);
							}
								var flog="RgBdQ";
								args.ids = ids;
								args.flog = flog;
								args.ss = ss;
								args.staTime = $("#startTime").datebox('getValue');
								args.endTime = $("#endTime").datebox('getValue');
								BingData("#gds",args,"toCjsjjh.action?m=toRgBl&ids="+ids,null);
							}
						else if(ip=="月"){	//日冻结，时间标示为唯一的
							for(var i = 0;i<gdnode.length;i++){
								times.push(gdnode[i].curve_storage_time);
							}
								var flog="RgBdM";
								args.times = times;
								args.flog = flog;
								args.ss = ss;
								args.staTimeM = $("#startTimeM").datebox('getValue');
								args.endTimeM = $("#endTimeM").datebox('getValue');
								BingData("#gdsMon",args,"toCjsjjh.action?m=toRgBl&times="+times,null);
							}
						else if(ip=="年"){
							for(var i = 0;i<gdnode.length;i++){
								times.push(gdnode[i].curve_storage_time);
								nname.push(gdnode[i].trueName);
							}
								var flog="RgBdN";
								args.times = times;
								args.flog = flog;
								args.ss = ss;
								args.nname = nname;
								args.staTimeY = $("#startTimeY").datebox('getValue');
								args.endTimeY = $("#endTimeY").datebox('getValue');
								BingData("#gdsYear",args,"toCjsjjh.action?m=toRgBl&times="+times+"&nname="+nname,null);
							}
					}
				}
			}
			//人工补调:某块表，某个属性，数据详情。
			function RgBd(){
				var node =$("#gd").datagrid("getSelected");
				if(node==null){
					$.messager.alert("提示","请选择一个或多个参数");
					return false;
				}
				
				var onj = document.getElementsByName("what");
				for(var i = 0;i<onj.length;i++){
					if(onj[i].checked){
						$("#divRgTb").show();
						document.getElementById('divRgTbMon').style.display='none';
						document.getElementById('divRgTbYear').style.display='none';
						GetDataD();
						var ip = onj[i].value;
						if(ip=="曲线"){
							$("#divRgTb").dialog({
							     title:'人工补调-曲线',
							     modal:true,
							     draggable:true,
							     width:1280,
							     height:530,
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
							document.getElementById('divRgTb').style.display='none';
							document.getElementById('divRgTbYear').style.display='none';
							GetDataD();
							$("#divRgTbMon").dialog({
							     title:'人工补调-月',
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
							document.getElementById('divRgTb').style.display='none';
							document.getElementById('divRgTbMon').style.display='none';
							GetDataD();
							$("#divRgTbYear").dialog({
							     title:'人工补调-年',
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
			$(function(){
			//曲线
			$('#gds').datagrid({
				singleSelect: true,
				//pagination:true,
				fitColumns:false,
				rownumbers : true,
				remoteSort : false,
				sortName : 'flog',
				columns: [[
					{ title: 'id',field: 'id',hidden: true,sortable:true, width: 100,formatter: function (value, rowData, rowIndex) {return value}}, 
					{ title: '参数', field: 'trueName',sortable:true, width: 150,formatter: function (value, rowData, rowIndex) {return value}}, 
					{ title: '时间', field: 'curve_storage_time',sortable:true, width: 150,formatter: function (value, rowData, rowIndex) {return value}}, 
					{ title: '0:00', field: 'point1',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '0:15', field: 'point2',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '0:30', field: 'point3',width: 80,editor:'text',styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '0:45', field: 'point4',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '1:00', field: 'point5',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '1:15', field: 'point6',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '1:30', field: 'point7',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '1:45', field: 'point8',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '2:00', field: 'point9',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '2:15', field: 'point10',editor:'text',width: 80},
					{ title: '2:30', field: 'point11',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '2:45', field: 'point12',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '3:00', field: 'point13',width: 80,editor:'text',styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '3:15', field: 'point14',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '3:30', field: 'point15',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '3:45', field: 'point16',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '4:00', field: 'point17',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '4:15', field: 'point18',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '4:30', field: 'point19',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '4:45', field: 'point20',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},
					{ title: '5:00', field: 'point21',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '5:15', field: 'point22',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '5:30', field: 'point23',width: 80,editor:'text',styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '5:45', field: 'point24',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '6:00', field: 'point25',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '6:15', field: 'point26',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '6:30', field: 'point27',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '6:45', field: 'point28',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '7:00', field: 'point29',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '7:15', field: 'point30',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},
					{ title: '7:30', field: 'point31',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '7:45', field: 'point32',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '8:00', field: 'point33',width: 80,editor:'text',styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '8:15', field: 'point34',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '8:30', field: 'point35',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '8:45', field: 'point36',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '9:00', field: 'point37',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '9:15', field: 'point38',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '9:30', field: 'point39',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '9:45', field: 'point40',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},
					{ title: '10:00', field: 'point41',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '10:15', field: 'point42',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '10:30', field: 'point43',width: 80,editor:'text',styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '10:45', field: 'point44',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '11:00', field: 'point45',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '11:15', field: 'point46',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '11:30', field: 'point47',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '11:45', field: 'point48',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '12:00', field: 'point49',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '12:15', field: 'point50',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},
					{ title: '12:30', field: 'point51',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '12:45', field: 'point52',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '13:00', field: 'point53',width: 80,editor:'text',styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '13:15', field: 'point54',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '13:30', field: 'point55',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '13:45', field: 'point56',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '14:00', field: 'point57',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '14:15', field: 'point58',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '14:30', field: 'point59',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '14:45', field: 'point60',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},
					{ title: '15:00', field: 'point61',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '15:15', field: 'point62',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '15:30', field: 'point63',width: 80,editor:'text',styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '15:45', field: 'point64',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '16:00', field: 'point65',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '16:15', field: 'point66',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '16:30', field: 'point67',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '16:45', field: 'point68',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '17:00', field: 'point69',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '17:15', field: 'point70',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},
					{ title: '17:30', field: 'point71',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '17:45', field: 'point72',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '18:00', field: 'point73',width: 80,editor:'text',styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '18:15', field: 'point74',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '18:30', field: 'point75',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '18:45', field: 'point76',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '19:00', field: 'point77',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '19:15', field: 'point78',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '19:30', field: 'point79',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '19:45', field: 'point80',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},
					{ title: '20:00', field: 'point81',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '20:15', field: 'point82',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '20:30', field: 'point83',width: 80,editor:'text',styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '20:45', field: 'point84',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '21:00', field: 'point85',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '21:15', field: 'point86',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '21:30', field: 'point87',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '21:45', field: 'point88',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '22:00', field: 'point89',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '22:15', field: 'point90',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},
					{ title: '22:30', field: 'point91',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '22:45', field: 'point92',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '23:00', field: 'point93',width: 80,editor:'text',styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '23:15', field: 'point94',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '23:30', field: 'point95',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '23:45', field: 'point96',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},
					{ title: '参数标示', field: 'flog',hidden: true,sortable:true, width: 250}
					]],
					onLoadSuccess:function (data){
						$('#gds').datagrid('selectRow',0);
						var row=$('#gds').datagrid('getRows');
						if (data.rows.length>0)
							{
								//调用mergeCellsByField()合并单元格
								mergeCellsByField("gds","trueName");
					    	}  
						},
						toolbar:[{
							text:'保存',
							//iconCls:'icon-save',
							handler:function(){
								$('#gds').datagrid('acceptChanges');
								//获取datagrid中所有的数据
								var rowDatas = $("#gds").datagrid("getRows");
								$.each(rowDatas,function(i,item){
									//alert("I::"+item);
									//alert("id::"+item.id);
									//alert("po::"+item.point1);
									var dd = $('#gds').datagrid('getSelected');
									$.ajax({
										url: "toCjsjjh.action?m=SaveRgBlUpDate",
										type:"POST",
										dataType:"json",
										data:{
										//所有被选中的Id
										//点值
										"ids":item.id,
										"point1":item.point1,"point2":item.point2,"point3":item.point3,"point4":item.point4,"point5":item.point5,"point6":item.point6,"point7":item.point7,"point8":item.point8,"point9":item.point9,"point10":item.point10,
										"point11":item.point11,"point12":item.point12,"point13":item.point13,"point14":item.point14,"point15":item.point15,"point16":item.point16,"point17":item.point17,"point18":item.point18,"point19":item.point19,"point20":item.point20,
										"point21":item.point21,"point22":item.point22,"point23":item.point23,"point24":item.point24,"point25":item.point25,"point26":item.point26,"point27":item.point27,"point28":item.point28,"point29":item.point29,"point30":item.point30,
										"point31":item.point31,"point32":item.point32,"point33":item.point33,"point34":item.point34,"point35":item.point35,"point36":item.point36,"point37":item.point37,"point38":item.point38,"point39":item.point39,"point40":item.point40,
										"point41":item.point41,"point42":item.point42,"point43":item.point43,"point44":item.point44,"point45":item.point45,"point46":item.point46,"point47":item.point47,"point48":item.point48,"point49":item.point49,"point50":item.point50,
										"point51":item.point51,"point52":item.point52,"point53":item.point53,"point54":item.point54,"point55":item.point55,"point56":item.point56,"point57":item.point57,"point58":item.point56,"point59":item.point59,"point60":item.point60,
										"point61":item.point61,"point62":item.point62,"point63":item.point63,"point64":item.point64,"point65":item.point65,"point66":item.point66,"point67":item.point67,"point68":item.point68,"point69":item.point69,"point70":item.point70,
										"point71":item.point71,"point72":item.point72,"point73":item.point73,"point74":item.point74,"point75":item.point75,"point76":item.point76,"point77":item.point77,"point78":item.point78,"point79":item.point79,"point80":item.point80,
										"point81":item.point81,"point82":item.point82,"point83":item.point83,"point84":item.point84,"point85":item.point85,"point86":item.point86,"point87":item.point87,"point88":item.point88,"point89":item.point89,"point90":item.point90,
										"point91":item.point91,"point92":item.point92,"point93":item.point93,"point94":item.point94,"point95":item.point95,"point96":item.point96
										}, success: function(data){
											if(data.flag == true){
												GetDataD();
											}
										}
									});
								});
							}
						}],
					onDblClickRow:function(rowIndex){
							var row = $('#gds').datagrid('getSelected');  
		                    if (row) {  
		                        var rowIndex = $('#gds').datagrid('getRowIndex', row);  
		                        $('#gds').datagrid('beginEdit', rowIndex);  
		                    }
					},
					onClickRow:function(rowIndex){
						var rows = $('#gds').datagrid('getRows');
	    	            for ( var i = 0; i < rows.length; i++) {
	    	           	 $('#gds').datagrid('endEdit', i);  
	    	       		}
					}
				});

			//月
			$('#gdsMon').datagrid({
				singleSelect: true,
				//pagination:true,
				fitColumns:false,
				rownumbers : true,
				remoteSort : false,
				sortName : 'flog',
				columns: [[
					//{ title: 'id',field: 'id',hidden: true,sortable:true, width: 100,formatter: function (value, rowData, rowIndex) {return value}}, 
					{ title: '参数', field: 'trueName',sortable:true, width: 150,formatter: function (value, rowData, rowIndex) {return value}}, 
					{ title: '时间', field: 'curve_storage_time',sortable:true, width: 150,formatter: function (value, rowData, rowIndex) {return value}}, 
					{ title: '第一天', field: 'p1',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '第二天', field: 'p2',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '第三天', field: 'p3',width: 80,editor:'text',styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '第四天', field: 'p4',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '第五天', field: 'p5',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '第六天', field: 'p6',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '第七天', field: 'p7',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '第八天', field: 'p8',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '第九天', field: 'p9',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '第十天', field: 'p10',editor:'text',width: 80},
					{ title: '第十一天', field: 'p11',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '第十二天', field: 'p12',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '第十三天', field: 'p13',width: 80,editor:'text',styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '第十四天', field: 'p14',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '第十五天', field: 'p15',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '第十六天', field: 'p16',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '第十七天', field: 'p17',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '第十八天', field: 'p18',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '第十九天', field: 'p19',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '第二十天', field: 'p20',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},
					{ title: '第二十一天', field: 'p21',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '第二十二天', field: 'p22',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '第二十三天', field: 'p23',width: 80,editor:'text',styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '第二十四天', field: 'p24',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '第二十五天', field: 'p25',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '第二十六天', field: 'p26',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '第二十七天', field: 'p27',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '第二十八天', field: 'p28',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '第二十九天', field: 'p29',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '第三十天', field: 'p30',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},
					{ title: '第三十一天', field: 'p31',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},
					{ title: '参数标示', field: 'flog',hidden: true,sortable:true, width: 250}
					]],
					onLoadSuccess:function (data){
						$('#gdsMon').datagrid('selectRow',0);
						var row=$('#gdsMon').datagrid('getRows');
						if (data.rows.length>0)
							{
								//调用mergeCellsByField()合并单元格
								mergeCellsByField("gdsMon","trueName");
					    	}  
						},
						toolbar:[{
							text:'保存',
							//iconCls:'icon-save',
							handler:function(){
								$('#gdsMon').datagrid('acceptChanges');
								//获取datagrid中所有的数据
								var rowDatas = $("#gdsMon").datagrid("getRows");
								$.each(rowDatas,function(i,item){
									//alert("I::"+item);
									//alert("id::"+item.id);
									//alert("po::"+item.point1);
									var dd = $('#gdsMon').datagrid('getSelected');
									$.ajax({
										url: "toCjsjjh.action?m=SaveRgBlMonthUpDate",
										type:"POST",
										dataType:"json",
										data:{
										//所有被选中的Id
										//点值
										"times":item.curve_storage_time,
										"p1":item.p1,"p2":item.p2,"p3":item.p3,"p4":item.p4,"p5":item.p5,"p6":item.p6,"p7":item.p7,"p8":item.p8,"p9":item.p9,"p10":item.p10,
										"p11":item.p11,"p12":item.p12,"p13":item.p13,"p14":item.p14,"p15":item.p15,"p16":item.p16,"p17":item.p17,"p18":item.p18,"p19":item.p19,"p20":item.p20,
										"p21":item.p21,"p22":item.p22,"p23":item.p23,"p24":item.p24,"p25":item.p25,"p26":item.p26,"p27":item.p27,"p28":item.p28,"p29":item.p29,"p30":item.p30,
										"p31":item.p31
										}, success: function(data){
											if(data.flag == true){
												GetDataD();
											}
										}
									});
								});
							}
						}],
					onDblClickRow:function(rowIndex){
							var row = $('#gdsMon').datagrid('getSelected');  
		                    if (row) {  
		                        var rowIndex = $('#gdsMon').datagrid('getRowIndex', row);  
		                        $('#gdsMon').datagrid('beginEdit', rowIndex);  
		                    }
					},
					onClickRow:function(rowIndex){
						var rows = $('#gdsMon').datagrid('getRows');
	    	            for ( var i = 0; i < rows.length; i++) {
	    	           	 $('#gdsMon').datagrid('endEdit', i);  
	    	       		}
					}
				});
			
			//年
			$('#gdsYear').datagrid({
				singleSelect: true,
				//pagination:true,
				fitColumns:false,
				rownumbers : true,
				remoteSort : false,
				sortName : 'flog',
				columns: [[
					//{ title: 'id',field: 'id',hidden: true,sortable:true, width: 100,formatter: function (value, rowData, rowIndex) {return value}}, 
					{ title: '参数', field: 'trueName',sortable:true, width: 150,formatter: function (value, rowData, rowIndex) {return value}}, 
					{ title: '时间', field: 'curve_storage_time',sortable:true, width: 150,formatter: function (value, rowData, rowIndex) {return value}}, 
					{ title: '第一月', field: 'p1',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '第二月', field: 'p2',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '第三月', field: 'p3',width: 80,editor:'text',styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '第四月', field: 'p4',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '第五月', field: 'p5',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '第六月', field: 'p6',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '第七月', field: 'p7',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '第八月', field: 'p8',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '第九月', field: 'p9',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '第十月', field: 'p10',editor:'text',width: 80},
					{ title: '第十一月', field: 'p11',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},{ title: '第十二月', field: 'p12',editor:'text',width: 80,styler: function (value, rowData, rowIndex) {if(value==0){return 'font-weight: bold;color:red;';}}},
					{ title: '参数标示', field: 'flog',hidden: true,sortable:true, width: 250}
					]],
					toolbar:[{
						text:'保存',
						iconCls: 'icon-ok',
						//iconCls:'icon-save',
						handler:function(){
							$('#gdsYear').datagrid('acceptChanges');
							//获取datagrid中所有的数据
							var rowDatas = $("#gdsYear").datagrid("getRows");
							$.each(rowDatas,function(i,item){
								//alert("I::"+item);
								//alert("id::"+item.id);
								//alert("po::"+item.point1);
								var dd = $('#gdsYear').datagrid('getSelected');
								$.ajax({
									url: "toCjsjjh.action?m=SaveRgBlYearUpDate",
									type:"POST",
									dataType:"json",
									data:{
									//所有被选中的Id
									//点值
									"names":item.trueName,
									"times":item.curve_storage_time,
									"p1":item.p1,"p2":item.p2,"p3":item.p3,"p4":item.p4,"p5":item.p5,"p6":item.p6,"p7":item.p7,"p8":item.p8,"p9":item.p9,"p10":item.p10,
									"p11":item.p11,"p12":item.p12
									}, success: function(data){
										if(data.flag == true){
											GetDataD();
										}
									}
								});
							});
						}
					}],
					onLoadSuccess:function (data){
						$('#gdsYear').datagrid('selectRow',0);
						var row=$('#gdsYear').datagrid('getRows');
						if (data.rows.length>0)
							{
								//调用mergeCellsByField()合并单元格
								mergeCellsByField("gdsYear","trueName");
					    	} 
						},
					onDblClickRow:function(rowIndex){
							var row = $('#gdsYear').datagrid('getSelected');  
		                    if (row) {
		                        var rowIndex = $('#gdsYear').datagrid('getRowIndex', row);  
		                        $('#gdsYear').datagrid('beginEdit', rowIndex);  
		                    }
					},
					onClickRow:function(rowIndex){
						var rows = $('#gdsYear').datagrid('getRows');
	    	            for ( var i = 0; i < rows.length; i++) {
	    	           	 $('#gdsYear').datagrid('endEdit', i);  
	    	       		}
					}
				});
			
			});
	</script>
</html>
