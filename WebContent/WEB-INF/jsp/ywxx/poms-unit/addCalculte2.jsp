<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加计量表信息</title>
</head>
<script type="text/javascript" src="/emcc-web/js/poms-business/jsonToTime.js"></script>
	<link href="/emcc-web/css/poms-system/xtqygl.css" rel="stylesheet" type="text/css" />
		<link href="/emcc-web/css/poms-unit/bdcss.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="/emcc-web/component/jquery-easyui/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css" href="/emcc-web/component/jquery-easyui/themes/icon.css">
			
		<script type="text/javascript" src="/emcc-web/js/poms-system/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="/emcc-web/component/jquery-easyui/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="/emcc-web/js/poms-business/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="/emcc-web/js/page.js"></script>
			<script type="text/javascript" src="/emcc-web/js/jquery.form.js"></script>
<body>
<!-- 计量终端配置页 -->
			<form id="calForm" method="post" action="#"> 
			<input type="hidden" name = "qyid" id="qyid" value="<%=(String)request.getAttribute("qyid")%>"/>
			<input type="hidden" name = "cjqid" id="cjqid" value="<%=(String)request.getAttribute("cjqid")%>"/>
			<input type="hidden" name = "euiNames" id="euiNames" value="<%=(String)request.getAttribute("euiNames")%>"/>
			 
			    <table>
			     <tr><td colspan="5" height="10px"></td></tr>
			    	<tr>
			    	<td colspan="5" style="width: 100%;">
			    		<table>
					    	<tr>
					    		<td width="150px" align="right">计量终端编号:</td>
					    		<td  align="left"><input type="text" id="ctdCodes" name="ctdCodes" disabled='disabled'/></td>
					    		
					    		<td width="150px" align="right">企业:</td>
					    		<td  align="left"><input type="text" id="uqy" name="uqy" disabled=true value="<%=(String)request.getAttribute("euiNames")%>"/></td>
					    		<td>&nbsp;</td>
					    	</tr>			    					    	
					    	<tr>
					    	
					    		<td width="150px" align="right">计量终端模型:</td>
					    		<td  align="left">
					    		<!--  <select id="model" name="model" style="width: 150px;text-align: center;" >
					    		</select>
					    		-->
					    		<input type="text" id="model" name="model"  disabled="disabled" />
					    			<input type="hidden" id="cdtName">
					    		</td>
					    		<td width="150px" align="right">计量终端柜编号:</td>
					    		<td  align="left">
					    			<input type="text" id="cdtTerminalName" name="cdtTerminalName" onclick="tanBJ('cal')" readonly="readonly" />
					    			<input type="hidden" id="cdtid">
					    		</td>
					    		<td>&nbsp;</td>
					    	 	
					    		
					    	</tr>
					    	
					    	<tr>
					    		<td width="150px" align="right">计量表终端地址(PN):</td>
					    		<td  align="left">
					    			<input type="text" id="cdtProtocalAddr" name="cdtProtocalAddr" />
					    			
					    		</td>
					    		<td width="150px" align="right">计量终端回路名称:</td>
					    		<td  align="left"><input type="text" id="cdtMeasureLoop" name="cdtMeasureLoop" disabled="disabled"/></td>
					    		<td>&nbsp;</td>
					    	</tr>
					    	
					    	<tr>
					    	
					    		
					    		<td width="150px" align="right">测量终端类型:</td>
					    		<td  align="left">
					    			<select id="cdtTerminalStatus" name="cdtTerminalStatus" style="width: 150px;text-align: center;">
		
					    			</select>
					    		</td>
					    		<td width="150px" align="right">一类数据(FN):</td>
					    		<td  align="left"><input type="text" id="cdtProtocalFunCode" name="cdtProtocalFunCode" disabled="disabled"/></td>
					    		<td>&nbsp;</td>
					    	</tr>
					    	<tr>
					    		
					    		<td width="150px" align="right">二类日曲线数据(FN):</td>
					    		<td  align="left"><input type="text" id="cdtProtocalSecFunCode" name="cdtProtocalSecFunCode" disabled="disabled"/></td>
					    		<td width="150px" align="right">二类日冻结数据(FN):</td>
					    		<td  align="left"><input type="text" id="cdtProtocalSecdayFunCode" name="cdtProtocalSecdayFunCode" disabled="disabled"/></td>
					    		<td>&nbsp;</td>
					    	</tr>
					    	<tr>
					    		
					    		<td width="150px" align="right">二类月冻结数据(FN):</td>
					    		<td  align="left"><input type="text" id="cdtProtocalSecmonFunCode" name="cdtProtocalSecmonFunCode" disabled="disabled"/></td>
					    		<td width="150px" align="right">计量终端初始值:</td>
					    		<td  align="left"><input type="text" id="cdtInitValue" name="cdtInitValue" disabled="disabled"/></td>
					    		<td>&nbsp;</td>
					    	</tr>
							<tr>
					    		
					    		<td width="150px" align="right">计量终端厂家:</td>
					    		<td  align="left"><input type="text" id="cdtTerminalIndustry" name="cdtTerminalIndustry" disabled="disabled"/></td>
					    		<td width="150px" align="right">计量终端检定周期:</td>
					    		<td  align="left"><input type="text" id="cdtCheckPeriod" name="cdtCheckPeriod" disabled="disabled"/></td>
					    		<td>&nbsp;</td>
					    	</tr>
					    	<tr>
					    		
					    		<td width="150px" align="right">计量终端出厂编号:</td>
					    		<td  align="left"><input type="text" id="cdtProductionCode" name="cdtProductionCode" disabled="disabled"/></td>
					    		<td width="150px" align="right">下次检定日期:</td>
					    		<td  align="left"><input type="text" id="cdtNextCheckTime" name="cdtNextCheckTime" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" style="width:150px;" disabled="disabled"/></td>
					    		<td>&nbsp;</td>
					    	</tr>
				    		<tr>
					    		
					    		<td width="150px" align="right">
					    			<input type="hidden" id="pclcParentId" name="pclcParentId"/>
					    			<input type="hidden" id="pclcCalculateBand" name="pclcCalculateBand"/>
					    			<input type="hidden" id="pclcEnergyType" name="pclcEnergyType"/>
					    			
					    			
					    		</td>
					    		<td  align="left"></td>
					    		<td>&nbsp;</td>
					    	</tr>					    						    	
					    	<tr>
					    	
					    		<td width="150px" align="right">计量表类型:</td>
					    		<td  align="left">
					    		<input type="radio" id="cdtIsinvented" name="cdtIsinvented" value="0" checked="checked" onclick="showMpBsDetail()"/>实终端
					    		<input type="radio"  id="cdtIsinvented" name="cdtIsinvented" value="1" onclick="showMpBsDetail()"/>虚终端
					    		</td>
					    		<td width="150px" align="right"></td>
					    		<td  align="left"></td>
					    		<td>&nbsp;</td>
					    	</tr>
	
			    		</table>
			    	</td>
					</tr>
			    	 <tr>
			    		<td colspan="5" style="width: 100%;">
			    	<!-- 实终端 BEGIN-->
						<table id="zd0">

					    	<tr>
					    	
					    		<td width="150px" align="right">添加时间:</td>
					    		<td  align="left"><input type="text" id="cdtAddTime" name="cdtAddTime" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" style="width:150px;"/></td>
					    		<td width="150px" align="right"></td>
					    		<td  align="left"></td>
					    		<td>&nbsp;</td>
					    	</tr>
					    	<!-- 
					    	<tr>
					    	
					    		<td width="100px" align="right">计算公式:</td>
					    		<td  align="left" colspan="3">
					    			<textarea rows="2" cols="4" id="cdtFormular" name="cdtFormular" style="width: 400px"></textarea>	
					    		</td>
					    		<td>&nbsp;</td>
					    	</tr>
					    	 -->
						</table>
					    	<!-- 实终端 END -->

						</td>
			    	</tr>
			    	 <tr>
			    		<td id="w1" colspan="5" style="display:none;width: 700px;margin-left: 0px;">
				    		<!-- 虚终端 BEGIN -->
						<table  align="center" border="1" cellpadding="0" cellspacing="0" width="700px" bordercolordark="#FFFFFF" style="border: thin solid; ">
						<!-- 			
	             		<tr>
							<td colspan="5" >
								公式：
							</td>
						</tr>
						 -->  
	                   <tr>
	                  	 	<td >
								公式：
							</td>
							<td colspan="4" align="left" >
								<textarea name="formularName" id="formularName" cols="60" rows="3" readonly></textarea>
								<input name="formularNameId" id="formularNameId" type="hidden"/>
								<input name="formularNameIdS" id="formularNameIdS" type="hidden"/>
							</td>
						</tr>
						<tr>
							<td colspan="5" align="left" >
								<table border="1" cellpadding="0" cellspacing="0" style="border: thin solid;border-color: gray;">
									<tr>
										<td style="width:12%;">
										运算符号
						               </td>
										<td style="width:87%">
											<button type="button" value="+" id="buttona" name="buttont"
												onclick="add(this)" style="cursor:pointer;width:30px"/>
												+
											</button>
											<button type="button" value="-" id="buttonb" name="buttonb"
												onclick="add(this)" style="cursor:pointer;width:30px"/>
												-
											</button>
											<button type="button" value="*" id="buttonc" name="buttonc"
												onclick="add(this)" style="cursor:pointer;width:30px"/>
												*
											</button>
											<button type="button" value="\" id="buttond" name="buttond"
												onclick="add(this)" style="cursor:pointer;width:30px"/>
												/
											</button>
											<button type="button" value="(" id="buttone" name="buttone"
												onclick="add(this)" style="cursor:pointer;width:30px"/>
												(
											</button>
											<button type="button" value=")" id="buttonf" name="buttonf"
												onclick="add(this)" style="cursor:pointer;width:30px"/>
												)
											</button>
											<button type="button" value="." id="buttong" name="buttonf"
												onclick="add(this)" style="cursor:pointer;width:30px"/>
												.
											</button>
	
	
											<button type="button" value="1" id="button1" name="button1"
												onclick="add(this)" style="cursor:pointer;width:30px">
												1
											</button>
											<button type="button" value="2" id="button2" name="button2"
												onclick="add(this)" style="cursor:pointer;width:30px">
												2
											</button>
											<button type="button" value="3" id="button3" name="button3"
												onclick="add(this)" style="cursor:pointer;width:30px"/>
												3
											</button>
											<button type="button" value="4" id="button4" name="button4"
												onclick="add(this)" style="cursor:pointer;width:30px"/>
												4
											</button>
											<button type="button" value="5" id="button5" name="button5"
												onclick="add(this)" style="cursor:pointer;width:30px"/>
												5
											</button>							
											<button type="button" value="6" id="button6" name="button6"
												onclick="add(this)" style="cursor:pointer;width:30px"/>
												6
											</button>
											<button type="button" value="7" id="button7" name="button7"
												onclick="add(this)" style="cursor:pointer;width:30px"/>
												7
											</button>
											<button type="button" value="8" id="button8" name="button8"
												onclick="add(this)" style="cursor:pointer;width:30px"/>
												8
											</button>
											<button type="button" value="9" id="button9" name="button9"
												onclick="add(this)" style="cursor:pointer;width:30px"/>
												9
											</button>
											<button type="button" value="0" id="button0" name="button0"
												onclick="add(this)" style="cursor:pointer;width:30px"/>
												0
											</button>
											<button type="button" value="max" id="buttonMax" name="buttonMax"
												onclick="add(this)" style="cursor:pointer;width:30px"/>
												max
											</button>
											<button type="button" value="avg" id="buttonAvg" name="buttonAvg"
												onclick="add(this)" style="cursor:pointer;width:30px"/>
												avg
											</button>
											<button type="button" value="min" id="buttonMin" name="buttonMin"
												onclick="add(this)" style="cursor:pointer;width:30px"/>
												min
											</button>
											<button type="button" value="diff" id="buttonDiff" name="buttonDiff"
												onclick="add(this)" style="cursor:pointer;width:30px"/>
												diff
											</button>
											<button type="button" value="sum" id="buttonSum" name="buttonSum"
												onclick="add(this)" style="cursor:pointer;width:35px"/>
												sum
											</button>
										</td>
										<td style="width:8%">
											<input type="button" value="退后" id="buttonth" name="buttonth" onclick="backoff()"  icon='icon-back'/>
											<input type="button" value="清除" id="buttonq" name="buttonq" onclick="cleanFormular()" icon='icon-delete'/>
										</td>
									</tr>
								</table>
							</td>
						</tr>               
	                      
	                    <tr>
							<td colspan="5" align="left"  >
								<table  width="100%" cellpadding="0" cellspacing="0" style="border: thin solid;border-color: gray;">
									<tr>
										<td  align="left"  style="width:10%" >因子选择：</td>
										<td style="width:70%" >	
											<input type="text" id="factorSelect" name="factorSelect" size="50" maxlength="150" readonly/> 
											<input type="hidden" id="factorSelectID" name="factorSelectID" size="50" maxlength="150" readonly/> 
											<input type="hidden" id="factorSelectIDS" name="factorSelectIDS" size="50" maxlength="150" readonly/> 
										</td> 							 
										<td style="width:10%">
											<input type="button"  name="buttonqd" onclick="yinzi()"; value="确定"  icon='icon-save'/>											
										</td>
										<td style="width:10%">
											<input type="button" value="清除"  name="buttonq" onclick="clean()" icon='icon-delete'/>
										</td>
									</tr>
								</table>
							</td>
						</tr>  
                     
	                    <tr>
						<td align="left"  style="width:10%">因子属性：</td>
						<TD align="left"  colspan="4">
							<input type="hidden" size="12" name="application1" maxlength="50" />
							<input type="button" size="12" onclick="addFactor('cal')" value="计量仪表" name="application" maxlength="50"  icon='icon-add'/>
						</TD>
						</tr>
	                         
				</table>
							<!-- 虚终端 END -->
			    		</td>
			    	</tr>		
			    		    				    				    					    				    			    					   
			    </table> 
				<table style="width: 100%">
					<tr>
			    		<td width="100px" align="right">备注:</td>
			    		<td  align="left" colspan="4">
			    			<textarea rows="3" cols="4" id="cdtBackups" name="cdtBackups" style="width: 400px"></textarea>
			    		</td>
			    	</tr>	
					<tr>
						<td width="100px" ></td>
				    	<td  align="left" colspan="4">
							<input type="submit" value="确定" id="aButton" class="btnClass" />
							<input type="button" value="取消" id="cButton" class="btnClass"/>
						</td>
					</tr>
				</table>
			</form>
			<!-- 
			<table id="ff" style="height:180px;"></table>260
			  -->
			<div id="ss" style="height:330px;display: none;" ><table id="ca" style="height:190px;"></table></div>
</body>
<script type="text/javascript">

          
         
		$(function(){

	      	 //循环计量表类型
	      	 var arr = ["新增", "测试", "测通","正常","停用"];
	      	 $('#cdtTerminalStatus').html("<option value='-1'>选择标记类型</option>"); 
			  $.each(arr, function(i,val){      
				  $('#cdtTerminalStatus').append("<option value='"+i+"'>"+val+"</option>");
			  });
			//初始化时间
				var now=new Date();
				
				var year = now.getFullYear();
				var month=now.getMonth()+1;
				var day=now.getDate();
			  
			  $("#cdtAddTime").datebox("setValue", year+"-"+month+"-"+day);
	 	 	 //初始化日期控件
	 	   	 //$("#cdtAddTime").datebox({ 
		 	 //  	 formatter: formatDate
		 	 //  	  });
		     //$("#cdtNextCheckTime").datebox({ formatter: formatDate });

				/**$.ajax({
			           url: "calculateTerminalDevice.action?m=getCalculteModel",
			           type:"POST",dataType:"json",
			           timeout: 1000,
			           success: function(data){ //放入下拉框
			           		var list = data.list;
				          $('#model').html("<option value='-1'>选择模型</option>");
			           		for(var i=0;i<list.length;i++){
			           			$('#model').append("<option value='"+list[i].id+"'>"+list[i].ctmNames+"("+list[i].ctmCodes+")"+"</option>");
			           		}
			           }
			      	 });*/

		      	 $('#cButton').click(function(){
					//window.close();
					//alert('aa');
		      		window.parent.$('#iframeDivId').dialog('close'); //
			      		
			     });
			     
		     	//提交计量表信息
			     $('#aButton').click(function(){
			    		//var model=$('#model').val();
			    		//alert($('#cdtName').val());
			    		
			    		$DisSelects = $("input[disabled='disabled']");
			    		$DisSelects.attr("disabled", false); 
			    		
			    		var model=$('#cdtName').val();
			    		
						var qyid=$('#qyid').val();
						var cjqid=$('#cjqid').val();
						var ctdCodes=$('#ctdCodes').val();//计量表编号
						var cdtTerminalName=$('#cdtTerminalName').val();//计量终端名称
						var cdtMeasureLoop=$('#cdtMeasureLoop').val();//计量回路
						var cdtInitValue =$('#cdtInitValue').val();//计量表底数
						var cdtTerminalIndustry=$('#cdtTerminalIndustry').val();//生产厂家
						var cdtCheckPeriod=$('#cdtCheckPeriod').val();//检定周期
						var cdtIsinvented=$("input[name='cdtIsinvented']:checked").val();
						var cdtid=$('#cdtid').val();
						//alert(cdtIsinvented);
						if(ctdCodes==""){
							$.messager.alert("提示","计量终端编号不能为空","warning",null);
							return false;
						}else if(cdtTerminalName==""){
							$.messager.alert("提示","计量终端名称不能为空!","warning",null);
							return false;
						}else if(cdtMeasureLoop==""){
							$.messager.alert("提示","计量终端回路名称不能为空","warning",null);
							return false;
						}else if(cdtIsinvented==0){
							if(cdtInitValue !=""){
				    		    var re = /^\d+\.?\d*$/;
								 
								if(!re.test(cdtInitValue)){
									 $.messager.alert("提示","计量终端初始值只能输入整数,请重新输入","warning",null);	
									 return false;
								}						    	
						    }
			    			if(cdtCheckPeriod !=""){
				    			var reg = new RegExp("^[0-9]*$"); 
				    			 if(!reg.test(cdtCheckPeriod)){
				    		        $.messager.alert("提示","计量终端检定周期只能输入数字","warning",null);
				    		        return false;
				    		    }
				    		}
						}
						
							var options = {
									url:"calculateTerminalDevice.action?m=saveCalcul&modelId="+model+"&qyid="+qyid+"&cjqid="+cjqid+"&cdtid="+cdtid,
									
									   async:false,
							           dataType:"json",
							           timeout: 1000,
							           success: function(data){
											if(data.flag==true){
								 				$.messager.alert("提示","添加采集器与计量表关联成功!","info",function(){window.parent.$('#iframeDivId').dialog('close'); window.parent.GetDataee(qyid,cjqid);});
								 				$('#ctdCodes').val('');
												$('#cdtTerminalName').val('');
												$('#cdtMeasureLoop').val('');
												$('#cdtTerminalStatus').val('');
												$('#cdtProtocalFunCode').val('');
												$('#cdtProtocalSecFunCode').val('');
												$('#cdtProtocalSecdayFunCode').val('');
												$('#cdtProtocalSecmonFunCode').val('');
												
												$('#cdtInitValue').val('');
												
												$('#cdtTerminalIndustry').val('');
												$('#cdtCheckPeriod').val('');
												$('#cdtProductionCode').val('');
												//$('#cdtNextCheckTime').val(row.cdtNextCheckTime);
												//alert(row.cdtNextCheckTime);
												$("#cdtNextCheckTime").datebox('setValue','');
								 				
									    	}else{
												$.messager.alert("提示","添加采集器与计量表关联失败!","info",function(){window.parent.$('#iframeDivId').dialog('close'); });
												
										    }
							           }
								}
							$('#calForm').ajaxForm(options);
						
				 });
					//格式化日期
				 	function formatDate(date) {
				 	        return date.getFullYear() + "-" + (date.getMonth() +1) + "-" + date.getDate();
				 	}
				 
			});

		//单击计量表名称弹出计量表，选中一个表，带回其信息并赋予相关属性文本 START
				function tanBJ(data){
				var qyid=$('#qyid').val();//获取企业的ID
					$('#ctdCodes').val('');
	 				$('#cdtTerminalName').val('');
	 				$('#cdtMeasureLoop').val('');
	 				$('#cdtTerminalStatus').val('');
	 				$('#cdtProtocalFunCode').val('');
	 				$('#cdtProtocalSecFunCode').val('');
                    $('#cdtProtocalSecdayFunCode').val('');
					$('#cdtProtocalSecmonFunCode').val('');
	 				$('#cdtInitValue').val('');
	 				
	 				$('#cdtTerminalIndustry').val('');
	 				$('#cdtCheckPeriod').val('');
	 				$('#cdtProductionCode').val('');
	 				//$('#cdtNextCheckTime').val(row.cdtNextCheckTime);
	 				//alert(row.cdtNextCheckTime);
	 			$("#cdtNextCheckTime").datebox('setValue','');
				$('#ss').show();
				GetDataee2('1');//加载列表
				$('#ss').dialog({  
					title:'选择计量表', 
			   	 	modal:true,
			   	 	width:600,
			   	 	draggable:false,
			   	 	buttons: [{
						text: '确定',
						iconCls: 'icon-ok', 
							handler: function(){
			   	 				var row=$('#ca').datagrid('getSelected');
			   	 				if(row !=null){
									//var ret = row.cdtTerminalName+"-"+row.cdtid;
									//alert(row.id);
									$('#cdtid').val(row.id);
			   	 					$('#ctdCodes').val(row.ctdCodes);
			   	 					if(row.pomsCalculateTerminalModel!=null){
			   	 					$('#model').val(row.pomsCalculateTerminalModel.ctmNames);
			   	 					$('#cdtName').val(row.pomsCalculateTerminalModel.id);
			   	 					}
			   	 					
			   	 					$('#cdtProtocalAddr').val(row.cdtProtocalAddr);
			   	 					
			   	 					$('#cdtTerminalName').val(row.cdtTerminalName);
				   	 				$('#cdtTerminalName').val(row.cdtTerminalName);
				   	 				$('#cdtMeasureLoop').val(row.cdtMeasureLoop);
				   	 				$('#cdtTerminalStatus').val(row.cdtTerminalStatus);
				   	 				$('#cdtProtocalFunCode').val(row.cdtProtocalFunCode);
				   	 				$('#cdtProtocalSecFunCode').val(row.cdtProtocalSecFunCode);
				   	 				$('#cdtProtocalSecdayFunCode').val(row.cdtProtocalSecdayFunCode);
				   	 				$('#cdtProtocalSecmonFunCode').val(row.cdtProtocalSecmonFunCode);
				   	 				$('#cdtInitValue').val(row.cdtInitValue);			   	 				
				   	 				$('#cdtTerminalIndustry').val(row.cdtTerminalIndustry);
				   	 				$('#cdtCheckPeriod').val(row.cdtCheckPeriod);
				   	 				$('#cdtProductionCode').val(row.cdtProductionCode);
				   	 				$('#pclcParentId').val(row.pclcParentId);
				   	 				$('#pclcCalculateBand').val(row.pclcCalculateBand);
				   	 				$('#pclcEnergyType').val(row.pclcEnergyType);
				   	 				//$('#cdtNextCheckTime').val(row.cdtNextCheckTime);
				   	 				//alert(row.cdtNextCheckTime);
				   	 			$("#cdtNextCheckTime").datebox('setValue',Util.DateTime.Formater('yyyy-MM-dd',row.cdtNextCheckTime.time));

					   	 			
				   	 				}
			   	 				$('#ss').dialog('close');
							}
						},
						{
							text: '取消',
								handler: function() {
									$('#ss').dialog('close');
							 		
								}
							}
						] 
				});
	 		}
		// END
			
		//实点、虚点层级交换
		 function showMpBsDetail(){
				//var cdtIsinvented = document.getElementById ("cdtIsinvented").value;
				
				var cdtIsinvented=$("input[name='cdtIsinvented']:checked").val();
				var objDiv = document.getElementById ("w1");
				var zd0 = document.getElementById ("zd0");
				if (cdtIsinvented==1){ 
					zd0.style.display="none";
					objDiv.style.display = "block"; 
				}else{ 
					objDiv.style.display = "none";
					zd0.style.display="block";
				}
			}
		/**
		//模型联动	
		 function checkModel(){
				var modelID=$('#model').val()
				GetDataff(modelID);
		}
		**/
		//返回计量表信息，并赋予
			function addFactor(data){
				var qyid=$('#qyid').val();//获取企业的ID
				$('#ss').show();
				GetDataee2('');//加载列表
				$('#ss').dialog({  
					title:'选择计量表', 
			   	 	modal:true,
			   	 	width:600,
			   	 	draggable:false,
			   	 	buttons: [{
						text: '确定',
						iconCls: 'icon-ok', 
							handler: function() {
			   	 				var row=$('#ca').datagrid('getSelected');
			   	 				if(row !=null){
									var ret = row.cdtTerminalName+"-"+row.cdtid;
				   	 				
					   	 			if(ret!=null){
					   					//alert('ss');
					   					if(data=="cal"){
					   						var arr=ret.split("-");
					   						if(arr[0].split(",").length>1){
					   							alert("只能选择一个");
					   							return;
					   						}
					   						if($("#factorSelectID").val().indexOf("-1")>0||$("#factorSelectID").val().indexOf("-2")>0){
					   								alert("已经存在因子属性,不能重复添加或首应添加因子属性！");
					   								return;
					   						}
					   						$("#factorSelectID").val(arr[1]+"-1");
					   						$("#factorSelect").val(arr[0]);
					   						$("#factorSelectIDS").val(arr[1]);
					   					}
					   				}
				   	 				}
			   	 				$('#ss').dialog('close');
							}
						},
						{
							text: '取消',
								handler: function() {
									$('#ss').dialog('close');
							 		
								}
							}
						] 
				});
	 		}
	 		
			var symbols = new Array();
			var symbolIds = new Array();
			var symbolDisplayIds = new Array();
			function cleanFormular(){
				$("#formularName").val("");
				$("#formularNameId").val("");
				$("#formularNameIdS").val("");
				symbols = [];
				symbolIds = [];
				symbolDisplayIds = [];
			}
			function backoff(){
				symbols.pop();
				symbolIds.pop();
				symbolDisplayIds.pop();
				
			}
			function backoff(){
				symbols.pop();
				symbolIds.pop();
				symbolDisplayIds.pop();
				refresh();
			}
			//公式刷新
			function add(t){
				symbols.push(t.value);
				symbolIds.push(t.value);
				symbolDisplayIds.push(t.value);
				refresh();
			}
			function refresh(){
				$("#formularName").val("");
				$("#formularNameId").val("");
				$("#formularNameIdS").val("");
				for(var k=0;k<symbols.length;k++){
			    	$("#formularName").val($("#formularName").val()+symbols[k]);			
			    }
			    for(var h=0;h<symbolIds.length;h++){
			    	$("#formularNameId").val($("#formularNameId").val()+symbolIds[h]);
			    }
			    for(var n=0;n<symbolDisplayIds.length;n++){
			    	$("#formularNameIdS").val($("#formularNameIdS").val()+symbolDisplayIds[n]);
			    }
			}
			function yinzi(){		
			    symbols.push("{"+$("#factorSelect").val().replace("#","的")+"}");
			    symbolIds.push("{"+$("#factorSelectID").val()+"}");
			    symbolDisplayIds.push("{"+$("#factorSelectIDS").val()+"}");
			    refresh();
			    clean();		    
			}
			function clean(){
				$("#factorSelectID").val("");
				$("#factorSelect").val("");
				$("#factorSelectIDS").val("");
			}

			function GetDataee2(cjqid){
				var args={};
				args.pageIndex=1;//页索引
				args.pageSize=5;//页容量
				var pagelists=[5,10,15,20];
	            args.pageList=pagelists;
				var qyId=$("#qyid").val();
				args.qyId=qyId;
				args.cjqid=cjqid;
				BingData("#ca",args,"calculateTerminalDevice.action?m=getMultiCal",null);
			}
	 		
			$('#ca').datagrid( {
				striped : true,
				fitColumns: true, //自适应列的大小
				pagination: true,
				rownumbers: false,
				singleSelect:true,//设置单选、多选。true单选，false 多选。
				columns : [ [ {field : 'cdtMeasureLoop',title : '计量终端回路名称',width : 100},
				              {field : 'pomsCalculateTerminalModel',title : '计量模型',width : 100,formatter: function(value,rowData,rowIndex){if(value==null){return "";}else{return value.ctmNames;}}},
							  {field : 'ctdCodes',title : '计量终端编号',width : 100},
							  {field : 'cdtProtocalFunCode',title : '一类数据(FN)',width : 100},
							  //{field : 'pomsCalculateTerminalModel',title : '一类数据(FN)',width : 100,function (value, rowData, rowIndex) {if(value!=null){return value.ctmProtocalFunCode;}else{return "";}}},
							  {field : 'cdtTerminalStatus',title : '计量终端状态',width : 100,formatter: function (value, rowData, rowIndex) {if (value==0) {return "新增";} else if(value=="1"){return "测试";}else if(value=="2"){return "测通";}else if(value=="3"){return "正常";}else if(value=="4"){return "停用";} }},
							  {field : 'cdtIsinvented',title : '虚/实终端',width : 100,formatter: function(value, rowData, rowIndex){if(value==0){return "实";}else if(value==1){return "虚";} } }
							  
						  ] ]
			});

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
</html>