<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type"
			content="text/html; charset=ISO-8859-1">
		<title>能耗负荷配置</title>
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
		$(function(){
			var click1 = true,click2=false,click3=false,click4=false;//用来判断当前停留在哪个tab页下
			InitTreeData();
			treeGrid('','');
		/**
			$(function() {	
				$('#tt').tabs({
					onSelect:function(title){
					var node =$("#MyTree").tree("getSelected"); //当前选中节点
						if(title=="电"){
							if(node ==null){
								treeGrid('1','');
								}else{
									treeGrid('1',node.id);
								}
							
							//$('#ifr_1').attr("src","consumptionLoadConfig.action?m=load_treeGrid_ele&eneType=1");
							click1=true;
							click2=false;
							click3=false;
							click4=false;
						}else if(title=="水"){
							//$('#ifr_2').attr("src","consumptionLoadConfig.action?m=load_treeGrid_ele&eneType=2");
							if(node ==null){
								treeGrid('2','');
								}else{
									treeGrid('2',node.id);
								}
							click1=false;
							click2=true;
							click3=false;
							click4=false;
							
						}else if(title=="气"){
							//$('#ifr_3').attr("src","consumptionLoadConfig.action?m=load_treeGrid_ele&eneType=3");
							if(node ==null){
								treeGrid('3','');
								}else{
									treeGrid('3',node.id);
								}
							click1=false;
							click2=false;
							click3=true;
							click4=false;
						}else if(title=="热"){
							//$('#ifr_4').attr("src","consumptionLoadConfig.action?m=load_treeGrid_ele&eneType=4");
							if(node ==null){
								treeGrid('4','');
								}else{
									treeGrid('4',node.id);
								}
							click1=false;
							click2=false;
							click3=false;
							click4=true;
						}
					}
				});
			});
			**/
			//新增负荷
			$('#addButton').click(function(){
			
				var node = $('#treegrid').treegrid('getSelected');
				var treenode =$("#MyTree").tree("getSelected"); //当前选中节点
                
				if(treenode ==null){
					$.messager.alert("提示","请选择一个树节点!","info");
					return ;
					}
				
				var nodeflag="0";
				var parentid ="";
				
				if(node!=null){ //添加节点标识，是否为子节点	
					//$.messager.alert("提示","请选择一个回路!","info",null);
					//return false;
					nodeflag="1";
					$('#pclcParentName').val(node.pclcLoopName);
					$('#pclcParentName').attr("disabled",true);
				   //alert(node.pclcParentId);
					parentid=node.id
					//alert(parentid);
					}else{
						parentid='null';
						
					}

				//页面加载时给提交时间赋值为当前时间
				var d = new Date();
				str = d.getFullYear()+'-'+(d.getMonth() + 1<10?('0'+(d.getMonth() + 1)):d.getMonth() + 1)+'-'+(d.getDate()<10?('0'+d.getDate()):d.getDate())
				$("#cdtNextCheckTime").datebox('setValue',str);
				
				//$('#pclcEnergyType').val(node.pclcEnergyType);
				//$('#pclcEnergyType').attr("disabled",true);

				//加载企业
				$.ajax({
			           url: "enegryUnit.action?m=getEnegryInfo&enegryId="+treenode.id,
			           type:"POST",dataType:"json",
			           timeout: 1000,async:false,
			           success: function(data){ //放入下拉框
			           		var eneUnit = data.eneUnit;
			           		//alert("企业---"+eneUnit);
			           		$('#qyName').val(eneUnit.euiNames);
			           }
			      	 });

				$.ajax({
			           url: "calculateTerminalDevice.action?m=getCalculteModel",
			           type:"POST",dataType:"json",
			           timeout: 1000,
			           success: function(data){ //放入下拉框
			           		var list = data.list;
			           		
			           		var rdo = "<option value='-1'>--选择模型--</option>";
			           		//var rdo="";
			           		for(var i=0;i<list.length;i++){
			           			
			           			rdo += "<option value='"+list[i].id+"'>"+list[i].ctmNames+"("+list[i].ctmCodes+")"+"</option>";
			           			
			           		}
				     
			           		$("#pclcModel").html("");
			          		$("#pclcModel").html(rdo);
			           }
			      	 });

		      	 //加载能源类型
		      
	         	$.ajax({
				           url: "calculateTerminalDevice.action?m=getBMInfo",
				           type:"POST",dataType:"json",
				           timeout: 1000,async:false,
				           success: function(data){ 
				           		var list = data.list;
				                var enegrys = "";
				           		for(var i=0;i<list.length;i++){
				           			
				           			enegrys += "<option value='"+list[i].cmCode+"'>"+list[i].cmName+"</option>";
				           		}
				           		$("#pclcEnergyType").html("");
				          		$("#pclcEnergyType").html(enegrys);
				           }
				      	 });
         	//$("#pclcEnergyType option[value='"+row.pclcEnergyType+"']").attr("selected", "selected");
         	
				//var enegry =$('#pclcEnergyType').val();
				
				
				$("#pclcCalculateBand").val(1);
				$("#pclcIfhas").val(0);
				var pclcEuiId =treenode.id;
				
				$('#divThemes').show();
				$('#divThemes').dialog({  
					title:'添加负荷配置', 
			   	 	modal:true,
			   	 	draggable:true,
			   	 	dialogClass:'moveToTop',
			   	 	buttons: [{
						text: '提交',
						iconCls: 'icon-ok', 
							handler: function() {
								$('#ff').form('submit',{  
								    url:"calculateTerminalDevice.action?m=saveCalculFromCons&parentid="+parentid+"&pclcEuiId="+pclcEuiId+"&flag="+nodeflag, dataType:"json",async:false,
								    async:false,
								    onSubmit: function(){  
								        //进行表单验证 
								        var period =$('#cdtCheckPeriod').val();
								        var cdtTerminalName =$('#cdtTerminalName').val();
								        var ctdCodes=$('#ctdCodes').val();//计量表编号
								        var cdtInitValue=$('#cdtInitValue').val();
								        //var v=$('#pclcModel').selectedIndex;
								        //alert(v);
								         var obj = document.getElementById('pclcModel'); //selectid
										 var index = obj.selectedIndex; 
								         
								        if(cdtTerminalName==""){
											$.messager.alert("提示","计量终端柜编号不能为空!","warning",null);
											return false;
										}
								        if(ctdCodes==""){
											$.messager.alert("提示","计量终端编号不能为空","warning",null);
											return false;
										}
								        if(period ==""){
							    			$.messager.alert("提示","计量终端检定周期不能为空","warning",null);
											return false;
							    		}
										if(period !=""){
							    			var reg = new RegExp("^[0-9]*$"); 
							    			 if(!reg.test(period)){
							    		        $.messager.alert("提示","计量终端检定周期只能输入数字","warning",null);
							    		        return false;
							    		    }
							    		}
									 	if(index==0){
									 		$.messager.alert("提示","计量模型不能为空,请选择一个模型","warning",null);
											return false;
									 	}
										if(cdtInitValue !=""){
							    			var reg = new RegExp("^[0-9]*$"); 
							    			 if(!reg.test(cdtInitValue)){
							    		        $.messager.alert("提示","计量终端初始值只能输入整数","warning",null);
							    		        return false;
							    		    }
							    		}
							    								    		
								    },success:function(data){    
								    	var jsonObj=eval("("+data+")");
								 		if(jsonObj.bool){
								 			$('#calData').datagrid('acceptChanges');
								 			var rowDatas = $("#calData").datagrid("getRows");
								 			var ctdCodes=$('#ctdCodes').val();
								 			//alert(rowDatas);
								 			$.each(rowDatas,function(index,item){
								 				//$('#calData').datagrid('refreshRow',rowData, i);
								 				
								 				 //var s= $('#calData').datagrid('selectRow', index);//选中一行
								 				// alert(item.mmpUpValue);
								 		//		alert(item.id+"-"+item.mmpCodes+"-"+item.mmpNames+"-"+item.mmpUpValue);
								 				$.ajax({

													url: "calculateTerminalDeviceParam.action?m=saveCalculteParam&ctdcode="+ctdCodes,
													type:"POST",
													dataType:"json",
													timeout: 10000,
													data:{
														//"jlbid":nodetree.id,
														"paramId":item.id,
														"ctdpCodes":item.mmpCodes,
														"ctdpNames":item.mmpNames,
														"ctdpSymbols":item.mmpSymbols,
														"ctdpUnits":item.mmpUnits,
														"ctdpFormular":item.mmpFormular,
														"ctdpIssave":item.mmpIssave,
														"ctdpType":item.mmpType,
														"ctdpSaveInterval":item.mmpSaveInterval,
														"ctdpSaveStyle":item.mmpSaveStyle,
														"ctdpStatisticType":item.mmpStatisticType,
														"ctdpUpLine":item.mmpUpValue,
														"ctdpUperLine":item.mmpUperLine,
														"ctdpDownLine":item.mmpDownValue,
														"ctdpDownerLine":item.mmpDownerLine,
														"ctdpStandardVal":item.mmpStandardVal,
														"ctdpOrders":item.mmpOrders,
														"ctdpBackups":item.mmpBackups
														}, success: function(data){
															if(data.flag == true){
															///alert("保存成功!");
															//alert(row2.id);
															//	GetDataff2();
														}
														}
												});
									 			});
								
								 			$.messager.alert("提示","添加成功!","info",function(){
								 				$('#divThemes').dialog('close');
										 		$('#ff').form('clear');
										 		$('#calData').datagrid('loadData',{total:0,rows:[]});										 
													treeGrid('','',pclcEuiId);
									 			});
								 			
										}else {
											$.messager.alert("提示","添加失败!","info",function(){
								 				$('#divThemes').dialog('close');
										 		$('#ff').form('clear');
										 		$('#calData').datagrid('loadData',{total:0,rows:[]});
									 			});
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
					 		$('#calData').datagrid('loadData',{total:0,rows:[]});
								}
						
							}
						] 
				});

			});


			//修改
			$('#updButton').click(function(){
				
				var node = $('#treegrid').treegrid('getSelected');
				if(node==null){	
					$.messager.alert("提示","请选择一个回路!","info",null);
					return false;
					}
				//alert(node.pclcParentId);
				//获取父级回路名称
				
				
				if(node.pclcParentId=='null'){
					
				$('#pclcParentName2').val(node.pclcLoopName);
				$('#pclcParentName2').attr("disabled",true);
				}
				else{
				$.ajax({
			           url:'calculateTerminalDevice.action?m=get_ParentName&pid='+node.pclcParentId,
			           type:"POST",dataType:"json",
			           timeout: 1000,
			           success: function(data){ //放入下拉框
			          
			           		var e = data.pd;
			           
			           		$('#pclcParentName2').val(e);
			           		$('#pclcParentName2').attr("disabled",true);
			           }
			      	 });
				}
				
				$('#ctdCodes2').val(node.pclcTerminalName); 
				$('#cdtMeasureLoop2').val(node.pclcLoopName);
				$('#cdtInitValue2').val(node.pclcInitValue);
				$('#cdtTerminalIndustry2').val(node.pclcProductIndustry);
				$('#cdtProductionCode2').val(node.pclcProductionCode);
				$('#cdtCheckPeriod2').val(node.pclcCheckPeriod);
				//$('#pclcNextCheckTime').val(node.pclcNextCheckTime);
				//alert(node.pclcNextCheckTime);
				$("#cdtNextCheckTime2").datebox('setValue',node.pclcNextCheckTime);
				$('#pclcCalculateBand2').val(node.pclcCalculateBand);
				//$('#pclcIfhas').val(node.pclcIfhas);pclcModel2
				//$('#cdtBackups2').val(node.pclcBackups);
				
				$('#cdtBackups3').val(node.pclcBackups);
				//$('#pclcModel2').attr("disabled",true);
				$('#pclcEnergyType2').val(node.pclcEnergyType);
				//$('#pclcEnergyType').attr("disabled",true);pclcMode3
				//$('#pclcMode3').val(node.pomsCalculateTerminalModel.ctm_Names);
				
				$('#pclcParentId2').val(node.pclcParentId);
				$('#cdtTerminalName2').val(node.cdtTerminalName);
				//alert(node.pclcModel);
				
				//加载企业
				$.ajax({
			           url: "enegryUnit.action?m=getEnegryInfo&enegryId="+node.pclcEuiId,
			           type:"POST",dataType:"json",
			           timeout: 1000,
			           success: function(data){ //放入下拉框
			           		var eneUnit = data.eneUnit;
			           		$('#qyName2').val(eneUnit.euiNames);
			           }
			      	 });
				var modeid="";
				//选择模型
				$.ajax({
			           url: "calculateTerminalDevice.action?m=getCalculteModel",
			           type:"POST",dataType:"json",
			           timeout: 1000,async:false,
			           success: function(data){ //放入下拉框
			           		var list = data.list;
			           		
			           		var rdo = "<option value='-1'>--选择模型--</option>";
			           		for(var i=0;i<list.length;i++){
			           			rdo += "<option value='"+list[i].id+"'>"+list[i].ctmNames+"("+list[i].ctmCodes+")"+"</option>";
			           			if(node.pclcModel==list[i].id){
				           			
			           				modeid=list[i].id;
				           			
				           		}
			           		}
				      
			           		$("#pclcModel2").html("");
			          		$("#pclcModel2").html(rdo);
			           }
			      	 });
		      	// alert(modeid);
		      	$.ajax({
				           url: "calculateTerminalDevice.action?m=getBMInfo",
				           type:"POST",dataType:"json",
				           timeout: 1000,async:false,
				           success: function(data){ 
				           		var list = data.list;
				                var enegrys = "<option value='-1'>--选择能源--</option>";
				           		for(var i=0;i<list.length;i++){
				           			
				           			enegrys += "<option value='"+list[i].cmCode+"'>"+list[i].cmName+"</option>";
				           			
				           		}
				           		$("#pclcEnergyType2").html("");
				          		$("#pclcEnergyType2").html(enegrys);
				          		//$("#pclcEnergyType2").attr$("#dataDiv :text").attr("disabled");
				          		$("#pclcEnergyType2").attr("disabled");
				           }
				      	 });
         	$("#pclcEnergyType2 option[value='"+node.pclcEnergyType+"']").attr("selected", "selected");
		      	
		      	
				var pclcEuiId =node.pclcEuiId;
				//var pclcEnergyType=node.pclcEnergyType;
				$('#divThemes2').show();
				$("#pclcModel2 option[value='"+modeid+"']").attr("selected", "selected"); //设置Select的Text值为jQuery的项选中
				//联动模型
				GetDataff2(node.id);
				$('#divThemes2').dialog({  
					title:'更新负荷配置', 
			   	 	modal:true,
			   	 	draggable:true,
			   	 	dialogClass:'moveToTop',
			   	 	buttons: [{
						text: '提交',
						iconCls: 'icon-ok', 
							handler: function() {
								$('#ff2').form('submit',{  
									url:"calculateTerminalDevice.action?m=updateCalculteFromCons&jlbid="+node.id+"&pclcEuiId="+pclcEuiId+"&pclcModel="+node.pclcModel, dataType:"json",async:false,
								    onSubmit: function(){ 
								    var tName =$('#ctdCodes2').val();
								     var codes2 =$('#ctdCodes2').val();
								    var tName =$('#cdtTerminalName2').val();
									var period =$('#cdtCheckPeriod2').val();
									var cdtInitValue=$('#cdtInitValue2').val();
								        //进行表单验证  
								    if(tName==""){
								    	$.messager.alert("提示","计量终端柜编号不能为空!","warning",null);
											return false;
								    }
								     if(codes2==""){
								    	$.messager.alert("提示","计量终端编号不能为空!","warning",null);
											return false;
								    }
								     if(period==""){
								    	$.messager.alert("提示","计量终端检定周期不能为空!","warning",null);
											return false;
								    }
									if(period !=""){
										//alert(period);
						    			var reg = new RegExp("^[0-9]*$");
						    			
						    			 if(!reg.test(period)){
						    		        $.messager.alert("提示","计量终端检定周期只能输入数字","warning",null);
						    		        return ;
						    		    }
						    		}	
								        if(cdtInitValue !=""){
							    			var reg = new RegExp("^[0-9]*$"); 
							    			 if(!reg.test(cdtInitValue)){
							    		        $.messager.alert("提示","计量终端初始值只能输入整数","warning",null);
							    		        return false;
							    		    }
							    		}
								    },success:function(data){
								    	
								    	var jsonObj=eval("("+data+")");
								    	
								 		if(jsonObj.bool){
								 			$.messager.alert("提示","更新成功!","info",function(){
								 				$('#divThemes2').dialog('close');
										 		$('#ff2').form('clear');					
													treeGrid('','',pclcEuiId);
									 			});

										}else {
											$.messager.alert("提示","更新失败!","info",function(){
								 				$('#divThemes2').dialog('close');
										 		$('#ff2').form('clear');
									 			});
										}
								    }  
								});  
								
							}
						},
						{
							text: '取消',
								handler: function() {
							$('#divThemes2').dialog('close');
					 		$('#ff2').form('clear');
								}
							}
						] 
				});

			});
			
			
			//初始化树结构
			 function InitTreeData()
		     {
		      	$('#MyTree').tree({
		          url:'enegryUnit.action?m=getAllEnegryInfo',
		          checkbox:false,
		          animate:true,
		          onBeforeExpand:function(node){
		          	 $('#MyTree').tree('options').url = 'enegryUnit.action?m=getChildEnegryInfo&eid=' + node.id;
		          },
		          onClick:function(node){//单击某个树节点,对应的Tabs发生数据变化
		        	 
						//alert(flag+"-"+node.id);
		        	 	treeGrid('',node.id);
		          }
		        });
		     }

			/**
		     $('#delButton').click(function (){
		    	 var flag=1;
					if(click2){
							flag=2;
						}else if(click3){
							flag=3;
						}else if(click4){
							flag=4;
						}
		    	 var node = $('#treegrid').treegrid('getSelected');
		    	 if(node ==null){alert('请选择一项');return ;}

		    	 	$.messager.confirm('提示','确定删除?',function(r){  
					    if (r){  
				             $.ajax({
					            data:{"id":node.id},
					 		    url:'consumptionLoadConfig.action?m=delCons', //提交给哪个执行  
					 		    
					 		    success:function(data){ 
					            	var jsonObj=eval("("+data+")"); 
									if(jsonObj.bool){
											$.messager.alert('提示','删除成功!','info',function(){treeGrid(flag,'');});
											
										}else{
											$.messager.alert('提示','删除失败','warning');
											return ;
										 
										}
					 		    }  
					 		});
					    	
					    }else{
							return ;
						}  
					}); 
			   });

			**/

			//加载计量表
		     GetDataff();
		     
		   //删除计量表
				$('#delButton').click(function(){

				  	 var node = $('#treegrid').treegrid('getSelected');
			    	 if(node ==null){alert('请选择一项');return ;}
					var ee = $('#treegrid').datagrid('getSelections'); //计量表的集合
					//alert(ee);
					 //拼接出计量表的ID 
					var calculIds = "";
			    	for(var i=0;i<ee.length;i++){
			    		calculIds += ee[i].id;
			    		if(i<ee.length-1){calculIds += "#";}
			    	}
					if(node !=null){
					$.messager.confirm('提示','确定要删除选中的数据吗?',function(r){
						if (r){
						var args={};
						args.jlbid='';
						args.calculIds=calculIds;
						$.ajax({
							url: "calculateTerminalDevice.action?m=delCalculteAndParam" ,
							type:"POST",
							dataType:"json",
							async:true,
							data: args,
							success: function(data){
							
							if(data.bool=="e"){
								$.messager.alert("提示","该节点含有子信息，请先删除子信息!","info",null);
									return;
							}
							
								if(data.bool==true){
									$.messager.alert("提示","删除成功,表计关联表信息也已删除!","info",function (){treeGrid('','');});
									
								}else{
									$.messager.alert("提示","删除失败!","info",null);
									return;
								}
							}
							});
						} 
						});
					}
				});
		
		 
		});
		
	 	//模型联动	
		 function checkModel(){
				var modelID=$('#pclcModel').val()
				GetDataff(modelID);
		}

		 function checkModel2(){
				var modelID=$('#pclcModel2').val()
				GetDataff2(modelID);
		}
	    //加载能耗负荷sh 
	function treeGrid(eneType,qyid){
		$('#treegrid').treegrid( {
			title:'能耗负荷配置信息',
			height:500,
			nowrap: false,
			rownumbers: true,
			animate:true,
			collapsible:true,
			singleSelect:true,//设置单选、多选。true单选，false 多选。
			fitColumns: false, //自适应列的大小
			url : 'calculateTerminalDevice.action?m=load_treeGrid&eneType='+eneType+"&qyid="+qyid,
			idField:'pclcTerminalName',
			treeField : 'pclcTerminalName',
			frozenColumns:[[
			                //{title:'ID',field:'id',width:200}
			            	{field : 'cdtTerminalName',
			    				title : '计量终端柜编号',
			    				width : 60,rowspan:2
			    			}
						]],
			columns : [ [
			  {
			 	field : 'pclcTerminalName',
			 	title : '计量终端编号',
			 	width : 60,rowspan:2
			 },  
			  {
				field : 'pclcLoopName',
				title : '计量终端回路名称',
				width : 280,rowspan:2
			},{
				field : 'pclcInitValue',
				title : '计量终端初始值',
				width : 130,rowspan:2
			}, {
				field : 'pclcProductIndustry',
				title : '计量终端厂家',
				width : 130,rowspan:2
			}, {
				field : 'pclcProductionCode',
				title : '计量终端出厂编号',
				width : 150,rowspan:2
			}, {
				field : 'pclcEnergyTypeName',
				title : '能源种类',
				width : 140,rowspan:2
			},{
				field : 'pclcBackups',
				title : '备注',
				width : 140,rowspan:2
			}

			] ],
			onBeforeExpand:function(row,param){
				if (row){
					$(this).treegrid('options').url = 'calculateTerminalDevice.action?m=getChild_treeGrid&id='+row.id;
				} else {
					//$(this).treegrid('options').url = 'treegrid_data.json';
				}
			}
		/**,
			onContextMenu: function(e,row){
				e.preventDefault();
				$(this).treegrid('unselectAll');
				$(this).treegrid('select', row.code);
				$('#mm').menu('show', {
					left: e.pageX,
					top: e.pageY
				});
			}
			**/
			,onDblClickRow:function(row){
				document.getElementById('iframe01').src="calculateTerminalDevice.action?m=getChilds&id="+row.id;
				$('#iframeDivId').show();
				$('#iframeDivId').dialog({  
					title:'能耗负荷配置', 
			   	 	modal:true,
			   	 	width:900,
			   	 	draggable:false
				});
			}
	
		});
		}
	
	
	
	function append(){
		codeIndex++;
		var data = [{
			id:'',
			pclcTerminalName: '',
			pclcLoopName: '',
			pclcProductIndustry: '',
			pclcProductionCode: ''
		}];
		var node = $('#treegrid1').treegrid('getSelected');
		$('#treegrid1').treegrid('append', {
			parent: (node?node.id:null),
			data: data
		});
	}

	//规范日期格式	
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
	
		</script>
	</head>
	<body>
		<div id="main" style="padding: 0px;">
			<div id="rywh_left">
				<div class="yhgltreeDiv" align="left">
					<ul class="easyui-tree" style="margin-left: 3px" id="MyTree">
					</ul>
				</div>

			</div>

			<div id="rywh_right" style="width: 80%">

				<div id="rywh_right_top" style="padding-top: 8px; height: 40px;">
					<table>
						<tr>
							<!-- 
							<td>
								企业：
							</td>
							<td>
								<input type="text" id="qy" name="qy" />
							</td>
								<input type="button" value="查询" class="btnClass" id="search" />
							 -->
							<td>
								<input type="button" value="添加" class="btnClass" id="addButton" />
								<input type="button" value="修改" class="btnClass" id="updButton" />
								<input type="button" value="删除" class="delClass" id="delButton" />
							</td>
						</tr>
					</table>
				</div>
				<!-- 
				<div style="margin-left: 5px;margin-top: 5px;">
					<div id="right01" style="width:450px;float: left; ">
						<table id="treegrid1"></table>
						
					</div>
					<div id="right02" style="width:450px; float: left;margin-left: 5px;">
						<table id="treegrid2"></table>
						
					</div>
				</div>
				<div style="margin-top: 5px;margin-left: 5px;">
					<div id="right03" style="width:450px; float: left;">
						<table id="treegrid3"></table>
						
					</div>
					<div id="right04" style="width:450px; float: left;margin-left: 5px;">
						<table id="treegrid4"></table>
						
					</div>
				</div>	
				-->
				<div>
					<table id="treegrid"></table>
				</div>

				<div id="mm" class="easyui-menu" style="width: 120px;">
					<div onclick="append()">
						Append
					</div>
				</div>
			</div>
			<!-- 新增能耗负荷配置 -->
			<div id="divThemes"
				style="display: none; text-align: center; padding: 5px;">
				<div>
					<form id="ff" method="post" >
						<table>
							<tr>
								<td width="150" align="right">
									企业:
								</td>
								<td>
									<input id="qyName" name="qyName" disabled="disabled" />
								</td>
								<td width="150" align="right">
									计量终端柜编号:
								</td>
								<td>
									<input id="cdtTerminalName" name="cdtTerminalName" />
									<font color="red">*</font>
								</td>
								<td width="150" align="right">
									计量终端编号:
								</td>
								<td>
									<input id="ctdCodes" name="ctdCodes" />
									<font color="red">*</font>
								</td>
							</tr>
							<tr>
								<td width="150" align="right">
									计量终端回路名称:
								</td>
								<td>
									<input id="cdtMeasureLoop" name="cdtMeasureLoop" />
								</td>
								<td width="150" align="right">
									计量终端初始值:
								</td>
								<td>
									<input id="cdtInitValue" name="cdtInitValue" />

								</td>
								<td width="150" align="right">
									计量终端厂家:
								</td>
								<td>
									<input id="cdtTerminalIndustry" name="cdtTerminalIndustry" />
								</td>
							</tr>
							<tr>
								<td width="150" align="right">
									计量终端出厂编号:
								</td>
								<td>
									<input id="cdtProductionCode" name="cdtProductionCode" />
								</td>
								<td width="150" align="right">
									计量终端检定周期:
								</td>
								<td>
									<input id="cdtCheckPeriod" name="cdtCheckPeriod" />&nbsp;月
									<font color="red">*</font>
								</td>
								<td width="150" align="right">
									下次检定日期:
								</td>
								<td>
									<input id="cdtNextCheckTime" name="cdtNextCheckTime"
										class="easyui-datebox"
										data-options="formatter:myformatter,parser:myparser"
										style="width: 150px;" />
									<font color="red">*</font>
								</td>
							</tr>
							<tr>
								<td width="150" align="right">
									计量级别:
								</td>
								<td align="left">
									<select id="pclcCalculateBand" name="pclcCalculateBand"
										style="width: 100px;">
										<option value="1">
											一级计量
										</option>
										<option value="2">
											二级计量
										</option>
										<option value="3">
											三级计量
										</option>
									</select>
									<font color="red">*</font>
									<!-- 
							<input id="pclcCalculateBand" name="pclcCalculateBand"/>
							 -->
								</td>
								<td width="150" align="right">
									计量表终端模型:
								</td>
								<td>
									<!-- 
							<input id="pclcModel" name="pclcModel"/>
							 -->
									<select id="pclcModel" name="pclcModel"
										style="width: 150px; text-align: center;"
										onchange="checkModel()"></select>
									<font color="red">*</font>
								</td>

								<!--
							<td width="150" align="right">是否已经装表:</td>
							<td align="left">
							<input id="pclcIfhas" name="pclcIfhas"/>
							<select id="pclcIfhas" style="width: 100px;">
								<option value="0" >没有</option>
								<option value="1">有</option>
							</select>
							  &nbsp;
							</td>
							  -->
								<td width="150" align="right">
									能源种类:
								</td>
								<td>
									<!-- 
							<input id="pclcEnergyType" name="pclcEnergyType"/>
							 -->
									<select id="pclcEnergyType" name="pclcEnergyType"></select>
									<font color="red">*</font>
								</td>
							</tr>
							<tr>
								<td width="150" align="right" id="pclcParentName5">
									父级:
								</td>
								<td>
									<input type="hidden" id="pclcParentId" name="pclcParentId" />
									<input id="pclcParentName" name="pclcParentName" disabled="disabled"/>
								</td>
								<td width="150" align="right">
									备注:
								</td>
								<td colspan="3" align="left">
									<textarea rows="3" cols="40" id="cdtBackups" name="cdtBackups"></textarea>
								</td>

							</tr>
						</table>
					</form>
				</div>
				<div>
					<table id="calData" style="height: 180px;"></table>
				</div>
			</div>
			<!-- 更新能耗负荷配置 -->
			<div id="divThemes2"
				style="display: none; text-align: center; padding: 5px;">
				<div>
					<form id="ff2" method="post">
						<table>
							<tr>
								<td width="150" align="right">
									企业:
								</td>
								<td>
									<input id="qyName2" name="qyName" disabled="disabled" />
								</td>
								<td width="150" align="right">
									计量终端柜编号:
								</td>
								<td>
									<input id="cdtTerminalName2" name="cdtTerminalName" />
									<font color="red">*</font>
								</td>
								<td width="150" align="right">
									计量终端编号:
								</td>
								<td>
									<input id="ctdCodes2" name="ctdCodes" style="float: left" />
									<font color="red">*</font>
								</td>
							</tr>
							<tr>
								<td width="100" align="right">
									计量终端回路名称:
								</td>
								<td>
									<input id="cdtMeasureLoop2" name="cdtMeasureLoop" />
								</td>
								<td width="150" align="right">
									计量终端初始值:
								</td>
								<td>
									<input id="cdtInitValue2" name="cdtInitValue" />

								</td>
								<td width="150" align="right">
									计量终端厂家:
								</td>
								<td>
									<input id="cdtTerminalIndustry2" name="cdtTerminalIndustry" />
								</td>
							</tr>
							<tr>
								<td width="150" align="right">
									计量终端出厂编号:
								</td>
								<td>
									<input id="cdtProductionCode2" name="cdtProductionCode" />
								</td>
								<td width="150" align="right">
									计量终端检定周期:
								</td>
								<td>
									<input id="cdtCheckPeriod2" name="cdtCheckPeriod" />&nbsp;月
									<font color="red">*</font>
								</td>
								<td width="150" align="right">
									下次检定日期:
								</td>
								<td>
									<input id="cdtNextCheckTime2" name="cdtNextCheckTime"
										class="easyui-datebox"
										data-options="formatter:myformatter,parser:myparser"
										style="width: 150px;" />
									<font color="red">*</font>
								</td>
							</tr>
							<tr>
								<td width="150" align="right">
									计量级别:
								</td>
								<td align="left">
									<select id="pclcCalculateBand2" name="pclcCalculateBand"
										style="width: 100px;">
										<option value="1">
											一级计量
										</option>
										<option value="2">
											二级计量
										</option>
										<option value="3">
											三级计量
										</option>
									</select>
									<font color="red">*</font>
									<!-- 
							<input id="pclcCalculateBand" name="pclcCalculateBand"/>
							 -->
								</td>
								<td width="150" align="right">
									计量表终端模型:
								</td>
								<td>
								<!--	
								<input id="pclcMode3" name="pclcMode3" disabled="disabled"/>
								 -->
									 <select id="pclcModel2" name="pclcModel"
										style="width: 150px; text-align: center;" disabled="disabled"
										onchange="checkModel()"></select>
									<font color="red">*</font>
								</td>
								<!--
							<td width="150" align="right">是否已经装表:</td>
							<td align="left">
							<input id="pclcIfhas" name="pclcIfhas"/>
							<select id="pclcIfhas" style="width: 100px;">
								<option value="0" >没有</option>
								<option value="1">有</option>
							</select>
							  &nbsp;
							</td>
							  -->
								<td width="150" align="right">
									能源种类:
								</td>
								<td>
									<!-- 
							<input id="pclcEnergyType" name="pclcEnergyType"/>
							 -->
									<select id="pclcEnergyType2" name="pclcEnergyType"></select>
									<font color="red">*</font>
								</td>
							</tr>
							<tr>
								<td width="150" align="right">
									父级:
								</td>
								<td>
									<input type="hidden" id="pclcParentId2" name="pclcParentId" />
									<input id="pclcParentName2" name="pclcParentName2" disabled="disabled"/>
								</td>
								<td width="150" align="right">
									备注:
								</td>
								<td colspan="3" align="left">
									<textarea rows="3" cols="40" id="cdtBackups3" name="cdtBackups"></textarea>
								</td>
							</tr>
						</table>
					</form>
				</div>
				<div>
					<table id="calData2" style="height: 180px;"></table>
				</div>
			</div>
			<div id="iframeDivId" style="display: none;">
				<iframe style="height: 460px; width: 885px;" scrolling="auto"
					frameborder="0" marginheight="0" id="iframe01" src=""></iframe>
			</div>
		</div>
	</body>
	<script type="text/javascript">
	
	function GetDataff(modelId){
		var args={};
		args.pageIndex=1;//页索引
		args.pageSize=10;//页容量
		args.modelId=modelId; //计量模型id
		BingData("#calData",args,"calculateTerminalDevice.action?m=getModelAndPoint",null);
		}
	var lastIndexOne;
	$('#calData').datagrid( {
		title : '测点信息配置',
		striped : true,
		fitColumns: true, //自适应列的大小
		pagination: true,
		height:300,
		rownumbers: false,
		singleSelect:true,//设置单选、多选。true单选，false 多选。
		columns : [[ {field : 'mmpOrders',title : '排序',width : 100},
		     		 {field : 'mmpCodes',title : '测点编码',width : 100},
					  {field : 'mmpNames',title : '测点名称',width : 100},
					  {field : 'mmpUnits',title : '测点单位',width : 100},
					  {field : 'mmpFormular',title : '测点公式',width : 100,editor:'text'},
					  {field : 'mmpIssave',title : '是否需要储存',width : 100,editor:'text'},
					  {field : 'mmpType',title : '测点类型',width : 100,editor:'text',formatter: function (value, rowData, rowIndex) {if (value==0) {return "模拟量";} else if(value=="1"){return "开关量";} }},
					  {field : 'mmpSaveInterval',title : '存储周期',width : 100,editor:'numberbox'},
					  {field : 'mmpSaveStyle',title : '存储方式',width : 100,editor:'text'},
					  {field : 'mmpStatisticType',title : '统计类型',width : 100,editor:'text',formatter: function (value, rowData, rowIndex) {if (value==0) {return "累计";} else if(value=="1"){return "瞬时";}else if(value=="2"){return "统计";}else if(value=="3"){return "状态";}else if(value=="4"){return "事件";}}},
					  {field : 'mmpUpValue',title : '上限',width : 100,editor:'numberbox'},
					  {field : 'mmpUperLine',title : '上上限',width : 100,editor:'numberbox'},
					  {field : 'mmpDownValue',title : '下限',width : 100,editor:'numberbox'},
					  {field : 'mmpDownerLine',title : '下下限',width : 100,editor:'numberbox'},
					  {field : 'mmpStandardVal',title : '标准值',width : 100,editor:'numberbox'},
					  {field : 'mmpBackups',title : '备注',width : 100,editor:'text'}
					   ] ],
		onClickRow:function(rowIndex){
		if (lastIndexOne != rowIndex){
		
			$('#calData').datagrid('endEdit', lastIndexOne);
			$('#calData').datagrid('beginEdit', rowIndex);
			 var row = $('#calData').datagrid('getSelected');
			
		}
		lastIndexOne = rowIndex;
	},
	//单击编码列
   onClickCell:function(rowIndex, field, value){
    var codeid=$("#codeid").val();
     if(field=="ctdpCodes"||field=="ctdpNames"){
    
        $("#divChedian").show();
        $.ajax({
			data:{"codeid":codeid},
		    type:'post',
		    dataType:"json",
        url:'CodeManagementAction.action?m=getCodebypid',
        success:function(data){
		    var num=1;
		$("#cedian").empty();
			$.each(data.lst, function(i,item) {    
		    var v = $("<div style='width:45%;float:left;'><input style='width:20px;float:left;' name='indury' type='radio' title='"+item.cmName+"'  value='"+item.cmCode+"'/>"+item.cmName+"</div>");
			if(num%2 == 0){
			v.append($("<br>"));
			}
			$("#cedian").append(v);
			num++;
			});
	 	 }
	});

        $("#divChedian").dialog({
		  title:'选择编码类型',
			  modal:true,
          draggable:true,
	      width:500,
		      height:500,
			  buttons:[{
	   	  text:'确定',
	   	  handler:function(){
	   	  var radiovalue=ShowTemp();
	 
	   	   var row = $('#ff').datagrid('getSelected');
	   	   row.ctdpCodes=radiovalue[1];
	   	   row.ctdpNames=radiovalue[0];
	   	  $('#calData').datagrid('refreshRow', rowIndex);
			  $('#divChedian').dialog('close');
 
 			}
			},{
		 	text:'取消',
			 handler:function(){
		 	$('#divChedian').dialog('close');
 	       }
 	    }]
  });
  
  
  $("#btnFind").click(function(){
		var cmName=$("#txtCode").val();
		var codeid=$("#codeid").val();
	    var row = $('#calData').datagrid('getSelected');



	$.ajax({
	 data:{"cmName":cmName,"codeid":codeid},
	 type:'post',
	 dataType:"json",
	 url:'CodeManagementAction.action?m=getCodeLikeName',
	 success:function(data){
	 var num=1;
 $("#cedian").empty();
 $.each(data.lst, function(i,item) {
	 var vs = $("<div style='display:block;width:45%;height:auto;float:left;'><input style='display:block;width:20px;float:left;' name='indury' title='"+item.cmName+"'  value='"+item.cmCode+"' type='radio'/>"+item.cmName+"</div>");
	 if(num%2 == 0){
		vs.append($("<br/>"));
	 }
	 $("#cedian").append(vs);
	 num++;
});


}


});
});
     }
}



					   
	});

	function GetDataff2(jlbid){
		var args={};
		//var jlbid=$('#jlbid').val();
		args.pageIndex=1;//页索引
		args.pageSize=10;//页容量
		args.jlbid=jlbid; //计量设备id
		BingData("#calData2",args,"calculateTerminalDevice.action?m=getCalculteParam",null);
		}
	//初始化table	
	var lastIndex;
	
	$('#calData2').datagrid( {
		title : '计量设备参数',
		iconCls:'icon-edit',
		striped : true,
		fitColumns: true, //自适应列的大小
		height:300,
		pagination: true,
		rownumbers: false,
		singleSelect:true,//设置单选、多选。true单选，false 多选。
		columns : [ [ 
		             {field : 'ctdpOrders',title : '排序',width : 100},
		     		 {field : 'ctdpCodes',title : '测点编码',width : 100},
					  {field : 'ctdpNames',title : '测点名称',width : 100},
					  {field : 'ctdpUnits',title : '测点单位',width : 100},
					  {field : 'ctdpFormular',title : '测点公式',width : 100,editor:'text'},
					  {field : 'ctdpIssave',title : '是否需要储存',width : 100,editor:'text'},
					  {field : 'ctdpType',title : '测点类型',width : 100,editor:'text',formatter: function (value, rowData, rowIndex) {if (value==0) {return "模拟量";} else if(value=="1"){return "开关量";} }},
					  {field : 'ctdpSaveInterval',title : '存储周期',width : 100,editor:'numberbox'},
					  {field : 'ctdpSaveStyle',title : '存储方式',width : 100,editor:'text'},
					  {field : 'ctdpStatisticType',title : '统计类型',width : 100,editor:'text',formatter: function (value, rowData, rowIndex) {if (value==0) {return "累计";} else if(value=="1"){return "瞬时";}else if(value=="2"){return "统计";}else if(value=="3"){return "状态";}else if(value=="4"){return "事件";}}},
					  {field : 'ctdpUpLine',title : '上限',width : 100,editor:'numberbox'},
					  {field : 'ctdpUperLine',title : '上上限',width : 100,editor:'numberbox'},
					  {field : 'ctdpDownLine',title : '下限',width : 100,editor:'numberbox'},
					  {field : 'ctdpDownerLine',title : '下下限',width : 100,editor:'numberbox'},
					  {field : 'ctdpStandardVal',title : '标准值',width : 100,editor:'numberbox'},
					 
					  {field : 'ctdpBackups',title : '备注',width : 100,editor:'text'}
					  
					  
				  ] ],
					toolbar:[{
						text:'保存',
						iconCls:'icon-save',
						handler:function(){
							$('#calData2').datagrid('acceptChanges');
							//获取datagrid中所有的数据
							var rowDatas = $("#calData2").datagrid("getRows");
							 var nodetree = $('#treegrid').treegrid('getSelected');
							//alert(row2.id);
							
							//var jlbid=$('#jlbid').val();
							$.each(rowDatas,function(i,item){
								$.ajax({
									url: "calculateTerminalDeviceParam.action?m=saveCalculteParam",
									type:"POST",
									dataType:"json",
									timeout: 10000,
									data:{
										"jlbid":nodetree.id,
										"paramId":item.id,
										"ctdpCodes":item.ctdpCodes,
										"ctdpNames":item.ctdpNames,
										"ctdpSymbols":item.ctdpSymbols,
										"ctdpUnits":item.ctdpUnits,
										"ctdpFormular":item.ctdpFormular,
										"ctdpIssave":item.ctdpIssave,
										"ctdpType":item.ctdpType,
										"ctdpSaveInterval":item.ctdpSaveInterval,
										"ctdpSaveStyle":item.ctdpSaveStyle,
										"ctdpStatisticType":item.ctdpStatisticType,
										"ctdpUpLine":item.ctdpUpLine,
										"ctdpUperLine":item.ctdpUperLine,
										"ctdpDownLine":item.ctdpDownLine,
										"ctdpDownerLine":item.ctdpDownerLine,
										"ctdpStandardVal":item.ctdpStandardVal,
										"ctdpOrders":item.ctdpOrders,
										"ctdpBackups":item.ctdpBackups
								
										}, success: function(data){
											if(data.flag == true){
											///alert("保存成功!");
											//alert(row2.id);
											//	GetDataff2();
										}
										
										}
								});
							});
							
						}
					},'-',{
						text:'删除',
						iconCls:'icon-remove',
						handler:function(){
						var row = $('#calData2').datagrid('getSelected');
						if (row){
							var index = $('#calData2').datagrid('getRowIndex', row);
							$.ajax({
								url: "calculateTerminalDeviceParam.action?m=delCalculteParam",
								type:"POST",
								dataType:"json",
								timeout: 10000,
								data:{
									"jlbidsb":row.id,
							
									}, success: function(data){
										if(data.flag == true){
										//alert("保存成功!");
											$('#calData2').datagrid('deleteRow', index);
									}
									
									}
							});
							
						}

							
						}
					}],
					onClickRow:function(rowIndex){
						//if (lastIndex != rowIndex){
						
							$('#calData2').datagrid('endEdit', lastIndex);
							$('#calData2').datagrid('beginEdit', rowIndex);
							 var row = $('#calData2').datagrid('getSelected');
							
						//}
						lastIndex = rowIndex;
					},
					//单击编码列
				   onClickCell:function(rowIndex, field, value){
				    var codeid=$("#codeid").val();
				     if(field=="ctdpCodes"||field=="ctdpNames"){
				    
				        $("#divChedian").show();
				        $.ajax({
           				data:{"codeid":codeid},
          			    type:'post',
          			    dataType:"json",
                        url:'CodeManagementAction.action?m=getCodebypid',
                        success:function(data){
           			    var num=1;
            			$("#cedian").empty();
              			$.each(data.lst, function(i,item) {    
             		    var v = $("<div style='width:45%;float:left;'><input style='width:20px;float:left;' name='indury' type='radio' title='"+item.cmName+"'  value='"+item.cmCode+"'/>"+item.cmName+"</div>");
             			if(num%2 == 0){
       					v.append($("<br>"));
       					}
       					$("#cedian").append(v);
       					num++;
             			});
         		 	 }
            		});
   
				        $("#divChedian").dialog({
	    				  title:'选择编码类型',
	     				  modal:true,
	                      draggable:true,
	    			      width:500,
	     			      height:500,
	   					  buttons:[{
					   	  text:'确定',
					   	  handler:function(){
					   	  var radiovalue=ShowTemp();
					 
					   	   var row = $('#ff').datagrid('getSelected');
					   	   row.ctdpCodes=radiovalue[1];
					   	   row.ctdpNames=radiovalue[0];
					   	  $('#calData2').datagrid('refreshRow', rowIndex);
		   	 			  $('#divChedian').dialog('close');
		   	  
		   	  			}
		     			},{
		   			 	text:'取消',
		   	 			 handler:function(){
		   	 		 	$('#divChedian').dialog('close');
		   	  	       }
		   	  	    }]
	              });
	              
	              
	              $("#btnFind").click(function(){
		       		var cmName=$("#txtCode").val();
		       		var codeid=$("#codeid").val();
		      	    var row = $('#calData2').datagrid('getSelected');
	         
	    
		   
		  		$.ajax({
          		 data:{"cmName":cmName,"codeid":codeid},
           		 type:'post',
           		 dataType:"json",
          		 url:'CodeManagementAction.action?m=getCodeLikeName',
          		 success:function(data){
     			 var num=1;
            	 $("#cedian").empty();
                 $.each(data.lst, function(i,item) {
               	 var vs = $("<div style='display:block;width:45%;height:auto;float:left;'><input style='display:block;width:20px;float:left;' name='indury' title='"+item.cmName+"'  value='"+item.cmCode+"' type='radio'/>"+item.cmName+"</div>");
             	 if(num%2 == 0){
       				vs.append($("<br/>"));
       			 }
             	 $("#cedian").append(vs);
             	 num++;
               });
        
             
              }
    
          
             });
		  });
				     }
				}
	});
	
	</script>
</html>