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
		<link rel="stylesheet" href="../assets/css/style.css">
		<link rel="stylesheet" href="../assets/css/loader-style.css">
		<link rel="stylesheet" href="../assets/css/bootstrap.css">
		<script type="text/javascript"
			src="../js/jquery-1.8.2.min.js">
		</script>
		<script type="text/javascript" src="../js/jquery-tab.js">
		</script>
		<script type="text/javascript" src="../assets/js/bootstrap.js">
		</script>
		<script src="http://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"
		type="text/javascript">
		</script>
		<script type="text/javascript"
			src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
		<style type="text/css">
		/* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
			/* =========
				Get Fonts */
		@import url(http://fonts.googleapis.com/css?family=Quicksand);
		
		@import
			url(http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css)
			;
		
		/* ================
				   Assign Variables */ /* ===========================
				   Setup Mixins/Helper Classes */
		.clearfix:after,.container:after,.tab-nav:after {
			content: ".";
			display: block;
			height: 0;
			clear: both;
			visibility: hidden;
		}
		
		/* ==========
				   Setup Page */
		*,*:before,*:after {
			box-sizing: border-box;
		}
		
		body {
			font-family: 'Quicksand', sans-serif;
		}
		
		/* =================
				   Container Styling */
		.container {
			position: relative;
			background: white;
			padding: 3em 0em 0em 0em;
			width: 100%;
		}
		
		/* ===========
				   Tab Styling */
		.tab-group {
			position: relative;
			border: 1px solid #eee;
			/* margin-top: 10.5em;*/
			border-radius: 0 0 10px 10px;
		}
		
		.tab-group section {
			opacity: 0;
			height: 0;
			padding: 0 1em;
			overflow: hidden;
			transition: opacity 0.4s ease, height 0.4s ease;
		}
		
		.tab-group section.active {
			opacity: 1;
			height: auto;
			overflow: visible;
		}
		
		.tab-nav {
			list-style: none;
			margin: -2.5em -1px 0 0;
			padding: 0;
			height: 2.5em;
			overflow: hidden;
		}
		
		.tab-nav li {
			display: inline;
		}
		
		.tab-nav li a {
			top: 1px;
			position: relative;
			display: block;
			float: left;
			border-radius: 10px 10px 0 0;
			background: #eee;
			line-height: 2em;
			padding: 0 1em;
			text-decoration: none;
			color: grey;
			margin-top: .5em;
			margin-right: 1px;
			transition: background .2s ease, line-height .2s ease, margin .2s ease;
		}
		
		.tab-nav li.active a {
			background: #6EB590;
			color: white;
			line-height: 2.5em;
			margin-top: 0;
		}
		
		.content_title_01 {
			width: 100%;
			height: 25px;
			line-height: 25px;
			background: url(/emcc-new/images/title_bg_01.png) no-repeat;
		}
		
		.content_title_01_txt {
			margin-left: 25px;
			_margin-left: 13px;
			color: #FFFFFF;
			float: left;
			font-size: 14px;
		}
		
		.top5 {
			margin-left: 5px;
			margin-top: 10px;
			margin-bottom: 50px;
			height: 20px;
			line-height: 50px;
			width: 90%;
		}
		
		.top5 img,span {
			vertical-align: middle;
		}
		
		.box-shadow-2 {
			-webkit-box-shadow: 0 0 10px #1d1f24;
			-moz-box-shadow: 0 0 10px #1d1f24;
			box-shadow: 0 0 10px #1d1f24;
		}
		
		.obj {
			width: 611.4px;
			height: 446.2px;
			background: #eee;
		}
		
		.box-shadow-5 {
			-webkit-box-shadow: inset 0 0 10px #0CC;
			-moz-box-shadow: inset 0 0 10px #0CC;
			box-shadow: inset 0 0 10px #0CC;
		}
		</style>
	<script>
	$(function() {
			$("#top").css("color","#3F3F3F");
			$(".dropdown-toggle").css("font-size","24px");
			$(".dropdown-toggle").css("font-family","华文中宋");
			$(".dropdown-toggle").css("line-height","20px");
			$(".col-sm-3").css("padding-left","6px");
			var aLi = document.querySelectorAll('.dropdown-toggle');
		    for (var i = 0; i < aLi.length; i++) {
		        aLi[i].addEventListener('click', function(e){
		        	$(".dropdown-toggle").css("color","white");
		        	if(e.target.className=="dropdown-toggle"){
		        		$(this).css("color","#3F3F3F");
		        	}else{
		        		$(".dropdown-toggle").css("color","white");
		        	}
		        });
		    }
	});
	</script>
	</head>
	<div class="container-fluid paper-wrap bevel tlbr"
		style="">
		<!-- 内容板块 -->
		<div class="content-wrap" style="border: 0px green solid;width:104%;height:100%;">
				<!-- 图表 -->
				<div style="border: 0px green solid;width:75%;height:90%;float:left;margin-left: -2%;">
					<div class="col-lg-4 box-shadow-2"
						style="border: 0px red solid;width:74%;height:46%;margin-top: 1%;">
						<div class="weather-wrap">
							<iframe
								src="../monitor/monthColumn"
								width="100%" height="100%"  frameborder="no"  border="0"></iframe>
						</div>
					</div>
					<div class="col-lg-3 box-shadow-2"
						style="border: 0px red solid; width:25%;height:46%;margin-top: 1%;margin-left: 1%;">
							<div class="weather-wrap" id="righttop5">
							<!--TOP5  -->
								<iframe
								src="../monitor/yearBar"
								width="100%" height="100%" frameborder="no"  border="0"></iframe>
						</div>
					</div>
					<!-- 吨标准煤 -->
					<div class="col-lg-8 box-shadow-2"
						style="border: 0px solid ; margin-top: 1%;width: 100%;height:50%; ">
						<div style="background: #2C3240;">
							<div style="width: 71%; float: left;top: -15px; ">
								<iframe style="padding: 0;" id="fr"
									src="../monitor/yearColumn" width="100%"
									height="100%" border="0" frameborder="0"
									marginwidth="0″
		                   marginheight="
									0" scrolling="no" allowtransparency="yes"
									style="margin-top: -5px;">
								</iframe>
							</div>
							<div style="width: 28.4%; float: left;margin-left: 5px;">
								<iframe id="fr" src="../monitor/yearPie"
									width="100%" height="80%" border="0" frameborder="0"
									marginwidth="0″
		                     marginheight="0" scrolling="no" allowtransparency="yes"
									style="margin-top: 0px;">
								</iframe>
							</div>
						</div>
					</div>
				</div>		
				<!-- 医院简介 -->
				<div style="border: 0px red solid;width:25%;height:88%;margin-left: 1%;margin-top: 0.8%;float:left;">
					<div style="border: 0px blue solid;width:100%;">
							<div class="col-lg-5 box-shadow-2"
									style="border: 0px solid;width:100%; height: 100%;">
									<div class="weather-wrap"  style="color: white; font-family: 华文中宋;margin-top: 10px;">
										<!--百度地图容器-->
										<div style="width: 100%; height: 250px; border: #ccc solid 1px;"
											id="dituContent">
										 <script type="text/javascript">
										    //创建和初始化地图函数：
										    function initMap(){
										        createMap();//创建地图
										        setMapEvent();//设置地图事件
										        addMapControl();//向地图添加控件
										        addMarker();//向地图中添加marker
										    }
										    
										    //创建地图函数：
										    function createMap(){
										        var map = new BMap.Map("dituContent");//在百度地图容器中创建一个地图
										        var point = new BMap.Point(112.959825,36.03861);//定义一个中心点坐标
										        map.centerAndZoom(point,17);//设定地图的中心点和坐标并将地图显示在地图容器中
										        window.map = map;//将map变量存储在全局
										    }
										    
										    //地图事件设置函数：
										    function setMapEvent(){
										        map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
										        map.enableScrollWheelZoom();//启用地图滚轮放大缩小
										        map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
										        map.enableKeyboard();//启用键盘上下左右键移动地图
										    }
										    
										    //地图控件添加函数：
										    function addMapControl(){
										        //向地图中添加缩放控件
											var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
											map.addControl(ctrl_nav);
										        //向地图中添加缩略图控件
											var ctrl_ove = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:1});
											map.addControl(ctrl_ove);
										        //向地图中添加比例尺控件
											var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
											map.addControl(ctrl_sca);
										    }
										    
										    //标注点数组
										    var markerArr = [{title:"三元中能煤业",content:"三元中能煤业", point:"112.959825,36.03861",isOpen:0,icon:{w:21,h:21,l:0,t:0,x:6,lb:5}} ];
										    //创建marker
										    function addMarker(){
										        for(var i=0;i<markerArr.length;i++){
										            var json = markerArr[i];
										            var p0 = json.point.split("|")[0];
										            var p1 = json.point.split("|")[1];
										            var point = new BMap.Point(p0,p1);
													var iconImg = createIcon(json.icon);
										            var marker = new BMap.Marker(point,{icon:iconImg});
													var iw = createInfoWindow(i);
													var label = new BMap.Label(json.title,{"offset":new BMap.Size(json.icon.lb-json.icon.x+10,-20)});
													marker.setLabel(label);
										            map.addOverlay(marker);
										            label.setStyle({
										                        borderColor:"#808080",
										                        color:"#333",
										                        cursor:"pointer"
										            });
													
													(function(){
														var index = i;
														var _iw = createInfoWindow(i);
														var _marker = marker;
														_marker.addEventListener("click",function(){
														    this.openInfoWindow(_iw);
													    });
													    _iw.addEventListener("open",function(){
														    _marker.getLabel().hide();
													    })
													    _iw.addEventListener("close",function(){
														    _marker.getLabel().show();
													    })
														label.addEventListener("click",function(){
														    _marker.openInfoWindow(_iw);
													    })
														if(!!json.isOpen){
															label.hide();
															_marker.openInfoWindow(_iw);
														}
													})()
										        }
										    }
										    //创建InfoWindow
										    function createInfoWindow(i){
										        var json = markerArr[i];
										        var iw = new BMap.InfoWindow("<b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b><div class='iw_poi_content'>"+json.content+"</div>");
										        return iw;
										    }
										    //创建一个Icon
										    function createIcon(json){
										        var icon = new BMap.Icon("http://app.baidu.com/map/images/us_mk_icon.png", new BMap.Size(json.w,json.h),{imageOffset: new BMap.Size(-json.l,-json.t),infoWindowOffset:new BMap.Size(json.lb+5,1),offset:new BMap.Size(json.x,json.h)})
										        return icon;
										    }
										    
										    initMap();//创建和初始化地图
										</script>
									</div>
									<p style ="color: white; font-size: 14px; font-family:华文中宋; margin-top: 50px">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 长治三元中能煤业有限公司成立于2010年,注册资金50万元人民币。是一家有限责任公司自然人投资或控股的法人独资，长治三元中能煤业有限公司法人是张炳林，主要面象—市场，客户群为—。员工人数50人，不断提升企业的核心竞争力，使企业在发展中树立起良好的社会形象。凭借专业的水平和成熟的技术。公司将始终坚持“质量第一，信誉第一”的宗旨，以科学的管理手段，雄厚的技术力量，将不断深化改革，创新机制，适应市场，全面发展，欢迎各界朋友莅临参观、指导和业务洽谈。

										长治三元中能煤业有限公司以诚信、实力和产品质量获得业界的高度认可。欢迎各界朋友莅临参观、指导和业务洽谈。
										</p>
							</div>
						</div>
				</div>
		</div>
</div>
	<script>
window.jQuery || document.write('__tag_328$41_<\/script>')
</script>
	<script type="text/javascript">
$(function() {
	// Calling the plugin
	$('.tab-group').tabify();
})
</script>
	<script type="text/javascript">  
        $(document).ready(function(){  
        if($.browser.msie) {  
          $('.obj').boxShadow(-10,-10,5,"#0cc"); //obj元素使用了box-shadow  
        }  
      });  
    </script>
</html>