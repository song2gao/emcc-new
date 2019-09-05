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
		<title>电力电耗查询-中惠元景能耗监测平台</title>
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
		        		$(this).html("运行")
		        	}else if(e.target.className=="btn btn-success"){
		        		$(this).removeClass("btn btn-success");
		        		$(this).addClass("btn btn-danger");
		        		$(this).html("停止")
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
				+'<span class="label label-danger" style="width: 82px;margin-left:10px;">16.3</span> ℃'
				+'</td></tr><tr><td >冷冻水出水温度：</td><td>'
				+'<span class="label label-danger" style="width: 82px;margin-left:10px;">16.3</span> ℃'
				+'</td></tr><tr><td >冷冻水出水温度：</td><td>'
				+'<span class="label label-danger" style="width: 82px;margin-left:10px;">16.3</span> ℃'
				+'</td></tr><tr><td >冷冻水出水温度：</td><td>'
				+'<span class="label label-danger" style="width: 82px;margin-left:10px;">16.3</span>℃'
				+'</td></tr><tr><td >冷冻水出水温度：</td><td>'
				+'<span class="label label-danger" style="width: 82px;margin-left:10px;">16.3</span>℃'
				+'</td></tr><tr><td >冷冻水出水温度：</td><td>'
				+'<span class="label label-danger" style="width: 82px;margin-left:10px;">16.3</span>℃'
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
				+'<span class="label label-danger" style="width: 82px;margin-left:10px;">16.3</span> ℃'
				+'</td></tr><tr><td >冷冻水出水温度：</td><td>'
				+'<span class="label label-danger" style="width: 82px;margin-left:10px;">16.3</span> ℃'
				+'</td></tr><tr><td >冷冻水出水温度：</td><td>'
				+'<span class="label label-danger" style="width: 82px;margin-left:10px;">16.3</span> ℃'
				+'</td></tr><tr><td >冷冻水出水温度：</td><td>'
				+'<span class="label label-danger" style="width: 82px;margin-left:10px;">16.3</span>℃'
				+'</td></tr><tr><td >冷冻水出水温度：</td><td>'
				+'<span class="label label-danger" style="width: 82px;margin-left:10px;">16.3</span>℃'
				+'</td></tr><tr><td >冷冻水出水温度：</td><td>'
				+'<span class="label label-danger" style="width: 82px;margin-left:10px;">16.3</span>℃'
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
				+'<span class="label label-danger" style="width: 82px;margin-left:10px;">16.3</span> ℃'
				+'</td></tr><tr><td >冷冻水出水温度：</td><td>'
				+'<span class="label label-danger" style="width: 82px;margin-left:10px;">16.3</span> ℃'
				+'</td></tr><tr><td >冷冻水出水温度：</td><td>'
				+'<span class="label label-danger" style="width: 82px;margin-left:10px;">16.3</span> ℃'
				+'</td></tr><tr><td >冷冻水出水温度：</td><td>'
				+'<span class="label label-danger" style="width: 82px;margin-left:10px;">16.3</span>℃'
				+'</td></tr><tr><td >冷冻水出水温度：</td><td>'
				+'<span class="label label-danger" style="width: 82px;margin-left:10px;">16.3</span>℃'
				+'</td></tr><tr><td >冷冻水出水温度：</td><td>'
				+'<span class="label label-danger" style="width: 82px;margin-left:10px;">16.3</span>℃'
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
			background:url(/emcc-new/assets/img/sinowestar.gif)  no-repeat; background-size:84.7% 110%;
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
         <span class="label label-info" style="border: 0px solid red;position:absolute;top:26%;width:5%;left:22.5%;"> 工 频 </span>
         <span class="label label-gongpin"  id="sp_pop"  style="border: 0px solid red;position:absolute;top:39%;left:22.5%;width:5%;">50 </span>
         <span class="label label-important" style="border: 0px solid red;position:absolute;top:50.5%;left:22.5%;width:5%;">停止</span>
         <span class="label label-inverse" style="border: 0px solid red;position:absolute;top:63%;left:22.5%;width:5%;">&nbsp;60 </span>
         <span class="label label-danger" style="border: 0px solid red;position:absolute;top:75%;left:22.5%;width:5%;"> &nbsp;变频 </span>
         <span class="label label-inverse" style="border: 0px solid red;position:absolute;top:88%;left:22.5%;width:5%;">45</span>
         <!-- 温度 -->
         <span class="label label-weather" style="border: 0px solid red;position:absolute;top:26%;left:30%;"> 18.9 ℃ </span>
         <span class="label label-weather" style="border: 0px solid red;position:absolute;top:38%;left:30%;"> 20.5 ℃ </span>
         <span class="label label-weather" style="border: 0px solid red;position:absolute;top:52%;left:30%;"> 20.5 ℃ </span>
         <span class="label label-weather" style="border: 0px solid red;position:absolute;top:62%;left:30%;"> 18.9 ℃ </span>
         <span class="label label-weather" style="border: 0px solid red;position:absolute;top:76%;left:30%;"> 20.5 ℃ </span>
         <span class="label label-weather" style="border: 0px solid red;position:absolute;top:88%;left:30%;"> 18.9 ℃ </span>
         
          <!-- 六个 -->
         <div onclick="clickSB2();" class="select" style="border: 0px solid red;position:absolute;top:7%;left:8%;width:7%;height:12%;"></div>
         <div onclick="clickSB2();" class="select" style="border: 0px solid red;position:absolute;top:24%;left:8%;width:7%;height:12%;"></div>
         <div onclick="clickSB2();" class="select" style="border: 0px solid red;position:absolute;top:40%;left:8%;width:7%;height:12%;"></div>
         <div onclick="clickSB2();" class="select" style="border: 0px solid red;position:absolute;top:56.2%;left:8%;width:7%;height:12%;"></div>
         <div onclick="clickSB2();" class="select" style="border: 0px solid red;position:absolute;top:72.4%;left:8%;width:7%;height:12%;"></div>
         <div onclick="clickSB2();" class="select" style="border: 0px solid red;position:absolute;top:89.4%;left:8%;width:7%;height:12%;"></div>
         <!-- 工频 -->
         <div onclick="clickSB1();" class="select" style="border: 0px solid red;position:absolute;top:29%;left:22.8%;width:4%;height:10%;"></div>
         <div onclick="clickSB1();" class="select" style="border: 0px solid red;position:absolute;top:53.5%;left:23%;width:4%;height:10%;"></div>
         <div onclick="clickSB1();" class="select" style="border: 0px solid red;position:absolute;top:78%;left:22.8%;width:4%;height:10%;"></div>
          <!-- 变频 -->
         <div onclick="clickSB1();" class="select" style="border: 0px solid red;position:absolute;top:29%;left:60.3%;width:4%;height:10%;"></div>
         <div onclick="clickSB1();" class="select" style="border: 0px solid red;position:absolute;top:53.5%;left:60.4%;width:4%;height:10%;"></div>
         <div onclick="clickSB1();" class="select" style="border: 0px solid red;position:absolute;top:78%;left:60.3%;width:4%;height:10%;"></div>
         
         <!-- 主机 -->
         <div onclick="clickOne();"  class="select" style="border: 0px solid red;position:absolute;top:22%;left:34%;width:20%;height:17%;"></div>
		 <div class="btn-group" style="border: 0px solid red;position:absolute;top:40%;left:40%;">
           <button type="button" class="btn btn-warning">节能</button>
           <button type="button" class="btn btn-danger">停止</button>
         </div>
         <div onclick="clicktwo();" class="select" style="border: 0px solid red;position:absolute;top:47%;left:34%;width:20%;height:17%;">
         	
         </div>
         <div class="btn-group" style="border: 0px solid red;position:absolute;top:65%;left:40%;">
           <button type="button" class="btn btn-warning">节能</button>
           <button type="button" class="btn btn-success">运行</button>
         </div>
         <div onclick="clickthree();" class="select" style="border: 0px solid red;position:absolute;top:72%;left:34%;width:20%;height:17%;">
         	
         </div>
         <div class="btn-group" style="border: 0px solid red;position:absolute;top:90%;left:40%;">
           <button type="button" class="btn btn-warning">节能</button>
           <button type="button" class="btn btn-danger">停止</button>
         </div>
         <!-- 温度 -->
         <span class="label label-weather" style="border: 0px solid red;position:absolute;top:26%;left:53%;"> 18.9 ℃ </span>
         <span class="label label-weather" style="border: 0px solid red;position:absolute;top:38%;left:53%;"> 20.5 ℃ </span>
         <span class="label label-weather" style="border: 0px solid red;position:absolute;top:52%;left:53%;"> 20.5 ℃ </span>
         <span class="label label-weather" style="border: 0px solid red;position:absolute;top:62%;left:53%;"> 18.9 ℃ </span>
         <span class="label label-weather" style="border: 0px solid red;position:absolute;top:76%;left:53%;"> 20.5 ℃ </span>
         <span class="label label-weather" style="border: 0px solid red;position:absolute;top:88%;left:53%;"> 18.9 ℃ </span>
		
         <!-- 空调系统管理 -->
         <span class="label label-important" style="border: 0px solid red;position:absolute;top:26%;left:60%;width:5%;">停止</span>
         <span class="label label-inverse" style="border: 0px solid red;position:absolute;top:39%;left:60%;width:5%;">50</span>
         <span class="label label-danger" style="border: 0px solid red;position:absolute;top:50.5%;left:60%;width:5%;">变频 </span>
         <span class="label label-inverse"  style="border: 0px solid red;position:absolute;top:63%;left:60%;width:5%;">500 </span>
         <span class="label label-info" style="border: 0px solid red;position:absolute;top:75%;left:60%;width:5%;">工频</span>
         <span class="label label-gongpin" id="sp_pop" style="border: 0px solid red;position:absolute;top:88%;left:60%;width:5%;">45</span>
         
         <!-- 温度压力 -->
         
         <div style="border: 0px solid red;position:absolute;top:27.5%;right:25%;width:5%;color: #E0EEE0;font-size: 16px;">温度：</div><span class="label label-weather" style="border: 0px solid red;position:absolute;top:28%;right:20%;width:5%;">47.0℃</span>
         <div style="border: 0px solid red;position:absolute;top:49.5%;right:25%;width:5%;color: #E0EEE0;font-size: 16px;">压力：</div><span class="label label-weather" style="border: 0px solid red;position:absolute;top:50%;right:20%;width:5%;">0.38 MPa</span>
        
         <!-- 有功电能 -->
		<div class="col-xs-3 box-shadow-2" style="margin-top:-2.3%;left:85%; width: 18%;height: 99.5%;border:0px solid red;margin-left: 0px;">
			<ul>
				<li id="weather">
					当前天气&#160;
				</li>
				<li id="weather2"></li>
				<li>今天湿度：57.6%</li>
				<li>当前照度：65000.0Lux</li>
				<li>—— —能耗分析— ——</li>
				<li>昨日消耗量：<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;00.0   KWh</li>
				<li>今日消耗量：<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;00.0   KWh</li>
				<li>今年消耗量：<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;19058.9   KWh</li>
				<li>节能率：<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;15.0   %</li>
				<li>节能额：<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3363.3   KWh</li>
				<li>减少碳排放：<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;834.5   吨</li>
			</ul>
		</div>
        
	</body>
</html>
