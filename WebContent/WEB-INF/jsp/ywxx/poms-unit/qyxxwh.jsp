<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="utf-8"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
		<script type="text/javascript" src="/emcc-web/js/other.js"></script> 
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
			src="/emcc-web/component/jquery-easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript"> 
 	
 	 $(function(){ 
	     InitTreeData();
	     
	    //点击区县,行业触发 
	    $(".code").click(function(){   
	       var type=$(this).attr("id");
	         $.ajax({
	           data:{"type":type},
	           type:'post',
	           dataType:"json",
	           url:'CodeManagementAction.action?m=getCodeByParentId',
	           success:function(data){
	           $("#tb").show();
	          		InitCompanyTreeData(type);	//行业树
			           /*var num = 1;
			           $("#tb").empty();
			             $.each(data.lst, function(i,item) {
			             	var input = $("<span style='display:block;width:50%;float:left;'><input style='display:block;width:20px;float:left;' name='indury' type='radio' value='"+item.cmCode+"' title='"+item.cmName+"'  />"+item.cmName+"</span>");
			       			
			       			if(num%2 == 0){
			       				input.append($("<br>"));
			       			}
			       			$("#tb").append(input);
			       			num++;
			             });*/
	           }
	         });
	       var t="#"+type;
	       var v= t.split("1"); 
	       $("#Divindustryinvolved").show(); 
	       $("#Divindustryinvolved").dialog({
	              title:'选择行业', 
			      modal:true,
			      width:450,
			   	  draggable:false,
			   	  buttons:[{
			   	  text:'确定',
			   	  handler:function(){
			   	  var radioValue = ShowTemp();
				  $(t).attr("value",radioValue[0]); 
			      $(v[0]).attr("value",radioValue[1]); 
			   	  $('#Divindustryinvolved').dialog('close');
			   	  } 
			   	  },{
			   	  text:'取消',
			   	  handler:function(){
			   	  $('#Divindustryinvolved').dialog('close');
			   	  }
			   	  }]
	        });
	    }); 
	  
	    //加载行业树
	    function InitCompanyTreeData(type) {
	    	if(type=='euiBelongIndustry1'){
		    	$.ajax({
		           type:'post',
		           dataType:"json",
		           url:'CodeManagementAction.action?m=getCompanys',
		           success:function(data){
				       var pid =  data.cmid;
						$('#MyCompanyTree').tree({
							url : 'toCodes.action?m=load_CodeTrees&pid='+ pid,
							checkbox : false,
							animate : true,
							onBeforeExpand : function(node) {				
								$('#MyCompanyTree').tree('options').url = 'toCodes.action?m=load_CodeTrees&pid='+ node.id;
							},
							onClick:function(node){//单击某个树节点,对应的Tabs发生数据变化+
								var tname = node;
								findCodeByN(node);
					        }
					});
		           }
		         });
	    	}else if(type=='euiBelongDistrct1'){
	    		$.ajax({
		           type:'post',
		           dataType:"json",
		           url:'CodeManagementAction.action?m=getDisptch',
		           success:function(data){
				       var pid =  data.cmid;
						$('#MyCompanyTree').tree({
							url : 'toCodes.action?m=load_CodeTrees&pid='+ pid,
							checkbox : false,
							animate : true,
							onBeforeExpand : function(node) {				
								$('#MyCompanyTree').tree('options').url = 'toCodes.action?m=load_CodeTrees&pid='+ node.id;
							},
							onClick:function(node){//单击某个树节点,对应的Tabs发生数据变化+
								var tname = node;
								findCodeByM(node);
					        }
					});
		           }
		         });
	    	}
	    	
		}
	    function findCodeByN(node){
			//document.getElementById('euiBelongIndustry1').innerText=node.text;
			$("#euiBelongIndustry1").val(node.text);
			var codeN = node.text;
			$.ajax({
	           type:'post',
	           dataType:"json",
	            data:{"codeN":codeN},
	           url:'enegryUnit.action?m=findCodeByN',
	           success:function(data){
      				$("#euiBelongIndustry").val(data.code);
					//document.getElementById('euiBelongIndustry').innerText=data.code;
	           }
	         });
	    }
	    function findCodeByM(node){
			$("#euiBelongDistrct1").val(node.text);
			//document.getElementById('euiBelongDistrct1').innerText=node.text;
			var codeN = node.text;
			$.ajax({
	           type:'post',
	           dataType:"json",
	            data:{"codeN":codeN},
	           url:'enegryUnit.action?m=findCodeByN',
	           success:function(data){
	            	$("#euiBelongDistrct").val(data.code);
					//document.getElementById('euiBelongDistrct').innerText=data.code;
	           }
	         });
	    }
	    
	    
	    //获取选中的radio值
function ShowTemp()
{
	var complete=new Array(2);
   	var eless = document.getElementsByName("indury");
   
   	for(var i=0;i<eless.length;i++)
   	{
    	if(eless[i].checked){
     		complete[0]=eless[i].attributes["title"].value
     		complete[1]=eless[i].value
     		//alert(complete[1]);

     		break;
    	}
   	}
   	return complete;
}



	
	   $("#dataDiv :text").attr("disabled","disabled");
	   $("#euiConsumeBand").attr("disabled","disabled");      
  	
	 	$("#addButton").click(function(){
	 	    $("#btnType").val("add");
            var node =$("#MyTree").tree('getSelected'); //当前选中节点
           // $('#parentName').val(node.parentName);
           
           // if(node ==null){
            //	$.messager.alert('提示',"请选择节点!",'question');
              //  return;
             // }else{
                  //alert($('#treeid').val());
            	  $("#dataDiv :text").removeAttr("disabled");
            	   $("#euiConsumeBand").removeAttr("disabled");
            	   $("#euiBackups").removeAttr("disabled");
            	 // $('#parentName').val("");
            	  //$('#parentName').val($('#treename').val());
            	  //$("#parentName").attr("disabled","disabled"); 
            	  $('#parentName1').attr('style','display:none');
                 $('#parentName2').attr('style','display:none');
				//test
				
      			$('#euiCode').val("");
				$('#euiNames').val("");
				$('#euiRepresentative').val("");
				$('#euiBelongIndustry').val("");
				$('#euiBelongDistrct').val("");
				$('#euiConsumeBand').val("");
				$('#euiLocation').val("");
				$('#euiContentWay').val("");
				$('#euiBuildingArea').val("");
				$('#euiHoldPerson').val("");
				$('#euiChargeDepartment').val("");
				
                
				$('#euiBelongIndustry1').val("");
				$('#euiBelongDistrct1').val("");
				$('#euiConsumeBand').val("");
				$('#euiBackups').val("");
				
  				
              //}
              
  				//$('#form1').form('clear');//清空表单
  				
		});
		
		
		
     //修改按钮
     $("#btnupdate").click(function(){
      var node =  $("#MyTree").tree('getSelected'); 
      
      if(node==null){
        alert("请先选择一个企业");
      }else{
          $("#euiBackups").removeAttr("disabled");
          $("#btnType").val("update");
          $("#dataDiv :text").removeAttr("disabled");
	      $("#euiConsumeBand").removeAttr("disabled");  
          $("euiBackups").removeAttr("disabled");  
      }
     
     

 
     });
		

	 	
	 	$("#deleteButton").click(function(){
            var node =$("#MyTree").tree("getSelected"); //当前选中节点
            var eid=$('#treeid').val();
           
            if(node ==null){
            	$.messager.alert('提示',"请选择节点!",'question');
                	return;
                }
        	$.messager.confirm('提示','确定删除?',function(r){  
			    if (r){  
			        //alert('ok');  
		             $.ajax({
			            data:{"eid":eid}, async:true,
			 		    url:'enegryUnit.action?m=deleteEnegryInfo', //提交给哪个执行  
			 		    
			 		    success:function(data){
							if(data=="0"){
								$.messager.alert('提示','当前企业含有子企业,请先删除子企业!','warning');
								return ;
								}else if(data=="1"){
									$.messager.alert('提示','删除成功!','info');
									$('#treeid').val("");
									InitTreeData();
									
									$('#form1').form('clear');//清空表单
								}else if(data=="3"){
									$.messager.alert('提示','请先删除该企业的采集器','warning');
									return;
								}else if(data=="4"){
									$.messager.alert('提示','请先删除该企业的的员工','warning');
									return;
								}
							
								
								else if(data=="2"){
									//alert('删除失败!');
									$.messager.alert('提示','删除失败','warning');
									return ;
								 
								}
			 		    }  
			 		});
			    	
			    }else{
					//alert("Cancel");
					return ;
				}  
			}); 
        	
		});
			
	 
           

	 	//保存按钮
	     $('#saveButton').click(function(){
	    	 var btntype=$("#btnType").val();
	    	
	    	var euiId=$("#euiId").val(); 
	    	 var eid=$('#treeid').val();
	    	 var disa =$("#dataDiv :text").attr("disabled");
	    	 if(disa=="disabled"){
				//alert('dd');
				return ;
		     }
	    	 
	    	 var strP=/^\d+$/;
	    	 if($('#euiCode').val()==""){$.messager.alert('提示','单位编码不能为空!','info'); return ;};
	    	 if($('#euiNames').val()==""){$.messager.alert('提示','单位名称不能为空!','info'); return ;};
	    	 if($('#euiRepresentative').val()==""){$.messager.alert('提示','法人代表不能为空!','info'); return ;};
	    	 //if($('#euiBelongIndustry1').val()==""){$.messager.alert('提示','所属行业不能为空!','info'); return ;};
	    	 //if($('#euiBelongDistrct1').val()==""){$.messager.alert('提示','所属区县不能为空!','info'); return ;};
	    	 //if($('#euiConsumeBand').val()==""){$.messager.alert('提示','能耗等级不能为空!','info'); return ;};
	    	if($('#euiContentWay').val()!=""){
	    			if(strP.test($('#euiContentWay').val())==false){$.messager.alert('提示','联系方式请输入数字!','info'); return ;};
	    		
	    	}
	    	 
	    	 
	    	 //if($('#euiBuildingArea').val()==""){
   	   			//$.messager.alert('提示','建筑面积不能为空!','info');
   	   			 //return ;
   	   		//}else {
   	   	   		
				
				var strP=/^\d+$/; 
				var v=$('#euiBuildingArea').val();
				var ss =strP.test(v);
				//if(ss==false){
					///$.messager.alert('提示','建筑面积请输入数字!','info');
					//return ;
				//}
   	   	   	//}

   			//if($('#euiHoldPerson').val()==""){
   	   			//$.messager.alert('提示','容纳人数不能为空!','info');
   	   			 ///return ;
   	   		//}else {
   	   	   		
				
				var strP=/^\d+$/; 
				var v=$('#euiHoldPerson').val();
				var ss =strP.test(v);
				//if(ss==false){
				///	$.messager.alert('提示','容纳人数请输入数字!','info');
				//	return ;
				//}
   	   	   //	}
   	   	   	
   	   	   	//if(strP.test($('#euiContentWay').val())==false){$.messager.alert('提示','联系方式请输入数字!','info'); return ;};
   	   	   	
   			//if($('#euiChargeDepartment').val()==""){$.messager.alert('提示','节能主管部门不能为空!','info'); return ;};
   			
   			
   			
   			 if("add"==btntype){
   			//  var node =$("#MyTree").tree('getSelected'); //当前选中节点
   			 // $('#parentName').val(node.parentName);
	    	    $('#form1').form('submit',{
	 		    url:'enegryUnit.action?m=saveEnegryInfo&eid='+eid, //提交给哪个执行  
	 		    onSubmit: function(){  
	 		        //进行表单验证  
	 		        //如果返回false阻止提交  
	 		    },  
	 		    success:function(data){  
					if(data){
							$.messager.alert('提示','添加成功!','info');
							 InitTreeData();//刷新树结构
						}else{
							$.messager.alert('提示','添加失败','warning');
						}
	 		          
	 		    }  
	 		});
	    	    
	     }else if("update"==btntype){
	    	  
	    	     $('#form1').form('submit',{
	 		     url:'enegryUnit.action?m=updateEnegryUints&eid='+euiId,
	 		     onSubmit: function(){  
	 		        //进行表单验证  
	 		        //如果返回false阻止提交  
	 		    },   //提交给哪个执行  
	 		   	 		    success:function(data){  
					if(data){
							$.messager.alert('提示','修改成功!','info');
							 InitTreeData();//刷新树结构
						}else{
							$.messager.alert('提示','修改失败','warning');
						}
	 		          
	 		    }  
	 		});
	    	 }
   			
   			
   				     
	    	// $("#dataDiv :text").attr("disabled","disabled");//文本框禁用
	    	 $('#form1').form('clear');
	      });
	 });
	 


     function InitTreeData()
     {
    
      	$('#MyTree').tree({
          url:'enegryUnit.action?m=getAllEnegryInfo',
          checkbox:false,
          animate:true,
          onBeforeExpand:function(node){
          	//alert(node.id);
          	 $('#MyTree').tree('options').url = 'enegryUnit.action?m=getChildEnegryInfo&eid=' + node.id;
          },
          onClick:function(node){//单击某个树节点,对应的Tabs发生数据变化
        	 $("#dataDiv :text").attr("disabled","disabled");
             //$("#dataDiv :text").val('');
            // $('#euiConsumeBand').val('');
             
             
      
             
             
        	 // alert($("#dataDiv :text").attr("disabled"));
        	 $("#euiConsumeBand").attr("disabled","disabled");
        	 $("#euiBackups").attr("disabled","disabled");
        	  $('#treeid').val(node.id);
        	  $('#treename').val(node.text);
        	  
        	 
        	 // alert(node.text);
        	  var args={};
        	  args.enegryId=node.id;
        	  $.ajax({
        			url: "enegryUnit.action?m=getEnegryInfo" ,
        			type:"POST",
        			async:true,
        			dataType:"json",
        			data: args,
        			success: function(data){
      					
						//alert(data.eneUnit.id);
						$('#euiId').val(data.eneUnit.id);
						
						if(data.eneUnit.euiParentid=="ROOT"){
							 $('#parentName2').attr('style','display:none');
							 $('#parentName1').attr('style','display:none');
						}else{
							$('#parentName2').attr('style','display::block');
							$('#parentName1').attr('style','display::block');
						$('#parentName').val(data.eneUnit.parentName);	
						}
						//$('#parentName').val(data.eneUnit.parentName);	
						//alert(data.eneUnit.euiParentid)
						$('#euiCode').val(data.eneUnit.euiCode);
						$('#euiNames').val(data.eneUnit.euiNames);
						$('#euiRepresentative').val(data.eneUnit.euiRepresentative);
						
						$('#euiBelongIndustry').val(data.eneUnit.euiBelongIndustry);
						$('#euiBelongIndustry1').val(data.eneUnit.euiBelongIndustry1);
						//alert(data.eneUnit.euiBelongIndustry);
						
						$('#euiBelongDistrct').val(data.eneUnit.euiBelongDistrct);
						$('#euiBelongDistrct1').val(data.eneUnit.euiBelongDistrct1);
							//alert(data.eneUnit.euiBelongDistrct);
						
						$('#euiConsumeBand').val(data.eneUnit.euiConsumeBand);
						$('#euiLocation').val(data.eneUnit.euiLocation);
						$('#euiContentWay').val(data.eneUnit.euiContentWay);
						$('#euiBuildingArea').val(data.eneUnit.euiBuildingArea);
						$('#euiHoldPerson').val(data.eneUnit.euiHoldPerson);
						$('#euiChargeDepartment').val(data.eneUnit.euiChargeDepartment);
						$('#euiBackups').val(data.eneUnit.euiBackups);

        			}
        			}); 
        	  
          }
        });
     }

 

     </script>
<body style="font-size: 12px;">
<div id="main" class="rywh_main" style="margin-left: -7px;">
			<div id="rywh_left">
				<div class="yhgltreeDiv" align="left">
					<ul class="easyui-tree" style="margin-left: 3px" id="MyTree">
					</ul>
				</div>
				
			</div>
			
			
			
			
			<div id="rywh_right" style="width: 1040px;">
				<div id="rywh_right_top" align="left">
					<br />
					<span style="width: 30px;padding: 25px">
						<font class="font_cg"></font>
					</span>
					<input type="button" value="保存"  class="btnClass" id="saveButton" />&nbsp;&nbsp;&nbsp;
					<input type="button" id="addButton" value="增加"  class="btnClass" />
					 <input id="btnupdate" type="button" value="修改"  class="btnClass"/> 
					 <input type="hidden" id="btnType" value=""/>
					<input type="button" id="deleteButton" value="删除" class="delClass" />
					<input type="hidden"  id="treeid"/>
					<input type="hidden"  id="treename"/>
				</div>
				<br />
				
				<div id="Divindustryinvolved" style="display: none;width:450px;height:300px;">
				      <div id="tb">
				           <ul class="easyui-tree" style="margin-left: 3px" id="MyCompanyTree">
							</ul>
				      </div>
				</div>
				
				<div id="dataDiv" style="margin-left: 50px;">
				<form id="form1" name="form1" method="post">
					<table>
						<tr>
							<td width="80px">单位编码:</td>
							<td width="220px"><input type="text" id="euiCode" name="euiCode"  />
							<font color="red">*</font></td>
							<td id="parentName1" >父单位名称:</td>
							<td id="parentName2"><input type="text" id="parentName"   name="parentName" readonly="readonly"/>
							  <input type="hidden" id="euiId" name="euiId"> 
							  
							</td>	
													
						</tr>
						<tr>
							<td >单位名称:</td>
							<td ><input type="text" id="euiNames"  name="euiNames" />
							<font color="red">*</font></td>							
							<td>法人代表:</td>
							<td><input type="text" id="euiRepresentative" name="euiRepresentative"  />
							<font color="red">*</font></td>
						</tr>
						<tr>
							<td>所属行业:</td>
							<td ><input type="text" class="code"    id="euiBelongIndustry1" name="euiBelongIndustry1" readonly/>
							<font color="red">*</font>
							   <input type="hidden" id="euiBelongIndustry" name="euiBelongIndustry" value=" "/>
							</td>							
							<td>所属区县:</td>
							<td><input type="text" class="code" id="euiBelongDistrct1" name="euiBelongDistrct1" readonly/>
							<font color="red">*</font>
							  <input type="hidden"  id="euiBelongDistrct" name="euiBelongDistrct" value=" "/>
							</td>
						</tr>
						<tr>
							<td >能耗等级:</td>
							<td >
							    <select  style="width:155px;"  id="euiConsumeBand" name="euiConsumeBand" >
							      <option></option>
							      <option>两千吨标准煤以下</option>
							       <option>两千吨到五千吨标准煤</option>
							       <option>五千吨到一万吨标准煤</option>
							       <option>一万吨标准煤以上</option>
							    </select>
							    <font color="red">*</font>					    
							</td>							
							<td>地理位置:</td>
							<td><input type="text" id="euiLocation" name="euiLocation" /></td>
						</tr>
						<tr>
							<td>联系方式:</td>
							<td><input type="text" id="euiContentWay" name="euiContentWay" /></td>							
							<td>建筑面积(㎡):</td>
							<td><input type="text" id="euiBuildingArea" name="euiBuildingArea" />
							<font color="red">*</font></td>
						</tr>
						<tr>
							<td>容纳人数:</td>
							<td><input type="text" id="euiHoldPerson" name="euiHoldPerson" />
							<font color="red">*</font></td>							
							<td>节能主管部门:</td>
							<td><input type="text" id="euiChargeDepartment" name="euiChargeDepartment" /></td>
							
						</tr>
						<tr>
							<td >备注:</td>
							<td colspan="3">
							<textarea rows="4" style="width:500px;" id="euiBackups" name="euiBackups" disabled="disabled"></textarea>
							</td>
						</tr>																																									
					</table>
					</form>
				</div>
				
			</div>
		</div>
</body>
<script type="text/javascript">

function update(){
	$("#dataDiv :text").removeAttr("disabled");
}

function disable(){
	$(":text").val("");
	$("#dataDiv").attr("disabled","disabled"); 
}

</script>
</html>