<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>通用文件下载</title>
<script type="text/javascript" src="/emcc-web/component/jquery-easyui/jquery-1.7.2.min.js" ></script>
<style type="text/css">
	.table{border:1px solid #ccc; font-size:13px;}
</style>
<script type="text/javascript" charset="UTF-8">
function init(){
	initFiles();
	setChooseTitle();
	setTableWidth();
	widthAdaptive();
}

function initFiles(){
	$.post("/emcc-web/toFile.action?m=getFiles", 
		{
			uniqueDataId: $('#uniqueDataId').val(), 
			val: $('#val').val()
		},
	   	function(data){
	   		if(data == null) return;
	   		var root = data.root;
	   		var pomsFile;
	   		var isChecked;
	   		var isOperatorChoose = isExist('isOperatorChoose');
	   		var isOperatorDescription = isExist('isOperatorDescription');
	   		var isPhoto = isExist('isPhoto');
	   		var isPhotoDownload = isExist('isPhotoDownload');
	   		var choose;
	   		var description;
	   		var file;
	   		var photoPath;
	   		var photoDownload = "";
	   		$('#fileTable tr:gt(0)').remove();
	   		for(var i=0;i<data.pomsFiles.length;i++){
	   			pomsFile = data.pomsFiles[i];
	   			isChecked = pomsFile.isChoose == "1" ? 'checked="checked"' : '';
	   			if(isOperatorChoose){
	   				choose = '<input name="isChoose" type="checkbox" ' + isChecked + ' onclick="setChoose(this);"/>';
	   			}else{
	   				choose = '<input name="isChoose" type="checkbox" disabled="disabled"' + isChecked + '/>';
	   			}
	   			
	   			if(isOperatorDescription){
	   				description = '<input name="description" type="text" value="' + pomsFile.description + '"  onchange="setDescription(this);" />';
	   			}else{
	   				description = pomsFile.description;
	   			}
	   			
	   			if(isPhoto){
	   				photoPath = compilePath(root + pomsFile.filePath);
	   				if(isPhotoDownload){
	   					photoDownload = '<a href="javascript:download(\'' + pomsFile.id + '\');">下载</a>';
	   				}
	   				file = '<img src="' + photoPath + '" width="200px" height="100px" title="点击看大图" onclick="openPhoto(\'' + photoPath + '\')" style="cursor:pointer;"/>' + photoDownload;
	   			}else{
	   				file = '<a href="javascript:download(\'' + pomsFile.id + '\');">' + pomsFile.fileName + '</a>';
	   			}
	   			
	   			var $tr = '<tr id="' + pomsFile.id + '">' + 
						      	'<td name="chooseTd">' + choose + '</td>' + 
						      	'<td>' + file + '</td>' +
						      	'<td name="descriptionTd">' + description + '</td>' + 
						      	'<td name="deleteTd"><a href="javascript:delFile(\'' + pomsFile.id + '\');">删除</a></td>' + 
						  '</tr>';
				$('#fileTable').append($tr);
	   		}
	   		setExistNum();
	   		setIsChoose();
	   		setIsDescription();
	   		setIsDelete();
	   		setTrHeight();
	   		heightAdaptive();
		},
		"json"
	);
}

function download(id){
	var url = '/emcc-web/toFile.action?m=toFileDownload&id=' + id + "&browser=" + getBrowser();
	openWindow(url, 600, 400);
}

function openPhoto(url){
	openWindow(url, 800, 600);
}

function openWindow(url, width, height){
	var top = (window.screen.availHeight-30-height)/2; //获得窗口的垂直位置;
	var left = (window.screen.availWidth-10-width)/2; //获得窗口的水平位置;
	window.open(url,"","height="+height+", width="+width+", top="+top+", left="+left); 
}

function setExistNum(){
   	var existNum = $('#fileTable tr').length - 1;
	window.parent.setExistNum($('#iframeId').val(),existNum);
	window.parent.initUploadTrFromDownloadIframe($('#iframeId').val(),existNum);
}

function isMin(){
	if(isExist('minNum')){
		var minNum = parseInt($('#minNum').val());
		if($('#fileTable tr').length - 1 <= minNum){
			alert('文件已经达到最小数量' + minNum + '，不能继续减少了！');
			return true;
		}
	}
	return false;
}

function delFile(id){
	
	if(confirm("确定要删除吗？") && !isMin()){
		$.post("/emcc-web/toFile.action?m=delFile", 
			{
				id: id
			},
		   	function(data){
		   		if($.trim(data) == 'true'){
		   			$('#' + id).remove();
		   			setExistNum();
		   			heightAdaptive();
		   			alert("删除文件成功！");
		   		}
			},
			"text"
		);
	}
}

function setChoose(isChoose){
	$.post("/emcc-web/toFile.action?m=setChoose", 
		{
			id: $(isChoose).parent().parent().attr('id'),
			isChoose: $(isChoose).attr('checked') == 'checked' ? '1' : '0'
		},
	   	function(data){
	   		
		},
		"text"
	);
}

function setDescription(description){
	$.post("/emcc-web/toFile.action?m=setDescription", 
		{
			id: $(description).parent().parent().attr('id'),
			description : $(description).val()
		},
	   	function(data){
	   		
		},
		"text"
	);
}

function setIsChoose(){
	if($('#isDisplayChoose').val() != 'true'){
		$('[name="chooseTd"]').remove();
	}
}

function setIsDescription(){
	if($('#isDisplayDescription').val() != 'true'){
		$('[name="descriptionTd"]').remove();
	}
}

function setIsDelete(){
	if($('#isDisplayDelete').val() != 'true'){
		$('[name="deleteTd"]').remove();
	}
}

function setChooseTitle(){
	if(isExist('chooseTitle')){
		$('#chooseTitleTh').html($('#chooseTitle').val());
	}
}

function setTableWidth(){
	if(isExist('tableWidth')){
		$('#fileTable').css('width',$('#tableWidth').val());
	}
}

function setTrHeight(){
	if(isExist('trHeight')){
		$('#fileTable tr').css('height',$('#trHeight').val());
	}
}

function isExist(id){
	if($('#' + id).val() != '')
		return true;
	else
		return false;
}

function compilePath(path){
	return path.replace(/\\/g,'/');
}

function heightAdaptive(){
	window.parent.setHeight($('#iframeId').val());
}

function widthAdaptive(){
	window.parent.setWidth($('#iframeId').val());
}

function getBrowser() {
	var OsObject = "";
	if (navigator.userAgent.indexOf("MSIE") > 0) {
		return "MSIE";
	}
	if (isFirefox = navigator.userAgent.indexOf("Firefox") > 0) {
		return "Firefox";
	}
	if (isSafari = navigator.userAgent.indexOf("Safari") > 0) {
		return "Safari";
	}
	if (isCamino = navigator.userAgent.indexOf("Camino") > 0) {
		return "Camino";
	}
	if (isMozilla = navigator.userAgent.indexOf("Gecko/") > 0) {
		return "Gecko";
	}
}
</script>
</head>
<body>
	<input id="iframeId" type="hidden" />
	<input id="tableWidth" type="hidden" />
	<input id="trHeight" type="hidden" />
	<input id="isDisplayChoose" type="hidden" />
	<input id="isOperatorChoose" type="hidden" />
	<input id="chooseTitle" type="hidden" />
	<input id="isDisplayDescription" type="hidden" />
	<input id="isOperatorDescription" type="hidden" />
	<input id="isDisplayDelete" type="hidden" />
	<input id="isPhoto" type="hidden" />
	<input id="isPhotoDownload" type="hidden" />
	
	<input id="uniqueDataId" name="uniqueDataId" type="hidden" />
	<input id="val" name="val" type="hidden" />
	
	<input id="minNum" type="hidden" />
	<table id="fileTable" class="table">
		<tr style="background-color: #D1D1D1;">
			<th id="chooseTitleTh" name="chooseTd">是否选择</th>
	      	<th>文件下载</th>
	      	<th name="descriptionTd">描述</th>
	      	<th name="deleteTd">操作</th>
		</tr>
	</table>
</body>
</html>