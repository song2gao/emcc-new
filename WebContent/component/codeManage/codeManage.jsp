<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编码通用组件</title>
<jsp:include page="/component/common/importEasyui.jsp"></jsp:include>
<script type="text/javascript" src="/emcc-web/js/codeManage.js" charset="UTF-8"></script>
<script type="text/javascript">
$(function(){
	initCodeManage();
	setCodeManageEditStatus('code',true);
});
</script>
</head>
<body>
	<select id="code" class="codeManage" parentCode="JLDWBM" codeType="JLDWBM" style="width:100px;">
    </select>
    <input type="button" value="获取文本" onclick="alert(getCodeManageText('code'));" />
    <input type="button" value="获取值" onclick="alert(getCodeManageValue('code'));" />
</body>
</html>