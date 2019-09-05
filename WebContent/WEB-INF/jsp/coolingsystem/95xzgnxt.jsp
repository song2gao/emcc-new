<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
	<head>
		<meta>
		<title>北辰西站空调系统管理-中惠元景能耗监测平台</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<link rel="stylesheet" href="/emcc-new/assets/css/style.css">
		<link rel="stylesheet" href="/emcc-new/assets/css/loader-style.css">
		<link rel="stylesheet" href="/emcc-new/assets/css/bootstrap.css">
		<link rel="shortcut icon" href="/emcc-new/assets/ico/minus.png">
		
		<link href="/emcc-new/assets/js/tabs/acc-wizard.min.css" rel="stylesheet">
		<script type="text/javascript" src="/emcc-new/js/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" src="/emcc-new/js/layer.js"></script>
		<script type="text/javascript">
			function findWeather() {
				var cityUrl = 'http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js';
				$.getScript(cityUrl, function(script, textStatus, jqXHR) {
					var citytq = remote_ip_info.city; // 获取城市
					var url = "http://php.weather.sina.com.cn/iframe/index/w_cl.php?code=js&city=" + citytq + "&day=0&dfc=3";
					$.ajax({
						url: url,
						dataType: "script",
						scriptCharset: "gbk",
						success: function(data) {
							var _w = window.SWther.w[citytq][0];
							var _f = _w.f1 + "_0.png";
							if(new Date().getHours() > 17) {
								_f = _w.f2 + "_1.png";
							}
							var img = "<img width='16px' height='16px' src='http://i2.sinaimg.cn/dy/main/weather/weatherplugin/wthIco/20_20/" + _f +
								"' />";
							var tq = "当前城市：" +citytq + " " + img + " " + _w.s1 ;
							var tq2 ="今天温度：" +_w.t1 + "℃～" + _w.t2 + "℃ ";

							$('#weather').html(tq);
							$('#weather2').html(tq2);
						}
					});
				});
			}

			findWeather();
		</script>
		
		<script type="text/javascript">
		$(function(){
			selectButton();
			bianpin();
			selectSelect();
			selectBp()
		});
		function selectButton() {
			var aLi = document.querySelectorAll('.btn');
		    for (var i = 0; i < aLi.length; i++) {
		        aLi[i].addEventListener('click', function(e){
		        	if(e.target.className=="btn btn-warning"){
		        		$(this).removeClass("btn btn-warning");
		        		$(this).addClass("btn btn-info");
		        		$(this).html("本地")
		        	}else if(e.target.className=="btn btn-info"){
		        		$(this).removeClass("btn btn-info");
		        		$(this).addClass("btn btn-warning");
		        		$(this).html("节能")
		        	}else{
		        		$("button").addClass("btn");
		        	}
		        	if(e.target.className=="btn btn-danger"){
		        		$(this).removeClass("btn btn-danger");
		        		$(this).addClass("btn btn-success");
		        		$(this).html("正在运行...")
		        	}else if(e.target.className=="btn btn-success"){
		        		$(this).removeClass("btn btn-success");
		        		$(this).addClass("btn btn-danger");
		        		$(this).html("已经停止")
		        	}else{
		        		$("button").addClass("btn");
		        	}
		        });
		    }
		}
		//一号主机参数显示
		function clickOne() {
						//边缘弹出
			layer.open({
			  type: 1
			  ,title: '一号主机参数' //不显示标题栏
			  ,skin: 'layui-layer-molv' //样式类名
			  ,offset:  ['18%', '5%'] //具体配置参考：offset参数项
			  ,area: ['300px', '485px']
			  ,content: '<div style="padding: 10px 20px;"><table style="border-collapse:separate; border-spacing:15px;"><tr align="center">'
			  +'<td colspan="2">主机控制模式  <button type="button" style="margin-left:15px;" class="btn btn-info">本地</button></td>'
				+'</tr><tr><td >冷冻水出水温度：</td><td>'
				+'<span class="label label-danger" style="width: 82px;margin-left:10px;">15.6</span> ℃'
				+'</td></tr><tr><td >冷冻水回水温度：</td><td>'
				+'<span class="label label-danger" style="width: 82px;margin-left:10px;">16.5</span> ℃'
				+'</td></tr><tr><td >冷却水出水温度：</td><td>'
				+'<span class="label label-danger" style="width: 82px;margin-left:10px;">20.5</span> ℃'
				+'</td></tr><tr><td >冷却水回水温度：</td><td>'
				+'<span class="label label-danger" style="width: 82px;margin-left:10px;">18.9</span>℃'
				+'</td></tr><tr><td >总负荷率：</td><td>'
				+'<span class="label label-danger" style="width: 82px;margin-left:10px;">00.0</span>%'
				+'</td></tr><tr><td >制冷设定温度：</td><td>'
				+'<span class="label label-danger" style="width: 82px;margin-left:10px;">7.0</span>℃'
				+'</td></tr><tr align="center">'
			  +'<td colspan="2">主机运行模式  <button type="button" style="margin-left:15px;" class="btn btn-success">运行</button></td>'
				+'</tr><tr align="center">'
			  +'<td colspan="2">主机启停模式  <button type="button" style="margin-left:15px;" class="btn">启动</button></td>'
				+'</tr></table></div>'
			  ,btn: '关闭'
			  ,btnAlign: 'a' //按钮居中
			  ,anim : 3   //弹出 动画
			  ,isOutAnim : true //关闭动画效果
			  ,shade: 0 //不显示遮罩
			  ,shadeClose: true //点击遮罩关闭层
			  ,yes: function(index){
			    layer.close(index);
			  }
			});
		}
		//二号主机参数显示
		function clicktwo() {
						//边缘弹出
			layer.open({
			  type: 1
			  ,title: '二号主机参数' //不显示标题栏
			  ,skin: 'layui-layer-molv' //样式类名
			  ,offset:  ['18%', '15%'] //具体配置参考：offset参数项
			  ,area: ['300px', '485px']
			  ,content: '<div style="padding: 10px 20px;"><table style="border-collapse:separate; border-spacing:15px;"><tr align="center">'
			  +'<td colspan="2">主机控制模式  <button type="button" style="margin-left:15px;" class="btn btn-info">本地</button></td>'
			  +'</tr><tr><td >冷冻水出水温度：</td><td>'
				+'<span class="label label-danger" style="width: 82px;margin-left:10px;">15.6</span> ℃'
				+'</td></tr><tr><td >冷冻水回水温度：</td><td>'
				+'<span class="label label-danger" style="width: 82px;margin-left:10px;">16.5</span> ℃'
				+'</td></tr><tr><td >冷却水出水温度：</td><td>'
				+'<span class="label label-danger" style="width: 82px;margin-left:10px;">20.5</span> ℃'
				+'</td></tr><tr><td >冷却水回水温度：</td><td>'
				+'<span class="label label-danger" style="width: 82px;margin-left:10px;">18.9</span>℃'
				+'</td></tr><tr><td >总负荷率：</td><td>'
				+'<span class="label label-danger" style="width: 82px;margin-left:10px;">00.0</span>%'
				+'</td></tr><tr><td >制冷设定温度：</td><td>'
				+'<span class="label label-danger" style="width: 82px;margin-left:10px;">7.0</span>℃'
				+'</td></tr><tr align="center">'
			  +'<td colspan="2">主机运行模式  <button type="button" style="margin-left:15px;" class="btn btn-success">运行</button></td>'
				+'</tr><tr align="center">'
			  +'<td colspan="2">主机启停模式  <button type="button" style="margin-left:15px;" class="btn">启动</button></td>'
				+'</tr></table></div>'
			  ,btn: '关闭'
			  ,btnAlign: 'a' //按钮居中
			  ,anim : 1   //弹出 动画
			  ,isOutAnim : true //关闭动画效果
			  ,shade: 0 //不显示遮罩
			  ,shadeClose: true //点击遮罩关闭层
			  ,yes: function(index){
			    layer.close(index);
			  }
			});
		}
		//三号主机参数显示
		function clickthree() {
						//边缘弹出
			layer.open({
			  type: 1
			  ,title: '三号主机参数' //不显示标题栏
			  ,skin: 'layui-layer-molv' //样式类名
			  ,offset:  ['18%', '55%'] //具体配置参考：offset参数项
			  ,area: ['300px', '485px']
			  ,content: '<div style="padding: 10px 20px;"><table style="border-collapse:separate; border-spacing:15px;"><tr align="center">'
			  +'<td colspan="2">主机控制模式  <button type="button" style="margin-left:15px;" class="btn btn-info">本地</button></td>'
			  +'</tr><tr><td >冷冻水出水温度：</td><td>'
				+'<span class="label label-danger" style="width: 82px;margin-left:10px;">15.6</span> ℃'
				+'</td></tr><tr><td >冷冻水回水温度：</td><td>'
				+'<span class="label label-danger" style="width: 82px;margin-left:10px;">16.5</span> ℃'
				+'</td></tr><tr><td >冷却水出水温度：</td><td>'
				+'<span class="label label-danger" style="width: 82px;margin-left:10px;">20.5</span> ℃'
				+'</td></tr><tr><td >冷却水回水温度：</td><td>'
				+'<span class="label label-danger" style="width: 82px;margin-left:10px;">18.9</span>℃'
				+'</td></tr><tr><td >总负荷率：</td><td>'
				+'<span class="label label-danger" style="width: 82px;margin-left:10px;">00.0</span>%'
				+'</td></tr><tr><td >制冷设定温度：</td><td>'
				+'<span class="label label-danger" style="width: 82px;margin-left:10px;">7.0</span>℃'
				+'</td></tr><tr align="center">'
			  +'<td colspan="2">主机运行模式  <button type="button" style="margin-left:15px;" class="btn btn-success">运行</button></td>'
				+'</tr><tr align="center">'
			  +'<td colspan="2">主机启停模式  <button type="button" style="margin-left:15px;" class="btn">启动</button></td>'
				+'</tr></table></div>'
			  ,btn: '关闭'
			  ,btnAlign: 'a' //按钮居中
			  ,anim : 4   //弹出 动画
			  ,isOutAnim : true //关闭动画效果
			  ,shade: 0 //不显示遮罩
			  ,shadeClose: true //点击遮罩关闭层
			  ,yes: function(index){
			    layer.close(index);
			  }
			});
		}
		
		function selectSelect() {
			var aLi = document.querySelectorAll('.select');
		    for (var i = 0; i < aLi.length; i++) {
		        aLi[i].addEventListener('click', function(e){
		        		$("div").removeClass("select box-shadow-2");
		        		$("div").addClass("select");
		        	if(e.target.className=="select"){
		        		$(this).removeClass("select");
		        		$(this).addClass("select box-shadow-2");
		        	}else if(e.target.className=="select box-shadow-2"){
		        		$(this).removeClass("select box-shadow-2");
		        		$("div").addClass("select");
		        	}else{
		        		$("div").addClass("select");
		        	}
		        });
		    }
		}
		
		//一号水泵参数显示
		function clickSB1() {
			layer.confirm('确定要启用该水泵吗？',{icon: 3, title:'水泵提示信息'}, function(){
			  layer.msg('启动成功', {icon: 1});
			}, function(){
			  layer.msg('停止成功', {icon: 1});
			});
		}
		//冷却塔风机参数显示
		function clickSB2() {
			//边缘弹出
			layer.confirm('确定要启用该冷却塔风机吗？',{icon: 3, title:'风机提示信息'}, function(){
			  layer.msg('启动成功', {icon: 1});
			}, function(){
			  layer.msg('停止成功', {icon: 1});
			});
			
		}
		//变频 弹出层
		function bianpin() {
			$(".label-inverse").click(function(){
				var test=$(this);
				var id=test.attr("id");
				if(id=="sp_pop"){
					return;
				}else{
					layer.prompt({
					  value: $(this).html(),
					  title: '请输入变频值'
					}, function(value, index, elem){
					   test.html(value);
					   layer.close(index);
					});  
				}
				
			});
		}
		//点击变频
		function selectBp(){
				$(".label-danger,.label-important").click(function(){
					if($(this).html()=="变频"){
						$(this).removeClass("label label-danger");
				        $(this).addClass("label label-important");
				        $(this).html("停止");
			        }else {
			        	$(this).removeClass("label label-important");
				        $(this).addClass("label label-danger");
				        $(this).html("变频");
			        }
				});
		}
		</script>
		
		<!-- Le styles -->
		<STYLE type="text/css">
			body {
			background:url(/emcc-new/assets/img/gnxtgl.jpg)  no-repeat; background-size:99% 100%;
			}
			
.box-shadow-2 {
	-webkit-box-shadow: 0 0 10px #1d1f24;
	-moz-box-shadow: 0 0 10px #1d1f24;
	box-shadow: 0 0 10px #1d1f24;
}
ul{
padding:0;
font-family: 华文中宋;
font-size: 16px;
color: #FFFFFF;
line-height:2;
}
li {list-style-type:none;
padding:3px;
}
table tr{
border-collapse:separate;
	border-spacing:10px 50px;
}
</style>
	</head >
	<body style="border: 0px solid red;">
		<!-- 空调系统管理 -->
		<div  style="border: 0px solid red;margin-top:3%;width:90%;text-align: center;color: white;">
			<h1>北辰时代中心西站供暖系统图</h1>
		</div>
        <!-- 温度 -->
         <div style="border: 0px solid red;position:absolute;top:23%;right:66%;color: #E0EEE0;font-size: 16px;">回水温度：</div>
         <span class="label label-weather" style="border: 0px solid red;position:absolute;top:23.5%;right:60%;"> 51.0 ℃ </span>
         <div style="border: 0px solid red;position:absolute;top:35%;right:66%;color: #E0EEE0;font-size: 16px;">出水温度：</div>
         <span class="label label-weather" style="border: 0px solid red;position:absolute;top:35%;right:60%;"> 51.0 ℃ </span>
        
		 <div style="border: 0px solid red;position:absolute;top:68%;right:66%;color: #E0EEE0;font-size: 16px;">回水温度：</div>
         <span class="label label-weather" style="border: 0px solid red;position:absolute;top:68%;right:60%;"> 51.0 ℃ </span>
         <div style="border: 0px solid red;position:absolute;top:80%;right:66%;color: #E0EEE0;font-size: 16px;">出水温度：</div>
         <span class="label label-weather" style="border: 0px solid red;position:absolute;top:80%;right:60%;"> 51.0 ℃ </span>
         
         <!-- 温度 -->
		  <span class="label label-weather" style="border: 0px solid red;position:absolute;top:18%;right:42%;"> 50.0 Hz </span>
         <span class="label label-weather" style="border: 0px solid red;position:absolute;top:62%;right:42%;"> 50.0 Hz </span>
         
         <!-- 空调系统管理 -->
         <!-- 温度压力 -->
         
         <div style="border: 0px solid red;position:absolute;top:39%;right:20%;width:5%;color: #E0EEE0;font-size: 16px;">温度：</div>
         <span class="label label-weather" style="border: 0px solid red;position:absolute;top:39%;right:16%;width:5%;">47.0℃</span>
         <div style="border: 0px solid red;position:absolute;top:10%;right:20%;width:5%;color: #E0EEE0;font-size: 16px;">压力：</div>
         <span class="label label-weather" style="border: 0px solid red;position:absolute;top:10%;right:16%;width:5%;">0.38 MPa</span>
         
         <div style="border: 0px solid red;position:absolute;top:89%;right:20%;width:5%;color: #E0EEE0;font-size: 16px;">温度：</div>
         <span class="label label-weather" style="border: 0px solid red;position:absolute;top:89%;right:16%;width:5%;">47.0℃</span>
         <div style="border: 0px solid red;position:absolute;top:60%;right:20%;width:5%;color: #E0EEE0;font-size: 16px;">压力：</div>
         <span class="label label-weather" style="border: 0px solid red;position:absolute;top:60%;right:16%;width:5%;">0.38 MPa</span>
	</body>
</html>
