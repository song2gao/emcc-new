function getOs() {
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

function getIEVersion(){

	if(navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.match(/7./i)=="7.") 
	{ 
		return "IE 7.0";
	} 
	else if(navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.match(/8./i)=="8.") 
	{ 
		return "IE 8.0";
	} 
	else if(navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.match(/9./i)=="9.") 
	{ 
		return "IE 9.0";
	} 
	else if(navigator.appName == "Microsoft Internet Explorer") 
	{ 
		return "IE 6.0";
	} 
  }
	/*页面形式  左右结构  初始化右侧  #rywh_right 为右侧DIV的ID  wangruibo*/
		function initRight(){
			var clientWidth = window.screen.width;
			if(getOs()=='Firefox'){
				return clientWidth-263;			
			}
			else if(getOs()=='Safari'||getOs()=='Camino'){
				return clientWidth-279;				
			}else if(getOs()=='MSIE'){
				return clientWidth-259;			
			}			
	 	}
	/*页面形式  整体结构 初始化页面宽度*/
	function initWidth(){
		var clientWidth = window.screen.width;
			if(getOs()=='Firefox'){				
				return clientWidth-17.5;
			}
			else if(getOs()=='Safari'||getOs()=='Camino'){
				return clientWidth-24;
			}else if(getOs()=='MSIE'){
				return clientWidth-19.5;
			}	
	}
	
			/*页面形式  整体结构 初始化页面宽度*/
	function initWidth1(){
		var clientWidth = window.screen.width;
			if(getOs()=='Firefox'){				
				return clientWidth-3;
			}
			else if(getOs()=='Safari'||getOs()=='Camino'){
				return clientWidth-3;
			}else if(getOs()=='MSIE'){
				return clientWidth-19.5;
			}	
	}

	
function getUUID(){
	
	return Math.uuid().replace(/-/g,'');
}

function clearForm(formId){
	$('#' + formId).find('input:text').val('');
	$('#' + formId).find('select').val('');
	$('#' + formId + ' .codeManage').combobox('setValue','');
	$('#' + formId + ' .easyui-combogrid').each(function(){
		$(this).combogrid('setValue','');
	});
}
