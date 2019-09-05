
function expt(grid,formId,fileName){  
        var frozenColumns = $("#"+grid).datagrid("options").frozenColumns;  // 得到frozenColumns对象    
        var columns = $("#"+grid).datagrid("options").columns;    // 得到columns对象    
      //获取表头行列属性（为了生成多行表头）
        var mergedRegions = ""; 
        var length=0;
    // 载入title    
    if (typeof columns != 'undefined' && columns != '') {    
        $(columns).each(function (index) {
        	var mergedRegion = "";
            if (typeof frozenColumns != 'undefined' && typeof frozenColumns[index] != 'undefined') {    
               for (var i = 0; i < frozenColumns[index].length; ++i) {    
                	if (!frozenColumns[index][i].hidden) {
                		 if (typeof frozenColumns[index][i].field != 'undefined' && frozenColumns[index][i].field != '') {    
                             length++;   
                         } 
                    	 var rowspan = frozenColumns[index][i].rowspan;
                         var colspan = frozenColumns[index][i].colspan;
                         if(rowspan == null || rowspan == undefined){
                             rowspan = 0;
                         }
                         if(colspan == null || colspan == undefined){
                             colspan = 0;
                         }
                         mergedRegion += frozenColumns[index][i].title + "," +rowspan + "," + colspan + ":"
                    }  
               } 
            }    
            for (var i = 0; i < columns[index].length; ++i) { 
                if (!columns[index][i].hidden) {  
                	if (typeof columns[index][i].field != 'undefined' && columns[index][i].field != '') {    
                        length++;   
                    }
                	var rowspan = columns[index][i].rowspan;
                    var colspan = columns[index][i].colspan;
                    if(rowspan == null || rowspan == undefined){
                        rowspan = 0;
                    }
                    if(colspan == null || colspan == undefined){
                        colspan = 0;
                    }
                    mergedRegion += columns[index][i].title + "," +rowspan + "," + colspan + ":"
               }  
            } 
            if(mergedRegion != ""){
                mergedRegion = mergedRegion.substring(0, mergedRegion.length-1);
                mergedRegions += mergedRegion + ";";
            }  
        });
        if(mergedRegions != ""){
            mergedRegions = mergedRegions.substring(0, mergedRegions.length-1);
        }
    }   
    // 载入内容    
    var rows = $("#"+grid).datagrid("getRows"); // 这段代码是获取当前页的所有行
    if(rows.length<=0){
    	alert("不能导出空报表，请点击查询后再导出");
    	return;
    }
    //var fileName=$("#"+grid).datagrid("getPanel").panel("getTitle");
//    var row=new Array();
//    console.info(nameList.length);
//    for (var i = 0; i < rows.length; ++i) {  
//    	var colum=new Array();
//        for (var j = 0; j < nameList.length; ++j) { 
//            colum.push(rows[i][nameList[j].field]);
//        }
//       row.push(colum);
//    }  
    //表头信息
    if($("#" + formId).find('input[name="colums"]').length == 0){
        $("#" + formId).append('<input name="colums" type="hidden"/>');
    }
    $("#" + formId).find("input[name='colums']").val(mergedRegions);
    //数据信息
    if($("#" + formId).find('input[name="length"]').length == 0){
        $("#" + formId).append('<input name="length" type="hidden"/>');
    }
    $("#" + formId).find("input[name='length']").val(length);
    //报表信息
    if($("#" + formId).find('input[name="fileName"]').length == 0){
        $("#" + formId).append('<input name="fileName" type="hidden"/>');
    }
    $("#" + formId).find("input[name='fileName']").val(fileName);
    if($("#" + formId).find('input[name="rows"]').length == 0){
        $("#" + formId).append('<input name="rows" type="hidden"/>');
    }
    $("#" + formId).find("input[name='rows']").val(JSON.stringify(rows));
    $("#" + formId).attr("method","post");
    $("#" + formId).attr("action", "/emcc-new/coolindex/export").submit();
//   var a=JSON.stringify(rows);
//   var b=JSON.stringify(frozenColumns);
//   var c=JSON.stringify(columns);
//   // var url="export?name="+name+"&rows="+encodeURIComponent(a)+"&headers="+encodeURIComponent(b);
//   $.ajax({
//    	url:'export',
//    	dataType:'json',
//    	type:'post',
//    	data:{name:"123",rows:a,reozenheaders:b,headers:c},
//    	success:function(data){
//    		
//    	}
//    });
 //   window.location.href=url;
   /* $('#hlf').val(tableString); 
    console.info(tableString);
    exportString=tableString;  
    var url="export.jsp";  
    var param2={  
            doSize:false,  
            shadow:false,  
            content:'<iframe  scrolling="no" frameborder="0"  src="'+url+'" style="width:100%;height:95%;"></iframe>',  
            title:'Export',  
            width:300,      
            height:170,  
            modal:true        
    };  
    mpgdialog(param2);  */
}   
  
  
function mpgdialog(param){    
        $('#dialog2').dialog(param);  
        $('#dialog2').window('center');  
    }  