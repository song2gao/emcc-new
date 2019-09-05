<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>中惠元景能耗监测平台</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="/emcc-new/css/login.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css"
			href="/emcc-new/css/easyui.css">
		<link rel="stylesheet" type="text/css"
			href="/emcc-new/css/icon.css">
		<script type="text/javascript"
			src="/emcc-new/js/jquery-1.8.2.min.js"></script>
		<script type="text/javascript"
			src="/emcc-new/js/jquery.easyui.min.js"></script>
			
			
		<script type="text/javascript" src="/emcc-new/js/page.js"></script>
	<style>
  	*{
  		margin: 0px auto;
  		padding: 0px;
  	}
  	#div{
  		height: 90%;
  	}
  	.css_cla{
  		width: 200px;
  	}
  </style>
  
  <script type="text/javascript">
  		
			 var code ; //在全局 定义验证码
			window.onload=function createCode(){ 
				
				code = new Array();
				var codeLength = 4;//验证码的长度
				var checkCode = document.getElementById("checkCode");
				var checkCode1 = document.getElementById("checkCode1");
				checkCode.value = "";
				checkCode1.value = "";
	
				var selectChar = new Array('a','b','c','d','e','f','g','h','i','j','k','l','m','n','p','q','r','s','t',
				'u','v','w','x','y','z',1,2,3,4,5,6,7,8,9,
				'A','B','C','D','E','F','G','H','J','K','L','M','N','P','Q','R','S','T','U','V','W','X','Y','Z');
			
			for(var i=0;i<codeLength;i++) {
			   var charIndex = Math.floor(Math.random()*58);
			   code +=selectChar[charIndex];
			}
				if(code.length != codeLength){  
				   createCode();
				}
				checkCode.value = code;
				checkCode1.value = code;
			}
			
			$(function(){
					//弹出登陆界面
				  $(".abutton").click(function(){
					$("#divWindow").show();
				  });
				 //运维界面
				  $(".yunwei").click(function(){
				  	$("#divYW").show();
				  	$("#divNH").hide();
					$("#divWindow").dialog({
						title:"欢迎登陆",
						modal:true,
			   	 		width:480,
			   	 		height:400,
			   	 		draggable:false,
			   	 		buttons:[{
			   	 			text:"登陆",
			   	 			handler:function(){  	 				
			   	 				$("#form").form('submit',{
		   	 					    url:"login/login?uname="+$("#piName").val()+"&upwd="+$("#piPwd").val()+"&type=1",  						
			   	 					dataType:"json",async:false,			   	 					
			   	 					onSubmit:function(){
			   	 						//进行表单验证
			   	 						if($("#piName").val()==""){
			   	 							$.messager.alert("提示","用户名不能为空!","warning",null);
			   	 							return false;
			   	 						}
			   	 						if($("#piPwd").val()==""){
			   	 							$.messager.alert("提示","密码不能为空!","warning",null);
			   	 							return false;
			   	 						}
			   	 						if($("#piCheck").val()==""){
			   	 							$.messager.alert("提示","验证码不能为空!","warning",null);
			   	 							return false;
			   	 						}
			   	 					},success:function(data){
			   	 					  if($("#piCheck").val().toUpperCase() != code.toUpperCase()){
			   	 					     	alert("验证码输入错误");$("#piCheck").val("");
					                     	createCode();
					                     	return false;
					                     
			   	 					  }
			   	 						var obj = eval('(' + data + ')');
			   	 							url = obj.url+".jsp";
			   	 							alert("登陆成功");
											window.location=url;			   	 					
			   	 					}
			   	 				});
			   	 				
			   	 			}
			   	 		},
		   	 			{
		   	 				text:"取消",
		   	 				handler:function(){
		   	 					$("#divWindow").dialog("close");
		   	 					$("#form").form("clear");
		   	 				}
			   	 		}
			   	 		]
					});
				});
				//能耗界面
				$(".nenghao").click(function(){
					$("#divNH").show();
					$("#divYW").hide();
					$("#divWindow").dialog({
						title:"欢迎登陆",
						modal:true,
			   	 		width:480,
			   	 		height:400,
			   	 		draggable:false,
			   	 		buttons:[{
			   	 			text:"登陆",
			   	 			handler:function(){			   	 			
			   	 				$("#form").form('submit',{	   	 				
			   	 					url:"login/login?uname="+$("#piName").val()+"&upwd="+$("#piPwd").val()+"&type=1",	 
			   	 				    dataType:"json",async:false,  	 					
			   	 					onSubmit:function(){
			   	 						//进行表单验证
			   	 						if($("#piName").val()==""){
			   	 							$.messager.alert("提示","用户名不能为空!","warning",null);
			   	 							return false;
			   	 						}
			   	 						if($("#piPwd").val()==""){
			   	 							$.messager.alert("提示","密码不能为空!","warning",null);
			   	 							return false;
			   	 						}
			   	 						if($("#piCheck").val()==""){
			   	 							$.messager.alert("提示","验证码不能为空!","warning",null);
			   	 							}			   	 						 
			   	 					},			   	 					
			   	 					success:function(data){
			   	 					 if($("#piCheck").val().toUpperCase() != code.toUpperCase()){
						                 	alert("验证码输入错误");$("#piCheck").val("");
					                     	createCode();
					                     	return false;
					                 	}
			   	 					var obj = eval('(' + data + ')');   
			   	 							  url = obj.url+".jsp";
			   	 							  alert("登陆成功");
			   	 							  window.location=url;
			   	 						
			   	 							
			   	 					}
			   	 				});
			   	 			}
			   	 		},
		   	 			{
		   	 				text:"取消",
		   	 				handler:function(){
		   	 					$("#divWindow").dialog("close");
		   	 					$("#form").form("clear");
		   	 				}
			   	 		}
			   	 		]
					});
				});
				//登陆
				var utype;
				$("#loginsb").click(function(){
					$("#loginsb").attr("src","image/poms-system/login2.png");
					var type;
					if($.trim($("#uname").val())==""){
						alert("请输入用户名");
						return false;
					}
					if($.trim($("#upwd").val())==""){
						alert("请输入密码");
						return false;
					}
						if($.trim($("#check_ch").val())==""){          //测试时暂时注释，方便测试
							alert("请输入验证码");
						return false;
						}
						if($("#check_ch").val().toUpperCase() != code.toUpperCase()){
							alert("验证码输入错误");$("#check_ch").val("");
					  	createCode();
					  	return false;
						}
					
					var url;
					$.ajax({
						url:"login/login?uname="+$("#uname").val()+"&upwd="+$("#upwd").val()+"&type=2&euiCode=yymx",
						type:'post',dataType:'json',
						async:false,
						success:function(data){
							url = data.url+".jsp";
			   	 			alert("登陆成功");
			   	 			window.location=url;
						}
					});
					
				});
				
				$("#loginsb,#loginsb").hover(function(){
					$("#loginsb").attr("src","image/poms-system/login0.png");
				},function(){
					$("#loginsb").attr("src","image/poms-system/login1.png");
				});
				
			});
  </script>
  </head>
  
  <body style="background-image:url('image/login/back.jpg')">
  	<p style="background-image: url('image/login/top.png'); width: 100%; height: 3%;"></p>
  	<div ><img src="image/login/loginName.png" style="left:5%; position: absolute; z-index: 2; "></img></div>
   <!-- <table style="background-image: url('image/login/back.jpg'); width: 100%; height: 94%; " cellpadding="0" cellspacing="0">-->
    		 	<img src="image/login/middle.png" width="100%" height="100%" style="background-image:url('image/login/back.jpg')"></img>
    			<table width="200" style="position: absolute; top: 47%; right: 5%">
    					<tr>
    						<td ><img src="image/login/26X26.png"></img></td>
    						<td >
    							<a href="javascript:void(0);"   class="abutton yunwei" ><font size="3" color="white"><b>平台运维管理系统</b></font></a>
    						</td>
    					</tr>
    					<tr>
    						<td ><img src="image/login/26X26.png"></img></td>
    						<td >
    							<a href="javascript:void(0)"   class="abutton nenghao"><font size="3" color="white"><b>能耗数据采集系统</b></font></a>
    						</td>
    					</tr>
    				</table>
    	
		<div align="center" style=" position: absolute; top: 450px;right:60%; text-align: center; ">		
   			<table style="position:absolute; left: 35%; width=18%;">
   				<tr>
   					<td><b>用户名：</b></td>
   					<td>
   						<input id="uname" name="uname" value="" class="css_cla"/>
   					</td>
   				</tr>
   				<tr>
   					<td><b>密码：</b></td>
   					<td>
   						<input type="password" id="upwd" name="upwd" value="" class="css_cla"/>
   					</td>
   				</tr>
   				<tr>
   					<td><b>验证码：</b></td>
   					<td>
   						<input id="check_ch" name="check_ch" value="" class="css_cla"/>
   					</td>
   				</tr>
   				<tr align="center">
   					<td>
   							<input type="button" id="checkCode" class="code" onClick="createCode()"/>
   					</td>
   					<td>
   							<font size="-1" face="新宋体"><a href="javascript:void(0);" onClick="createCode()" style="margin-top: -10;">看不清楚，换一张</a></font>
   					</td>
   				</tr>
   				<tr align="center">
   					<td colspan="2">
   						<img id="loginsb" src="image/poms-system/login1.png"/>
   					</td>
   				</tr>
   			</table>
   		
   		</div>
    <p style="background-image: url('image/login/foot.png'); width: 100%; height: 3%;"></p>
    <div id="divWindow" style="display: none; text-align: center; padding: 5px;">
    		<div id="divYW" style="display: none;">
    			<img src="image/login/yunwei.png"></img><br/>
    		</div>
    		<div id="divNH" style="display: none;">
    			<img src="image/login/nenghao.png"></img><br/>
    		</div>
    		<form  id="form" method="post">
    		<table align="center">
    			<tr>
    				<td><b>用户名：</b></td>
    				<td><input id="piName" name="piName" value="" class="css_cla"/></td>
    			</tr>
    			<tr>
    				<td><b>密码：</b></td>
    				<td><input type="password" id="piPwd" name="piPwd" value="" class="css_cla"/></td>
    			</tr>
    			<tr>
    				<td><b>验证码：</b></td>
    				<td><input id="piCheck" name="piCheck" value="" class="css_cla"/></td>
    			</tr>
    			<tr>
    				<td><input type="button" id="checkCode1" class="code" onClick="createCode(this)"/></td>
    				<td>
    					<font size="-1" face="新宋体"><a href="javascript:void(0);" onClick="createCode()" style="margin-top: -10;">看不清楚，换一张</a></font>
    				</td>
    			</tr>
    		</table>
    		</form>
    	</div>
  </body>
</html>


