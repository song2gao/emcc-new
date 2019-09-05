var initializationTime=(new Date()).getTime();
//求日期。精确到分。没有星期几
function showLeftTime()
{
	var now=new Date();
	//var year=now.getYear();
	var year = now.getFullYear();
	var month=now.getMonth()+1;
	var day=now.getDate();
	var hours=now.getHours();
	if(hours<10){
		hours='0'+''+hours;
	}
	var t;
	if(hours>12){
		t="PM";
	}else{
		t="AM"
	}
	var minutes=now.getMinutes();
	if(minutes<10){
		minutes='0'+''+minutes;
	}
	var time=""+year+"/"+month+"/"+day+"    "+hours+":"+minutes+" "+t;
	//一分钟刷新一次显示时间
	//document.all.show.innerHTML=""+year+"/"+month+"/"+day+"    "+hours+":"+minutes+" "+t;
	document.getElementById("show").innerHTML = ""+year+"/"+month+"/"+day+"    "+hours+":"+minutes+" "+t;
	var timeID=setTimeout(showLeftTime,60000);
}

//求日期。精确到日。有星期几

	function initArray(){
		var now=new Date();
		var week;
			if(new Date().getDay()==0)          week="星期日"
			if(new Date().getDay()==1)          week="星期一"
			if(new Date().getDay()==2)          week="星期二"
			if(new Date().getDay()==3)          week="星期三"
			if(new Date().getDay()==4)          week="星期四"
			if(new Date().getDay()==5)          week="星期五"
			if(new Date().getDay()==6)          week="星期六"
		var year=now.getFullYear();
		var month=now.getMonth()+1;
		var day=now.getDate();
		//document.all.xinqi.innerHTML=""+year+"/"+month+"/"+day+"    "+week;
		document.getElementById("xinqi").innerHTML=""+year+"/"+month+"/"+day+"    "+week;
		
	}
	function initShowTime(){
		var now=new Date();
		var week;
			if(new Date().getDay()==0)          week="星期日"
			if(new Date().getDay()==1)          week="星期一"
			if(new Date().getDay()==2)          week="星期二"
			if(new Date().getDay()==3)          week="星期三"
			if(new Date().getDay()==4)          week="星期四"
			if(new Date().getDay()==5)          week="星期五"
			if(new Date().getDay()==6)          week="星期六"
		var year=now.getFullYear();
		var month=now.getMonth()+1;
		var day=now.getDate();
		document.getElementById("showTimeInfo").innerHTML = ""+year+"年"+month+"月"+day+"日    "+week;
	}
	var yearnum = 0;
	var monthnum = 0;
	var daynum = 1;
	//规范日期格式	
	function myformatter(date) {
		var y = date.getFullYear() + yearnum;
		var m = date.getMonth() + 1 + monthnum;
		var d = date.getDate() + daynum;
		return y + '-' + (m < 10 ? ('0' + m) : m) + '-'
				+ (d < 10 ? ('0' + d) : d);
	}
	function myparser(s) {
		if (!s)
			return new Date();
		var ss = (s.split('-'));
		var y = parseInt(ss[0], 10);
		var m = parseInt(ss[1], 10);
		var d = parseInt(ss[2], 10);
		if (!isNaN(y) && !isNaN(m) && !isNaN(d)) {
			return new Date(y, m - 1, d);
		} else {
			return new Date();
		}
	}