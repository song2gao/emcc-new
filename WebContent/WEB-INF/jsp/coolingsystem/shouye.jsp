<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>北辰公共设施公司监测系统</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="/emcc-new/css/button.css">
<script type="text/javascript" src="/emcc-new/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="/emcc-new/js/layer.js"></script>
<style>
.top {
	width: 100%;
	height: 50%;
	color: white;
	font-size: 12px;
}

.chuck {
	width: 30%;
	height: 90%;
	float: left;
	margin-left: 30px;
	margin-top: 15px;
	opacity: 0.12;
	background-color: #ffffff;
	z-index: -100;
	position: relative;
}

.content {
	width: 30%;
	height: 90%;
	float: left;
	margin-left: 30px;
	margin-top: 15px;
	margin-left: -30%;
}

.left {
	width: 50%;
	float: left;
	height: 100%;
}

.middle {
	width: 20%;
	float: left;
	height: 50%;
	margin-top: 25%;
}

.right {
	width: 30%;
	float: left;
	height: 100%;
}

.title {
	font-size: 14px;
}

.value {
	font-size: 24px;
}

.left-ul li {
	line-height: 200%;
}

.left-ul {
	height: 70%;
}

.right-ul {
	height: 100%;
}

.right-ul li {
	line-height: 250%;
}

a {
	cursor: pointer;
}
</style>
<script type="text/javascript">

	$.ajax({
		url:"coolindex/indexData?energyType=1,2,5,6",
		dataType:"json",
		success:function(data){
			for(var i=0;i<data.cool.length;i++){
				var c=data.cool[i];
				var type=c.energyType;
				$("#"+type+"day").html(c.daySum);
				$("#"+type+"month").html(c.monthSum);
				$("#"+type+"year").html(c.yearSum);
			}
		}
	});
	function clickOne(val) {
		if(val==1){
			$('#mainPage',window.parent.document).attr("src","coolindex/ydfxfx");
		}else if(val==2){
			$('#mainPage',window.parent.document).attr("src","coolindex/ysfxfx");
		}else if(val==4){
			$('#mainPage',window.parent.document).attr("src","coolindex/lryfxfx");
		}
	}
</script>
</head>

<body>
	<div
		style="width: 99%; height: 100%;  background: url(image/bg.jpg) no-repeat;background-size: 100%;">
		<div class="top">
			<div class="chuck" ></div>
			<div class="content">
				<div class="left">
					<ul class="left-ul" id="1">
						<li class="title">日累计用电量(kWh)</li>
						<li class="value" id="1day">0</li>
						<li>月累计用电量</li>
						<li class="value" id="1month">0</li>
						<li>年累计用电量</li>
						<li class="value" id="1year">0</li>
					</ul>
					<hr />
					<a class="button button-primary button-pill button-small"
						href="javascript:void(0)" style="margin: 5% 10%"
						onclick="clickOne('1');">分项能耗</a>
				</div>
				<div class="middle">
					<img src="image/dian.png" width="48" height="64" />
				</div>
				<div class="right" style="background-color: #FFA93C">
					<ul class="right-ul">
						<li>去年今日</li>
						<li>0</li>
						<li>去年本月</li>
						<li>0</li>
						<li>去年总计</li>
						<li>0</li>
					</ul>
				</div>
			</div>
			<div class="chuck"></div>
			<div class="content">
				<div class="left">
					<ul class="left-ul" id="2">
						<li class="title">日累计用水量(t)</li>
						<li class="value" id="2day">0</li>
						<li>月累计用水量</li>
						<li class="value" id="2month">0</li>
						<li>年累计用水量</li>
						<li class="value" id="2year">0</li>
					</ul>
					<hr />
					<a class="button button-primary button-pill button-small"
						style="margin: 5% 10%" onclick="clickOne('2');">分项能耗</a>
				</div>
				<div class="middle">
					<img src="image/water.ico" width="48" height="64" />
				</div>
				<div class="right" style="background-color: #3A7FDA">
					<ul class="right-ul">
						<li>去年今日</li>
						<li>0</li>
						<li>去年本月</li>
						<li>0</li>
						<li>去年总计</li>
						<li>0</li>
					</ul>
				</div>
			</div>
			<div class="chuck"></div>
			<div class="content">
				<div class="left">
					<ul class="left-ul">
						<li class="title">日累计燃气量(m³)</li>
						<li class="value">0</li>
						<li>月累计燃气量</li>
						<li class="value">0</li>
						<li>年累计值燃气量</li>
						<li class="value">0</li>
					</ul>
					<hr />
					<a class="button button-primary button-pill button-small"
						style="margin: 5% 10%" onclick="clickOne('3');">分项能耗</a>
				</div>
				<div class="middle">
					<img src="image/fire.ico" width="64" height="64" />
				</div>
				<div class="right" style="background-color: #E34D4E">
					<ul class="right-ul">
						<li>去年今日</li>
						<li>0</li>
						<li>去年本月</li>
						<li>0</li>
						<li>去年总计</li>
						<li>0</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="top">
			<div class="chuck"></div>
			<div class="content">
				<div class="left">
					<ul class="left-ul">
						<li class="title">日累计冷热源(GJ)</li>
						<li class="value" id="5day">0</li>
						<li>月累计冷热源</li>
						<li class="value" id="5month">0</li>
						<li>年累计冷热源</li>
						<li class="value" id="5year">0</li>
					</ul>
					<hr />
					<a class="button button-primary button-pill button-small"
						style="margin: 5% 10%" onclick="clickOne('4');">分项能耗</a>
				</div>
				<div class="middle">
					<img src="image/cold.png" width="48" height="48" />
				</div>
				<div class="right" style="background-color: #3EB7AE">
					<ul class="right-ul">
						<li>去年今日</li>
						<li>0</li>
						<li>去年本月</li>
						<li>0</li>
						<li>去年总计</li>
						<li>0</li>
					</ul>
				</div>
			</div>
			<div class="chuck"></div>
			<div class="content">
				<div class="left">
					<ul class="left-ul">
						<li class="title">日累计蒸气量(m³)</li>
						<li class="value" id="6day">0</li>
						<li>月累计蒸气量</li>
						<li class="value" id="6month">0</li>
						<li>年累计蒸气量</li>
						<li class="value" id="6year">0</li>
					</ul>
					<hr />
					<a class="button button-primary button-pill button-small"
						style="margin: 5% 10%" onclick="clickOne('6');">分项能耗</a>
				</div>
				<div class="middle">
					<img src="image/air.ico" width="48" height="64" />
				</div>
				<div class="right" style="background-color: #8750AD">
					<ul class="right-ul">
						<li>去年今日</li>
						<li>0</li>
						<li>去年本月</li>
						<li>0</li>
						<li>去年总计</li>
						<li>0</li>
					</ul>
				</div>
			</div>
			<div class="chuck"></div>
			<div class="content">
				<div class="left">
					<ul class="left-ul">
						<li class="title">日累计总费用(元)</li>
						<li class="value">￥0</li>
						<li>月累计用电量</li>
						<li class="value">￥0</li>
						<li>年累计用电量</li>
						<li class="value">￥0</li>
					</ul>
					<hr />
					<a class="button button-primary button-pill button-small"
						style="margin: 5% 10%" onclick="clickOne('6');">分项能耗</a>
				</div>
				<div class="middle">
					<img src="image/doolar.ico" width="48" height="64" />
				</div>
				<div class="right" style="background-color: #74AD42">
					<ul class="right-ul">
						<li>去年今日</li>
						<li>￥0</li>
						<li>去年本月</li>
						<li>￥0</li>
						<li>去年总费用</li>
						<li>￥0</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
