
<%@  page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/EasyUI_of_InsdepTheme-1.5.1-0.0.1/themes/insdep/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/EasyUI_of_InsdepTheme-1.5.1-0.0.1/themes/insdep/master.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/EasyUI_of_InsdepTheme-1.5.1-0.0.1/themes/insdep/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/jquery-easyui-1.5.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/jquery-easyui-1.5.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/jquery-easyui-1.5.3/datagrid-transposedview.js"></script>
<script>
/* var result=$.ajax({
	 type : "GET",  //提交方式  
     url : "${pageContext.request.contextPath}/user/showByTran",
     success: function(data)
     {
    	 result=JSON.parse(data);
     }
}); */
//alert(result);
$(function(){
	$('#tt').datagrid({
		       fit: true,
		       view: transposedview,
		       headerTextAlign: "center",
		       headerWidth: 100,
		       itemWidth: 200,
		       title: 'xzczcz',
		       fitColumns: false,
		       border: true,
		       singleSelect: true,
		       collapsible: false,
		       scrollbarSize: 0,
		       url: 'http://localhost/NewFirstGroup/user/showByTran',
		       method: 'get',
		       //queryParams: params,
		       columns: [[
		                  
{field:'userId',title:'ID',align:'right'},
{field:'userName',title:'用户名',align:'right'},
{field:'password',title:'密码',align:'right'},
{field:'roleName',title:'角色名',align:'right'},
{field:'userDescription',title:'备注',align:'right'},
		                  ]],
		      // pagination: pagination,
		      /*  onClickRow: clickRow,
		       onSelect: selectRow,
		       onLoadSuccess: loadSuccess,
		       onLoadError: function () {
	    } */
	 });
	})
	</script>
</head>
<body>
	<h1>DataGrid - TransposedView</h1>
	
	<table id="tt"></table>
</body>
</html>