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
		<title></title>
		<link rel="stylesheet" type="text/css" href="/emcc-new/css/themes/default/easyui.css"></link>
		<link rel="stylesheet" type="text/css" href="/emcc-new/css/themes/icon.css"></link>
		<script type="text/javascript"	src="/emcc-new/js/jquery-1.8.2.min.js"></script>
		<script type="text/javascript"	src="/emcc-new/js/jquery.easyui.min.js"></script>
		<script type="text/javascript"	src="/emcc-new/js/page.js"></script>
	<script type="text/javascript">
	// Tree
	var type="1";
	$(function() {  //加载数据
		type="${type}";
		InitTreeData();
	});
	function InitTreeData() {
		$('#MyTree-QuXian').tree({
			url :'gettree?pid=0&type='+type,
			checkbox : false,
			//animate : true,
			onBeforeExpand : function(node) {
				$('#MyTree-QuXian').tree('options').url = 'gettree?pid='+ node.id+'&type='+node.attributes.eid+'&energyType='+type;
			},
			onClick : function(node) {	
				parent.GetClickData(node);
			},
			onCheck:function(node){
				var nodes1=new Array();
				var nodes2=new Array();
				nodes1=$('#MyTree-QuXian').tree('getChecked');
				parent.GetCheckData(nodes1);
			}
		});
	}
</script>
<style type="text/css">
.top{
 background-image:url("/emcc-new/image/monitor/bule-bg100X23.jpg");
 width:100%;
 height:23px;
 font-size:16px;
 color:#94c8ff;
 text-align:left;
 line-height:23px;
 padding-left:-3px;
 margin-top:0px;
 font-weight:bold;
}
.content_title_01_txt{
	margin-left:25px;
	_margin-left:13px;
	color:#FFFFFF;
	float:left;
	font-size:14px;
}
.content_title_01{
	width:100px;
	height:25px;
	line-height:25px;
	background:url(/emcc-new/images/title_bg_01.png) no-repeat;

}
ul{
margin:0px;
padding:3px;
font-family: 华文中宋;
font-size: 24px;
color: #FFFFFF;

}
li {list-style-type:none;
font-size: 24px;
padding:10px;
margin:0px;
}
</style>
	</head>
	<body style="width:100%;margin:0px;border:0px solid red;margin-top:0px;overflow: scroll;overflow-y:hidden;">	
			<div class="content_title_01" style="border:0px solid red;">
				<div class="content_title_01_txt">用能点位</div>
			</div>
			<ul class="easyui-tree" style="height:546px;overflow: auto;color:#FFFFFF;" id="MyTree-QuXian">
			</ul>
	</body>
</html>

