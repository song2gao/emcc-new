<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta>
		<title>用能负荷监测-中惠元景能耗监测平台</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<!-- Le styles -->
		<link rel="stylesheet" href="/emcc-new/assets/css/style.css">
		<link rel="stylesheet" href="/emcc-new/assets/css/bootstrap.css">
		<link rel="stylesheet" href="/emcc-new/css/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css"
			href="/emcc-new/css/icon.css"></link>
		<link rel="stylesheet" type="text/css" href="/emcc-new/css/jedate.css">
		<script type="text/javascript"
			src="/emcc-new/js/jquery-1.8.2.min.js">
		</script>
		<script type="text/javascript"
			src="/emcc-new/js/jquery.easyui.min.js">
		</script>
		<script type="text/javascript" src="/emcc-new/js/layui/layui.all.js"></script>
		<script type="text/javascript" src="/emcc-new/js/jquery.jedate.js"></script>
		<script type="text/javascript" src="/emcc-new/js/page.js"></script>
		<script type="text/javascript" src="/emcc-new/js/jsonToTime.js"></script>
		<script type="text/javascript" src="/emcc-new/js/time.js"></script>
		<script>
$(function() {
	InifhTable();
	GetData();
});
//加载表格数据
function GetData() {
	var args = {};
	BingData("#fhtb", args, 'coolreal',null);
}
</script>
<!-- 表格展示 -->
<script>
function InifhTable() {
	//初始化table	
	$('#fhtb').datagrid( {
		fitColumns : false, //自适应列的大小
		singleSelect : true,
		fit : true,
		rownumbers :false,
		columns : [ [
				{
					title : '计量点名称',
					field : '0',
					align : 'center',
					width : fixWidth(0.2),
					styler : function(value, row, index) {  
                    		return 'border:1px solid #fff;';  
                	} 
				},
				{
					title : '瞬时流速',
					field : '2',
					align : 'center',
					width : fixWidth(0.1),
					styler : function(value, row, index) {  
                    		return 'border:1px solid #fff;';  
                	} 
				},
				{
					title : '供水温度',
					field : '3',
					align : 'center',
					width : fixWidth(0.1),
					styler : function(value, row, index) {  
                    		return 'border:1px solid #fff;';  
                	} 
				},
				{
					title : '回水温度',
					field : '4',
					align : 'center',
					width : fixWidth(0.1),
					styler : function(value, row, index) {  
                    		return 'border:1px solid #fff;';  
                	} 
				},
				{
					title : '累计热量',
					field : '5',
					align : 'center',
					width : fixWidth(0.24),
					styler : function(value, row, index) {  
                    		return 'border:1px solid #fff;';  
                	} 
				},
				{
					title : '累计冷量',
					field : '6',
					align : 'center',
					width : fixWidth(0.24),
					styler : function(value, row, index) {  
                    		return 'border:1px solid #fff;';  
                	} 
				}]],
		striped : true
	});
}
function fixWidth(percent){
		return $("#table").width()*percent;
	}
</script>
<script>
	function JSONToCSVConvertor(JSONData, ReportTitle, ShowLabel) {  
            //If JSONData is not an object then JSON.parse will parse the JSON string in an Object  
            var arrData = typeof JSONData != 'object' ? JSON.parse(JSONData)  
                    : JSONData;  
  
            var CSV = '';  
            //Set Report title in first row or line  
  
            CSV += ReportTitle + '\r\n\n';  
  
            //This condition will generate the Label/Header  
            if (ShowLabel) {  
                var row = "";  
  
                //This loop will extract the label from 1st index of on array  
                for ( var index in arrData[0]) {  
  
                    //Now convert each value to string and comma-seprated  
                    row += index + ',';  
                }  
  
                row = row.slice(0, -1);  
  
                //append Label row with line break  
                CSV += row + '\r\n';  
            }  
  
            //1st loop is to extract each row  
            for (var i = 0; i < arrData.length; i++) {  
                var row = "";  
  
                //2nd loop will extract each column and convert it in string comma-seprated  
                for ( var index in arrData[i]) {  
                    row += '"' + arrData[i][index] + '",';  
                }  
  
                row.slice(0, row.length - 1);  
  
                //add a line break after each row  
                CSV += row + '\r\n';  
            }  
  
            if (CSV == '') {  
                alert("Invalid data");  
                return;  
            }  
  
            //Generate a file name  
            var fileName = "MyReport_";  
            //this will remove the blank-spaces from the title and replace it with an underscore  
            fileName += ReportTitle.replace(/ /g, "_");  
  
            //Initialize file format you want csv or xls  
            var uri = 'data:text/csv;charset=utf-8,' + escape(CSV);  
  
            // Now the little tricky part.  
            // you can use either>> window.open(uri);  
            // but this will not work in some browsers  
            // or you will not get the correct file extension      
  
            //this trick will generate a temp <a /> tag  
            var link = document.createElement("a");  
            link.href = uri;  
  
            //set the visibility hidden so it will not effect on your web-layout  
            link.style = "visibility:hidden";  
            link.download = fileName + ".csv";  
  
            //this part will append the anchor tag and remove it after automatic click  
            document.body.appendChild(link);  
            link.click();  
            document.body.removeChild(link);  
        }  
  
        $("#btnExport").click(function() {  
            var data = JSON.stringify($('#tablef').datagrid('getData').rows);  
            alert(data);  
            if (data == '')  
                return;  
            JSONToCSVConvertor(data, "Download", true);  
        });  
</script>
<STYLE type="text/css">
.box-shadow-2 {
	-webkit-box-shadow: 0 0 10px #1d1f24;
	-moz-box-shadow: 0 0 10px #1d1f24;
	box-shadow: 0 0 10px #1d1f24;
}
.dropdown-toggle{
			cursor:pointer;
		}
		.button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 5px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
}
</style>
	</head>
	<body>
		<!--  用能负荷监测内容 -->
		<div class="wrap-fluid">
			<div class="container-fluid paper-wrap bevel tlbr" style="width:100%">
				<!-- 内容板块 -->
				<div class="content-wrap" style="border: 0px solid green;padding:0px;">
					<div class="row" style="border: 0px solid green;margin-left:0.2%;">
					<div class="col-sm-10" style="float:left;width:100.0%;border: 0px solid red ;padding-left:10px;margin-top: 1%;height:87%;">
						<!-- 数据列表 -->
							<div class="col-xs-4 box-shadow-2" id="table" style="border:0px solid;width:100%;height: 99%;margin-top: 1%;">
								<table id="fhtb" class="easyui-datagrid" style="width: 100%;; height: 100%;background-color:black" toolbar="#toolbar" >
								</table> 
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
