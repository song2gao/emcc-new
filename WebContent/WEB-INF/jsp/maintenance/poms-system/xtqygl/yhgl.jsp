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
		<title>系统权限管理-用户管理</title>
		<link href="/emcc-web/css/poms-system/xtqygl.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/default/easyui.css"></link>
		<link rel="stylesheet" type="text/css" href="/emcc-web/css/poms-business/themes/icon.css"></link>
		<script type="text/javascript"	src="/emcc-web/js/poms-system/jquery-1.7.2.js"></script>
		<script type="text/javascript"	src="/emcc-web/js/poms-business/jquery.easyui.min.js"></script>
		<script type="text/javascript"	src="/emcc-web/js/page.js"></script>
		<script type="text/javascript">
		
	$(function() {
		//全局变量
		var roleId;
		
		//鼠标点击(按钮)
		$(".btnClass").focus(
				function() {
					if (!false)$(this).css("background","url(/emcc-web/image/poms-system/btn_3.png)")
				});
		$(".delClass").focus(
				function() {
					$(this).css("background","url(/emcc-web/image/poms-system/del_3.png)")
				});
				
		var uloginbool=true,upwdbool=true;
					  		
	  		//判断登陆名是否重复
	  		$("#loginName").keyup(function(){
	  			var loginName = $("#loginName").val();
	  			if(loginName.length <= 4){
	  				$('#loginNameImg').attr("src","/emcc-web/image/poms-system/no.gif");
	  				$('#loginNameImg').show();
	  				return false;
	  			}
	  			$.ajax({
		            url: "toUserSel.action?m=test_loginName",
		            type:"POST",dataType:"json",
		            timeout: 1000,
		            data:{
		            	"loginName":loginName,
		            	"type":1
		            }, success: function(data){
		            	if(data.ltest){ //存在,则不能使用
		            		$('#loginNameImg').attr("src","/emcc-web/image/poms-system/no.gif");
		            		uloginbool = true;
		            	}else{
		            		$('#loginNameImg').attr("src","/emcc-web/image/poms-system/yes.gif");
		            		uloginbool = false;
		            	}
		            	$('#loginNameImg').show();
           	        }
		        });
	  		});
	  		//判断密码长度
	  		$("#loginPassword").keyup(function(){
	  			var loginPassword = $("#loginPassword").val();
	  			if(loginPassword.length <= 5){
	  				$('#loginPwdImg').attr("src","/emcc-web/image/poms-system/no.gif");
	  			}else{
	  				$('#loginPwdImg').attr("src","/emcc-web/image/poms-system/yes.gif");
	  			}
	  			$('#loginPwdImg').show();
	  		});
				
				
		//增加
		$("#addbtn").click(function(){
			uloginbool=true;upwdbool=true;
			$('#fid').form('clear');
			$('#loginPwdImg').hide();
			$('#loginNameImg').hide();
			var row = $('#tabs_user').datagrid('getSelected');
			if(row!=null){$("#parentUmId").val(row.uid);$("#parentUmId2").val(row.uid);}
			else{alert('请选择一个用户作为父用户再增加!');return false;}
			$('#dd').show();
			$.ajax({
	           url: "toUserSel.action?m=load_Roles",
	           type:"POST",dataType:"json",
	           timeout: 1000,
	           success: function(data){
	           	var roles = data.roles;
	           	var rdo = "<option value='-1'>-- 请选择角色  --</option>";
	          		for(var i=0;i<roles.length;i++){
	          			rdo += "<option value='"+roles[i].rid+"'>"+roles[i].rname+"</option>";
	          		}
	          		$("#roleidSelect").html("");
	          		$("#roleidSelect").html(rdo);
	            }
	      	 });
			$('#dd').dialog({ 
				title:'添加用户', 
		   	 	modal:true,
		   	 	draggable:false,
		   	 	buttons: [{
					text: '提交',
						handler: function() {
							$('#fid').form({  
							    url:"toUserSel.action?m=Add_Users", dataType:"json",async:false,
							    onSubmit: function(){  
							        //进行表单验证  
							        if(uloginbool){
							        	if($('#loginName').val().length<5){alert('"用户名"必须为五位以上!');$('#loginName').focus();return false;}
							        	alert('用户名以被占用,请重新取一个!');
							        	$('#loginName').focus();
							        	return false;
							        }
							        if($('#loginPassword').val().length<=5){alert('"密码"必须为六位以上!');$('#loginPassword').focus();return false;}
							    	if($('#personName').val()==""){alert('请选择一个"人员"!');return false;}
							    	if($('#roleidSelect').val()==-1){alert('请选择一个"角色"!');return false;}
							    	if($('#umIsdeleteId').val()==null){alert('请选择是否能删除!');return false;}
							    },success:function(data){
							    	if(data=="{}"){
							    		alert("提交失败!");	
									}
									else{
										alert("提交成功!");	
								        $('#dd').dialog('close');
										GetData2();								
									}
							    }  
							});  
							$('#fid').submit(); 
						}
					},
					{
						text: '取消',
						handler: function() {
							$('#dd').dialog('close');
							$('#fid').form('clear');
						}
					}
					] 
			});
		});		
		
		//修改
		$("#updbtn").click(function(){
			uloginbool = false;
			var row = $('#tabs_user').datagrid('getSelected');
			if(row==null){alert('请选择一个用户再修改!');return false;}
			$('#fid').form('clear');
			$('#loginPwdImg').hide();
			$('#loginNameImg').hide();
			
			//获取选中的用户信息
			$.ajax({
	           url: "toUserSel.action?m=load_Uers",
	           type:"POST",dataType:"json",
	           timeout: 1000,
	           data:{
	           		"id":row.uid
	           },
	           success: function(data){
	           		var en = data.user;
	           		$('#parentUmId').val(en.puserid);$('#parentUmId2').val(en.puserid);
	           		$('#personName').val(en.personName);$('#staffCodes').val(en.personCode);
	           		$('#loginName').val(en.loginName);
	           		$('#loginPassword').val(en.loginPassWrod);
	           		$('#umBackupsId').val(en.backups);
	           		$('#userid').val(en.userid);
	           		var deltest = en.umIsdelete;
	           		if(deltest=='0'){
          				var rdod = "";
	          				rdod += "<option value='1'>允许删除</option>";
	          				rdod += "<option value='0' selected='selected'>不允许删除</option>";
		          		$("#umIsdeleteId").html("");
		          		$("#umIsdeleteId").html(rdod);
	           		}else{
	           			var rdod = "";
	          				rdod += "<option value='1' selected='selected'>允许删除</option>";
	          				rdod += "<option value='0'>不允许删除</option>";
		          		$("#umIsdeleteId").html("");
		          		$("#umIsdeleteId").html(rdod);
	           		}
	           		roleId=en.roleId;
	           		
	           		 //获取角色列表
					$.ajax({
			           url: "toUserSel.action?m=load_Roles",
			           type:"POST",dataType:"json",
			           timeout: 1100,
			           success: function(data){
			           	var roles = data.roles;
			           	var rdo = "<option value='-1'>-- 请选择角色  --</option>";
			          		for(var i=0;i<roles.length;i++){
			          			if(roleId==roles[i].rid){ // 默认选择
			          				rdo += "<option selected='selected' value='"+roles[i].rid+"'>"+roles[i].rname+"</option>";
			          			}else{
			          				rdo += "<option value='"+roles[i].rid+"'>"+roles[i].rname+"</option>";
			          			}
			          			
			          		}
			          		$("#roleidSelect").html("");
			          		$("#roleidSelect").html(rdo);
			            }
			      	 });
	           }
	      	 });
	      	
			$('#dd').show();
			$('#dd').dialog({ 
				title:'修改用户', 
		   	 	modal:true,
		   	 	draggable:false,
		   	 	buttons: [{
					text: '修改',
						handler: function() {
							$('#fid').form({  
							    url:"toUserSel.action?m=Update_Users", dataType:"json",async:false,
							    onSubmit: function(){  
							        //进行表单验证  
							        
							        if(uloginbool){
							        	if($('#loginName').val().length<5){alert('"用户名"必须为五位以上!');$('#loginName').focus();return false;}
							        	alert('用户名以被占用,请重新取一个!');
							        	$('#loginName').focus();
							        	return false;
							        }
							        if($('#roleidSelect').val()==-1){alert('请选择一个"角色"!');return false;}
							    	if($('#umIsdeleteId').val()==null){alert('请选择是否能删除!');return false;}
							        if($('#loginPassword').val().length<=5){alert('"密码"必须为六位以上!');$('#loginPassword').focus();return false;}
							    	if($('#personName').val()==""){alert('请选择一个"人员"!');return false;}
							    },success:function(data){
							    	if(data=="{}"){
							    		alert("提交失败!");	
									}
									else{
										alert("提交成功!");	
								        $('#dd').dialog('close');
										GetData2();								
									}
							    }  
							});  
							$('#fid').submit(); 
						}
					},
					{
						text: '取消',
						handler: function() {
							$('#dd').dialog('close');
							$('#fid').form('clear');
						}
					}] 
			});
		});	

		// 删除按钮点击事件
		$(".delClass").click(function(){
			var row = $('#tabs_user').datagrid('getSelected');
			if(row==null){$.messager.alert("警告","请选择一个用户再进行删除!");return false;}
			$.ajax({
	           url: "toUserSel.action?m=Del_Users_Test",
	           type:"POST",dataType:"json",
	           timeout: 1000,
	           data:{
	           		"uid":row.uid
	           },
	           success: function(data){ //根据返回的值判断是否能删除
	           		var test = data.test; 
	           		if(test==0){$.messager.alert("警告","该用户不允许删除!");return false;} 
	           		else if(test==1){$.messager.alert("警告","因该用户有子用户,不允许删除!");return false;}
	           		else{
	           			$.messager.confirm('提示','确定要删除用户"'+row.user+'"?',function(r){  
						    if (r){  
						       $.ajax({
						           url: "toUserSel.action?m=Del_Users",
						           type:"POST",dataType:"json",
						           timeout: 1000,
						           data:{
						           		"uid":row.uid
						           },
						           success: function(data){ //根据返回的值判断是否能删除
						           		if(data=="{}"){
							    		$.messager.alert("警告","删除失败!");	
										}
										else{
											GetData2();
											$.messager.alert("警告","删除成功!");	
										}
						           }
						      	 });
						    }  
						}); 
	           			
	           		}
	           }
	      	 });
		});

		function GetData2(type,id) { //加载表格
			$("#tabs_user").datagrid("loadData", []);//清空tabs内容
			
			var args = {};
			args.roleid = $("#roleid").val();
			args.type = type;
			args.id = id;
			args.pageIndex = 1;//页索引
			args.pageSize = 15;//页容量
			BingData("#tabs_user", args, "toUserSel.action?m=load_UserTabs", null);
		} 

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

	});
</script>


<script type="text/javascript">

	
	
	// Tree
	$(function() {  //加载数据
		InitTreeData();
	});

	function InitTreeData() {
		$('#MyTree').tree({
			url : 'toUserSel.action?m=load_QiYe',
			checkbox : false,
			animate : true,
			onBeforeExpand : function(node) {
				$('#MyTree').tree('options').url = 'toUserSel.action?m=load_Users&qid='+ node.id+ "&type="+ node.attributes.type;
			},
			onClick : function(node) {	
				GetData1(node.attributes.type, node.id);
			}
		});
	}
	
	function GetData1(type,id) {
			$("#tabs_user").datagrid("loadData", []);//清空tabs内容
			
			var args = {};
			args.roleid = $("#roleid").val();
			args.type = type;
			args.id = id;
			args.pageIndex = 1;//页索引
			args.pageSize = 15;//页容量
			BingData("#tabs_user", args, "toUserSel.action?m=load_UserTabs", null);
	}   

	// Tabs      
	$(function() {
		//初始化table（用户管理）	
		$('#tabs_user').datagrid( {
			title : '用户管理',
			fitColumns : true, //自适应列的大小
			singleSelect : true,
			rownumbers: true,
			pageList:[15,30,45],
			striped:true,
			columns : [ [ {
				title : '用户名',
				field : 'user',
				align : 'center',
				width : 100,
				fit: true
			}, {
				title : '姓名',
				field : 'person',
				align : 'center',
				width : 100
			},{
				title : '用户ID',
				field : 'uid',
				hidden : true ,
				width : 100
			}, {
				title : '角色',
				field : 'role',
				align : 'center',
				width : 100
			}, {
				title : '所属机构',
				field : 'energy',
				align : 'center',
				width : 100
			} ] ],
			pagination : true			
		});
		GetData1();
		//点击查询按钮时，根据条件查询信息
		$("#searchButton").click(function() {
				GetData1();
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
			<div id="yhgl_right" style="height:570px;">
				<div id="yhgl_right_top" align="left" >
					<br />
					<div align="center">
					<span style="width: 40px;"></span>
					<font class="font_cg">真实姓名: </font><input type="text" name="tname" id="roleid"/><span style="width: 40px;"></span>
					<input type="button" value="查询" class="btnClass" id="searchButton" onmouseover="this.style.color='white'" onmouseout="this.style.color='black'" style="cursor: pointer;"/>
					<span style="width: 40px;"></span>
					<input type="button" value="增加" class="btnClass" id="addbtn" onmouseover="this.style.color='white'" onmouseout="this.style.color='black'" style="cursor: pointer;"/>
					<input type="button" value="修改" class="btnClass" id="updbtn" onmouseover="this.style.color='white'" onmouseout="this.style.color='black'" style="cursor: pointer;"/>
					<input type="button" value="删除" class="delClass" id="delbtn" onmouseover="this.style.color='white'" onmouseout="this.style.color='black'" style="cursor: pointer;"/>
					</div>
				</div>
				
				<div id="dd"  style="width:500px;height:350px;display: none;"> 
					  
					  	<script type="text/javascript">
					  	// 人员选择的ajax
					  	$(function(){
					  		$("#person_a").click(function(){
					  			var row = $('#tabs_user').datagrid('getSelected');
					  			$.ajax({
						            url: "toUserSel.action?m=load_PersonName",
						            type:"POST",dataType:"json",
						            timeout: 1000,
						            data:{
						            	"EnergyName":row.energy
						            }, success: function(data){
						            	
						            	var rdo = '';
						            	if(data.type==2){
						            		var persons = data.persons;
							            	rdo = '<table border="0" style="width: 402px;">';
							           		for(var i=0;i<persons.length;i++){
							           			if((i+1)%4==1){rdo += '<tr>'}
							           			rdo += '<td align="left"><input type="radio" name="per" value="'+persons[i].piCodes+'" textName="'+persons[i].piName+'"/><font class="font_cg">'+persons[i].piName+'</font>';
							           			rdo += '</td>';
							           			if((i+1)%4==0){rdo += '</tr>';}
							           			else if(i+1==persons.length){rdo += '</tr>';}
							           		}
							           		rdo += '</table>';
						           		}else{// 显示全部的人员
						           			
						           			
						           			rdo = data.persons;
						           		}
						           		$("#perDiv_nei").html("");
						           		$("#perDiv_nei").html(rdo);
			            	        }
						        });
								$('#perDiv').show();
								$('#perDiv').dialog({ 
							   	 	modal:true,
							   	 	draggable:false,
							   	 	buttons: [{
										text: '',
										iconCls: 'icon-ok',
											handler: function() { //把选择的人员赋给文本框
												var val = $('input:radio[name="per"]:checked');
												$('#personName').val(val.attr("textName")); 
												$('#staffCodes').val(val.val()); 
												$('#perDiv').dialog('close');
											}
										}] 
								});
					  		});
					  		
					  		//角色的选择
							
					  	 });	  
					  	</script><br/>
					   <form id="fid" method="post">
					  	 <table id="addid" align="center" width="390">
					  	 	<tr>
								<td align="left"><font  class="font_cg">是否能删除 :</font></td>
								<td>
									<input type="hidden" name="id" id="userid" value=""/>
									<select id="umIsdeleteId" name="umIsdelete" style="width: 155px">
					  	 				<option value="1" selected="selected">允许删除</option>
					  	 				<option value="0">不允许删除</option>
					  	 			</select>
								</td>
							</tr>
					  	 	<tr>
					  	 		<td align="left"><font class="font_cg">父用户编码 :</font></td>
					  	 		<td><input id="parentUmId" disabled value=""/>
					  	 			<input type="hidden" id="parentUmId2" name="parentUmId" value=""/>
					  	 		</td>
					  	 	</tr>
					  	 	<tr>
					  	 		<td align="left"><font  class="font_cg">人员	 :</font></td>
					  	 		<td><input  type="text" id="personName" value="" disabled />
					  	 			<input type="hidden" id="staffCodes" name="staffCodes" value=""/>
					  	 			 <a id="person_a" href="#"><font class="font_cg">选择</font></a>
					  	 		</td>
					  	 	</tr>
					  	 	<tr>
					  	 		<td colspan="2" align="center">
					  	 			<div id="per_div" style="display: none;">11</div>
					  	 		</td>
					  	 	</tr>
					  	 	<tr>
					  	 		<td align="left"><font  class="font_cg">用户名 :</font></td>
					  	 		<td><input name="loginName" class="easyui-validatebox" id="loginName" maxlength="12">
					  	 			<img id="loginNameImg" src="" style="display: none;"/>
					  	 			<font  class="font_cg">(用户名长度不能超过12)</font>
					  	 		</td>
					  	 	</tr>
					  	 	<tr>
					  	 		<td align="left"><font  class="font_cg">密码 :</font></td>
					  	 		<td>
					  	 		<input maxlength="8" type="password" style="width: 155px" class="easyui-validatebox" id="loginPassword" name="loginPassword">
					  	 		<img id="loginPwdImg" src="" style="display: none;"/>
					  	 		<font  class="font_cg">(密码长度不能超过8)</font>
					  	 		</td>
					  	 	</tr>
					  	 	<tr>
					  	 		<td align="left"><font  class="font_cg">角色 :</font></td>
					  	 		<td>
					  	 			<select id="roleidSelect" name="roleId" style="width: 155px">
					  	 				<option value="-1">-- 请选择角色  --</option>
					  	 			</select>
					  	 		</td>
					  	 	</tr>
					  	 	<tr>
					  	 		<td align="left"><font  class="font_cg">备注 :</font></td>
					  	 		<td>
									<textarea id="umBackupsId" name="umBackups" rows="4" cols="20"></textarea>
								</td>
					  	 	</tr>
					  	 </table>
					  	</form>
				</div> 
				<!-- 人员选择 -->
				<div id="perDiv" title="人员选择" style="width:420px;height:380px;display: none;">
					<div id="perDiv_nei"></div>
				</div>
				<div id="yhgl_right_bottom">
					<table id="tabs_user" style="height:460px;">
					</table>
				</div>
			</div>
		</div>
	</body>
</html>
