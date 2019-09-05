$(function(){
		var divs=$("div.arrows-acr");
		for(var i=0;i<divs.length;i++){
			var div=$($(divs[i]));
			var width=div.css("width");
			var img=$(div.find("img"));
			var src=img.attr("src");
			var begin="0px";
			var end="0px";
			if(src.indexOf("left")>=0){
				img.css("margin-left",width);
				begin=width;
			}else{
				end=width;
			}
			
			lefttoright(img,5000,begin,end);
		}
		divs=$("div.arrows-ver");
		for(var i=0;i<divs.length;i++){
			var div=$($(divs[i]));
			var width=div.css("height");
			var img=$(div.find("img"));
			var src=img.attr("src");
			var begin="0px";
			var end="0px";
			if(src.indexOf("top")>=0){
				img.css("margin-top",width);
				begin=width;
			}else{
				end=width;
			}
			
			uptodown(img,5000,begin,end);
		}
	});
	function lefttoright(obj,speed,begin,end){
        obj.animate({
                marginLeft:end
        },speed,function(){
                $(this).css("margin-left",begin);
                lefttoright(obj,speed,begin,end);
        });
	}
	function uptodown(obj,speed,begin,end){
        obj.animate({
                marginTop:end
        },speed,function(){
                $(this).css("margin-top",begin);
                uptodown(obj,speed,begin,end);
        });
	}