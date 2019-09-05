<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<link href=/emcc-web/css/poms-system/xtqygl.css rel="stylesheet" type="text/css"/>
  	<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/default/easyui.css"></link>
	<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/icon.css"></link>
	<script type="text/javascript"	src="/emcc-web/js/poms-system/jquery-1.7.2.js"></script>
	<script type="text/javascript"	src="/emcc-web/js/poms-business/jquery.easyui.min.js"></script>
	<script type="text/javascript"	src="/emcc-web/js/page.js"></script>
  	<script type="text/javascript">
  	

  	function s(){
  	var row = $("#tabs_code").datagrid('getSelected');
  	var cmId=row.cmId;
  		  	$.ajax({
  			url:"toCodes.action?m=se_Codes&aa="+$('#cmCodeId').val()+"&cmId="+cmId,
			type:"POST",
			dataType:"json",
			timeout: 1000,
			success:function(data){
			

			  if(data.obj == "code"){
					
					$.messager.alert("提示","编码不能重复，请重新输入!!");
					$('#cmCodeId').val('');
					return false;
				}
			 }
  		});

  	}
  		
  		$(function(){
  			// Tree
			$(function() {  //加载数据
				InitTreeData();
			});
		
			function InitTreeData() {
				$('#MyTree').tree({
					url : 'toCodes.action?m=load_CodeTree',
					checkbox : false,
					animate : true,
					onBeforeExpand : function(node) {
						$('#MyTree').tree('options').url = 'toCodes.action?m=load_CodeTrees&pid='+ node.id;
					},
					onClick : function(node) {	
						GetData1(node.id);
					}
				});
			}
			
			// Tabs      
			$(function() {
				//初始化table（用户管理）	
				$('#tabs_code').datagrid( {
					title : '编码管理',
					fitColumns : true, //自适应列的大小
					singleSelect : true,
					striped:true,
					rownumbers: true,
					pagination : true,
					pageList:[15,30,45,60],
					columns : [ [ {
						title : '编码',
						field : 'cmCode',
						align : 'center',
						width : 100
					},{
						title : '编码名称',
						field : 'cmName',
						align : 'center',
						width : 100
					},{
						title : '编码ID',
						field : 'cmid',
						hidden : true ,
						width : 100
					},{
						title : '父ID',
						field : 'cmParentId',
						hidden : true ,
						width : 100
					},{
						title : '编码说明',
						field : 'cmDescription',
						align : 'center',
						width : 100
					}, {
						title : '参数1',
						field : 'cmBackupone',
						align : 'center',
						width : 100
					},{
						title : '参数2',
						field : 'cmBackuptwo',
						align : 'center',
						width : 100
					} ] ],
					onLoadSuccess : function(data) {
						$('#tabs_code').datagrid('selectRow',0);
					}
				});
				GetData1();
		 	 });	
		 	 
		 	 //点击查询按钮时，根据条件查询信息
			$("#searchButton").click(function() {
				var id;
				var tree = $('#MyTree').tree('getSelected');//获取树形被点中的对象
				if(tree!=null){id=tree.id;}
				GetData1(id);
			}); 
				
				
			function GetData1(id) {
				$("#tabs_code").datagrid("loadData", []);//清空tabs内容
				var args = {};
				if($.trim($('#cnid').val())!=""){args.cname = $.trim($('#cnid').val());}
				args.pid = id;
				args.pageIndex = 1;//页索引
				args.pageSize = 15;//页容量
				BingData("#tabs_code", args, "toCodes.action?m=load_CodeTabs", null);
			}  
			
			 //点击添加按钮时
			$("#addbtn").click(function() {
				$('#fid').form('clear');
				var row = $("#tabs_code").datagrid('getSelected');
				if(row==null){
					$.messager.alert("提示","请选择一条表中编码!");
					return ;
				}
				$('#dd').show();
				$('#cmBackuptwoId1').val(row.cmCodeType);
				if(row!=null){
					$('#ccmParentId').val(row.cmId);$('#ccmParentNameId').val(row.cmName);
					$("#cmCodeType").val(row.cmCodeType);
					$('#cmcodetype').val(row.cmCodeType);
				}else{
					$('#ccmParentId').val("0");$('#ccmParentNameId').val("此模块为一级模块");
				}
				$('#dd').dialog({ 
				title:'新增编码', 
		   	 	modal:true,
		   	 	draggable:true,
		   	 	buttons: [{
					text: '提交',
						handler: function() {
							$('#fid').form({  
							    url:"toCodes.action?m=Add_Codes&aa="+$('#cmCodeId').val(),
							    contentType: "application/x-www-form-urlencoded;charset=utf-8",
							    dataType:"json",async:false,
							    onSubmit: function(){  
							       
							        if($.trim($('#cmNameId').val())==""){$.messager.alert("提示","名称不能为空!");$('#cmNameId').focus();return false;}
							        if($.trim($('#cmCodeId').val())==""){$.messager.alert("提示","编码不能为空!");$('#cmCodeId').focus();return false;}
							        //if($.trim($('#cmDescriptionId').val())==""){$.messager.alert("提示","说明不能为空!");$('#cmDescriptionId').focus();return false;}
							    	
							    },success:function(data){
							   
							    if(data=="{}"){
							    		$.messager.alert("提示","提交失败!");
									}
									else{
										$.messager.alert("提示","提交成功!");
								        $('#dd').dialog('close');
										GetData1(row.cmId);	
												//InitTreeData();					
									}
							    }  
							});  
							$('#fid').submit(); 
						}
					},{
						text: '取消',
						handler: function() {
							$('#dd').dialog('close');
							$('#fid').form('clear');
						}
					}] 
				});
			}); 
			
			
			
			 //点击修改按钮时
			$("#updbtn").click(function() {
				var row = $("#tabs_code").datagrid('getSelected');
				$('#fid').form('clear');
				$('#dd').show();
				if(row==null){
					$.messager.alert("提示","请选择一个'编码'再做修改操作!");return false;
				}
				//赋值
				$('#ccmId').val(row.cmId);
				$('#cmNameId').val(row.cmName);
				$('#ccmParentId').val(row.cmParentId);
				$('#cmCodeId').val(row.cmCode);
				$('#cmDescriptionId').val(row.cmDescription);
				$('#cmBackuponeId').val(row.cmBackupone);
				$('#cmBackuptwoId').val(row.cmBackuptwo);
				
				$('#cmcodetype').val(row.cmCodeType);
				if(row.cmParentId=="0"){
						$('#ccmParentNameId').val("此模块为一级模块");	
				}else{
				// 根据父ID查处父Name
					$.ajax({
			           url: "toCodes.action?m=SelPareName_Pid",
			           contentType: "application/x-www-form-urlencoded;charset=utf-8",
			           type:"POST",dataType:"json",
			           timeout: 1000,
			           data:{
			           		"pid":row.cmParentId
			           },
			           success: function(data){
			        	   	var cname = data.cname;
			        	   	$('#ccmParentNameId').val(cname);
			           }
			      	});
			    }
				$('#dd').dialog({ 
				title:'修改编码', 
		   	 	modal:true,
		   	 	draggable:true,
		   	 	buttons: [{
					text: '提交',
						handler: function() {
							$('#fid').form({  
							    url:"toCodes.action?m=Update_Codes&aa="+$('#cmBackuptwoId1').val(), dataType:"json",async:false,
							    contentType: "application/x-www-form-urlencoded;charset=utf-8",
							    onSubmit: function(){  
							        //进行表单验证  
							        if($.trim($('#cmNameId').val())==""){$.messager.alert("提示","名称不能为空!");$('#cmNameId').focus();return false;}
							        if($.trim($('#cmCodeId').val())==""){$.messager.alert("提示","编码不能为空!");$('#cmCodeId').focus();return false;}
							    	if($.trim($('#cmDescriptionId').val())==""){$.messager.alert("提示","说明不能为空!");$('#cmDescriptionId').focus();return false;}
							    },success:function(data){
							    	if(data=="{}"){
							    		$.messager.alert("提示","修改失败!");
									}
									else{
										$.messager.alert("提示","修改成功!");
								        $('#dd').dialog('close');
										GetData1(row.cmParentId);//InitTreeData();					
									}
							    }  
							});  
							$('#fid').submit(); 
						}
					},{
						text: '取消',
						handler: function() {
							$('#dd').dialog('close');
							$('#fid').form('clear');
						}
					}] 
				});
			}); 
			
			//点击删除按钮
			$("#delbtn").click(function(){
				var row = $("#tabs_code").datagrid('getSelected');
				if(row==null){$.messager.alert("警告","请选择一个编码再进行删除!");return false;}
				$.messager.confirm('提示','确定要删除编码" '+row.cmName+' "以及它的子编码吗"?',function(r){
					if(r){
						$.ajax({
				           url: "toCodes.action?m=Del_Code",
				           type:"POST",dataType:"json",
				           timeout: 1000,
				           data:{
				           		"cid":row.cmId
				           },
				           success: function(data){ //根据返回的值判断是否能删除
			           			if(data=="{}"){
						    		$.messager.alert("提示","删除失败!");
								}
								else{
									$.messager.alert("提示","删除成功!");
									GetData1();InitTreeData();					
								}
				           }
				      	 });
				     }	
				  });	
			});
			
			
  	});
  	
  
  	</script>
  </head>
  
 <body>
		<div id="main" class="xtqygl_main">
			<div id="yhgl_left" style="height: 570px;">
				<ul class="easyui-tree" style="margin-left: 3px" id="MyTree">
				</ul>
				
			</div>
			<div id="yhgl_right" style=" height: 570px;">
				<div id="yhgl_right_top" align="left" >
					<br />
					<div align="center" >
					<span style="width: 40px;"></span>
					<font class="font_cg">名称: </font><input type="text" name="cname" id="cnid"/><span style="width: 40px;"></span>
					<input type="button" value="查询" class="btnClass" id="searchButton" onmousemove="this.style.color='white'" onmouseout="this.style.color='black'" style="cursor:pointer;"/>
					<span style="width: 40px;"></span>
					<input type="button" value="添加" class="btnClass" id="addbtn" onmousemove="this.style.color='white'" onmouseout="this.style.color='black'" style="cursor:pointer;"/>
					<input type="button" value="修改" class="btnClass" id="updbtn" onmousemove="this.style.color='white'" onmouseout="this.style.color='black'" style="cursor:pointer;"/>
					<input type="button" value="删除" class="delClass" id="delbtn" onmousemove="this.style.color='white'" onmouseout="this.style.color='black'" style="cursor:pointer;"/>
					</div>
				</div>
			
				<div id="dd"  style="width:500px;height:360px;display: none;"> 
					  <br/>
					   <form id="fid" method="post" >
					  	 <table id="addid" align="center" width="390">
					  	 	<tr>
								<td align="left"><font  class="font_cg">编码名称:</font></td>
								<td>
									<input type="hidden" name="cmId" id="ccmId" value=""/>
									<input id="cmNameId" name="cmName" value=""/>
									<font color="red">*</font>
								</td>
							</tr>
					  	 	<tr>
					  	 		<td align="left"><font class="font_cg">父编码名称:</font></td>
					  	 		<td><input id="ccmParentNameId" disabled value="此编码为一级编码"/>
					  	 			<input type="hidden" id="ccmParentId" name="cmParentId" value="0"/>
					  	 			<input type="hidden" id="cmCodeType" name="cmCodeType" value="0"/>
					  	 		</td>
					  	 	</tr>
					  	 	<tr>
					  	 		<td align="left"><font  class="font_cg">编码 :</font></td>
					  	 		<td>
					  	 			<input  type="text" id="cmCodeId" name="cmCode" value="" onblur="s()"/>
					  	 			<font color="red">*</font>
					  	 		</td>
					  	 	</tr>
					  	 	<tr>
					  	 		<td align="left"><font  class="font_cg">编码说明 :</font></td>
					  	 		<td>
									<textarea id="cmDescriptionId" name="cmDescription" rows="4" cols="20"></textarea>
									<font color="red">*</font>
								</td>
					  	 	</tr>
					  	 	<tr>
					  	 		<td align="left"><font  class="font_cg">备用1 :</font></td>
					  	 		<td>
									<input id="cmBackuponeId" name="cmBackupone" />
								</td>
					  	 	</tr>
					  	 	<tr>
					  	 		<td align="left"><font  class="font_cg">备用2 :</font></td>
					  	 		<td>
									<input id="cmBackuptwoId" name="cmBackuptwo"/>
								</td>
					  	 	</tr>
					  	 	<tr>
					  	 		<td align="left"><font  class="font_cg">编码类型:</font></td>
					  	 		<td>
									<input id="cmcodetype" disabled name="cmBackuptwo1" />
								</td>
					  	 	</tr>
					  	 </table>
					  	</form>
				</div> 
				<div id="yhgl_right_bottom">
					<table id="tabs_code" style="height: 500px;">
					</table>
				</div>
			</div>
		</div>
	</body>
</html>
