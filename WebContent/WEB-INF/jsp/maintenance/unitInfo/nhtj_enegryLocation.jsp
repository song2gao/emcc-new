<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>用能单位维护-能耗统计配置-用能位置</title>
		<link href="/emcc-web/css/poms-unit/nhtjpz.css" rel="stylesheet" type="text/css" />
		<link href="/emcc-web/css/poms-system/xtqygl_jssq.css" rel="stylesheet" type="text/css"/>
		<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/default/easyui.css"></link>
		<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/icon.css"></link>
		<script type="text/javascript"	src="/emcc-web/js/poms-system/jquery-1.7.2.js"></script>
		<script type="text/javascript"	src="/emcc-web/js/poms-business/jquery.easyui.min.js"></script>
		<script type="text/javascript"	src="/emcc-web/js/page.js"></script>

<script type="text/javascript">
	
	// Tree
	$(function() {  //加载数据
		InitTreeData();
	});

	function InitTreeData() {
		$('#MyTree').tree({
			url : 'Terminal.action?m=load_ynxtTree',
			checkbox : false,
			animate : true,
			onBeforeExpand : function(node) {
				$('#MyTree').tree('options').url = 'Terminal.action?m=loadTreechild_ynwz&id='+node.id+"&type="+node.attributes.type;
			},
			onClick : function(node) {	
				GetData1(node.attributes.type, node.id);
			}
		});
	}
	
	function GetData1(type,id) {
			$("#tabs_con").datagrid("loadData", []);//清空tabs内容
			var args = {};
			if(type==1){
				args.eid = id;
			}
			else{
				args.pid = id;
			}
			args.pageIndex = 1;//页索引
			args.pageSize = 5;//页容量
			BingData("#tabs_con", args, "Terminal.action?m=load_YnwzTabs", null);
	}   

	// Tabs      
	$(function() {
		//初始化table（用户管理）	
		$('#tabs_con').datagrid( {
			fitColumns : true, //自适应列的大小
			singleSelect : true,
			striped:true,
			pageList:[5,10,15],
			columns : [ [ {
				title : '用能位置名称',
				field : 'eulName',
				align : 'center',
				width : 100
			}, {
				title : 'ID',
				field : 'eulId',
				align : 'center',
				hidden : true 
			},{
				title : '树节点顺序',
				field : 'eulOrder',
				align : 'center',
				width : 100
			},{
				title : '关联表计',
				field : 'eulBiaoJi',
				align : 'center',
				width : 200
			}, {
				title : '备注',
				field : 'eulBackups',
				align : 'center',
				width : 100
			}] ],
				pagination : true,
				onClickRow:function(){  //查询出点击的对象。并把查出的信息放如文本框
					var row = $('#tabs_con').datagrid('getSelected');
					$('#eename').val(row.eulEnergyName);
					$('#eeid').val(row.eulEnergyId);
					$('#epname').val(row.eulParentName);
					$('#epid').val(row.eulParentId);
					$('#ename').val(row.eulName);
					$('#eorder').val(row.eulOrder);
					$('#ebackups').val(row.eulBackups);
					$('#ebiaoji').val(row.eulBiaoJi);
					$('#emj').val(row.eulHoldArea);
					$('#ers').val(row.eulHoldPersons);
					$('#eid').val(row.eulId);
					$('#ebiaojiId').val(row.eulBiaoJiId);
				}			
		});
		GetData1();
	});
$(function() {
	//删除操作
	$('#deleteButton').click(function(){
		var row = $('#tabs_con').datagrid('getSelected');
		if(row==null){
			$.messager.alert("提示","选择一个用能位置再进行删除操作!");return false;
		}
		$.messager.confirm('提示','确定要删除"'+row.eulName+'"?',function(t){ 
			if(t){
				$.ajax({
		           url: "Terminal.action?m=Del_UsingLocation",
		           type:"POST",dataType:"json",
		           timeout: 1000,
		           data:{
		           		"eulid":row.eulId
		           },
		           success: function(data){ //根据返回的值判断是否能删除
		           		if(data=="{}"){
			    			$.messager.alert("警告","删除失败!");$('#sysfrom').form('clear');
						}
						else{
							GetData1();
							$.messager.alert("警告","删除成功!");$('#sysfrom').form('clear');
						}
		           }
		      	});
			}
		});
	});
	
	//保存
	$('#saveButton').click(function(){
		var tree = $('#MyTree').tree('getSelected');
		var row = $('#tabs_con').datagrid('getSelected');
		if(tree==null && row==null){$.messager.alert("提示","请选择一个用能系统进行增加或更新再保存");return false;}
		if(row==null && $('#eename').val()=="" || $('#eename').val()==null){
			$.messager.alert("提示","点击新增再进行保存操作");return false;
		}
		
		$.messager.confirm('提示','确定要更新"'+$('#ename').val()+'"?',function(t){ 
			if(t){
				$('#sysfrom').form({  
				    url:"Terminal.action?m=UpdateOrSave_Location",
				    dataType:"json",
				    async:false,
				    onSubmit: function(){  
				        //进行表单验证  
				        if($('#ename').val()=="" || $('#ename').val()==null){
				        	$.messager.alert("提示","更新的名称不能为空!");
				        	$('#ename').focus();
				        	return false;
				        }
				    },success:function(data){
				    	if(data=="{}"){
				    		$.messager.alert("提示","保存失败!");
						}
						else{
							$.messager.alert("提示","保存成功!");
							GetData1();InitTreeData();
							$('#sysfrom').form('clear');			
						}
				    }  
				});  
				$('#sysfrom').submit(); 
			}
		});
	});
	
	//新增
	$('#addButton').click(function(){
		var tree = $('#MyTree').tree('getSelected');
		if(tree==null){$.messager.alert("提示","请先在左侧的树型图选择一个父节点!");return false;}
		$('#sysfrom').form('clear');
		if(tree.attributes.type==1){
			$('#eename').val(tree.text);
			$('#eeid').val(tree.id);
			$('#epname').val("无父节点");
			$('#epid').val("0");
		}else{
			$('#eename').val(tree.attributes.ename);
			$('#eeid').val(tree.attributes.eid);
			$('#epname').val(tree.text);
			$('#epid').val(tree.id);
		}
	});
	
	
		//弹出表计选择的Div
$('.BJClass').click(function(){
	
		if($('#eename').val()=="" || $('#eename').val()==null){
			$.messager.alert("提示","必须是新增或者更新时才能做表计选择操作!");return false;
		}
		$('.BJClass').focusout();
		$('#BJDiv').show();
		$('#BiaoJiTab').datagrid( {
			fitColumns : true, //自适应列的大小
			striped:true,
			checkOnSelect: true,
			pagination:true,
			modal:true,
			draggable:true,
			columns : [ [ {
				title : '全选',
				field : 'ck',
				align : 'center',
				checkbox:true,
				width : 100
			},{
				title : '计量终端回路名称',
				field : 'cdtName',
				align : 'center',
				width : 100
			},{
				title : '计量终端编号',
				field : 'cdtName',
				align : 'center',
				width : 100
			},{
				title : '一类数据(FN)',
				field : 'cdtFN',
				align : 'center',
				width : 100
			},{
				title : '计量终端状态',
				field : 'cdtZhuangTai',
				align : 'center',
				width : 100,
				formatter: function (value, rowData, rowIndex){
					 if (value==0) {return "新增";} 
					 else if(value=="1"){return "测试";}
					 else if(value=="2"){return "测通";}
					 else if(value=="3"){return "正常";}
					 else if(value=="4"){return "停用";}
				}
			},{
				title : '虚/实终端',
				field : 'cdtXuShi',
				align : 'center',
				width : 50,
				formatter: function(value, rowData, rowIndex){
					if(value==0){return "实";}
					else if(value==1){return "虚";} 
				}
			},{
				title : 'ID',
				field : 'cdtId',
				hidden : true ,
				width : 100
			} ] ],onLoadSuccess:function(data){      
				   if(data){
			   		  $.each(data.rows, function(index, item){
				  		 if(item.cdtchecked){
					  		$('#BiaoJiTab').datagrid('checkRow', index);
					  	 }
				 	  });
				   }
				}
		});
		
		GetData2();
		
		function GetData2(type,id) {
			$("#BiaoJiTab").datagrid("loadData", []);//清空tabs内容
			var args = {};
			if($('#eid').val()!=""){args.id=$('#eid').val();}
			args.eid=$('#eeid').val();
			args.type=2;  //用能系统的类型
			args.pageIndex = 1;//页索引
			args.pageSize = 10;//页容量
			BingData("#BiaoJiTab", args, "Terminal.action?m=load_BiaoJiTabs", null);
		}   	
		
		//显示窗口
		$('#BJDiv').dialog({ 
		   	 	modal:true,
		   	 	draggable:false,
		   	 	buttons: [{
					text: '确定',
						handler: function() {
							var rows = $('#BiaoJiTab').datagrid('getSelections');
							var biaojis = "";
							var biaoji = "";
					    	for(var i=0;i<rows.length;i++){
					    		biaojis += rows[i].cdtId;
					    		biaoji += rows[i].cdtName;
					    		if(i<rows.length-1){biaojis += "#";}
					    		if(i<rows.length-1){biaoji += ",";}
					    	}
					    	
					    	$('#ebiaoji').val(biaoji);
					    	$('#ebiaojiId').val(biaojis);
					    	$('#BJDiv').dialog('close');
						}
					},{
					text: '取消',
						handler: function() {
							$('#BJDiv').dialog('close');
						}
					}
				] 
			});
	});
	
	
	$(".BJClass,.BJClass").hover(function(){
		$(this).css("cursor","hand");
	});
	
});
</script>
	</head>

	<body>
		<div id="main" class="nhtjpz_main">
			<div id="ynxt_left">
				<ul class="easyui-tree" style="margin-left: 3px;margin-top: 3px;" id="MyTree">
				</ul>
			</div>
			<div id="ynxt_right_main">
				<div class="ynxt_right_top" align="right">&nbsp; 
					<input align="right" type="button" value="保存" class="btnClass" id="saveButton"/>
					<input align="right" type="button" value="新增" class="btnClass" id="addButton"/>
					<input align="right" type="button" value="删除" class="delClass" id="deleteButton"/>
				</div>
				<div class="ynxt_right_center">
					<table id="tabs_con" style="height: 200px;">
					</table>
				</div>
				<div style="height: 8px;margin-left: -40px;" align="left">
					<ul><li class="licss limov"><input type="button" value="用能位置信息" id="libtn1" class="liimgcss liimgcssmoren"/></ul>
				</div>
				<div class="ynxt_right_bottom">
				<form id="sysfrom" action="" method="post">
					<table style="width: 800px;margin-left: 20px;margin-top: 10px;">
						<tr>
							<td><font  class="font_cg">企业名称：</font></td>
							<td>
								<input disabled="disabled" id="eename" name="eusEnergyName"/>
								<input id="eeid" name="eusEnergyId" type="hidden"/>
							</td>
							<td><font  class="font_cg">父节点名称：</font></td>
							<td>
								<input disabled="disabled" id="epname" name="eusParentName"/>
								<input id="epid" name="eusParentId" type="hidden"/>
							</td>
						</tr>
						<tr>
							<td><font  class="font_cg">位置名称：</font></td>
							<td><input id="ename" name="eusName"/></td>
							<td><font  class="font_cg">面积：</font></td>
							<td><input id="emj" name="eusMianJi"/></td>
						</tr>
						<tr>
							<td><font  class="font_cg">树节点顺序：</font></td>
							<td><input id="eorder" name="eusOrder"/></td>
							<td><font  class="font_cg">人数：</font></td>
							<td><input id="ers" name="eusRenShu"/></td>
						</tr>
						<tr>
							<td><font  class="font_cg">关联表计：</font></td>
							<td colspan="3">
								<input id="ebiaoji" name="eBiaoJi" class="BJClass"/>
								<input id="ebiaojiId" name="eBiaoJiId" type="hidden"/>	
							</td>
						</tr>
						<tr>
							<td><font  class="font_cg">备注：</font></td>
							<td colspan="3">
								<input id="" name="ustype" type="hidden" value="2"/>
								<input id="eid" name="eusId" value="" type="hidden"/>
								<textarea id="ebackups" name="eusBackups" rows="3" cols="35"></textarea>
							</td> 
						</tr>
					</table>
				  </form>
				</div>
				<div id="BJDiv" title="表计选择"  style="width:820px;height:380px;display: none;">
					<table id="BiaoJiTab"></table>
				</div>
			</div>
		</div>
	</body>
</html>
