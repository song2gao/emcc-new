<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文件上传页面</title>
<script type="text/javascript" src="/emcc-web/component/jquery-easyui/jquery-1.7.2.min.js" ></script>
<script type="text/javascript" src="/emcc-web/js/fileUploadDownload.js" charset="UTF-8"></script>
<script type="text/javascript">
$(function(){
    
  
	var fileDownloadConfig = getFileDownloadConfig();
	fileDownloadConfig.iframeId = "fileDownloadFrame";
	fileDownloadConfig.isDisplayChoose = "true";
	fileDownloadConfig.isDisplayDescription = 'true';
	fileDownloadConfig.chooseTitle = "选择";
	fileDownloadConfig.isDisplayDelete = 'true';
	fileDownloadConfig.isOperatorChoose = 'true';
	fileDownloadConfig.isOperatorDescription = 'true';
	//fileDownloadConfig.isPhoto = 'true';
	//fileDownloadConfig.isPhotoDownload = 'true';
	fileDownloadConfig.tableWidth = "800";
	fileDownloadConfig.uniqueDataId = "userHeader";
	fileDownloadConfig.val = "1";
	fileDownloadConfig.minNum = "1";
	//初始化下载组件
	initFileDownload(fileDownloadConfig);

	var fileUploadConfig = getFileUploadConfig();
	fileUploadConfig.iframeId = "fileUploadFrame";
	fileUploadConfig.isDisplayChoose = "true";
	fileUploadConfig.isDisplayDescription = 'true';
	fileUploadConfig.chooseTitle = "选择";
	fileUploadConfig.tableWidth = "800";
	fileUploadConfig.uniqueDataId = "userHeader";
	fileUploadConfig.val = "1";
	fileUploadConfig.fileTypeCode = "FILETEST";
	fileUploadConfig.minNum = "1";
	fileUploadConfig.maxNum = "10";
	// 初始化上传组件
	
	initFileUpload(fileUploadConfig);
	
	
});

function sub(){
	if(checkFileUpload("fileUploadFrame")){
		submitFileUpload("fileUploadFrame");
	}
	
	var iframeId = "";
	if(checkFileUpload(iframeId)){
		submitFileUpload(iframeId);
	}
}
</script>
</head>
<body>
<div><iframe id="fileUploadFrame" name="fileUploadFrame" src="/emcc-web/component/fileUploadDownload/sc.jsp" group="file" style="border:0; overflow:hidden;"></iframe></div>
<div style="width:800px;text-align: center;"><a href="javascript:sub();">提交</a></div>
</body>
</html>