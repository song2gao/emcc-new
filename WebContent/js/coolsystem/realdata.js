var str = "";
$(function () {
    var ctds = $("b");
    for (var i = 0; i < ctds.length; i++) {
        var ctd = $(ctds[i]);
        if (ctd.attr("id") != undefined) {
            var ctdCode = ctd.attr("id").substring(0, ctd.attr("id").indexOf("e"));
            var pointCode = ctd.attr("value");
            pointInfo(ctdCode, pointCode);
            str += ctdCode + "=" + pointCode;
            if (i != ctds.length - 1) {
                str += ",";
            }
        }
    }
    var zjctds = $("button");
    for (var i = 0; i < zjctds.length; i++) {
        var zjctd = $(zjctds[i]);
        if (zjctd.attr("id") != undefined) {
            var ctdCode = zjctd.attr("id");
            str += "," + ctdCode + "=10002";
        }
    }
    window.setInterval(getRealData, 3000);
});

function getRealData() {
    $.ajax({
        url: 'real?codes=' + str,
        dataType: 'json',
        success: function (data) {
            for (var i = 0; i < data.points.length; i++) {
                var id = data.points[i].ctdCode;
                var mmpCode = data.points[i].code;
                var value = data.points[i].value;
                var upline = $("#" + id).attr("upvalue");
                var downline = $("#" + id).attr("downvalue");
                var flag = false;
                if (mmpCode == "10002") {
                    if (id == 161 || id == 162 || id == 160) {
                        if (value == "4") {
                            $("#" + id).attr("class", "btn btn-success");
                            $("#" + id).html("正在运行");
                        } else {
                            $("#" + id).attr("class", "btn btn-danger");
                            $("#" + id).html("已经停止");
                        }
                    }else{
                        if (value==9||value==8||value==10) {
                            $("#" + id).attr("class", "btn btn-success");
                            $("#" + id).html("正在运行");
                        } else {
                            $("#" + id).attr("class", "btn btn-danger");
                            $("#" + id).html("已经停止");
                        }
                    }

                } else {
                    if (upline != 0) {
                        if (value >= upline) {
                            flag = true;
                        }
                    }
                    if (downline != 0) {
                        if (value <= downline) {
                            flag = true;
                        }
                    }
                    $("#" + id + "e" + mmpCode).html(value);
                    if (!flag) {
                        $("#" + id + "e" + mmpCode).css("color", "white");
                    } else {
                        $("#" + id + "e" + mmpCode).css("color", "red");
                    }
                }
            }
        }
    });
}