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
		<title>用能单位维护-能耗统计配置-用能系统</title>
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
				$('#MyTree').tree('options').url = 'Terminal.action?m=loadTreechild&id='+node.id+"&type="+node.attributes.type;
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
			BingData("#tabs_con", args, "Terminal.action?m=load_YnxtTabs", null);
	}   

	// Tabs      
	$(function() {
		//初始化table（用能系统）	
		$('#tabs_con').datagrid( {
			fitColumns : true, //自适应列的大小
			singleSelect : true,
			striped:true,
			pageList:[5,10,15],
			columns : [ [ {
				title : '重点用能设备名称',
				field : 'eusName',
				align : 'center',
				width : 100
			}, {
				title : 'ID',
				field : 'eusId',
				align : 'center',
				hidden : true ,
				width : 100
			},{
				title : '用能位置',
				field : 'eusOrder',
				align : 'center',
				width : 100
			},{
				title : '关联表计',
				field : 'eusBiaoJi',
				align : 'center',
				width : 200
			}, {
				title : '备注',
				field : 'eusBackups',
				align : 'center',
				width : 100
			}, {
				title : '父节点ID',
				field : 'eusParentId',
				align : 'center',
				hidden : true ,
				width : 100
			},{
				title : '企业名称',
				field : 'eusEnergyName',
				align : 'center',
				hidden : true ,
				width : 100
			},{
				title : '企业ID',
				field : 'eusEnergyId',
				align : 'center',
				hidden : true ,
				width : 100
			},{
				title : '父节点名称',
				field : 'eusParentName',
				align : 'center',
				hidden : true ,
				width : 100
			}] ],
				pagination : true,
				onClickRow:function(){  //查询出点击的对象。并把查出的信息放如文本框
					var row = $('#tabs_con').datagrid('getSelected');
					$('#eename').val(row.eusEnergyName);
					$('#eeid').val(row.eusEnergyId);
					$('#epname').val(row.eusParentName);
					$('#epid').val(row.eusParentId);
					$('#ename').val(row.eusName);
					$('#eorder').val(row.eusOrder);
					$('#ebackups').val(row.eusBackups);
					$('#ebiaoji').val(row.eusBiaoJi);
					$('#eid').val(row.eusId);
					$('#ebiaojiId').val(row.eusBiaoJiId);
					$('#xtModel').val(row.modelName);
				}			
		});
		GetData1();
	});
$(function() {
	//删除操作
	$('#deleteButton').click(function(){
		var row = $('#tabs_con').datagrid('getSelected');
		if(row==null){
			$.messager.alert("提示","选择一个用能系统再进行删除操作!");return false;
		}
		$.messager.confirm('提示','确定要删除"'+row.eusName+'"?',function(t){ 
			if(t){
				$.ajax({
		           url: "Terminal.action?m=Del_UsingSystem",
		           type:"POST",dataType:"json",
		           timeout: 1000,
		           data:{
		           		"eusid":row.eusId
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
				    url:"Terminal.action?m=UpdateOrSave_System",
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
			columns : [ [ {
				title : '全选',
				field : 'ck',
				align : 'center',
				checkbox:true,
				width : 100
			},{
				title : '回路名称',
				field : 'cdtName',
				align : 'center',
				width : 100
			},{
				title : '计量终端编号',
				field : 'cdtPN',
				align : 'center',
				width : 100
			},{
				title : '通讯协议功能FN',
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
			args.type=1;  //用能系统的类型
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
	
	//弹出选择系统模型窗口
	$('.XTClass').click(function(){
	          if($('#eename').val()=="" || $('#eename').val()==null){
			$.messager.alert("提示","必须是新增或者更新时才能做表计选择操作!");return false;
		}
	      $('.XTClass').focusout();
		$('#XTDiv').show();
		//GetData();
		$('#XTTab').datagrid( {
			fitColumns : true, //自适应列的大小
			striped:true,
			//checkOnSelect: true,
			singleSelect:true,
			columns : [ [
			// {
			//	title : '全选',
			//	field : 'ck',
			//	align : 'center',
			//	checkbox:true,
			//	width : 100
			//}
			//,
			{
				title : '用能系统模型名称',
				field : 'systemModelName',
				align : 'center',
				width : 100
			},{
				title : '用能系统类型',
				field : 'systemModelType',
				align : 'center',
				width : 100,
				formatter: function (value, rowData, rowIndex){
					 if (value=="1") {return "系统";} 
					 else if(value=="2"){return "设备";} 
				}
			},{
				title : '用能系统备注',
				field : 'systemModelBackups',
				align : 'center',
				width : 100
			} ] ],onLoadSuccess:function(data){      
				   if(data){
			   		  $.each(data.rows, function(index, item){
				  		 if(item.cdtchecked){
					  		$('#XTTab').datagrid('checkRow', index);
					  	 }
				 	  });
				   }
				},onDblClickRow:function(){
				 //   var row = $('#XTTab').datagrid('getSelected'); 
				    $('#XTCDiv').show();
				    $('#XTCTab').datagrid({
			fitColumns : true, //自适应列的大小
			striped:true,
			singleSelect:true,
			columns : [ [
			
			{
				title : '参数名称',
				field : 'modelParamName',
				align : 'center',
				width : 100
			},{
				title : '参数值',
				field : 'modelParamVal',
				align : 'center',
				width : 100
			},{
				title : '备注',
				field : 'modelParamBackups',
				align : 'center',
				width : 100
			} ] ],onLoadSuccess:function(data){      
				   if(data){
			   		  $.each(data.rows, function(index, item){
				  		 if(item.cdtchecked){
					  		$('#XTCTab').datagrid('checkRow', index);
					  	 }
				 	  });
				   }
				}
				    });
				    GetData();
		function GetData() {
			$("#XTCTab").datagrid("loadData", []);//清空tabs内容
			var args = {};
			if($('#eid').val()!=""){args.id=$('#eid').val();}
			var eid=$('#eeid').val();
			args.type=1;  //用能系统的类型
			args.pageIndex = 1;//页索引
			args.pageSize = 10;//页容量
			var xtmx = $('#XTTab').datagrid('getSelected');
			var idse = xtmx.id;			
			var name = $('#findCS').val();
			BingData("#XTCTab", args, "Terminal.action?m=load_CSTypeTabs&idse="+idse+"&findCS="+name, null);
		}
				  $('#XTCDiv').dialog({ 
		   	 	modal:true,
		   	 	draggable:false,
		   	 	buttons: [{
					text: '确定',
						handler: function() {
							var rows = $('#XTCTab').datagrid('getSelections');
					    	$('#XTCDiv').dialog('close');
						}
					},{
					text: '取消',
						handler: function() {
							$('#XTCDiv').dialog('close');
						}
					}
				] 
			});  
				}
		});
			GetData2();
		
		function GetData2(type,id) {
			$("#XTTab").datagrid("loadData", []);//清空tabs内容
			var args = {};
			if($('#eid').val()!=""){args.id=$('#eid').val();}
			var eid=$('#eeid').val();
			args.type=1;  //用能系统的类型
			args.pageIndex = 1;//页索引
			args.pageSize = 10;//页容量
			BingData("#XTTab", args, "Terminal.action?m=load_XTMOdelTabs&id="+eid, null);
		}
	 
				//显示添加系统模型窗口
		$('#XTDiv').dialog({ 
		   	 	modal:true,
		   	 	draggable:false,
		   	 	buttons: [{
					text: '确定',
						handler: function() {
							var rows = $('#XTTab').datagrid('getSelections');
							var modelid = "";
							var model = "";
					    	for(var i=0;i<rows.length;i++){
					    		modelid += rows[i].id;
					    		model += rows[i].systemModelName;
					    		if(i<rows.length-1){modelid += "#";}
					    		if(i<rows.length-1){model += ",";}
					    	}
					    	$('#xtModel').val(model);
					    	$('#xtModelId').val(modelid);
					    	$('#XTDiv').dialog('close');
						}
					},{
					text: '取消',
						handler: function() {
							$('#XTDiv').dialog('close');
						}
					}
				] 
			});   	
	
	
	});
	
	
});
   //添加
     $(function(){
         $('#addBt').click(function(){
           $('#addModel').show();
            $('#addModel').dialog({
				title:'新建系统名称',
				modal:true,
		   	 	draggable:true,
		   	 	buttons:[{
		   	 		text: '',
		   	 	    iconCls: 'icon-ok',
		   	 		handler:function(){
		   	 			$('#fmid').form({
		   	 				url:"Terminal.action?m=toAddModel",
		   	 				dataType:"json",async:false,
		   	 				success:function(data){
			   	 				if(data=="{}"){
									$.messager.alert("提示","添加失败");
				   	 			}else{
									$.messager.alert("提示","添加成功");
			   	 					$('#addModel').dialog('close');
			   	 					GetDatas();
				   	 			}
		   	 				}
		   	 			});
		   	 			$('#fmid').submit();
			   		}
		   	 	}]
			});
     });
  
     
    //修改
         $('#updaButton').click(function(){
            var row=$('#XTTab').datagrid('getSelected');
            if(row==null){
				$.messager.alert("提示","请选择一个'系统'再做修改操作!");return false;
			};
			//获取选中用户的信息
				$.ajax({
				url:"Terminal.action?m=toById",
				type:"POST",dataType:"json",
	           	timeout: 1000,
	           	data:{
	           		"id":row.id
	           	},
	           	success:function(data){
	           	var en = data.ppp;
	           
	        //	alert(en.eusNames);
	        //	alert(en.espParamVal);
	        //	alert(en.eusBackups);
	           	$('#cid2').val(en.id);
	           	$('#ynName2').val(en.systemModelName);
	           	$('#ynCode2').val(en.systemModelType);
	           	$('#cbackup2').val(en.systemModelBackups);
	          // 	alert(en.eusNames);
	           	}
         });
         $('#upModel').show();
         	$('#upModel').dialog({
				title:'修改系统模型',
				modal:true,
		   	 	draggable:true,
		   	 	buttons:[{
		   	 		text: '',
		   	 		iconCls: 'icon-ok',
		   	 		handler:function(){
						$('#Upfmid').form({
							url:"Terminal.action?m=toUpdateModel",
							dataType:"json",async:false,
						//	onSubmit: function(){  
					        //进行表单验证  
					     //   	if($.trim($('#ynName2').val())==""){$.messager.alert("提示","编码不能为空!");$('#ccode2').focus();return false;}
					    //	    if($.trim($('#ynCode2').val())==""){$.messager.alert("提示","名称不能为空!");$('#cname2').focus();return false;}
					    		//if($.trim($('#cbackup2').val())==""){$.messager.alert("提示","类型不能为空!");$('#ctype2').focus();return false;}
					   	//	},
							success:function(data){
							//alert(data)
								if(data=="{}"){
									$.messager.alert("提示","修改失败!");
								}else{
									$.messager.alert("提示","修改成功!");
			   	 					$('#upModel').dialog('close');
			   	 					GetDatas();
								}
		   	 				}
						});
							//GetData();
						$('#Upfmid').submit();
		   	 		}
		   	 	}]
		   	 });
         
     });
            //删除
           $('#deleteBt').click(function(){
                  var row1=$('#XTTab').datagrid('getSelected');
                  var pid=row1.id;
                  //alert(pid);
                  if(row1==null){
                     $.messager.alert("提示","请选择一个系统模型");return false;
                  };
                
                  $.ajax({
                  	url:"Terminal.action?m=toDeleteModel",
						type:"POST",dataType:"json",
			           	timeout: 1000,
			           	data:{
			           		"id":pid
			           	},
			           	success:function(data){
			           
					         	if(data=="0"){
								$.messager.alert('提示','当前系统模型含有参数,请先删除参数!','warning');
								return ;
								}else if(data=="1"){
								$.messager.alert('提示','删除成功!','warning');
								 GetDatas();
								}else if(data=="2"){
								$.messager.alert('提示','删除失败!','warning');
								return ;
								}
					         	 GetDatas();
				        }
                  
                  });
                 
              
    
                 
           });  
           //查询
           $('#findButton').click(function(){  
           	$("#XTTab").datagrid("loadData",[]);
           
           GetDatas();
          	$('#findModel').val("");
           });
           GetDatas();
           	//模型
  	function GetDatas(){
		BingData("#XTTab",null,"Terminal.action?m=toFindModelMo&findModel="+$('#findModel').val());
	}

	 //参数类型添加
    $('#addBt1').click(function(){
        $('#addCS').show();
         $('#addCS').dialog({
				title:'新建参数类型',
				modal:true,
		   	 	draggable:true,
		   	 	buttons:[{
		   	 		text: '',
		   	 	    iconCls: 'icon-ok',
		   	 		handler:function(){
			   	 		var node =$("#XTTab").datagrid("getSelected");
			   	 		var pid = node.id;
		   	 			$('#CSfmid').form({
		   	 				url:"Terminal.action?m=toAddCSType&pid="+pid,
		   	 				dataType:"json",async:false,
		   	 				onSubmit: function(){  
								   //进行表单验证  
						       
							         if($('#espParamVal').val()!=""){
							        	 var strP=/^\d+$/; 
				                var v=$('#espParamVal').val();
				                var ss =strP.test(v);
				                if(ss==false){
					            $.messager.alert('提示','参数值请输入数字!',"warning",null);
					            return false;
				                }
							         } 
     
						         },success:function(data){
			   	 				if(data=="{}"){
									$.messager.alert("提示","添加失败");
				   	 			}else{
									$.messager.alert("提示","添加成功");
			   	 					$('#addCS').dialog('close');
			   	 					GetDatass();
				   	 			}
		   	 				}
		   	 			});
		   	 			$('#CSfmid').submit();
			   		}
		   	 	}]
			});
  });

    //修改参数类型
    $('#updaButton1').click(function(){
       var row=$('#XTCTab').datagrid('getSelected');
       //alert(row.espParamName);
     //  alert(row.id);
       if(row==null){
			$.messager.alert("提示","请选择一个'参数'再做修改操作!");return false;
		};
		//获取选中用户的信息
			$.ajax({
			url:"Terminal.action?m=toCSById",
			type:"POST",dataType:"json",
          	timeout: 1000,
          	data:{
          		"ids":row.id
          	},
          	
          	success:function(data){
          	var en = data.pp;
          	$('#CScid2').val(en.id);
          	$('#EnerSysiD2').val(en.pomsEnergyUsingSystemModel.id);
          	$('#espParamName2').val(en.modelParamName);
          	$('#espParamVal2').val(en.modelParamVal);
          	$('#espBackups2').val(en.modelParamBackups);
          	//alert(en.espBackups);
          	}
    });
    $('#upCSType').show();
    	$('#upCSType').dialog({
			title:'修改参数类型',
			modal:true,
	   	 	draggable:true,
	   	 	buttons:[{
	   	 		text: '',
	   	 		iconCls: 'icon-ok',
	   	 		handler:function(){
					$('#UpCSfmid').form({
						url:"Terminal.action?m=toUpdateCS",
						dataType:"json",async:false,
					//	onSubmit: function(){  
				        //进行表单验证  
				     //   	if($.trim($('#ynName2').val())==""){$.messager.alert("提示","编码不能为空!");$('#ccode2').focus();return false;}
				    //	    if($.trim($('#ynCode2').val())==""){$.messager.alert("提示","名称不能为空!");$('#cname2').focus();return false;}
				    		//if($.trim($('#cbackup2').val())==""){$.messager.alert("提示","类型不能为空!");$('#ctype2').focus();return false;}
				   	//	},
				   	onSubmit: function(){  
								   //进行表单验证  
						       
							         if($('#espParamVal2').val()!=""){
							        	 var strP=/^\d+$/; 
				                var v=$('#espParamVal2').val();
				                var ss =strP.test(v);
				                if(ss==false){
					            $.messager.alert('提示','参数值请输入数字!',"warning",null);
					            return false;
				                }
							         } 
     
						         },
						success:function(data){
						//alert(data)
							if(data=="{}"){
								$.messager.alert("提示","修改失败!");
							}else{
								$.messager.alert("提示","修改成功!");
		   	 					$('#upCSType').dialog('close');
		   	 					GetDatass();
							}
	   	 				}
					});
						//GetData();
					$('#UpCSfmid').submit();
	   	 		}
	   	 	}]
	   	 });
    
});
    //删除参数类型
    $('#deleteBt1').click(function(){
           var row1=$('#XTCTab').datagrid('getSelected');
           var pid=row1.id;
           //alert(pid);
           if(row1==null){
              $.messager.alert("提示","请选择一个系统模型");return false;
           }; 
           $.ajax({
           	url:"Terminal.action?m=toDeleteCSType",
					type:"POST",dataType:"json",
		           	timeout: 1000,
		           	data:{
		           		"id":pid
		           	},
		           	success:function(data){
				         	if(data!=null){
			//	           	alert(data.Nlx);
				        }
				       	 GetDatass();
			        }
           
           });
          
       

          
    }); 
    $('#findButton1').click(function(){  
       	$("#XTCTab").datagrid("loadData",[]);
        GetDatass();
        $('#findCS').val("");
        });
        GetDatass();
        	//模型
	function GetDatass(){
	//	var args={};
	//	args.name=$("#name").val()
	//	args.types=$("#types").val();
	//	args.pageIndex=1;//页索引
	//	args.pageSize=5;//页容量为5
		var xtmx = $('#XTTab').datagrid('getSelected');
		var idse = xtmx.id;		
//		BingData("#XTCTab",null,"Terminal.action?m=toFindCSType&idse="+idse+"&findCS="+$('#findCS').val());
		BingData("#XTCTab",null,"Terminal.action?m=load_CSTypeTabs&idse="+idse+"&findCS="+$('#findCS').val());
	}
   
 
     
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
					<ul><li class="licss limov"><input type="button" value="用能系统信息" id="libtn1" class="liimgcss liimgcssmoren"/></ul>
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
							<td><font  class="font_cg">重点用能设备名称：</font></td>
							<td><input id="ename" name="eusName"/></td>
							<td><font  class="font_cg">用能位置：</font></td>
							<td><input id="eorder" name="eusOrder"/></td>
						</tr>
						<tr>
							<td><font  class="font_cg">关联表计：</font></td>
							<td>
								<input id="ebiaoji" name="eBiaoJi" class="BJClass" type="text" readonly="readonly"/>
								<input id="ebiaojiId" name="eBiaoJiId" class="BJClass" type="hidden" />
							</td>
							<td><font  class="font_cg">选择系统模型：</font></td>
							<td><input id="xtModel" name="xtModel" class="XTClass" readonly="readonly"/></td>
							<input id="xtModelId" name="xtModelId" class="XTClass" type="hidden"/>
						</tr>
						<tr>
							<td><font  class="font_cg">备注：</font></td>
							<td colspan="3">
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
				<div id="XTDiv" title="选择系统模型"  style="width:800px;height:380px;display: none;">
					<div  align="right" >&nbsp; 
					用能系统名称:<input id="findModel" name="findModel" type="text">
					<input align="right" type="button" value="查询" class="btnClass" id="findButton"/>
					<input align="right" type="button" value="新建" class="btnClass" id="addBt"/>
					<input align="right" type="button" value="修改" class="btnClass" id="updaButton"/>
					<input align="right" type="button" value="删除" class="delClass" id="deleteBt"/>
				</div>
				  <table id="XTTab"></table>
				</div>
				<div id="XTCDiv" title="参数类型"  style="width:550px;height:300px;display: none;">
				     	<div  align="right" >&nbsp; 
					参数名称:<input id="findCS" name="findCS" type="text">
					<input align="right" type="button" value="查询" class="btnClass1" id="findButton1"/>
					<input align="right" type="button" value="新建" class="btnClass1" id="addBt1"/>
					<input align="right" type="button" value="修改" class="btnClass1" id="updaButton1"/>
					<input align="right" type="button" value="删除" class="delClass1" id="deleteBt1"/>
				</div>
				  <table id="XTCTab"></table>
				</div>
				<!-- 新增系统模型 -->
				<div id="addModel"style="width: 500px; height: 320px; display: none;" >
				    <form id="fmid" method="post"><br/><br/>
				      <table id="addModeTable" align="center" width="300">
				        <tr><td><input type="hidden" id="cid" name="cid" class="easyui-validatebox" /></td></tr>
	        	 		<tr><td class="font_cg">用能系统名称:</td>
	        	 			<td><input type="text" id="ynName" name="ynName" class="easyui-validatebox" /></td>
	        	 		</tr>
	        	 		<!--  <tr><td class="font_cg">用能系统类型 :</td>
	        	 			<td><input type="text" id="ynCode" name="ynCode" class="easyui-validatebox" /></td>
	        	 		</tr>-->
	        	 		<tr>
	        	 		<tr><td class="font_cg">用能系统类型 :</td>
	        	 		<td >
							    <select    id="ynCode" name="ynCode" class="easyui-validatebox">
							     <option value="1">系统</option>
							     <option value="2">设备</option>
							    </select>
							   				    
							</td>
	        	 		</tr>
	        	 	     <tr>
	        	 			<td class="font_cg">用能系统备注:</td>
	        	 			<td><textarea rows="4" cols="20" id="cbackup" name="cbackup"></textarea></td>
	        	 		</tr>
				      </table>
				    </form>
				</div>
				<!--修改系统模型 -->
				<div id="upModel"style="width: 500px; height: 320px; display: none;" >
				    <form id="Upfmid" method="post"><br/><br/>
				      <table id="upModeTable" align="center" width="300">
				        <tr><td><input type="hidden" id="cid2" name="cid2" class="easyui-validatebox" /></td></tr>
	        	 		<tr><td class="font_cg">用能系统名称:</td>
	        	 			<td><input type="text" id="ynName2" name="ynName2" class="easyui-validatebox" /></td>
	        	 		</tr>
	        	 		<!--  <tr><td class="font_cg">用能系统类型 :</td>
	        	 			<td><input type="text" id="ynCode2" name="ynCode2" class="easyui-validatebox" /></td>
	        	 		</tr>-->
	        	 		<tr>
	        	 		<tr><td class="font_cg">用能系统类型 :</td>
	        	 		<td >
							    <select    id="ynCode2" name="ynCode2" class="easyui-validatebox">
							      <option value="1">系统</option>
							     <option value="2">设备</option>
							    </select>
							   				    
							</td>
	        	 		</tr>
	        	 	     <tr>
	        	 			<td class="font_cg">用能系统备注:</td>
	        	 			<td><textarea rows="4" cols="20" id="cbackup2" name="cbackup2"></textarea></td>
	        	 		</tr>
				      </table>
				    </form>
				</div>
				<!-- 新增参数类型 -->
				<div id="addCS"style="width: 500px; height: 320px; display: none;" >
				    <form id="CSfmid" method="post"><br/><br/>
				      <table id="addCSTable" align="center" width="300">
				        <tr><td><input type="hidden" id="CScid" name="CScid" class="easyui-validatebox" /></td></tr>
	        	 		<tr><td class="font_cg">参数名称:</td>
	        	 			<td><input type="text" id="espParamName" name="espParamName" class="easyui-validatebox" /></td>
	        	 		</tr>
	        	 		<tr><td class="font_cg">参数值 :</td>
	        	 			<td><input type="text" id="espParamVal" name="espParamVal" class="easyui-validatebox" /></td>
	        	 		</tr>
	        	 	     <tr>
	        	 			<td class="font_cg">备注:</td>
	        	 			<td><textarea rows="4" cols="20" id="espBackups" name="espBackups"></textarea></td>
	        	 		</tr>
				      </table>
				    </form>
				</div>
				<!--修改参数类型 -->
				<div id="upCSType"style="width: 500px; height: 320px; display: none;" >
				    <form id="UpCSfmid" method="post"><br/><br/>
				      <table id="upCSTypeTable" align="center" width="300">
				        <tr><td><input type="hidden" id="CScid2" name="CScid2" class="easyui-validatebox" /></td></tr>
				        <tr><td><input type="hidden" id="EnerSysiD2" name="EnerSysiD2" class="easyui-validatebox" /></td></tr>
	        	 		<tr><td class="font_cg">参数名称:</td>
	        	 			<td><input type="text" id="espParamName2" name="espParamName2" class="easyui-validatebox" /></td>
	        	 		</tr>
	        	 		<tr><td class="font_cg">参数值 :</td>
	        	 			<td><input type="text" id="espParamVal2" name="espParamVal2" class="easyui-validatebox" /></td>
	        	 		</tr>
	        	 	     <tr>
	        	 			<td class="font_cg">备注:</td>
	        	 			<td><textarea rows="4" cols="20" id="espBackups2" name="espBackups2"></textarea></td>
	        	 		</tr>
				      </table>
				    </form>
				</div>
			</div>
		</div>
	</body>
</html> 	
