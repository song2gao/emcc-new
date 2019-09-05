<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <script type="text/javascript" src="/emcc-new/fusioncharts-xt/js/fusioncharts.js"></script>
  <script type="text/javascript" src="/emcc-new/fusioncharts-xt/js/themes/fusioncharts.theme.fint.js"></script>
  <script>
  	FusionCharts.ready(function(){
      var revenueChart = new FusionCharts({
        "type": "${swf}",
        "renderAt": "chartContainer",
        "width": "${width}",
        "height": "${height}",
        "dataFormat": "xml",
        "dataSource": "${data}"
    });
   revenueChart.render();
})
function test(test){
	parent.test(test);
}
  </script>
  </head>
  <body style="margin:0px">
  <div id="chartContainer">FusionCharts XT will load here!</div>
</body>
</html>


