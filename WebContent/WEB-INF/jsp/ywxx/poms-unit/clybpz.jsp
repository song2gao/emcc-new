<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.net.URLEncoder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
		<link href="/emcc-web/css/poms-system/xtqygl.css" rel="stylesheet" type="text/css" />
		
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
 	
 	 $(function(){ 
 		GetData();

 		//添加采集器事件
		$('#addAss').click(function(){
			var row=$('#cc').datagrid('getSelected');
			if(row==null){alert('请选择一个企业!');return false;}
			$('#unitid').val(row.euiNames);
			//$('#unitid').attr("disasbled",false);
			$('#divAdd').show();
			$.ajax({
		           url: "calculateTerminalDevice.action?m=getFrontConfig",
		           type:"POST",dataType:"json",
		           timeout: 1000,
		           success: function(data){ //放入下拉框
		           		var list = data.list;
			         	//var rdo = "<option value='-1'>--选择前置机--</option>";
			         	var rdo="<option ></option>";
		           		for(var i=0;i<list.length;i++){
		           			
		           			rdo += "<option value='"+list[i].id+"'>"+list[i].frontProcessorIp+"</option>";
		           		}
		           		$("#qzjid").html("");
		          		$("#qzjid").html(rdo);
		           }
		      	 });
			$('#asstdCode').val("");
			$('#asstdNames').val("");
			
			$('#asstdProduction').val("");
			$('#crcAssembleIp').val("");
			$('#crcCommunicateType').val("");
			$('#crcCommunicateSerial').val("");
			$('#asstdBackups').val("");
			
             
			$('#divAdd').dialog({  
				title:'添加采集器', 
		   	 	modal:true,
		   	 	width:400,
		   	 	draggable:true,
		   	 	buttons: [{
					text: '提交',
					iconCls: 'icon-ok', 
						handler: function() {
							$('#addForm').form('submit',{  
							    url:"assembledTerminal.action?m=saveAssembled&eid="+row.id, dataType:"json",async:false,
							    onSubmit: function(){  
							        //进行表单验证  
							        if($('#crcCommunicateSerial').val()==""){
							        	$.messager.alert("提示","采集终端编号不能为空!","warning",null);
							        	return false;
								        }
							        if($('#asstdNames').val()==""){
							        	$.messager.alert("提示","采集终端名称不能为空!","warning",null);
							        	return false;
								        }
							        if($('#asstdProduction').val()==""){
							        	$.messager.alert("提示","生产厂家不能为空!","warning",null);
							        	return false;
								        }
							       
							     
							        if($('#qzjid').val()==""){
							        	$.messager.alert("提示","前置机不能为空!","warning",null);
							        	
							        	return false;
								        }
							        
							        if($('#asstdCode').val()==""){
							        	$.messager.alert("提示","采集通讯地址不能为空!","warning",null);
							        	return false;
								        }  
							        if($('#asstdCode').val()!=""){
							        	 var strP=/^\d+$/; 
				                         var v=$('#asstdCode').val();

							         } 
							        
							    },success:function(data){
							    	if(data=='true'){
								    		
							 				$.messager.alert("提示","添加成功!","info",function(){$('#divAdd').dialog('close');GetDatadd(row.id);});
							 				
								    	}else{
								    		
											$.messager.alert("提示","添加失败!","info",function(){$('#divAdd').dialog('close');});				
									    }
							    }  
							});  
							//$('#addForm').submit(); qzjid
							//$('#divAdd').dialog('close');
						}
					},
					{
						text: '取消',
							handler: function() {
								$('#divAdd').dialog('close');
						 		$('#addForm').form('clear'); 
							}
						}
					] 
			});
		});
		
		//计量配置页 
		$('#addCal').click(function(){
			var rowcc=$('#cc').datagrid('getSelected');
			var rowdd=$('#dd').datagrid('getSelected');
			if(rowdd !=null){

				//window.showModalDialog("calculateTerminalDevice.action?m=toAddCalcultePage&qyId="+rowcc.id+"&cjqId="+rowdd.id,"newwin","dialogHeight:520px; dialogWidth: 1010px; dialogTop: 200px; dialogLeft: 260px;");
				//$('#addCalIframe').src("calculateTerminalDevice.action?m=toAddCalcultePage&qyId="+rowcc.id+"&cjqId="+rowdd.id,"newwin","dialogHeight:520px; dialogWidth: 1010px; dialogTop: 200px; dialogLeft: 260px;");
				document.getElementById('addCalIframe').src="calculateTerminalDevice.action?m=toAddCalcultePage&qyId="+rowcc.id+"&cjqId="+rowdd.id;
				$('#iframeDivId').show();
				$('#iframeDivId').dialog({  
					title:'添加计量表信息', 
			   	 	modal:true,
			   	 	width:765,
			   	 	draggable:true
				});

			}else{
				$.messager.alert("提示","请选择采集器!","info",null);
			}
			
		});
		//计量终端配置更新页
		$('#updCal').click(function(){
			var rowcc=$('#cc').datagrid('getSelected');
			var rowdd=$('#dd').datagrid('getSelected');
			var rowee=$('#ee').datagrid('getSelected');
			//alert("计量表-->"+rowee.id);
			if(rowcc !=null && rowdd!=null && rowee !=null){
				//window.showModalDialog("calculateTerminalDevice.action?m=toUpCalcultePage&qyId="+rowcc.id+"&cjqId="+rowdd.id+"&jlbId="+rowee.id,"newwin","dialogHeight:600px; dialogWidth: 1020px; dialogTop: 100px; dialogLeft: 260px;");
				document.getElementById('updateCalIframe').src="calculateTerminalDevice.action?m=toUpCalcultePage&qyId="+rowcc.id+"&cjqId="+rowdd.id+"&jlbId="+rowee.id;
				$('#iframeUpdateId').show();
				$('#iframeUpdateId').dialog({  
					title:'修改计量表信息', 
			   	 	modal:true,
			   	 	width:765,
			   	 	draggable:true
				});
			}else if(rowdd==null){
				$.messager.alert("提示","必须选择一个采集器!","info",null);
			}else if(rowee==null){
				$.messager.alert("提示","必须选择一个计量表!","info",null);
			}
			});

		//删除计量表
		$('#delCal').click(function(){
			var rowcc=$('#cc').datagrid('getSelected');
			var rowdd=$('#dd').datagrid('getSelected');
			var rowee=$('#ee').datagrid('getSelected');

			var ee = $('#ee').datagrid('getSelections'); //计量表的集合
			 //拼接出计量表的ID 
			var calculIds = "";
	    	for(var i=0;i<ee.length;i++){
	    		calculIds += ee[i].id;
	    		if(i<ee.length-1){calculIds += "#";}
	    	}
			if(rowee !=null){
			$.messager.confirm('提示','确定要删除选中的数据吗?',function(r){
				if (r){
				var args={};
				args.jlbid=rowee.id;
				args.calculIds=calculIds;
				$.ajax({
					url: "calculateTerminalDevice.action?m=delCalculteAndCjq" ,
					type:"POST",
					dataType:"json",
					async:true,
					data: args,
					success: function(data){
					
						if(data.bool==true){
							$.messager.alert("提示","表计关联采集器信息已删除!","info",function (){GetDataee(rowcc.id,rowdd.id);});
							
						}else{
							$.messager.alert("提示","表计关联采集器信息删除失败!","info",null);
							return;
						}
					}
					});
				} 
				});
			}
		});
		
		//采集器删除
		$('#delAss').click(function(){//删除方法
			var rowUnit=$('#cc').datagrid('getSelected');
			var row=$('#dd').datagrid('getSelected');
			if(row){
				$.messager.confirm('提示','确定要删除选中的数据吗?',function(r){
					if (r){ 
					var args={};
					args.pid=row.id;
					args.eid=rowUnit.id;
					$.ajax({
						url: "assembledTerminal.action?m=delAssembled" ,
						type:"POST",
						dataType:"json",
						async:true,
						data: args,
						success: function(data){
							if(data){
								$.messager.alert("提示","删除成功!","info",function (){GetDatadd(rowUnit.id);});
								
							}else{
								$.messager.alert("提示","删除失败,采集器已关联计量终端设备!","info",null);
								return;
							}
						}
						}); 
					}
				});//
				}
		});
		//采集器修改
			$('#updAss').click(function(){
			var rowcc=$('#cc').datagrid('getSelected');
			var rowdd=$('#dd').datagrid('getSelected');
			if(rowdd==null){alert('请选择一个采集器!');return false;}
			
				$.ajax({
		           url: "calculateTerminalDevice.action?m=getFrontConfig",
		           type:"POST",dataType:"json",
		           timeout: 1000,async:false,
		           success: function(data){ //放入下拉框
		           		var list = data.list;
			         	//var rdo = "<option value='-1'>--选择前置机--</option>";
			         	var rdo="<option ></option>";
		           		for(var i=0;i<list.length;i++){
		           			
		           			rdo += "<option value='"+list[i].id+"'>"+list[i].frontProcessorIp+"</option>";
		           			
		           		}
		           		$("#qzjid").html("");
		          		$("#qzjid").html(rdo);
		           }
		      	 });
			
			
			///alert(rowdd.pomsFrontProcessorConfig.id);
			$('#unitid').val(rowcc.euiNames);
			$('#asstdCode').val(rowdd.asstdCode);
			$('#asstdNames').val(rowdd.asstdNames);
			$('#crcCommunicateType').val(rowdd.crcCommunicateType);
			$('#asstdProduction').val(rowdd.asstdProduction);
			$('#asstdBackups').val(rowdd.asstdBackups);
			$('#crcCommunicateSerial').val(rowdd.crcCommunicateSerial);
			$('#qzjid').val(rowdd.pomsFrontProcessorConfig.id);
			
			
		
			
			var args={};
			args.pid=rowdd.id;
			args.eid=rowcc.id;
			$('#divAdd').show();
			$('#divAdd').dialog({  
				title:'修改采集器', 
		   	 	modal:true,
		   	 	width:400,
		   	 	draggable:true,
		   	 	buttons: [{
					text: '提交',
					iconCls: 'icon-ok', 
						handler: function() {
							$('#addForm').form('submit',{  
							    url:"assembledTerminal.action?m=saveOrUpdateAssembled&eid="+rowcc.id+"&pid="+rowdd.id+"&pro="+$("#qzjid").val(), dataType:"json",async:false,
							    onSubmit: function(){  
								   //进行表单验证  
						        if($('#crcCommunicateSerial').val()==""){
							        	$.messager.alert("提示","采集终端编号不能为空!","warning",null);
							        	return false;
								        }
							        if($('#asstdNames').val()==""){
							        	$.messager.alert("提示","采集终端名称不能为空!","warning",null);
							        	return false;
								        }
							        if($('#asstdProduction').val()==""){
							        	$.messager.alert("提示","生产厂家不能为空!","warning",null);
							        	return false;
								        }
							       
							     
							        if($('#qzjid').val()==""){
							        	$.messager.alert("提示","前置机不能为空!","warning",null);
							        	
							        	return false;
								        }
							        
							        if($('#asstdCode').val()==""){
							        	$.messager.alert("提示","采集通讯地址不能为空!","warning",null);
							        	return false;
								        }
							         if($('#asstdCode').val()!=""){
							        	 var strP=/^\d+$/; 
				var v=$('#asstdCode').val();
				var ss =strP.test(v);
				if(ss==false){
					$.messager.alert('提示','采集通讯地址请输入数字!',"warning",null);
					return false;
				}
							         } 
     
						        

							    },success:function(data){
							    	if(data){
								    		
							 				$.messager.alert("提示","修改成功!","info",function(){$('#divAdd').dialog('close');GetDatadd(rowcc.id);});
							 				
								    	}else{
								    		
											$.messager.alert("提示","修改失败!","info",function(){$('#divAdd').dialog('close');});				
									    }
							    }  
							});  
							//$('#addForm').submit(); 
							//$('#divAdd').dialog('close');
						}
					},
					{
						text: '取消',
							handler: function() {
								$('#divAdd').dialog('close');
						 		$('#addForm').form('clear'); 
							}
						}
					] 
			});
		});

	
	 });
	 

 
     </script>
<body>
<div id="main" style="padding: 0px; margin-left: -3px;">
<!-- 
			<div id="clb_right" style="width: 1275px;">
			 -->
				<div id="yhgl_right_top" align="left" style="width: 1450px;height: 40px;">
					
					<div style="padding-top: 8px;">
					<table>
						<tr>
							<td>企业：</td>
							<td><input type="text" id="qy" name="qy"/>	</td>
							<td><input type="button" value="查询" class="btnClass" id="search"/></td>
						</tr>
					</table>
					<!-- 
						<font >&nbsp;企业：</font>
						<input type="text" id="qy" name="qy"/>	
						<input type="button" value="查询" class="btnClass" id="search"/>
						 -->
					</div>
					<!-- 
					<input type="button" value="添加" class="btnClass" />
					<input type="button" value="修改" class="btnClass" />
					<input type="button" value="删除" class="delClass" />
					 -->
				</div>
				<div style="width:100%">
					<table id="cc" style="height:240px;"></table>
				</div>
				<div id="leftC" style="width:50%;float: left;margin-left: 0px;" >
					  <div  id="" align="left" style="width: 630px;height: 10px; text-align: inherit; VISIBILITY:hidden;" >
						<input type="button" value="添加" class="btnClass" id="addAss" />
						<input type="button" value="修改" class="btnClass" id="updAss"/>
						<input type="button" value="删除" class="delClass" id="delAss"/>
					</div >
					<table id="dd" style="height:250px;"></table>
				</div>
				
				<!-- 
				<div style="float: left;width: 5px;">
					<img  src="/emcc-web/image/poms-unit/FGX.jpg" height="50px;">
				</div>
				 -->
				<div id="rightJ" style="width:50%; float: left;margin-left: 0px;">
					<div id="" align="left" style="width: 630px;height: 10px; text-align: inherit; VISIBILITY:hidden;">
						<input type="button" value="添加" class="btnClass" id="addCal" />
						<input type="button" value="修改" class="btnClass" id="updCal" />
						<input type="button" value="删除" class="delClass" id="delCal" />
					</div>
					<table id="ee" style="height:250px;"></table>
				</div>
				<!-- 
			</div>
			 -->
		</div>
		
		<!-- 采集终端配置添加页 -->
		<div id="divAdd" style="display: none;text-align: center; padding: 5px">
			<form id="addForm" method="post">  
			    <table>
			        <tr>
			    		<td width="100px" align="center">用能企业:</td>
			    		<td  align="left">
			    			<input type="text" id="unitid" name="unitid" disabled=true/>
			    		</td>
			    		<td>&nbsp;</td>
			    	</tr>
			    	<tr>
			    		<td width="100px" align="center">采集器终端编号:</td>
			    		<td  align="left"><input type="text" id="crcCommunicateSerial" name="crcCommunicateSerial" />
			    		<font color="red">*</font></td>
			    		<td>&nbsp;</td>
			    	</tr>
			    	<tr>
			    		<td width="100px" align="center">采集终端名称:</td>
			    		<td  align="left"><input type="text" id="asstdNames" name="asstdNames" />
			    		<font color="red">*</font></td>
			    		<td>&nbsp;</td>
			    	</tr>			    					    	
			    	
			    	<!--  <tr>
			    		<td width="100px" align="center">运行状况:</td>
			    		<td  align="left">
			    		 
			    		<input type="text" id="asstdRunStatus" name="asstdRunStatus" />
			    		
			    			<select id="asstdRunStatus" name="asstdRunStatus">
			    				
			    				<option value="0">--在线--</option>
			    				<option value="1">--离线--</option>
			    			</select>
			    		</td>
			    		
			    	</tr>
			    	-->				    
			    	<tr>
			    		<td width="100px" align="center">生产厂家:</td>
			    		<td  align="left"><input type="text" id="asstdProduction" name="asstdProduction" />
			    		<font color="red">*</font></td>
			    		<td>&nbsp;</td>
			    	</tr>
			    	<tr>
			    		<td width="100px" align="center">前置机:</td>
			    		<td  align="left">
							<select id="qzjid" name="qzjid"></select>
						<font color="red">*</font></td>
			    		<td>&nbsp;</td>
			    	</tr>
			    	<!--  <tr>
			    		<td width="100px" align="center">采集终端IP:</td>
			    		<td  align="left"><input type="text" id="crcAssembleIp" name="crcAssembleIp" /></td>
			    		<td>&nbsp;</td>
			    	</tr>-->
			    	<tr>
			    		<td width="100px" align="center">通讯类型:</td>
			    		<td  align="left">
			    		<!--  <input type="text" id="crcCommunicateType" name="crcCommunicateType" />-->
			    		<select id="crcCommunicateType" name="crcCommunicateType">
			    				
			    				<option >TCP</option>
			    				<option >UDP</option>
			    				<option >串口</option>
			    				<option >GPRS</option>
			    			</select></td>
			    		<td>&nbsp;</td>
			    	</tr>
			    	
			    	
			    	<tr>
			    	
			    		<td width="100px" align="center">采集通讯地址:</td>
			    		<td  align="left"><input type="text" id="asstdCode" name="asstdCode" />
			    		<font color="red">*</font></td>
			    		<td>&nbsp;</td>
			    	</tr>
			    	
			    	<tr>
			    		<td width="100px" align="center">备注:</td>
			    		<td ><textarea rows="4" style="width:200px;" id="asstdBackups" name="asstdBackups"></textarea></td>
			    		<td>&nbsp;</td>
			    	</tr>			   
			    </table> 
			</form> 
		</div> 
			
			<div id="iframeDivId" style="display: none;"><iframe style="height: 400px;width: 750px;" scrolling="auto" frameborder="0" marginheight="0" id="addCalIframe" src=""></iframe></div>
			<div id="iframeUpdateId" style="display: none;"><iframe style="height: 400px;width: 750px;" scrolling="auto" frameborder="0" marginheight="0" id="updateCalIframe" src=""></iframe></div>	
		
</body>
<script type="text/javascript">

function GetData(){
	var args={};
	args.pageIndex=1;//页索引
	args.pageSize=5;//页容量
	var pagelists=[5,10,15,20];
	args.pageList=pagelists;
	BingData("#cc",args,"calculateTerminalDevice.action?m=getEneUnits",null);
	}
function GetDatadd(argid){
	
	var args={};
	args.pageIndex=1;//页索引
	args.pageSize=5;//页容量
	var pagelists=[5,10,15,20];
	args.pageList=pagelists;
	args.enegryUnitId=argid;
	BingData("#dd",args,"calculateTerminalDevice.action?m=getAss",null);
	}
function GetDataee(unitid,calculteid){
	var args={};
	args.pageIndex=1;//页索引
	args.pageSize=5;//页容量
	var pagelists=[5,10,15,20];
	args.pageList=pagelists;
	args.unitid=unitid; //用能单位id
	args.calculteid=calculteid; //采集终端id
	BingData("#ee",args,"calculateTerminalDevice.action?m=getDeviceConfigs",null);
	}

$('#cc').datagrid( {
	title : '用能单位',
	striped : true,
	fitColumns: true, //自适应列的大小
	pagination: true,
	rownumbers: false,
	border:true,
	singleSelect:true,//设置单选、多选。true单选，false 多选。
	columns : [ [ 
				  {field : 'euiCode',title : '企业编码',width : 100},
				  {field : 'euiNames',title : '企业名称',width : 100},
				  {field : 'euiBelongDistrct',title : '所属区县',width : 100},
				  {field : 'euiBelongIndustry',title : '所属行业',width : 100},
				  {field : 'euiConsumeBand',title : '能耗等级',width : 100},
				  {field : 'euiChargeDepartment',title : '节能主管部门',width : 100},
				  {field : 'euiContentWay',title : '联系方式',width : 100},
				  {field : 'euiLocation',title : '地理位置',width : 100},
				  {field : 'euiBuildingArea',title : '建筑面积',width : 100} 
				  
			  ] ],
	onLoadSuccess:function (data){
		$('#cc').datagrid('selectRow', 0);
		var row=$('#cc').datagrid('getSelected');
		//alert(row.id);
		
		GetDatadd(row.id);
	},
	onSelect:function(rowIndex, rowData){
		//alert(rowData.id);
		GetDatadd(rowData.id);
		$('#ee').datagrid('loadData',[]);
	}
});

$('#dd').datagrid( {
	title : '采集终端信息',
	
	striped : true,
	fitColumns: true, //自适应列的大小
	pagination: true,
	rownumbers: false,
	singleSelect:true,//设置单选、多选。true单选，false 多选。
	columns : [ [ {field : 'asstdNames',title : '采集终端名称',width : 100},
				  {field : 'crcAssembleIp',title : '采集通讯地址',width : 100},
				  {field : 'asstdProduction',title : '生产厂家',width : 100},
				  {field : 'asstdBackups',title : '备注',width : 100}
				  
			  ] ],
			  
			  toolbar:[
				  	
				  
				  	{
						text:'添加',
						iconCls:'icon-add',
						handler:function(){
				  		$('#addAss').click();

						
							
						}
					},
					'-',{
						text:'修改',
						iconCls:'icon-save',
						handler:function(){
						
						$('#updAss').click();

						}
					},
					'-',{
						text:'删除',
						iconCls:'icon-remove',
						handler:function(){
						
						$('#delAss').click();

						}
					}],
			  
			  
			  
			  
	onSelect:function(rowIndex, rowData){
		var row=$('#cc').datagrid('getSelected');
			//alert(rowData.id+"+"+row.id);
			GetDataee(row.id,rowData.id);
	}
});

$('#ee').datagrid( {
	title : '计量终端信息',
	striped : true,
	fitColumns: true, //自适应列的大小
	pagination: true,
	rownumbers: false,
	singleSelect:false,//设置单选、多选。true单选，false 多选。
	columns : [ [{ 
		title: '全选', 
		field:'mck',
		checkbox:true,
		width:100
	},
	         	 {field : 'cdtMeasureLoop',title : '计量终端回路名称',width : 100},
				  {field : 'pomsCalculateTerminalModel',title : '计量模型',width : 100,formatter: function(value,rowData,rowIndex){if(value!=null){return value.ctmNames;}else{return '';}}},
				  {field : 'ctdCodes',title : '计量终端编号',width : 100},
				  {field : 'cdtProtocalAddr',title : '计量终端地址',width : 100},
				  {field : 'cdtTerminalStatus',title : '计量终端状态',width : 100,formatter: function (value, rowData, rowIndex) {if (value==0) {return "新增";} else if(value=="1"){return "测试";}else if(value=="2"){return "测通";}else if(value=="3"){return "正常";}else if(value=="4"){return "停用";} }},
				  {field : 'cdtIsinvented',title : '虚/实终端',width : 100,formatter: function(value, rowData, rowIndex){if(value==0){return "实";}else if(value==1){return "虚";} } }
				  
			  ] ],
			  toolbar:[
				  	
				  
				  	{
						text:'添加',
						iconCls:'icon-add',
						handler:function(){
				  		$('#addCal').click();

						
							
						}
					},
					'-',{
						text:'修改',
						iconCls:'icon-save',
						handler:function(){
						
						$('#updCal').click();

						}
					},
					'-',{
						text:'删除',
						iconCls:'icon-remove',
						handler:function(){
						
						$('#delCal').click();

						}
					}],
});


$('#search').click(function(){
	var qy=$('#qy').val();
	//alert(qy);
	var args={};
	args.pageIndex=1;//页索引
	args.pageSize=10;//页容量
	args.qy=qy;
	BingData("#cc",args,"calculateTerminalDevice.action?m=getEneUnit",null);
	
});


</script>
</html>