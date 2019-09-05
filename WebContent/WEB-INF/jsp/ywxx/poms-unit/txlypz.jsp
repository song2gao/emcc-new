<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
		<link href="/emcc-web/css/poms-system/xtqygl.css" rel="stylesheet"
			type="text/css" />
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
	<script type="text/javascript"> 
 	
 	 $(function(){ 
	     InitTreeData();
	     GetData();
	 });
	 
     function InitTreeData()
     {
      	$('#MyTree').tree({
          url:'toUserSel.action?m=load_QiYe',
          checkbox:false,
          animate:true,
          onBeforeExpand:function(node){
          	//alert(node.id);
          	 $('#MyTree').tree('options').url = 'toUserSel.action?m=load_Users&qid=' + node.id+"&type="+node.attributes.type;
          },
          onClick:function(node){//单击某个树节点,对应的Tabs发生数据变化
          	
          }
        });
     }
     
     </script>
<body>
<div id="main" class="xtqygl_main">
			<div id="yhgl_left">
				<div class="yhgltreeDiv" align="left">
					<ul class="easyui-tree" style="margin-left: 3px" id="MyTree">
					</ul>
				</div>
			</div>
			<div id="yhgl_right" style="width: 1040px;">
				<div id="yhgl_right_top" align="left">
					<br />
						<font class="font_cg">&nbsp;&nbsp;
						企业: <input type="text" id="" name="qy" />&nbsp;&nbsp;
						前置机: <input type="text" id="qzj" name="qzj" />
						</font>
					<input type="button" value="查询" class="btnClass" id="search"/>
					<span style="width: 40px;"></span>
					<input type="button" value="增加" class="btnClass" />
					<input type="button" value="修改" class="btnClass" />
					<input type="button" value="删除" class="delClass" />
				</div>
				<table id="cc" style="height: 480px"></table>
			</div>
		</div>
</body>
<script type="text/javascript">
	function GetData(){
		var args={};
		args.gdType=$("#piName").val();
		args.gdState=$("#piCodes").val();
		args.pageIndex=1;//页索引
		args.pageSize=10;//页容量
		BingData("#cc",args,"connRouteConfig.action?m=toSearchRouteConfig",null);
	}
	$('#cc').datagrid( {
		title : '通讯路由配置表',
		striped : true,
		fitColumns: true, //自适应列的大小
		pagination: true,
		rownumbers: true,
		singleSelect:true,//设置单选、多选。true单选，false 多选。
		columns : [ [ {field : 'crcEnterpriseId',title : '企业',width : 100},
					  {field : 'pomsFrontProcessorConfig',title : '前置机编号',width : 100,formatter: function(value, rowData, rowIndex){return value.communicateProtocal}},
					  {field : 'crcAssembleId',title : '采集器名称',width : 100},
					  {field : 'crcAssembleIp',title : '采集终端IP',width : 100},
					  {field : 'crcCommunicateSerial',title : '采集器序号',width : 100},
					  {field : 'crcCommunicateType',title : '通讯类型',width : 100},
					  {field : 'crcBackups',title : '备注',width : 100} 
					  
				  ] ]
	});
	//点击查询按钮时，根据条件查询信息
	$("#search").click(function(){
		//获取后台数据
		//$("#tt").datagrid("loadData",[]); 
		GetData();
	}); 
</script>
</html>