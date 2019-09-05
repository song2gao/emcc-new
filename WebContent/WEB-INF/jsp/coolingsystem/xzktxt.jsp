<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <meta>
    <title>北辰西站空调系统管理-中惠元景能耗监测平台</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="/emcc-new/assets/css/style.css">
    <link rel="stylesheet" href="/emcc-new/assets/css/loader-style.css">
    <link rel="stylesheet" href="/emcc-new/assets/css/bootstrap.css">
    <link rel="shortcut icon" href="/emcc-new/assets/ico/minus.png">
    <link rel="stylesheet" href="/emcc-new/js/layui/css/layui.css">
    <script type="text/javascript" src="/emcc-new/js/layui/layui.all.js"></script>
    <link href="/emcc-new/assets/js/tabs/acc-wizard.min.css"
          rel="stylesheet">
    <script type="text/javascript" src="/emcc-new/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/coolsystem/realdata.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/coolsystem/alarm.js"></script>
    <!--<script type="text/javascript" src="/emcc-new/js/layer.js"></script> -->
    <script type="text/javascript">
        $(function () {
        });

        function showmore() {
            $('#mainPage', window.parent.document).attr("src", "coolindex/lsqxcx");
        }

        //一号主机参数显示
        function clickZJ(value) {
            var title = "";
            var ctdCode = "";
            if (value == 1) {
                title = "一号制冷机";
                ctdCode = '263';
            } else if (value == 2) {
                title = "二号制冷机";
                ctdCode = '264';
            } else if (value == 3) {
                title = "三号制冷机";
                ctdCode = '265';
            } else {
                title = "四号制冷机";
                ctdCode = '266';
            }
            var layerContent = '<div class="layui-tab layui-tab-brief" style="border:0px solid red;height:95%;" lay-filter="docDemoTabBrief"><ul class="layui-tab-title">'
                + '<li class="layui-this">运行参数</li><li>机型参数</li></ul>'
                + '<div class="layui-tab-content" style="border:0px solid blue;height:90%;">'
                + '<div class="layui-tab-item layui-show">'
                + '<table class="layui-table" lay-size="sm" style="width:100%;">'
                + '<colgroup><col width="30px"><col width="40px"></colgroup>'
                + '<thead><tr><th>参数类别</th><th>参数值</th></tr></thead>'
                + '<tbody>';
            $.ajax({
                url: 'realbyCtdCode?ctdCode=' + ctdCode,
                dataType: 'json',
                async: false,
                success: function (data) {
                    for (var i = 0; i < data.list.length; i++) {
                        var point = data.list[i];
                        var value = point.value;
                        var showvalue = "";
                        var mmpCode = point.code;
                        if (mmpCode == "10002") {
                            if (value == 4) {
                                showvalue = "运行";
                            } else {
                                showvalue = "停止";
                            }
                        } else {
                            showvalue = point.value;
                        }
                        layerContent += '<tr><td>' + point.name + '：</td><td>' + showvalue + point.units + '</td></tr>';
                    }
                }
            });
            layerContent += '</tbody></table>'
                + '</div>'
                + '<div class="layui-tab-item">'
                + '<table class="layui-table" lay-size="sm" style="width:100%;">'
                + '<colgroup><col width="20px"><col width="40px"></colgroup>'
                + '<thead><tr><th>参数类别</th><th>参数值</th></tr></thead>'
                + '<tbody><tr><td>制冷量：</td><td>1406KW</td></tr><tr><td>产地：</td><td>无锡</td></tr><tr><td>售后服务：</td><td>一年保修</td>'
                + '</tr><tr><td>执行质量标准：</td><td>国标</td></tr><tr><td>冷暖类型：</td><td>单冷型</td>'
                + '</tr><tr><td>品牌：</td><td>约克</td>'
                + '</tr><tr><td>型号：</td><td>DBKA</td></tr><tr><td>加工定制：</td><td>是</td>'
                + '</tr><tr><td>空调技术：</td><td>定速</td></tr><tr><td>空调频率：</td><td>50（Hz）</td>'
                + '</tr></tbody></table>'
                + '</div>'
                + '</div></div>';
            layui.use(
                'layer',
                function () {
                    var layer = layui.layer;

                    layer
                        .open({
                            type: 1,
                            title: title //不显示标题栏
                            ,
                            skin: 'layui-layer-molv' //样式类名
                            ,
                            offset: ['12%', '5%'] //具体配置参考：offset参数项
                            ,
                            area: ['300px', '485px'],
                            content: layerContent,
                            btn: '关闭',
                            btnAlign: 'a' //按钮居中
                            ,
                            anim: 3 //弹出 动画
                            ,
                            isOutAnim: true //关闭动画效果
                            ,
                            shade: 0 //不显示遮罩
                            ,
                            shadeClose: true //点击遮罩关闭层
                            ,
                            yes: function (index) {
                                layer.close(index);
                            }
                        });
                });
        }
    </script>
    <!-- Le styles -->
    <STYLE type="text/css">
        body {
            background: url(/emcc-new/image/beichen/xzzl.jpg) no-repeat;
            background-size: 99% 100%;
        }

        .box-shadow-2 {
            -webkit-box-shadow: 0 0 10px #1d1f24;
            -moz-box-shadow: 0 0 10px #1d1f24;
            box-shadow: 0 0 10px #1d1f24;
        }

        ul {
            padding: 0;
            font-family: 华文中宋;
            font-size: 16px;
            color: #FFFFFF;
            line-height: 2;
        }

        li {
            list-style-type: none;
            padding: 3px;
        }

        table tr {
            border-collapse: separate;
            border-spacing: 10px 50px;
        }
    </style>
</head>
<body style="border: 0px solid red;">
<!-- 空调系统管理 -->
<div
        style="border: 0px solid red; margin-top: 1%;margin-left:2%; width: 90%; text-align: center; color: white;">
    <h2>北辰亚运村西站空调系统图</h2>
</div>
<span onclick="clickHz(124,10);" class="label label-weather"
      style="border: 0px solid red; position: absolute; top: 12%;left: 21%;">
		<b id="131">75</b>kW(额定功率)
	</span>
<span onclick="clickHz(124,10);" class="label label-weather"
      style="border: 0px solid red; position: absolute; top: 42%;left: 21%;">
		<b id="131">75</b>kW(额定功率)
	</span>
<span onclick="clickHz(124,10);" class="label label-weather"
      style="border: 0px solid red; position: absolute; top: 72%;left: 21%;">
		<b id="131">45</b>kW(额定功率)
	</span>
<span onclick="clickHz(124,10);" class="label label-weather"
      style="border: 0px solid red; position: absolute; top: 12%;left: 61%;">
		<b id="131">45</b>kW(额定功率)
	</span>
<span onclick="clickHz(124,10);" class="label label-weather"
      style="border: 0px solid red; position: absolute; top: 57%;left: 61%;">
		<b id="131">75</b>kW(额定功率)
	</span>
<!-- 主机 -->
<div onclick="clickZJ(1);" class="select"
     style="position: absolute; top: 9%; left: 33%; width: 22%; height: 16%; text-align: center;"></div>
<div onclick="clickZJ(2);" class="select"
     style="position: absolute; top: 30%; left: 33%; width: 22%; height: 16%;">
</div>
<div onclick="clickZJ(3);" class="select"
     style="position: absolute; top: 50%; left: 33%; width: 22%; height: 16%;">
</div>
<div onclick="clickZJ(4);" class="select"
     style="position: absolute; top: 70%; left: 33%; width: 22%; height: 16%;">
</div>
<div class="btn-group"
     style="border: 0px solid red; position: absolute; top: 25%; left: 42%;">
    <button type="button" id="263" class="btn btn-danger">已经停止</button>
</div>
<div class="btn-group"
     style="border: 0px solid red; position: absolute; top: 45%; left: 42%;">
    <button type="button" id="264" class="btn btn-danger">已经停止</button>
</div>
<div class="btn-group"
     style="border: 0px solid red; position: absolute; top: 65.5%; left: 42%;">
    <button type="button" id="265" class="btn btn-danger">已经停止</button>
</div>
<div class="btn-group"
     style="border: 0px solid red; position: absolute; top: 85.5%; left: 42%;">
    <button type="button" id="266" class="btn btn-danger">已经停止</button>
</div>
<!-- 温度
<span onclick="clickHz(130,10);" class="label label-weather"
    style="border: 0px solid red; position: absolute; top: 11.5%; left: 61%;">
    <b id="130">50.0</b>Hz
</span>
<span onclick="clickHz(131,10);" class="label label-weather"
    style="border: 0px solid red; position: absolute; top: 31.6%; left: 61%;">
    <b id="131">50.0</b>Hz
</span>
<span onclick="clickHz(132,10);" class="label label-weather"
    style="border: 0px solid red; position: absolute; top: 52%; left: 61%;">
    <b id="132">50.0</b>Hz
</span>
<span onclick="clickHz(133,10);" class="label label-weather"
    style="border: 0px solid red; position: absolute; top: 72%; left: 61%;">
    <b id="133">50.0</b>Hz
</span>
-->
<!-- 温度压力 -->
<!--<div style="position: absolute; top: 6.3%; left: 75%; width: 30%; color: #E0EEE0; font-size: 14px;"
 <div>分水器压力：
    <span class="label label-weather" onclick="clickHz(104,14);">
        <b id="105" name="14" value="14">0.0</b>MPa</span>
</div>
</div>

<div style="position: absolute; top: 10.8%; left: 75%; width: 30%; color: #E0EEE0; font-size: 14px;"
<div>分水器温度：
    <span class="label label-weather" onclick="clickHz(104,15);">
        <b id="105" name="14" value="14">0.0</b>℃</span>
</div>
</div>

<div style="position: absolute; top: 62.8%; left: 75%; width: 30%; color: #E0EEE0; font-size: 14px;"
<div>集水器压力：
    <span class="label label-weather" onclick="clickHz(104,14);">
        <b id="105" name="14" value="14">0.0</b>MPa</span>
</div>
</div>

<div style="position: absolute; top: 67.3%; left: 75%; width: 30%; color: #E0EEE0; font-size: 14px;"
<div>集水器温度：
    <span class="label label-weather" onclick="clickHz(104,15);">
        <b id="105" name="14" value="14">0.0</b>℃</span>
</div>
</div>-->
</body>
</html>
