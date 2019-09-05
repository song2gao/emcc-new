Util = {
    Page: {
        pageIndex: 1,
        pageSize: 10,
        pageSize2: 20
    },
    ArrayHelper: {
        //重写Array原型方法
        removeAt: function (array, n) {
            //n表示第几项，从0开始算起。
            if (n < 0)//如果n<0，则不进行任何操作。
                return array;
            else
                return array.slice(0, n).concat(array.slice(n + 1, array.length));
            /*
　　　concat方法：返回一个新数组，这个新数组是由两个或更多数组组合而成的。
　　　　　　　　　这里就是返回this.slice(0,n)/this.slice(n+1,this.length)
　　 　　　　　　组成的新数组，这中间，刚好少了第n项。
　　　slice方法： 返回一个数组的一段，两个参数，分别指定开始和结束的位置。
　　*/
        },
        remove: function (array, v, compare) {//n表示第几项，从0开始算起。
            var index = -1;
            for (var i = 0; i < array.length; i++) {
                if (compare != null) {
                    if (compare(array[i], v)) {
                        index = i;
                        break;
                    }
                }
                else {
                    if (array[i] == v) {
                        index = i;
                        break;
                    }
                }
            }
            return Util.ArrayHelper.removeAt(array, index);
        }
    },
    Guid: {
        New: function () {
            var guid = "";
            for (var i = 1; i <= 32; i++) {
                var n = Math.floor(Math.random() * 16.0).toString(16);
                guid += n;
                if ((i == 8) || (i == 12) || (i == 16) || (i == 20))
                    guid += "-";
            }
            return guid;
        }
    },
    LoadMark: {
        LoadCount: 0,
        Show: function (w) {

            Util.LoadMark.LoadCount++;
            if (Util.LoadMark.LoadCount == 1) {
                setTimeout(function () {
                    var width = document.body.clientWidth;
                    var height = document.body.clientHeight;
                    if (w) {
                        $("div.loadingMark").css("width", w + "px");
                    }
                    $("div.loadingMark").css("left", (width - 100) / 2 + "px");
                    $("div.loadingMark").css("top", (height - 23) / 2 + "px");
                    $("div.loadingPanel").removeClass("hide");
                    $("div.loadingMark").removeClass("hide");
                }, 1);
            }
        },
        Hide: function (t) {
            Util.LoadMark.LoadCount--;
            if (Util.LoadMark.LoadCount < 0) {
                Util.LoadMark.LoadCount = 0;
            }
            if (Util.LoadMark.LoadCount == 0) {
                if (t >= 0) {
                    if (t > 0) {
                        setTimeout(function () {
                            $("div.loadingPanel").addClass("hide");
                            $("div.loadingMark").addClass("hide");
                        }, t);
                    } else {
                        $("div.loadingPanel").addClass("hide");
                        $("div.loadingMark").addClass("hide");
                    }
                } else {
                    setTimeout(function () {
                        $("div.loadingPanel").addClass("hide");
                        $("div.loadingMark").addClass("hide");
                    }, 50);
                }
            }

        }
    },
    Navigator: {
        //获取浏览器地址传过来的值
        GetUrlParam: function (p) {
            var val = "";
            var param = window.location.search;
            param = param.substring(1);
            params = param.split("&");
            $.each(params, function () {
                var m = this.split("=");
                if (m.length == 2) {
                    if (m[0].toLowerCase() == p.toLowerCase())
                        val = m[1];
                }
            });
            return val;
        }
    },
    DateTime: {
        StrToDateTime: function (date) {
            if (date) {
                date = new Date(parseInt(date.replace("/Date(", "").replace(")/", "")));
                date = Util.DateTime.Formater("yyyy-MM-dd hh:mm:ss", date);
                date = date.substr(0, date.toString().lastIndexOf(":"));
                return date;
            } else {
                return "";
            }
        },
        StrToDate1: function (date, str) {
            if (date) {
                date = new Date(parseInt(date.replace("/Date(", "").replace(")/", "")));
                date = Util.DateTime.Formater(str, date);
                return date;
            } else {
                return "";
            }
        },
        Formater: function (fmtCode, date) {
            function splitDate(d, isZero) {
                var yyyy, MM, dd, hh, mm, ss;
                if (isZero) {
                    yyyy = d.getFullYear();
                    MM = (d.getMonth() + 1) < 10 ? "0" + (d.getMonth() + 1) : d.getMonth() + 1;
                    dd = d.getDate() < 10 ? "0" + d.getDate() : d.getDate();
                    hh = d.getHours() < 10 ? "0" + d.getHours() : d.getHours();
                    mm = d.getMinutes() < 10 ? "0" + d.getMinutes() : d.getMinutes();
                    ss = d.getSeconds() < 10 ? "0" + d.getSeconds() : d.getSeconds();
                } else {
                    yyyy = d.getFullYear();
                    MM = d.getMonth() + 1;
                    dd = d.getDate();
                    hh = d.getHours();
                    mm = d.getMinutes();
                    ss = d.getSeconds();
                }
                return { "yyyy": yyyy, "MM": MM, "dd": dd, "hh": hh, "mm": mm, "ss": ss };
            }

            var result, d, arr_d;

            var patrn_now_1 = /^y{4}-M{2}-d{2}\sh{2}:m{2}:s{2}$/;
            var patrn_now_11 = /^y{4}-M{1,2}-d{1,2}\sh{1,2}:m{1,2}:s{1,2}$/;

            var patrn_now_2 = /^y{4}\/M{2}\/d{2}\sh{2}:m{2}:s{2}$/;
            var patrn_now_22 = /^y{4}\/M{1,2}\/d{1,2}\sh{1,2}:m{1,2}:s{1,2}$/;

            var patrn_now_3 = /^y{4}年M{2}月d{2}日\sh{2}时m{2}分s{2}秒$/;
            var patrn_now_33 = /^y{4}年M{1,2}月d{1,2}日\sh{1,2}时m{1,2}分s{1,2}秒$/;

            var patrn_date_1 = /^y{4}-M{2}-d{2}$/;
            var patrn_date_11 = /^y{4}-M{1,2}-d{1,2}$/;

            var patrn_date_2 = /^y{4}\/M{2}\/d{2}$/;
            var patrn_date_22 = /^y{4}\/M{1,2}\/d{1,2}$/;

            var patrn_date_3 = /^y{4}年M{2}月d{2}日$/;
            var patrn_date_33 = /^y{4}年M{1,2}月d{1,2}日$/;

            var patrn_time_1 = /^h{2}:m{2}:s{2}$/;
            var patrn_time_11 = /^h{1,2}:m{1,2}:s{1,2}$/;
            var patrn_time_2 = /^h{2}时m{2}分s{2}秒$/;
            var patrn_time_22 = /^h{1,2}时m{1,2}分s{1,2}秒$/;

            if (!fmtCode) { fmtCode = "yyyy/MM/dd hh:mm:ss"; }
            if (date) {
                d = new Date(date);
                if (isNaN(d)) {
                    return "";
                }
            } else {
                d = new Date();
            }

            if (patrn_now_1.test(fmtCode)) {
                arr_d = splitDate(d, true);
                result = arr_d.yyyy + "-" + arr_d.MM + "-" + arr_d.dd + " " + arr_d.hh + ":" + arr_d.mm + ":" + arr_d.ss;
            }
            else if (patrn_now_11.test(fmtCode)) {
                arr_d = splitDate(d);
                result = arr_d.yyyy + "-" + arr_d.MM + "-" + arr_d.dd + " " + arr_d.hh + ":" + arr_d.mm + ":" + arr_d.ss;
            }
            else if (patrn_now_2.test(fmtCode)) {
                arr_d = splitDate(d, true);
                result = arr_d.yyyy + "/" + arr_d.MM + "/" + arr_d.dd + " " + arr_d.hh + ":" + arr_d.mm + ":" + arr_d.ss;
            }
            else if (patrn_now_22.test(fmtCode)) {
                arr_d = splitDate(d);
                result = arr_d.yyyy + "/" + arr_d.MM + "/" + arr_d.dd + " " + arr_d.hh + ":" + arr_d.mm + ":" + arr_d.ss;
            }
            else if (patrn_now_3.test(fmtCode)) {
                arr_d = splitDate(d, true);
                result = arr_d.yyyy + "年" + arr_d.MM + "月" + arr_d.dd + "日" + " " + arr_d.hh + "时" + arr_d.mm + "分" + arr_d.ss + "秒";
            }
            else if (patrn_now_33.test(fmtCode)) {
                arr_d = splitDate(d);
                result = arr_d.yyyy + "年" + arr_d.MM + "月" + arr_d.dd + "日" + " " + arr_d.hh + "时" + arr_d.mm + "分" + arr_d.ss + "秒";
            }

            else if (patrn_date_1.test(fmtCode)) {
                arr_d = splitDate(d, true);
                result = arr_d.yyyy + "-" + arr_d.MM + "-" + arr_d.dd;
            }
            else if (patrn_date_11.test(fmtCode)) {
                arr_d = splitDate(d);
                result = arr_d.yyyy + "-" + arr_d.MM + "-" + arr_d.dd;
            }
            else if (patrn_date_2.test(fmtCode)) {
                arr_d = splitDate(d, true);
                result = arr_d.yyyy + "/" + arr_d.MM + "/" + arr_d.dd;
            }
            else if (patrn_date_22.test(fmtCode)) {
                arr_d = splitDate(d);
                result = arr_d.yyyy + "/" + arr_d.MM + "/" + arr_d.dd;
            }
            else if (patrn_date_3.test(fmtCode)) {
                arr_d = splitDate(d, true);
                result = arr_d.yyyy + "年" + arr_d.MM + "月" + arr_d.dd + "日";
            }
            else if (patrn_date_33.test(fmtCode)) {
                arr_d = splitDate(d);
                result = arr_d.yyyy + "年" + arr_d.MM + "月" + arr_d.dd + "日";
            }
            else if (patrn_time_1.test(fmtCode)) {
                arr_d = splitDate(d, true);
                result = arr_d.hh + ":" + arr_d.mm + ":" + arr_d.ss;
            }
            else if (patrn_time_11.test(fmtCode)) {
                arr_d = splitDate(d);
                result = arr_d.hh + ":" + arr_d.mm + ":" + arr_d.ss;
            }
            else if (patrn_time_2.test(fmtCode)) {
                arr_d = splitDate(d, true);
                result = arr_d.hh + "时" + arr_d.mm + "分" + arr_d.ss + "秒";
            }
            else if (patrn_time_22.test(fmtCode)) {
                arr_d = splitDate(d);
                result = arr_d.hh + "时" + arr_d.mm + "分" + arr_d.ss + "秒";
            }
            else {
                alert("没有匹配的时间格式!");
                return;
            }

            return result;
        },
        StrToDate: function (str) {
            var dependedVal = str;
            //根据日期字符串转换成日期  
            var regEx = new RegExp("\\-", "gi");
            dependedVal = dependedVal.replace(regEx, "/");
            var milliseconds = Date.parse(dependedVal);
            var dependedDate = new Date(milliseconds);
            return dependedDate;
        }
    },
    Clone: function (obj) {
        //jQuery实现
        var newObject = jQuery.extend(true, {}, obj);
        return newObject;
        //js实现
        //        var type = typeof obj;

        //        if ('object' == type) {
        //            var args = {};
        //            for (attr in obj) {
        //                args[attr] = Util.Clone(obj[attr]);
        //            }
        //            return args;
        //        } else if ('array' == type) {
        //            var args = new Array();
        //            for (var i = 0; i < obj.length; i++) {

        //                var value = Util.Clone(obj[i]);
        //                if (value !== undefined) args.push(value);
        //            }
        //            return args;

        //        } else if ('string' == type) {
        //            var args = '' + obj.replace(/(\\|\")/g, "\\$1").replace(/\n|\r|\t/g, function () {
        //                var a = arguments[0];
        //                return (a == '\n') ? '\\n' : (a == '\r') ? '\\r' : (a == '\t') ? '\\t' : ""
        //            }) + '';
        //            return args;
        //        }
        //        else {
        //            return obj;
        //        }
    },
    eraseNull: function (obj) {
        if (obj != null) {
            var type = typeof obj;
            if ('object' == type) {
                for (attr in obj) {
                    obj[attr] = Util.eraseNull(obj[attr]);
                }
                return obj;
            } else if ('array' == type) {
                for (var i = 0; i < obj.length; i++) {
                    obj[i] = Util.eraseNull(obj[i]);
                }
            }
        } else {
            obj = "";
        }
        return obj;
    }
}