<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Insert title here</title>
	</head>
	<link href="/emcc-web/css/poms-system/xtqygl.css" rel="stylesheet"
		type="text/css" />
	<link href="/emcc-web/css/poms-unit/bdcss.css" rel="stylesheet" type="text/css" />
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
	<script type="text/javascript">
	
	$(function() {
		InitTreeData();
		GetData();

		$('#del').click(function(){//删除方法
			var row=$('#tt').datagrid('getSelected');
			if(row==null){
	    		$.messager.alert('警告','请选择人员!'); 
	    		return ; 
			}
			$.messager.confirm('提示','确定要删除选中的数据吗?',function(r){  
			    	if (r){  
						var args={};
						args.pid=row.id;
						args.piCodes=row.piCodes;
						$.ajax({
							url: "personInfo.action?m=deletePerson" ,
							type:"POST",
							dataType:"json",
							async:true,
							data: args,
							success: function(data){
								if(data){
									//callback(data);
									//GetData();
									$.messager.alert('提示','删除成功,人员关联用户也已删除!',"info",function(){GetData();});
								}else{
									$.messager.alert('提示',"删除失败,该人员已关联用户!");
									return;
								}
							}
						}); 
					}
			}); 
		});
		
		var piCodesTemp = null;
		$('#piCodes').blur(function(){
			
			if(piCodesTemp == null || (piCodesTemp != null && piCodesTemp != $('#piCodes').val())){
				$.ajax({
					url: "personInfo.action?m=searchPiCodesExist&piCodes=" + $('#piCodes').val() ,
					type:"POST",
					dataType:"text",
					data: null,
					success: function(result){
						if($.trim(result) == 'true'){
					    	$.messager.alert("提示","该编码已经使用!","warning",null);
					    	$('#piCodes').val('');
					    }
					}
				});
			}
		});
		
		//新增人员信息
		$('#addButton').click(function(){
			
			piCodesTemp = null;
			
			$('#divThemes input[type="text"]').val('');
			$('#divThemes select').text('');
			
			$('#divThemes').show();
			//默认选中第一个
			$("input[type=radio][value=0]").attr("checked",'checked');
			//加载企业
			$.ajax({
		           url: "enegryUnit.action?m=retEnegryInfo",
		           type:"POST",dataType:"json",
		           timeout: 1000,
		           success: function(data){ //放入下拉框
		           		var list = data.elist;
			         	var rdo = "<option value='-1'>--选择企业--</option>";
		           		for(var i=0;i<list.length;i++){
		           			//$('#unitid').append("<option value='"+list[i].id+"'>"+list[i].euiNames+"</option>");
		           			rdo += "<option value='"+list[i].id+"'>"+list[i].euiNames+"</option>";
		           		}
		           		$("#unitid").html("");
		          		$("#unitid").html(rdo);
		           }
		      	 });
				$('#divThemes').dialog({  
					title:'添加人员', 
			   	 	modal:true,
			   	 	width:400,
			   	 	draggable:true,
			   	 	buttons: [{
						text: '提交',
						iconCls: 'icon-ok', 
							handler: function() {
								$('#ff').form('submit',{  
								    url:"personInfo.action?m=savePerson", dataType:"json",async:false,
								    onSubmit: function(){  
								        //进行表单验证  
							    		return check();
							    		
								    },success:function(data){
									    
									    
								 		if(data=='true'){
								 			$.messager.alert("提示","添加成功!","info",function(){
									 			$('#divThemes').dialog('close');
										 		$('#ff').form('clear');
										 		GetData(); 
									 			});

										}else if(data=='false'){
											$.messager.alert("提示","添加失败!","info",function(){
									 			$('#divThemes').dialog('close');
										 		$('#ff').form('clear'); 
									 			});
										}
								    }  
								});  
								//$('#ff').submit(); 
								//$('#divThemes').dialog('close');
							}
						},
						{
							text: '取消',
								handler: function() {
									$('#divThemes').dialog('close');
							 		$('#ff').form('clear'); 
								}
							}
						] 
				});
		});

		//更新人员信息
		$('#editButton').click(function(){
			var row=$('#tt').datagrid('getSelected');
			piCodesTemp = row.piCodes;
			if(row !=null){
				//alert(row.piCodes);
				$('#piCodes').val(row.piCodes);
				$('#piName').val(row.piName);
				$('#piAge').val(row.piAge);
				$('#piEmail').val(row.piEmail);
				$('#piMobile').val(row.piMobile);
				$('#plLocation').val(row.plLocation);
				if(row.piSex=="0"){
						$("input[type=radio][value=0]").attr("checked",'checked');
					}else{
						$("input[type=radio][value=1]").attr("checked",'checked');
					}
				//alert(row.pomsEnergyUnitInfo.euiNames);
				var euiid="";
				//加载企业
				$.ajax({
			           url: "enegryUnit.action?m=retEnegryInfo",
			           type:"POST",dataType:"json",
			           timeout: 1000,
			           async:false,
			           success: function(data){ //放入下拉框
			           		var list = data.elist;
				         	var rdo = "<option value='-1'>--选择企业--</option>";
			           		for(var i=0;i<list.length;i++){
			           			rdo += "<option value='"+list[i].id+"'>"+list[i].euiNames+"</option>";
			           			if(row.pomsEnergyUnitInfo.id==list[i].id){
				           			euiid=list[i].id;
				           			
				           		}
			           		}
			           		$("#unitid").html("");
			          		$("#unitid").html(rdo);
			           }
			      	 });
				$("#unitid option[value='"+euiid+"']").attr("selected", "selected"); //设置Select的Text值为jQuery的项选中

				$('#divThemes').show();
				$('#divThemes').dialog({  
					title:'更新人员', 
			   	 	modal:true,
			   	 	width:400,
			   	 	draggable:true,
			   	 	buttons: [{
						text: '提交',
						iconCls: 'icon-ok', 
							handler: function() {
								$('#ff').form('submit',{  
								    url:"personInfo.action?m=savePerson&pid="+row.id, dataType:"json",async:false,
								    onSubmit: function(){  
								        //进行表单验证  
										return check();
								    },success:function(data){
								 		if(data=='true'){
								 			$.messager.alert("提示","更新成功!","info",null);
								 			$('#divThemes').dialog('close');
									 		$('#ff').form('clear'); 
									 		GetData();
										}else if(data=='false'){
											$.messager.alert("提示","更新失败!","info",null);
											$('#divThemes').dialog('close');
									 		$('#ff').form('clear'); 				
										}
								    }  
								});
							}
						},
						{
							text: '取消',
								handler: function() {
									$('#divThemes').dialog('close');
							 		$('#ff').form('clear'); 
								}
							}
						] 
				});
			}else{
				$.messager.alert("提示","请选择一个人员!","info",null);
				}
			
		});
		
	});

	function InitTreeData() {
		$('#MyTree').tree({
			url : 'enegryUnit.action?m=getAllEnegryInfo',
			checkbox : false,
			animate : true,
			onBeforeExpand : function(node) {
				//alert(node.id);
				$('#MyTree').tree('options').url = 'enegryUnit.action?m=getChildEnegryInfo&eid=' + node.id;
			},
			onClick : function(node) {//单击某个树节点,对应的Tabs发生数据变化
				GetDataRefresh(node.id);
			}
		});
	}
	
	
	function check(){
		
		if($('#piCodes').val() == ""){
   			$.messager.alert("提示","请填写编码!","warning",null);
   			return false;
    	}
   		
   		if($('#piName').val() == ""){
   			$.messager.alert("提示","请填写姓名!","warning",null);
    		return false;
    	}
   		
   		if($('#unitid').val() == '-1'){
   			$.messager.alert("提示","请选择用能单位!","warning",null);
    		return false;
   		}

   		if($('#piEmail').val() == ""){
   			$.messager.alert("提示","请填写邮箱!","warning",null);
   			return false;
   		}else{
   			var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
			if(!reg.test($('#piEmail').val())){
    	    	$.messager.alert("提示","Email格式错误!","warning",null);
    			return false;
    	    }
   		}
   		
   		return true;
	}
</script>

	<body>
		<div id="main" class="rywh_main" style="margin-left: -7px;">
			<div id="rywh_left">
				<div class="yhgltreeDiv" align="left">
					<ul class="easyui-tree" style="margin-left: 3px;" id="MyTree">
					</ul>
				</div>
			</div>
			<div id="rywh_right" style="width: 1040px;">
				<div id="rywh_right_top" align="left">
					<br />
					<font class="font_cg">&nbsp;&nbsp; 姓名: <input type="text"
							id="pName" name="pName" />&nbsp;&nbsp; 编码: <input type="text" id="pCodes"
							name="pCodes" /> </font>
					<input type="button" id="search" value="查询" class="btnClass" />
					<span style="width: 40px;"></span>
					<input id="addButton" type="button" value="增加" class="btnClass"/>
					<input id="editButton" type="button" value="修改" class="btnClass" />
					<input type="button" id="del" value="删除" class="delClass" />
				</div>
				<table id="tt" style="height:490px;"></table>
			</div>
		</div>
		
		<div id="divThemes" style="display: none;text-align: center; padding: 5px">
			<form id="ff" method="post">  
			    <table>
			    	<tr>
			    	
			    		<td width="100px" align="center">人员编码:</td>
			    		<td  align="left"><input type="text" id="piCodes" name="piCodes" /></td>
			    		
			    		<td style="color: red;">*</td>
			    	</tr>
			    	<tr>

			    		<td width="100px" align="center">姓&nbsp;&nbsp;&nbsp;&nbsp;名:</td>
			    		<td align="left"><input type="text" id="piName" name="piName"/>
			    		</td>
			    		<td style="color: red;">*</td>
			    	</tr>
			    	<tr>
			    		<td width="100px" align="center">性&nbsp;&nbsp;&nbsp;&nbsp;别:</td>
			    		<td align="left">
			    			&nbsp;&nbsp;&nbsp;<input type="radio" id="piSex" name="piSex" value="0" checked="checked"/>男
			    			<input type="radio" id="piSex" value="1" name="piSex"/>女
			    		</td>
			    		
			    		<td>&nbsp;</td>
			    	</tr>
			    	<tr>
	
			    		<td width="100px" align="center">年&nbsp;&nbsp;&nbsp;&nbsp;龄:</td>
			    		<td  align="left"><input type="text" id="piAge" name="piAge"/></td>
			    		<td>&nbsp;</td>
			    	</tr>

			    	<tr>
			    		<td width="100px" align="center">用能单位:</td>
			    		<td  align="left">
			    			<select id="unitid" name="unitid">
			    			</select>
			    		</td>
			    		<td style="color: red;">*</td>
			    	</tr>
			    	<tr>
			    		<td width="100px" align="center">邮&nbsp;&nbsp;&nbsp;&nbsp;箱:</td>
			    		<td  align="left"> <input type="text" id="piEmail" name="piEmail"/></td>
			    		<td style="color: red;">*</td>
			    	</tr>
			    	<tr>
			    		<td width="100px" align="center">联系方式:</td>
			    		<td  align="left"><input type="text" id="piMobile" name="piMobile"/></td>
						<td>&nbsp;</td>
			    	</tr>
			    	<tr>
			    		<td width="100px" align="center">家庭住址:</td>
			    		<td  align="left">
			    			<textarea rows="5" cols="20" id="plLocation" name="plLocation"></textarea>
			    		</td>
						<td>&nbsp;</td>
			    	</tr>				    	
			    </table> 
			</form> 
		</div> 
	</body>
	<script type="text/javascript">

	

	
	function GetData(){
		var args={};
		args.gdType=$("#pName").val();
		args.gdState=$("#pCodes").val();
		args.pageIndex=1;//页索引
		args.pageSize=10;//页容量
		BingData("#tt",args,"personInfo.action?m=toSearchPersons",null);
		}
	function GetDataRefresh(qyid){
		var args={};
		args.qyid=qyid;
		args.pageIndex=1;//页索引
		args.pageSize=10;//页容量
		BingData("#tt",args,"personInfo.action?m=getPersonsByunitid",null);
		}
		
	$('#tt').datagrid( {
		title : '人员信息表',
		striped : true,
		fitColumns: true, //自适应列的大小
		pagination: true,
		rownumbers: true,
		singleSelect:true,//设置单选、多选。true单选，false 多选。
		editors:'predefined editors',
		columns : [ [ {field : 'pomsEnergyUnitInfo',title : '用能单位',width : 100,formatter: function(value, rowData, rowIndex){return value.euiNames}},
					  {field : 'piCodes',title : '人员编码',width : 100},
					  {field : 'piName',title : '姓名',width : 100,formatter: function(value, rowData, rowIndex){return value}},
					  {field : 'piSex',title : '性别',width : 100,formatter: function(value, rowData, rowIndex){if(value=="0"){return "男" }else{return "女"}}},
					  {field : 'piAge',title : '年龄',width : 100},
					  {field : 'piMobile',title : '联系方式',width : 100},
					  {field : 'piEmail',title : '邮箱',width : 100} 
					  
				  ] ],
		pagination:true
	
	});
	//点击查询按钮时，根据条件查询信息
	$("#search").click(function(){
		//获取后台数据
		//$("#tt").datagrid("loadData",[]); 
		GetData()
	});
	$("#ibtn").click(function(){
		//获取后台数据
		//$("#tt").datagrid("loadData",[]); 
		tan()
	});



</script>
</html>