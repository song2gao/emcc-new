<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>实时数据监视</title>
		<link href="/emcc-web/css/poms-unit/bdcss.css" rel="stylesheet"
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
		<script type="text/javascript" src="/emcc-web/js/tochart.js"></script>
		<script language="JavaScript"
			src="/emcc-web/component/FusionCharts/FusionCharts.js"></script>
		<script type="text/javascript" src="/emcc-web/js/jzdd.js"></script>
	</head>

	<body>
		<div id="main" style="padding: 0px; width: 100%">
			<div id="ssjs_left" style="width: 20%">
				<div class="yhgltreeDiv" align="left">
					<ul class="easyui-tree" style="margin-left: 3px" id="MyTree"></ul>
				</div>
			</div>

			<div align="left" id="ssjs_right" style="width: 78%;">
				<div id="ssjs_right_top" style="width: 100%;">
					<!-- 表头 -->
					<table class="ybfont" border="0">
						<tr>
							<td colspan="3">
								<font style="font-size: 13px;">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
									<img src="/emcc-web/image/poms-monitor/TabLook.png" />
								</font>
							</td>
							<td>&emsp;&emsp;&emsp;&emsp;&emsp;
								<span id="promptA">请选择一个计量终端</span>&emsp;&emsp;&emsp;
								<span id="promptStatu" style="color: red"></span>			<!-- 状态 -->	<br/><br/>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
								<span id="promptAttr" style="font-size: 12px;"></span>		<!-- 表计中属性 -->
							</td>
							<td style="font-size: 12px;">&emsp;&emsp;&emsp;&emsp;
								<!-- 最大值最小值 --><span id="textTitle"></span>		<span id="AttrValues"></span>
								<span id="values"></span><br/>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
								<span id="MaxText" style="color: red"></span><span id="MaxValue" style="color: red"></span>
								<span id="MinText" style="color: red"></span><span id="MinValue" style="color: red"></span>
							</td>
						</tr>
					</table>
				</div>
				<!-- 重新做 -->
				<!-- 实时刷新表 -->
				<table id="gdss" class="easyui-datagrid" style="width:1100px;height:250px"
					toolbar="#toolbar"  rownumbers="true" fitColumns="true" singleSelect="true">
				</table>
			</div>
		</div>


		<script type="text/javascript">
		  var flag;
		  var sjq="";
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
				        	document.getElementById('promptA').innerText=""	//清空
				        	document.getElementById('promptStatu').innerText=""	//清空
				        	document.getElementById('promptAttr').innerText=""	//清空
					        GetDatass()
					    	document.getElementById('promptA').innerText=node.text;
					    	findCollect()	//显示单个表计的xinxi
					        go();
				        }
				    });
				}
		  	});
		function goTitle(){
			sjq = setInterval("getTitle()", 10000);
		}
		function go(){
			sjq = setInterval("GetDatass()", 30000);
		}
		//电表图旁数据展示
		function GetDatass(){
			var args={};
			var rowData =$("#MyTree").tree("getSelected"); 
			var bFlag="jkl";
			var id = rowData.id;
			var Flog='ceshi';
			BingData("#gdss",args,"toFailureReco.action?m=togetQzjData&id="+id+"&Flog="+Flog,null);
		}
		$(function(){
			//初始化table	
			$('#gdss').datagrid({
			fitColumns: false, //自适应列的大小
			singleSelect: true,
			pagination:false,
			height:435,
			columns: [[
			{ title: '计量回路名称', width: 200, field: 'sb',formatter: function (value, rowData, rowIndex) {return value}}, 
			{ title: '所属单位',  width: 150,  field: 'sc',formatter: function (value, rowData, rowIndex)  {return value}},
			{ title: '属性', width: 300, field: 'sa',formatter: function (value, rowData, rowIndex) {return value}},
			{ title: '属性值', width: 200, field: 'da',formatter: function (value, rowData, rowIndex) {return value}}
			]],
			//单击选中，显示下方信息
			onSelect:function(rowIndex, rowData){
					//触发表头
					var domm = $('#gdss').datagrid('getSelected');
					document.getElementById('promptAttr').innerText=rowData.sb+"---"+rowData.sd;
					document.getElementById('textTitle').innerText="截止当前为止,";
					var valuesd = rowData.da;
					document.getElementById('AttrValues').innerText = rowData.sa+":";
					document.getElementById('values').innerText = Math.round(valuesd*100)/100;
					goTitle();
				}
			}); 
		});
	  	function GetData(node){
			var args={};
			var node =$("#MyTree").tree("getSelected"); 
			var ss = node.id;
			args.ss = ss;
			args.pageIndex=1;//页索引
			args.pageSize=5;//页容量为5
			BingData("#gd",args,"toFailureReco.action?m=tofindJliangTab",null);
		}
		
		function findCollect(){
			var rowData =$("#MyTree").tree("getSelected"); 
			var id = rowData.id;
			var fog="One Tab";
			$.ajax({
				url: "toMeaTermon.action?m=toRequestMearTeronQ&id="+id+"&fog="+fog,
				type:"POST",
				dataType:"json",
				success: function(data){
					if(data.tade.sa=="fog"){
			    		document.getElementById('promptStatu').innerText=data.keys.cdtBackups;
					}else{
						return;
					}
				}
			});
		}

		function getTitle(){
			//从后台获取数赋值到表头
			var rowData =$("#MyTree").tree("getSelected"); 
			var values = document.getElementById('values').innerText;
			var value = values.substring(0,values.indexOf(".") + 3);
			var MaxValue = document.getElementById('MaxValue').innerText;
			var MinValue = document.getElementById('MinValue').innerText;
			$.ajax({
				type: 'POST',
				async: false,
				dataType:"json",
				data:{
					"bId":rowData.id,
					"value":value,
					"MaxValue":MaxValue,
					"MinValue":MinValue
	         	},
				url:"toFailureReco.action?m=getRTTitle",
				success: function(data){
	         			document.getElementById('MaxText').innerText="最大值:";
	         			document.getElementById('MaxValue').innerText=data.dom.da;
	         			document.getElementById('MinText').innerText="最小值:";
						document.getElementById('MinValue').innerText=data.dom.db;
					}
				});
			}
		
	</script>
	</body>
</html>