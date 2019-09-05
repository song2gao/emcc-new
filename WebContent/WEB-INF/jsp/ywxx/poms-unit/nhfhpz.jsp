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
			src="/emcc-web/component/jquery-easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript"> 
 	
 	 $(function(){ 
	     InitTreeData();
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
					R2
					<span style="width: 40px;"></span>

						<font class="font_cg">能耗负荷配置
							
						</font>
					
				</div>
			</div>
		</div>
</body>
</html>