<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<title>系统权限管理-模块管理</title>
  	<link href="/emcc-web/css/poms-system/xtqygl_jssq.css" rel="stylesheet" type="text/css"/>
  	<link href=/emcc-web/css/poms-system/xtqygl.css rel="stylesheet" type="text/css"/>
  	<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/default/easyui.css"></link>
	<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/icon.css"></link>
	<script type="text/javascript"	src="/emcc-web/js/poms-system/jquery-1.7.2.js"></script>
	<script type="text/javascript"	src="/emcc-web/js/poms-business/jquery.easyui.min.js"></script>
	<script type="text/javascript"	src="/emcc-web/js/page.js"></script>
  	<script type="text/javascript">
  		$(function() {
			function InitTreeData() {
				$('#MyTree').tree({
					url : 'toMudel.action?m=load_mkgl_tree',
					checkbox : false,
					animate : true,
					onBeforeExpand : function(node) {
					var array =node.attributes;
						//alert(array.mmCode);
						$('#MyTree').tree('options').url = 'toMudel.action?m=load_mkgl_tree&modulecode='+ array.mmCode;
					},onClick : function(node) {
						var array =node.attributes;	
						GetData1(array.mmCode);
						//alert($('#MyTree').tree('getRoot').attributes.mmCode);
				
					}
					/**
					,onLoadSuccess:function(node, data){
						var code =$('#MyTree').tree('getRoot').attributes.mmCode
						GetData1(code);
					}
					**/
				});
			}
			// Tree
			$(function() {  //加载数据
				InitTreeData();
					//var code =$('#MyTree').tree('getRoot').attributes.mmCode
			
			});
			
			// 数据表格：
			$(function() {
			//初始化table（模块管理）	
				$('#mudelinfoTable').datagrid( {
					title : '模块管理',
					fitColumns : true, //自适应列的大小
					singleSelect : true,
					rownumbers: true,
					striped:true,
					pagination : true,	
					pageList:[5,10,15],
					columns : [ [ {
						title : '模块ID',
						field : 'mid',
						hidden : true 
					},{
						title : '模块名称',
						align : 'center',
						field : 'mname',
						width : 200
					},{
						title : '模块编码',
						align : 'center',
						field : 'mcode',
						width : 200
					},{
						title : '模块说明',
						align : 'center',
						field : 'morders',
						width : 350
					}, {
						title : '排序',
						align : 'center',
						field : 'mbackup',
						width : 200
					} ] ],
						onClickRow:function(){
							var row = $('#mudelinfoTable').datagrid('getSelected');
							//alert(row.mid);
							$.ajax({
					           url: "toMudel.action?m=load_OneMudel",
					           type:"POST",dataType:"json",
					           timeout: 1000,
					           data:{
					           		"mid":row.mid
					           },
					           success: function(data){ //根据返回的值判断是否能删除
					           		var md = data.modul;
					           		$('#mid').val(md.id);
					           		$('#pmid').val(md.parentMmId);
					           		$('#pmnameid').val(data.pname);
					           		$('#morders').val(md.mmModuleDescription);
					           		$('#mbackups').val(md.mmModuleBackups);
					           		$('#murl').val(md.mmModuleUrl);
					           		$('#mname').val(md.mmModuleName);
					           		$('#mcode').val(md.mmModuleCode);
					           		$('#mproname').val(data.test);
					           		$('#mpronamehid').val(md.mmModuleProperty);
					           }
					        });
					        GetData2();
					     }
					});
					GetData1('null');
				});
			
			// 数据表格：
			$(function() {
			//初始化table(功能注册)	
				$('#actioninfoTable').datagrid( {
					title : '功能注册',
					fitColumns : true, //自适应列的大小
					rownumbers: true,
					striped:true,
					columns : [ [ {
						title : '操作ID',
						field : 'aid',
						hidden : true 
					},{
						title : '全选',
						align : 'center',
						field : 'ck',
						checkbox:true,
						width : 200
					},{
						title : '操作码',
						align : 'center',
						field : 'afieldOne',
						width : 200
					},{
						title : '操作名称',
						align : 'center',
						field : 'aname',
						width : 200
					}, {
						title : '操作描述',
						align : 'center',
						field : 'adescription',
						width : 300
					} ] ],onLoadSuccess:function(data){                
						if(data){
							$.each(data.rows, function(index, item){
								if(item.checked){
									$('#actioninfoTable').datagrid('checkRow', index);
								}
							});
						}
					}               
	 			});
			});
			
  	  		
  		var click1 = true,click2=false;//用来判断当前停留在哪个tab页下
  		
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
			
		/**
		 $('#libtn1').click(function btn1(){
			$(this).css("background","url(/emcc-web/image/poms-system/three_menu.png)");
			this.className = "liimgcss liimgcssmoren";
			$("#libtn4").addClass("liimgcss");
			$("#libtn4").removeClass("liimgcssmoren");
			$("#libtn4").css("background","url(/emcc-web/image/poms-system/three_menuBlue.png)");
			$("#lis_1").attr("style","display:block;");$("#lis_4").attr("style","display:none");
			click1 = true,click2=false;
		 });	
		 
		 $('#libtn4').click(function btn3(){
		 	$("#libtn1").css("background","url(/emcc-web/image/poms-system/three_menuBlue.png)");
			$(this).css("background","url(/emcc-web/image/poms-system/three_menu.png)");
			this.className = "liimgcss liimgcssmoren";
			$("#libtn1").addClass("liimgcss");
			$("#libtn1").removeClass("liimgcssmoren");
			$("#lis_4").attr("style","display:block;");$("#lis_1").attr("style","display:none");
			click1 = false,click2=true; GetData2();
		 });	
		**/
		 $('#libtn1').click(function btn1(){
				$(this).css("background","url(/emcc-web/image/poms-system/three_menu.png)");
				this.className = "liimgcss liimgcssmoren";
				$("#libtn4").addClass("liimgcss");
				$("#libtn4").removeClass("liimgcssmoren");
				$("#libtn4").css("background","url(/emcc-web/image/poms-system/three_menuBlue.png)");
				$("#lis_1").attr("style","display:block;height:240px;");$("#lis_4").attr("style","display:none");
				click1 = true,click2=false;
			 });	
			 
			 $('#libtn4').click(function btn3(){
			 	$("#libtn1").css("background","url(/emcc-web/image/poms-system/three_menuBlue.png)");
				$(this).css("background","url(/emcc-web/image/poms-system/three_menu.png)");
				this.className = "liimgcss liimgcssmoren";
				$("#libtn1").addClass("liimgcss");
				$("#libtn1").removeClass("liimgcssmoren");
				$("#lis_4").attr("style","display:block;");$("#lis_1").attr("style","display:none");
				click1 = false,click2=true; GetData2();
			 });
		
		//模块管理
		function GetData1(code) {
			$("#mudelinfoTable").datagrid("loadData", []);//清空tabs内容
			var args = {};
			args.roleid = $("#roleid").val();
			args.code = code;
			args.pageIndex = 1;//页索引
			args.pageSize = 5;//页容量
			BingData("#mudelinfoTable", args, "toMudel.action?m=load_mkgl_ByParentCode", null);
		}   
		
	
	
		//功能注册
		function GetData2() {
			$("#actioninfoTable").datagrid("loadData", []);//清空tabs内容
			var row = $('#mudelinfoTable').datagrid('getSelected');
			//var node =$("#MyTree").tree("getSelected"); //当前选中节点
			var args = {};
			if(row!=null){args.mid=row.mid;}
			args.eid = $('#actioninfoTable').val();
			args.pageIndex = 1;//页索引
			args.pageSize = 5;//页容量
			BingData("#actioninfoTable", args, "toMudel.action?m=load_actions", null);
		}   
		

		//删除操作
		 $('#deleteButton').click(function(){
		 	var row = $('#mudelinfoTable').datagrid('getSelected');
		 	 //var node =$("#MyTree").tree("getSelected"); //当前选中节点
		 	if(row==null){$.messager.alert("提示","请先选择一个模块再进行删除操作!",'question');}
		 	else{
		 		//首先判断该模块是否为父模块,是的话则不能删除
		 		$.ajax({
			           url: "toMudel.action?m=TestDelMudel",
			           type:"POST",dataType:"json",
			           timeout: 1000,
			           data:{
			           		"mcode":row.mcode
			           },
			           success: function(data){ //根据返回的值判断是否能删除
			           		var test = data.test;
			           		if(test==0){
			           			$.messager.alert("提示","该模块为父模块不能删除!");
			           		}else{
				           		$.messager.confirm('提示','确定要删除模块"'+row.mname+'"?',function(r){  
						 			if(r){
							 			$.ajax({
								           url: "toMudel.action?m=DelMudel",
								           type:"POST",dataType:"json",
								           timeout: 1000,
								           data:{
								           		"mid":row.mid
								           },
								           success: function(data){ //根据返回的值判断是否能删除
								           		if(data=="{}"){
									    			$.messager.alert("警告","删除失败!");	
												}
												else{
													//GetData1();
													$.messager.alert("警告","删除成功!","info",function(){
														$('#addfrm').form('clear');

														InitTreeData();
														var node =$("#MyTree").tree("getSelected"); //当前选中节点
														GetData1(node.attributes.mmCode);	
														});
												}
								           }
								      	 });
							      	  }
						 		});
						 	}
			           }
			    });
		 	}
		 });
		
		//新增按钮的操作
		$('#addButton').click(function add(){
			var row = $('#mudelinfoTable').datagrid('getSelected');
			// var node =$("#MyTree").tree("getSelected"); //当前选中节点
			//btn1();
			$("#libtn1").removeClass("liimgcss");
			$("#libtn1").addClass("liimgcssmoren");

			$("#libtn4").removeClass("liimgcssmoren");
			$("#libtn4").addClass("liimgcss");
			
			$("#libtn4").css("background","url(/emcc-web/image/poms-system/three_menuBlue.png)");
			$("#libtn1").css("background","url(/emcc-web/image/poms-system/three_menu.png)");
			$("#lis_1").attr("style","display:block;height:240px;");$("#lis_4").attr("style","display:none");
			click1 = true,click2=false;
			
			$('#addfrm').form('clear');
			if(row==null){
				//$.messager.alert("提示","请先选择一个模块做为父模块再进行新增操作!");return false;
					$('#pmnameid').val('--');
				}else{
					$('#pmnameid').val(row.mname);
					$('#pmid').val(row.mcode);
					$.ajax({
				           url: "toMudel.action?m=load_OneMudel",
				           type:"POST",dataType:"json",
				           timeout: 1000,
				           data:{
				           		"mid":row.mid
				           },
				           success: function(data){ //根据返回的值判断是否能删除
				           		var md = data.modul;
				           		$('#mpronamehid').val(md.mmModuleProperty);
				           }
				        });
					}
			
		});
			
			
		//保存按钮的操作
		$('#saveButton').click(function(){
			//alert($('#mid').val());
			if(click1){
				if($('#mid').val()==''){ //新增
					$.messager.confirm('提示','确定要新增模块"'+$('#mname').val()+'"?',function(r){ 
						if(r){
							$('#addfrm').form({  
							     url:"toMudel.action?m=AddMudel",
							     dataType:"json",
							     async:false,
							     onSubmit: function(){  
							        //进行表单验证  
							        if($('#mname').val()=="" || $('#mname').val()==null){
							        	$.messager.alert("提示","模块名称不能为空!");
							        	$('#mname').focus();
							        	return false;
							        }
							        if($('#mcode').val()=="" || $('#mcode').val()==null){
							        	$.messager.alert("提示","模块编号不能为空!");
							        	$('#mcode').focus();
							        	return false;
							        }
							        if(isNaN($('#mbackups').val())){
							        	alert("模块排序只允许输入数字！");
							        	return false;
								    }
							    },success:function(data){
							    	if(data=="{}"){
							    		$.messager.alert("提示","添加失败!");$('#addfrm').form('clear');	
									}
									else{
										$.messager.alert("提示","添加成功!","info",function(){
											$('#addfrm').form('clear');

											InitTreeData();
											GetData1('null');	
											});
									}
							    }  
							});  
							$('#addfrm').submit(); 
						}
					 });	
				}else{
				$.messager.confirm('提示','确定要更新模块"'+$('#mname').val()+'"?',function(t){ 
						if(t){
							$('#addfrm').form({  
							   url:"toMudel.action?m=UpdateMudel",
							    dataType:"json",
							    async:false,
							    onSubmit: function(){  
							        //进行表单验证  
							        if($('#mname').val()=="" || $('#mname').val()==null){
							        	$.messager.alert("提示","模块名称不能为空!");
							        	$('#mname').focus();
							        	return false;
							        }
							        if($('#mcode').val()=="" || $('#mcode').val()==null){
							        	$.messager.alert("提示","模块编号不能为空!");
							        	$('#mcode').focus();
							        	return false;
							        }
							        if(isNaN($('#mbackups').val())){
							        	alert("模块排序只允许输入数字！");
							        	return false;
								    }
							    },success:function(data){
							    	if(data=="{}"){
							    		$.messager.alert("提示","保存失败!");$('#addfrm').form('clear');	
									}
									else{
										$.messager.alert("提示","保存成功!");$('#addfrm').form('clear');	
										//GetData1();	
									}
							    }  
							});  
							$('#addfrm').submit(); 
						}
					});
				}
				
			}
		    if(click2){ //保存模块与某个操作的关系
		    	var rows = $('#actioninfoTable').datagrid('getSelections'); //操作的集合
		    	var rowm = $('#mudelinfoTable').datagrid('getSelected');  //模块的ID
		    	//var node =$("#MyTree").tree("getSelected"); //当前选中节点
		    	var actionIds = "";
		    	for(var i=0;i<rows.length;i++){
		    		actionIds += rows[i].aid;
		    		if(i<rows.length-1){actionIds += "#";}
		    	}
		    	$.messager.confirm('提示','确定要保存模块"'+rowm.mname+'"的操作方法?',function(r){  
		 			if(r){
			 			$.ajax({
				           url: "toMudel.action?m=AddMudelAction",
				           type:"POST",dataType:"json",
				           timeout: 1000,
				           data:{
				           		"aids":actionIds,
				           		"mid":rowm.mid
				           },
				           success: function(data){ //根据返回的值判断是否能删除
				           		if(data=="{}"){
					    			$.messager.alert("警告","保存失败!");	
								}
								else{
									$.messager.alert("警告","保存成功!");	
								}
				           }
				      	 });
			      	  }
		 		});
		    }
			
		});
		
		
	
		
		//操作的增加
		$('#actionAdd').click(function(){
			$('#acfid').form('clear');
			$('#acAdd').show();
			$('#acAdd').dialog({ 
				title:'添加操作', 
		   	 	modal:true,
		   	 	draggable:false,
		   	 	buttons: [{
					text: '提交',
						handler: function() {
							$('#acfid').form({  
							    url:"toMudel.action?m=Add_actions", dataType:"json",async:false,
							    onSubmit: function(){  
							        //进行表单验证  
						        	if($.trim($('#acNameId').val())==""){$.messager.alert("提示","操作名称不能为空!");$('#acNameId').focus();return false;}
							        if($.trim($('#acOneId').val())==""){$.messager.alert("提示","操作码不能为空!");$('#acOneId').focus();return false;}
							    	if($.trim($('#acTwoId').val())==""){$.messager.alert("提示","排序号不能为空!");$('#acTwoId').focus();return false;}
							    },success:function(data){
							    	if(data=="{}"){
							    		alert("提交失败!");	
									}
									else{
										alert("提交成功!");	
								        $('#acAdd').dialog('close');
										GetData2();								
									}
							    }  
							});  
							$('#acfid').submit(); 
						}
					},
					{
						text: '取消',
						handler: function() {
							$('#acAdd').dialog('close');
							$('#acfid').form('clear');
						}
					}
					] 
			});
		});
	});
  	</script>
  </head>
  
  <body>
    <div id="main" class="xtqygl_main" >
    
    	<div id="yhgl_left" style="height: 570px;">
			<ul class="easyui-tree" style="margin-left: 3px" id="MyTree">
			</ul>
				
		</div>
		<div id="yhgl_right"  style="height: 571px;">
    	<!--<div id="top_div_one" class="" align="right">  -->
			<div id="top_div_one" align="right" style="vertical-align: middle">
					<input type="button" value="保存" class="btnClass" id="saveButton"  onmousemove="this.style.color='white'" onmouseout="this.style.color='black'" style="cursor:pointer;"/>
					<input type="button" value="新增模块" class="btnClass" id="addButton"  onmousemove="this.style.color='white'" onmouseout="this.style.color='black'" style="cursor:pointer;"/>
					<input type="button" value="删除模块" class="delClass" id="deleteButton"  onmousemove="this.style.color='white'" onmouseout="this.style.color='black'" style="cursor:pointer;"/>
			</div>
			
			<div id="top_div_two" class="jssq_top_two">
				<table id="mudelinfoTable" style="height: 220px;">
				</table>
			</div>
			 
		
		<div id="bto_div">
			<ul class="" id="tab" style="margin-left: 1px;height: 25px;margin-top: 5px;padding:0;margin:0;list-style-type:none;">
			<li class="licss limov" ><input type="button" value="详细信息" id="libtn1" class="liimgcss liimgcssmoren" style="cursor:pointer;"/></li>
			<li class="licss limov" ><input type="button" value="功能注册" id="libtn4" class="liimgcss" style="cursor:pointer;"/></li>
			</ul>
			<div id="lis_1" style="display:block;" class="jbxxDiv_css">
				<form id="addfrm" method="post"  style="border:1px solid #ffffff;" >
				<table width="700" height="220" style="margin-left: 30px;margin-top: 10px;border: 1">
					<tr>
						<td align="left"><font class="font_cg">上级模块: </font></td>
						<td align="left">
							<input id="pmnameid" name="parentMmName" value="" class="easyui-validatebox"/>
							<font color="red">*</font>
							<input type="hidden" name="id" id="mid"/>
							<input type="hidden" name="parentMmId" id="pmid"/>
						</td>
						<td align="left"><font class="font_cg">所属系统: </font></td>
						<td align="left">
							<input id="mproname" name="mmModuleProperty2" value="" class="easyui-validatebox"/>
							<input type="hidden" name="mmModuleProperty" id="mpronamehid"/>
						</td>
					</tr>
					<tr>
						<td align="left"><font class="font_cg">模块编号: </font></td>
						<td align="left">
							<input id="mcode" name="mmModuleCode" value="" class="easyui-validatebox"/>
							<font color="red">*</font>
						</td>
						<td align="left"><font class="font_cg">模块名称: </font></td>
						<td align="left">
							<input id="mname" name="mmModuleName" value="" class="easyui-validatebox"/>
							<font color="red">*</font>
						</td>
					</tr>
					<tr>
						<td align="left"><font class="font_cg">URL地址: </font></td>
						<td align="left">
							<input id="murl" name="mmModuleUrl" value="" class="easyui-validatebox"/>
						</td>
						<td align="left"><font class="font_cg">模块排序: </font></td>
						<td align="left">
							<input id="mbackups" name="mmModuleBackups" />
							<!-- <textarea id="mbackups" rows="3" cols="17" name="mmModuleBackups"></textarea> -->
						</td>
					</tr>
					<tr>
						<td align="left"><font class="font_cg">模块说明: </font></td>
						<td align="left" colspan="3">
							<textarea id="morders" rows="3" cols="73" name="mmModuleDescription"></textarea>
						</td>
					</tr>
				</table>
				</form>
			</div>
			
			<div id="lis_4" style="display:none;margin-top: 0px;border: 1px;height: 240px;margin: 1px;border-style: solid;">
				<div align="right"><input id="actionAdd" type="button" value="增加操作" align="right" class="btnClass"/></div>
  	 			<table id="actioninfoTable" style="height: 220px;width: 1030px;border: 1px;"></table>
			</div>
		</div>
		</div>
		<div id="acAdd"  style="width:400px;height:350px;display: none;"> <br/>
			<form id="acfid" action="" method="post">
				<table align="center">
					<tr>
			  	 		<td align="left"><font  class="font_cg">操作名称 :</font></td>
			  	 		<td><input name="actionName" class="easyui-validatebox" id="acNameId" maxlength="12">
			  	 			<font color="red">*</font>
			  	 		</td>
			  	 	</tr>
					<tr>
			  	 		<td align="left"><font  class="font_cg">操作码 :</font></td>
			  	 		<td><input name="actionFieldOne" class="easyui-validatebox" id="acOneId" maxlength="12">
			  	 			<font color="red">*</font>
			  	 		</td>
			  	 	</tr>
			  	 	<tr>
			  	 		<td align="left"><font  class="font_cg">排序号 :</font></td>
			  	 		<td>
							<input id="acTwoId" name="actionFieldTwo" class="easyui-validatebox" />
							<font color="red">*</font>
						</td>
			  	 	</tr>
					<tr>
			  	 		<td align="left"><font  class="font_cg">描述 :</font></td>
			  	 		<td>
							<textarea id="acDesId" name="actionDescription" rows="4" cols="20"></textarea>
						</td>
			  	 	</tr>
					<tr>
			  	 		<td align="left"><font  class="font_cg">备注 :</font></td>
			  	 		<td>
							<textarea id="acBacId" name="actionBackups" rows="4" cols="20"></textarea>
						</td>
			  	 	</tr>
					
				</table>
			</form>
		</div>
	</div>
  </body>
</html>
