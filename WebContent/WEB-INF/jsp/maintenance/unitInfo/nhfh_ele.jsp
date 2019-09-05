<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type"
			content="text/html; charset=ISO-8859-1">
		<title>用电能耗负荷</title>
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

		<link href="/emcc-web/css/poms-unit/bdcss.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript">
	$(function() {

			var enetype =$('#enetype').val();
		$('#treegrid1').treegrid( {
			height:500,
			nowrap: false,
			rownumbers: true,
			animate:true,
			collapsible:true,
			url : 'consumptionLoadConfig.action?m=load_treeGrid&eneType='+enetype,
			idField:'id',
			treeField : 'id',
			frozenColumns:[[
			                {title:'ID',field:'id',width:200}
						]],
			columns : [ [
			    
			 	{field : 'pclcTerminalName',
				title : '计量表表名or编号',
				width : 150,rowspan:2
			}, {
				field : 'pclcLoopName',
				title : '计量表回路名称',
				width : 200,rowspan:2
			}, {
				field : 'pclcProductIndustry',
				title : '计量表生产厂家',
				width : 200,rowspan:2
			}, {
				field : 'pclcProductionCode',
				title : '计量表出厂编号',
				width : 150,rowspan:2
			}

			] ],
			onBeforeExpand:function(row,param){
				if (row){
					$(this).treegrid('options').url = 'consumptionLoadConfig.action?m=getChild_treeGrid&id='+row.id;
				} else {
					//$(this).treegrid('options').url = 'treegrid_data.json';
				}
			},
			onContextMenu: function(e,row){
				e.preventDefault();
				$(this).treegrid('unselectAll');
				$(this).treegrid('select', row.code);
				$('#mm').menu('show', {
					left: e.pageX,
					top: e.pageY
				});
			},onClickRow:function(row){
				document.getElementById('iframe01').src="consumptionLoadConfig.action?m=getChilds&id="+row.id;
				$('#win').window({  
				    width:600,  
				    height:300,  
				    modal:true,
				    minimizable:false,
				    collapsible:false,
				    maximizable:false,
				    draggable:false
				});  
				  
				}
	
		});
		
	});

	function append(){
		codeIndex++;
		var data = [{
			pclcTerminalName: '',
			pclcLoopName: '',
			pclcProductIndustry: '',
			pclcProductionCode: ''
		}];
		var node = $('#treegrid1').treegrid('getSelected');
		$('#treegrid1').treegrid('append', {
			parent: (node?node.code:null),
			data: data
		});
	}
	function remove(){
		var node = $('#treegrid1').treegrid('getSelected');
		if (node){
			$('#treegrid1').treegrid('remove', node.code);
		}
	}

</script>
	</head>
	<body>
	<div>
		<input id="enetype" type="hidden" value="<%=(String)request.getAttribute("eneType") %>"/>
		<table id="treegrid1" width="600px" height="470"></table>
		<div id="mm" class="easyui-menu" style="width:120px;">
			<div onclick="append()">Append</div>
			<div onclick="remove()">Remove</div>
		</div>
		
	</div> 
	<div id="win" iconCls="icon-save" title="My Window">  
	  <iframe style="height: 520px;width: 1000px;" scrolling="auto" frameborder="0" marginheight="0" id="iframe01" src=""></iframe>  
	</div>  
	</body>
</html>