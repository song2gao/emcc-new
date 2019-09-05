<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<title>系统权限管理-角色授权</title>
  	<link href="/emcc-web/css/poms-system/xtqygl_jssq.css" rel="stylesheet" type="text/css"/>
  	<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/default/easyui.css"></link>
	<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/icon.css"></link>
	<script type="text/javascript"	src="/emcc-web/js/poms-system/jquery-1.7.2.js"></script>
	<script type="text/javascript"	src="/emcc-web/js/poms-business/jquery.easyui.min.js"></script>
	<script type="text/javascript"	src="/emcc-web/js/page.js"></script>
  	<script type="text/javascript"><!--
  		$(function() {
  		var click1 = true,click2=false,click3=false;//用来判断当前停留在哪个tab页下
  		
  		//鼠标移过(按钮)
		$(".btnClass").hover(
				function() {
					if (!false)$(this).css("background","url(/emcc-web/image/poms-system/btn_2.png)");
				},
				function() {
					if (!false)$(this).css("background","url(/emcc-web/image/poms-system/btn_1.png)");
				});
		$(".delClass").hover(
				function() {
					if (!false)$(this).css("background","url(/emcc-web/image/poms-system/del_2.png)");
				},
				function() {
					if (!false)$(this).css("background","url(/emcc-web/image/poms-system/del_1.png)");
				});
		
		
		$(".liimgcss,.liimgcss").hover(function(){
				$(this).css("cursor","hand");
			});	
			
			
		 $('#libtn1').click(function btn1(){
		 	$("#libtn3").css("background","url(/emcc-web/image/poms-system/three_menuBlue.png)");
			
			$('#libtn1').css("background","url(/emcc-web/image/poms-system/three_menu.png)");
			
			$('#libtn1').addClass('liimgcss');$('#libtn1').addClass('liimgcssmoren');
			$("#libtn3").addClass("liimgcss");
			$("#libtn3").removeClass("liimgcssmoren");
			$("#libtn4").addClass("liimgcss");
			$("#libtn4").removeClass("liimgcssmoren");$("#lis_4").css("display","none");
			$("#libtn4").css("background","url(/emcc-web/image/poms-system/three_menuBlue.png)");
			
			$("#lis_1").css("display","block");$("#lis_3").css("display","none");
			click1 = true,click2=false,click3=false;
		 });	
		 
		 
		  $('#libtn3').click(function btn2(){
		 	$("#libtn1").css("background","url(/emcc-web/image/poms-system/three_menuBlue.png)");
			
			$(this).css("background","url(/emcc-web/image/poms-system/three_menu.png)");
			
			this.className = "liimgcss liimgcssmoren";
			$("#libtn1").addClass("liimgcss");
			$("#libtn1").removeClass("liimgcssmoren");
			$("#libtn4").addClass("liimgcss");
			$("#libtn4").removeClass("liimgcssmoren");$("#lis_4").css("display","none");
			$("#libtn4").css("background","url(/emcc-web/image/poms-system/three_menuBlue.png)");
			
			$("#lis_3").attr("style","display:block");
			$("#lis_1").attr("style","display:none;");
			click1 = false,click2=true,click3=false;
		 });
		 
		 $('#libtn4').click(function btn3(){
		 	$("#libtn1").css("background","url(/emcc-web/image/poms-system/three_menuBlue.png)");
			$("#libtn3").css("background","url(/emcc-web/image/poms-system/three_menuBlue.png)");
			
			$(this).css("background","url(/emcc-web/image/poms-system/three_menu.png)");
			
			this.className = "liimgcss liimgcssmoren";
			$("#libtn1").addClass("liimgcss");
			$("#libtn1").removeClass("liimgcssmoren");
			$("#libtn3").addClass("liimgcss");
			$("#libtn3").removeClass("liimgcssmoren");
			$("#lis_4").css("display","block");$("#lis_1").css("display","none");$("#lis_3").css("display","none");
			click1 = false,click2=false,click3=true;
		 });	
		
		
		
		//角色
		function GetData1(type,id) {
			$("#roleinfoTable").datagrid("loadData", []);//清空tabs内容
			
			var args = {};
			args.roleid = $("#roleid").val();
			args.type = type;
			args.id = id;
			args.pageIndex = 1;//页索引
			args.pageSize = 10;//页容量
			BingData("#roleinfoTable", args, "toRole.action?m=load_RolesTabs", null);
		}   
		
		// 数据表格：
		
		$(function() {
		//初始化table（角色管理）	
			$('#roleinfoTable').datagrid( {
				title : '角色管理',
				fitColumns : true, //自适应列的大小
				singleSelect : true,
				rownumbers: true,
				striped:true,
				columns : [ [ {
					title : '角色ID',
					field : 'rid',
					hidden : true 
				},{
					title : '角色名称',
					align : 'center',
					field : 'jueSeName',
					width : 350
				},{
					title : '角色说明',
					align : 'center',
					field : 'jueSeShuoMing',
						width : 420
				}, {
					title : '备注',
					align : 'center',
					field : 'jueSeBeiZhu',
					width : 430
				} ] ],
				onClickRow:function(){
					var row = $('#roleinfoTable').datagrid('getSelected');
					$('#rid').val(row.rid);
					$('#rnameId').val(row.jueSeName);
					$('#roleDescriptionId').val(row.jueSeShuoMing);
					$('#roleBackupsId').val(row.jueSeBeiZhu);
					$('#GlsqTree').tree('reload');
					$("#mudelinfoTable").datagrid("loadData", []);
					$("#actioninfoTable").datagrid("loadData", []);
					if(click3){
						GetDatabj();
					}
				}
				});
				GetData1();
			});
		//功能授权 Tree 的生成
		$('#GlsqTree').tree({
			url : 'toRole.action?m=load_ModelTree',
			checkbox : false,
			animate : true,
			onClick : function(node) {	//点击某个模块、加载二级子模块
				$("#actioninfoTable").datagrid("loadData", []);
				var row = $('#roleinfoTable').datagrid('getSelected');
				if(row==null){$.messager.alert("提示","请先选择一个角色再进行功能授权操作!");return false;}
				Glsq_TwoModel(node.id);
			}
		});
		
		//刷新二级模块
		function Glsq_TwoModel(id) {
			$("#mudelinfoTable").datagrid("loadData", []);//清空tabs内容
			var args = {};
			var row = $('#roleinfoTable').datagrid('getSelected');
			if(row!=null){args.roleid = row.rid;} //如果选中了角色,则按角色的模块来默认勾选
			args.id = id;
			args.pageIndex = 1;//页索引
			args.pageSize = 10;//页容量
			BingData("#mudelinfoTable", args, "toRole.action?m=load_MudelTwoTabs", null);
		}   
		
		$(function() {
		//初始化table（模块管理）	
			$('#mudelinfoTable').datagrid( {
			
				title : '模块选择',
				fitColumns : true, //自适应列的大小
				striped:true,
   				checkOnSelect: true,
				columns : [ [ { 
					title: '全选', 
					field:'mck',
					checkbox:true,
					width:100
				},{
					title : '模块ID',
					field : 'mmid',
					hidden : true 
				},{
					title : '模块名称',
					align : 'center',
					field : 'mmModuleName',
					checked:'checked',
					width : 200
				},{
					title : '模块描述',
					align : 'center',
					field : 'mmModuleDescription',
					width : 200
				}] ],
				onClickRow:function(rowIndex,rowData){//加载功能方法
					var mudrow = rowData;
					Glsq_ActionTab(mudrow.mmid,mudrow.mmModuleName);
				},onLoadSuccess:function(data){      
				   if(data){
			   		  $.each(data.rows, function(index, item){
				  		 if(item.mmck){
					  		$('#mudelinfoTable').datagrid('checkRow', index);
					  	 }
				 	  });
				 	  Glsq_ActionTab();
				   }
				}
			});
		});
		
		
		$(function() {
		//初始化table（操作管理）	
			$('#actioninfoTable').datagrid( {
				title : '功能方法',
				fitColumns : true, //自适应列的大小
				striped:true,
				columns : [ [ { 
					title: '全选', 
					field:'ack',
					checkbox:true,
					disable:true,
					width:100
				},{
					title : '方法ID',
					field : 'acid',
					hidden : true 
				},{
					title : '方法名称',
					align : 'center',
					field : 'actionName',
					checked:'checked',
					width : 100
				},{
					title : '方法说明',
					align : 'center',
					field : 'actionDescription',
					width : 150
				},{
					title : '所属模块',
					align : 'center',
					field : 'actionModuleName',
					width : 150
				},{
					title : '所属模块ID',
					align : 'center',
					hidden : true ,
					field : 'actionModuleId',
					width : 150
				}] ],onLoadSuccess:function(data){      
				   if(data){
			   		  $.each(data.rows, function(index, item){
				  		 if(item.acck){
					  		$('#actioninfoTable').datagrid('checkRow', index);
					  	 }
				 	  });
				   }
				}
			});
		});
		
		//刷新操作方法Table
		function Glsq_ActionTab(id) {
			$("#actioninfoTable").datagrid("loadData", []);
			var args = {};
			var rows = $('#mudelinfoTable').datagrid('getSelections'); //操作的集合
			if(rows!=null){//如果选中了模块
				var actionIds = "";
		    	for(var i=0;i<rows.length;i++){
		    		actionIds += rows[i].mmid;
		    		if(i<rows.length-1){actionIds += "#";}
		    	}
		    	args.mids = actionIds;
			} 
			var row = $('#roleinfoTable').datagrid('getSelected');
			if(row!=null){args.roleid = row.rid;} //如果选中了角色,则按角色的模块来默认勾选
			args.pageIndex = 1;//页索引
			args.pageSize = 10;//页容量
			BingData("#actioninfoTable", args, "toRole.action?m=load_MudelActionTabs", null);
		}   
		
		
		//删除操作
		 $('#deleteButton').click(function(){
		 	var row = $('#roleinfoTable').datagrid('getSelected');
		 	if(row==null){$.messager.alert("提示","请先选择一个角色再进行删除操作!");}
		 	else{
		 		$.messager.confirm('提示','确定要删除角色"'+row.jueSeName+'"?',function(r){  
		 			if(r){
			 			$.ajax({
				           url: "toRole.action?m=Del_Role",
				           type:"POST",dataType:"json",
				           timeout: 1000,
				           data:{
				           		"rid":row.rid
				           },
				           success: function(data){ //根据返回的值判断是否能删除
				           		if(data=="{}"){
					    			$.messager.alert("警告","删除失败!");	
								}
								else{
									GetData1();
									$.messager.alert("警告","删除成功!");	
								}
				           }
				      	 });
			      	   }
		 			});
		 		}
		 });
		
		//新增按钮的操作
		$('#addButton').click(function add(){
			btn1();
			$('#rid').val("");
			$('#rnameId').val("");
			$('#roleDescriptionId').val("");
			$('#roleBackupsId').val("");
		});
			
			
		//保存按钮的操作
		$('#saveButton').click(function(){
			var rowr = $('#roleinfoTable').datagrid('getSelected');//获取当前选择的角色
			if(click1){
				if($('#rid').val()==''){ //新增
					$.messager.confirm('提示','确定要新增角色"'+$('#rnameId').val()+'"?',function(r){ 
						if(r){
							$('#addfrm').form({  
							     url:"toRole.action?m=Add_Role",
							     dataType:"json",
							     async:false,
							    onSubmit: function(){  
							        //进行表单验证  
							        if($('#rnameId').val()=="" || $('#rnameId').val()==null){
							        	$.messager.alert("提示","角色名不能为空!");
							        	$('#rnameId').focus();
							        	return false;
							        }
							    },success:function(data){
							    	
							    	if(data=="{}"){
							    		$.messager.alert("提示","添加失败!");
									}
									else{
										$.messager.alert("提示","添加成功!");
										GetData1();	add();
										$('#addfrm').form('clear');		
									}
							    }  
							});  
							$('#addfrm').submit(); 
						}
					 });	
				}else{//修改
					$.messager.confirm('提示','确定要更新角色"'+$('#rnameId').val()+'"?',function(t){ 
						if(t){
							$('#addfrm').form({  
							    url:"toRole.action?m=Update_Role",
							    dataType:"json",
							    async:false,
							    onSubmit: function(){  
							        //进行表单验证  
							        if($('#rnameId').val()=="" || $('#rnameId').val()==null){
							        	$.messager.alert("提示","更新的角色名不能为空!");
							        	$('#rnameId').focus();
							        	return false;
							        }
							    },success:function(data){
							    	if(data=="{}"){
							    		$.messager.alert("提示","保存失败!");
									}
									else{
										$.messager.alert("提示","保存成功!");
										GetData1();	add();$('#addfrm').form('clear');			
									}
							    }  
							});  
							$('#addfrm').submit(); 
						}
					});
				}
				
			}
		    if(click2){  //保存功能授权的内容
				var rowacs = $('#actioninfoTable').datagrid('getSelections'); //操作的集合
				var rowmus = $('#mudelinfoTable').datagrid('getSelections'); //模块的集合
				var tree = $('#GlsqTree').tree('getSelected');//获取树形一级模块的ID
				if(rowacs==""){//没有选择操作,判断是否选择了模块
					if(rowmus==""){
						$.messager.alert("提示","请帮'角色'挑选相应的权限再保存!");
					}else{ //选择了模块没有选择操作
					 //拼接出模块的ID 
						var mudelIds = "";
				    	for(var i=0;i<rowmus.length;i++){
				    		mudelIds += rowmus[i].mmid;
				    		if(i<rowmus.length-1){mudelIds += "#";}
				    	}
						// 调用Ajax 添加
						$.ajax({
				           url: "toRole.action?m=Add_RoleMudelAction",
				           type:"POST",dataType:"json",
				           timeout: 1000,
				           data:{
				           		"mmpid":tree.id,
				           		"mids":mudelIds,
				           		"rid":rowr.rid
				           },
				           success: function(data){ //根据返回的值判断是否能删除
				           		if(data=="{}"){$.messager.alert("提示","保存失败!");}
								else{$.messager.alert("提示","保存成功!");}
				           }
				      	});
					}
				}else{
				    	var actionIds = "";
				    	for(var i=0;i<rowacs.length;i++){
				    		actionIds += rowacs[i].acid + "@" + rowacs[i].actionModuleId;
				    		if(i<rowacs.length-1){actionIds += "#";}
				    	}
						// 调用Ajax 添加
						$.ajax({
				           url: "toRole.action?m=Add_RoleMudelAction",
				           type:"POST",dataType:"json",
				           timeout: 1000,
				           data:{
				           		"mmpid":tree.id,
				           		"rid":rowr.rid,
				           		"acids":actionIds
				           },
				           success: function(data){ //根据返回的值判断是否能删除
				           		if(data=="{}"){$.messager.alert("提示","保存失败!");}
								else{$.messager.alert("提示","保存成功!");}
				           }
				      });
				}
			}
		    if(click3){ // 表计授权
		    	var eid = $('#qiYeidSelect').val();
				if(rowr==""){
					$.messager.alert("提示","请帮'角色'挑选相应表计再保存!");
				}else{
					var rowcas = $('#calinfoTable').datagrid('getSelections'); //表计的集合
					var mudelIds = "";
			    	for(var i=0;i<rowcas.length;i++){
			    		mudelIds += rowcas[i].cid;
			    		if(i<rowcas.length-1){mudelIds += "#";}
			    	}
			    	$.ajax({
				           url: "toRole.action?m=Add_RoleCal",
				           type:"POST",dataType:"json",
				           timeout: 1000,
				           data:{
				           		"eid":eid,
				           		"rid":rowr.rid,
				           		"rals":mudelIds
				           },
				           success: function(data){ //根据返回的值判断是否能删除
				           		if(data=="{}"){$.messager.alert("提示","保存失败!");}
								else{$.messager.alert("提示","保存成功!");}
				           }
				      });
				}
			}
			
		});
		
		// 得到企业信息的下拉
		$(function(){
			$.ajax({
	           url: "toRole.action?m=load_energyName",
	           type:"POST",dataType:"json",
	           timeout: 1000,
	           success: function(data){ //放入下拉框
	           		var list = data.elist;
	           		for(var i=0;i<list.length;i++){
	           			$('#qiYeidSelect').append("<option value='"+list[i].eid+"'>"+list[i].ename+"</option>");
	           		}
	           }
	      	 });
		});
		
		//根据选择的企业，改变表格内容
		$('#qiYeidSelect').change(function(){
			var rowr = $('#roleinfoTable').datagrid('getSelected');//获取当前选择的角色
			if(rowr==null){
				$.messager.alert("提示","请先挑选一个'角色'!");return false;
			}
			GetDatabj();
		});
		
		//表计授权
		function GetDatabj() {
			var args = {};
			args.eid = $('#qiYeidSelect').val();
			var row = $('#roleinfoTable').datagrid('getSelected');//获取当前选择的角色
			args.rid = row.rid;
			args.pageIndex = 1;//页索引
			args.pageSize = 10;//页容量
			BingData("#calinfoTable", args, "toRole.action?m=load_CalTabs", null);
		}   
		
		// 数据表格：
		
		$(function() {
		//初始化table（表计选择）	
			$('#calinfoTable').datagrid( {
				title : '表计选择',
				fitColumns : true, //自适应列的大小
				rownumbers: true,
				striped:true,
				columns : [ [ {
					title : '表计ID',
					field : 'cid',
					hidden : true 
				},{
					title : '全选',
					align : 'center',
					field : 'cchecked',
					checkbox: true,
					width : 300
				},{
					title : '表记编号',
					align : 'center',
					field : 'ccode',
					width : 300
				},{
					title : '回路名称',
					align : 'center',
					field : 'cname',
					width : 400
				}, {
					title : '备注',
					align : 'center',
					field : 'cbackup',
					width : 430
				} ] ],onLoadSuccess:function(data){      
						   if(data){
					   		  $.each(data.rows, function(index, item){
						  		 if(item.cchecked){
							  		$('#calinfoTable').datagrid('checkRow', index);
							  	 }
						 	  });
						 	  Glsq_ActionTab();
						   }
						}
				 });
			});
	});
  	</script>
  </head>
  
  <body>
    <div id="main" class="xtqygl_main" style=" margin-top: 5px; width: 100%;">
    	<div id="top_div">
			<div id="top_div_one" class="jssq_top_one" align="right" style="width: 100%;">
					<input type="button" value="保存" class="btnClass" id="saveButton" onmouseover="this.style.color='white'" onmouseout="this.style.color='black'" style="cursor: pointer;"/>
					<input type="button" value="新增" class="btnClass" id="addButton" onmouseover="this.style.color='white'" onmouseout="this.style.color='black'" style="cursor: pointer;"/>
					<input type="button" value="删除" class="delClass" id="deleteButton" onmouseover="this.style.color='white'" onmouseout="this.style.color='black'" style="cursor: pointer;"/>
			</div>
			<div id="top_div_two" class="jssq_top_two">
				<table id="roleinfoTable" style="height: 200px;">
				</table>
			</div>
		</div>
		<div id="bto_div" class="">
			<ul class="ulcss" id="tab">
			<li class="licss limov"><input type="button" value="基本信息" id="libtn1" class="liimgcss liimgcssmoren"/></li>
			<li class="licss limov"><input type="button" value="功能授权" id="libtn3" class="liimgcss"/></li>
			<li class="licss limov"><input type="button" value="表计授权" id="libtn4" class="liimgcss"/></li>
			</ul>
			<div id="lis_1" style="display:block;" class="jbxxDiv_css">
				<form id="addfrm" method="post" style="border:1px solid #ffffff; width:900px; height:300px;" >
				<table width="900" height="220" style="margin-left: 30px;margin-top: 30px; ">
					<tr>
						<td align="left"><font class="font_cg">角色名称: </font></td>
						<td align="left">
							<input id="rnameId" name="roleName" value="" class="easyui-validatebox"/>
							<font color="red">*</font>
							<input type="hidden" name="id" id="rid"/>
						</td>
					</tr>
					<tr>
						<td align="left"><font class="font_cg">角色说明: </font></td>
						<td align="left" colspan="3">
							<textarea id="roleDescriptionId" rows="3" cols="60" name="roleDescription"></textarea>
						</td>
					</tr>
					<tr>
						<td align="left"><font class="font_cg">备注: </font></td>
						<td align="left" colspan="3">
							<textarea id="roleBackupsId" rows="3" cols="60" name="roleBackups"></textarea>
						</td>
					</tr>
				</table>
				</form>
			</div>
			
			<div id="lis_3" style="display:none;">
				<div class="mksq_left">
					<ul class="easyui-tree" style="margin-left: 10px;margin-top: 10px;" id="GlsqTree">
					</ul>
				</div>
				<div class="mksq_right">
					<div style="float: left;" id="modeldivId">
						<table id="mudelinfoTable" style="height: 242px;width: 480px;">
						</table>
					</div>
					<div style="float: left;">
						<table id="actioninfoTable" style="height: 242px;width: 520px;">
						</table>
					</div>
				</div>
			</div>
			<div id="lis_4" style="display:none">
				<select id="qiYeidSelect" name="energy" style="width: 155px;">
					<option value="-1">-- 请选择企业 --</option>					
  	 			</select><br/>
  	 			<table id="calinfoTable" style="height: 220px;width: 1280px;">
				</table>
			</div>
		</div>
	</div>
  </body>
</html>
