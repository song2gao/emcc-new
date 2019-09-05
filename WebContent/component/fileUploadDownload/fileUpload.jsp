<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>通用文件上传</title>
<script type="text/javascript" src="/emcc-web/component/jquery-easyui/jquery-1.7.2.min.js" ></script>
<style type="text/css">
	.table{border:1px solid #ccc; font-size:13px;}
</style>
<script type="text/javascript" charset="UTF-8">

function init(){
	initTr();
	setFileSuffix();
	setIsChoose();
	setIsDescription();
	setChooseTitle();
	setTableWidth();
	widthAdaptive();
	heightAdaptive();
}

function initAddTr(){
	var $tr = $("#fileTr");
	$tr.find('input[name="isChoose"]').attr('checked',false);
	$tr.find('input[name="description"]').attr('value','');
	var $file = $tr.find('input[name="file"]');
	$file.after($('<input name="file" type="file" />'));
	$file.remove();
}

function initTr(){
	$('#fileTable tr:gt(1)').remove();
	heightAdaptive();
	initAddTr();
	window.parent.initUploadTrFromUploadIframe($('#iframeId').val());
}

function callbackInitTr(existNum){
	if(isExist('minNum')){
		var minNum = parseInt($('#minNum').val());
		for(var i=1;i<minNum - existNum;i++){
			addTr();
		}
	}
}

function addTr(){
	var $tr = $('#fileTr').clone().removeAttr('id');
	setTrHeight($tr);
	
	if(isMax()){
		return;
	}
	
	$('#num').val(parseInt($('#num').val()) + 1);
	$tr.find('#clearButton').remove();
	$tr.find('input').attr('value','').attr('checked',false);
	$tr.find('input[type="file"]').attr('name','file' + $('#num').val());
	$tr.find('#addButton').removeAttr('id').removeAttr('onclick').attr('value','删除').click(function(){
		if(!isMin()){
			$tr.remove();
		}
		heightAdaptive();
	});
	$('#fileTable').append($tr);
	heightAdaptive();
}

function isMin(){
	if(isExist('minNum')){
		var minNum = parseInt($('#minNum').val());
		var n = minNum - getExistNum();
		if($('#fileTable tr').length - 1 <= n){
			alert('上传的文件已经达到最小数量' + n + '，不能继续减少了！');
			return true;
		}
	}
	return false;
}

function isMax(){
	if(isExist('maxNum')){
		var maxNum = parseInt($('#maxNum').val());
		var n = maxNum - getExistNum();
		if($('#fileTable tr').length - 1 >= n){
			alert('上传的文件已经达到最大数量' + n + '，不能继续添加了！');
			return true;
		}
	}
	return false;
}

function setFileSuffix(){
	$.post("/emcc-web/toFile.action?m=getFileSuffix",
		{
			fileTypeCode: $('#fileTypeCode').val()
		},
		function(data){
			$('#fileSuffix').val($.trim(data));	
		},
		"text"
	);
}

function setIsChoose(){
	if($('#isDisplayChoose').val() != 'true'){
		$('[name="isChooseTd"]').remove();
	}
}

function setIsDescription(){
	if($('#isDisplayDescription').val() != 'true'){
		$('[name="descriptionTd"]').remove();
	}
}

function setTableWidth(){
	if(isExist('tableWidth')){
		$('#fileTable').css('width',$('#tableWidth').val());
	}
}

function setTrHeight($tr){
	if(isExist('trHeight')){
		$tr.css('height', $('#trHeight').val());	
	}
}

function setChooseTitle(){
	if(isExist('chooseTitle')){
		$('#chooseTitleTh').html($('#chooseTitle').val());
	}
}

function formSubmit(){
	displayProgressBar();
	var $isChoose;
	$('#fileTable tr:gt(0)').each(function(index, element) {
		if(isExist('isDisplayChoose')){
			$isChoose = $(this).find('input[name="isChoose"]');
			if($isChoose.attr('checked') == 'checked'){
				$(this).find('input[name="choose"]').val($isChoose.val());
				$isChoose.attr('checked',false);
			}
		}
    	$(this).find('input[name="fileInput"]').val($(this).find('input[type="file"]').attr('name'));
    });
	$('#fileUploadForm').submit();
}

function getExistNum(){
	if(isExist("existNum")){
		return parseInt($('#existNum').val());
	}
	return 0;
}

function check(){
	if(checkChooseFile() && checkMinNum() && checkMaxNum() && checkFileSuffix()){
		return true;	
	}else{
		return false;
	}
}

function checkChooseFile(){
	var fileNum = $('#fileTable input[type="file"][value!=""]').length;
	var descriptionNum = $('#fileTable input[name="description"][value!=""]').length;
	var checkNum = $('#fileTable input[name="isChoose"]:checked').length;
	if(fileNum == 0 && (checkNum != 0 || descriptionNum != 0)){
		alert('请选择上传文件！');
		return false;
	}else if(fileNum == 0 && checkNum == 0 && descriptionNum == 0){
		return false;
	}else{
		return true;
	}
}

function checkMinNum(){
	if(isExist('minNum')){
		var minNum = parseInt($('#minNum').val());
		var num = $('#fileTable input[type="file"][value!=""]').length;
		var n = minNum - getExistNum();
		if(num < n){
			alert('上传文件小于最小上传数量' + n + '！');
			return false;
		}
	}
	return true;
}

function checkMaxNum(){
	if(isExist('maxNum')){
		var maxNum = parseInt($('#maxNum').val());
		var num = $('#fileTable input[type="file"][value!=""]').length;
		var n = maxNum - getExistNum();
		if(num > n){
			alert('上传文件大于最大上传数量' + n + '！');
			return false;
		}
	}
	
	return true;
}

function checkFileSuffix(){
	var flag = true;
	if(isExist('fileSuffix')){
		var suffix;
		var fileVal;
		var fileSuffix = $('#fileSuffix').val().toLowerCase();
		$('#fileTable input[type="file"]').each(function(index, element) {
			fileVal = $(this).val();
            suffix = fileVal.substring(fileVal.lastIndexOf('.')).toLowerCase();
			if(fileVal != '' 
				&& fileSuffix.indexOf(',' + suffix + ',') == -1 
				&& fileSuffix.indexOf(suffix + ',') == -1 
				&& fileSuffix.indexOf(',' + suffix) == -1){
		
				alert('第' + (index + 1) + '个文件不符合上传文件要求，上传文件类型需在' + fileSuffix + '范围之内，不能为' + suffix + '！');
				flag = false;
			} 
        });
	}
	
	return flag;
}

function callback(result){
	$('#uploadResult').html(result);
	initTr();
	downloadIframeRefurbish();
	hiddenProgressBar();
}

function downloadIframeRefurbish(){
	if(isExist('fileUploadResult')){
		window.parent.downloadIframeRefurbish($('#iframeId').val());
	}
}

function isExist(id){
	if($('#' + id).val() != '')
		return true;
	else
		return false;
}

function heightAdaptive(){
	window.parent.setHeight($('#iframeId').val());
}

function widthAdaptive(){
	window.parent.setWidth($('#iframeId').val());
}

function displayProgressBar(){
	var $progressBar = $('#progressBarDiv');
	var $fileTable = $('#fileTable');
	
	var top = 0;
	if($fileTable.height() > $progressBar.height()){
		top = $fileTable.offset().top + ($fileTable.height() - $progressBar.height()) / 2;
	}else{
		top = $fileTable.offset();
	}
	
	var left = $fileTable.offset().left + ($fileTable.width() - $progressBar.width()) / 2;
	$progressBar.css('top',top).css('left',left).css('display','block');
}

function hiddenProgressBar(){
	$('#progressBarDiv').css('display','none');
}
</script>
</head>
<body>
	<form id="fileUploadForm" name="fileUploadForm" 
		action="/emcc-web/toFile.action?m=toFileUpload" 
		method="post" enctype="multipart/form-data"
		target="hidden_frame">
  		
  		<input id="iframeId" name="iframeId" type="hidden" />
        <input id="tableWidth" name="tableWidth" type="hidden" />
        <input id="trHeight" name="trHeight" type="hidden" />
  		
    	<input id="isDisplayChoose" name="isDisplayChoose" type="hidden" />
    	<input id="chooseTitle" name="isDisplayChoose" type="hidden" />
    	<input id="isDisplayDescription" name="isDisplayDescription" type="hidden" />
        <input id="minNum" name="minNum" type="hidden" />
        <input id="maxNum" name="maxNum" type="hidden"/>
 
		<input id="uniqueDataId" name="uniqueDataId" type="hidden" />
		<input id="val" name="val" type="hidden" />
        <input id="fileTypeCode" name="fileTypeCode" type="hidden" />
        
        <input id="fileSuffix" name="fileSuffix" type="hidden" />
        
        <input id="existNum" name="existNum" type="hidden" />
        <input id="num" name="num" type="hidden" value="0" />
        <div id="uploadResult" style="font-size: 12px;"></div>
    	<table id="fileTable" class="table">
    		<tr style="background-color: #D1D1D1;">
    			<th id="chooseTitleTh" name="isChooseTd">是否选择</th>
    			<th>文件上传</th>
    			<th name="descriptionTd">描述</th>
    			<th>操作</th>
    		</tr>
        	<tr id="fileTr">
            	<td name="isChooseTd"><input name="isChoose" type="checkbox" value="true"/> <input name="choose" type="hidden" /></td>
                <td><input name="file" type="file" /> <input name="fileInput" type="hidden" /> </td>
                <td name="descriptionTd"><input name="description" type="text" /></td>
                <td><input id="addButton" type="button" value="添加" onclick="addTr();" /> <input id="clearButton" type="button" value="清空" onclick="initAddTr();" /></td>
            </tr>
        </table>
    </form>
    <iframe name="hidden_frame"id="hidden_frame" style="display:none"></iframe>
    <div id="progressBarDiv" style="width:100px; position: absolute; display: none;">
    	<div style="width: inherit; text-align: center;"><img src="/emcc-web/image/poms-system/ProgressBar.gif" /></div>
    	<div style="font-size:12px; text-align: center;">正在文件上传...</div>
    </div>
</body>
</html>