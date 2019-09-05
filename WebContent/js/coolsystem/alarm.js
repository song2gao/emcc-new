var mylayer;	
//加载弹出层参数
	function clickHz(value, codes) {
		var title = "";
		var type = "";
		var name = "";
		var str = "";
		var up = "";
		var down = "";
		var unit = "";
		$.ajax({
			url : "/emcc-new/point/pointInfo",
			data : {
				calId : value,
				codes : codes
			},
			async : false,
			dataType : "json",
			type : "post",
			success : function(result) {
				title = result.name;
				str = title + " " + result.list[0].mmpNames;
				up = result.list[0].mmpUpValue;
				down = result.list[0].mmpDownValue;
				unit = result.list[0].mmpUnits;
			}
		});
		mylayer=layer.open({
					type : 1,
					title : title //不显示标题栏
					,
					skin : 'layui-layer-molv' //样式类名
					,
					offset : [ '15%', '10%' ] //具体配置参考：offset参数项
					,
					area : [ '500px', '100px' ],
					content : "<div style=\"padding: 10px 20px;\">"
							+ "<div class=\"layui-form-item\" style=\"color:black;border:0px solid green;\"><div class=\"layui-inline\">"
							+ "<label class=\"layui-form-label\" style=\"border:0px solid green;width:100px;\">报警上限：</label><input type=\"text\" name=\"max\" id=\"max\" lay-verify=\"email\" autocomplete=\"off\" class=\"layui-input\"  style=\"color:black;width:60px;\" value=\""+up+"\">"
							+ "</div><div class=\"layui-inline\"><label class=\"layui-form-label\" style=\"border:0px solid green;width:100px;\">报警下限：</label><input type=\"text\" id=\"min\" name=\"min\" lay-verify=\"email\" autocomplete=\"off\" class=\"layui-input\"  style=\"color:black;width:60px;\" value=\""+down+"\">"
							+ "</div><div class=\"layui-inline\"><label class=\"layui-btn\" onclick=\"submit('"
							+ value+ "',"+codes+")\">确定修改</label></div></div>"
							+ "</div>",
					btnAlign : 'a' //按钮居中
					,
					anim : 3 //弹出 动画
					,
					isOutAnim : true //关闭动画效果
					,
					shade : 0 //不显示遮罩
					,
					shadeClose : true //点击遮罩关闭层
					,
					yes : function(index) {
						layer.close(index);
					}
				});
	}

	//一号主机参数显示
	function clickZJ(value) {
		var title = "";
		if (value == 1) {
			title = "一号主机";
		}
		if (value == 2) {
			title = "二号主机";
		}
		if (value == 3) {
			title = "三号主机";
		}
		layui.use('layer',function() {
							var layer = layui.layer;

							layer.open({
										type : 1,
										title : title //不显示标题栏
										,
										skin : 'layui-layer-molv' //样式类名
										,
										offset : [ '12%', '5%' ] //具体配置参考：offset参数项
										,
										area : [ '300px', '485px' ],
										content : '<div class="layui-tab layui-tab-brief" style="border:0px solid red;height:95%;" lay-filter="docDemoTabBrief"><ul class="layui-tab-title">'
												+ '<li class="layui-this">运行参数</li><li>机型参数</li></ul>'
												+ '<div class="layui-tab-content" style="border:0px solid blue;height:90%;">'
												+ '<div class="layui-tab-item layui-show">'
												+ '<table class="layui-table" lay-size="sm" style="width:100%;">'
												+ '<colgroup><col width="30px"><col width="40px"></colgroup>'
												+ '<thead><tr><th>参数类别</th><th>参数值</th></tr></thead>'
												+ '<tbody><tr><td>冷冻水出水温度：</td><td>15.6℃</td></tr><tr><td>冷冻水回水温度：</td><td>15.6℃</td>'
												+ '</tr><tr><td>冷却水出水温度：</td><td>15.6℃</td></tr><tr><td>冷却水回水温度：</td><td>15.6℃</td>'
												+ '</tr><tr><td>总负荷率：</td><td>50%</td></tr><tr><td>制冷设定温度：</td><td>15.6℃</td>'
												+ '</tr></tbody></table>'
												+ '</div>'
												+ '<div class="layui-tab-item">'
												+ '<table class="layui-table" lay-size="sm" style="width:100%;">'
												+ '<colgroup><col width="20px"><col width="40px"></colgroup>'
												+ '<thead><tr><th>参数类别</th><th>参数值</th></tr></thead>'
												+ '<tbody><tr><td>制冷量：</td><td>72.29KW</td></tr><tr><td>电源频率：</td><td>50</td>'
												+ '</tr><tr><td>产地：</td><td>上海</td></tr><tr><td>售后服务：</td><td>一年保修</td>'
												+ '</tr><tr><td>执行质量标准：</td><td>国标</td></tr><tr><td>冷暖类型：</td><td>单冷型</td>'
												+ '</tr><tr><td>空调功率：</td><td>5匹以上</td></tr><tr><td>品牌：</td><td>开立</td>'
												+ '</tr><tr><td>型号：</td><td>DBKA</td></tr><tr><td>加工定制：</td><td>是</td>'
												+ '</tr><tr><td>空调技术：</td><td>定速</td></tr><tr><td>空调频率：</td><td>50（Hz）</td>'
												+ '</tr></tbody></table>'
												+ '</div>'
												+ '</div></div>'
												+ '',
										btn : '关闭',
										btnAlign : 'a' //按钮居中
										,
										anim : 3 //弹出 动画
										,
										isOutAnim : true //关闭动画效果
										,
										shade : 0 //不显示遮罩
										,
										shadeClose : true //点击遮罩关闭层
										,
										yes : function(index) {
											layer.close(index);
										}
									});
						});
	}
	function selectSelect() {
		var aLi = document.querySelectorAll('.select');
		for (var i = 0; i < aLi.length; i++) {
			aLi[i].addEventListener('click', function(e) {
				$("div").removeClass("select box-shadow-2");
				$("div").addClass("select");
				if (e.target.className == "select") {
					$(this).removeClass("select");
					$(this).addClass("select box-shadow-2");
				} else if (e.target.className == "select box-shadow-2") {
					$(this).removeClass("select box-shadow-2");
					$("div").addClass("select");
				} else {
					$("div").addClass("select");
				}
			});
		}
	}
	function submit(ctdCode,mmpCode) {
		var max = $("#max").val();
		var min = $("#min").val();
		$.ajax({
			url : "../point/uppPoint",
			data : {
				up : max,
				down : min,
				ctdCode : ctdCode,
				mmpCode:mmpCode
			},
			dataType : "json",
			type : "post",
			success : function(result) {
				if (result == 1) {
					$("#" + ctdCode+"e"+mmpCode).attr("upvalue",max);
					$("#" + ctdCode+"e"+mmpCode).attr("downvalue",min);
					layer.alert("修改成功",function(){
						layer.close(mylayer);
						layer.close(layer.index);
					});
				} else {
					layer.alert("修改失败",function(){
						layer.close(layer.index);
					});
				}

			}
		});
	}
	function pointInfo(ctdCode,mmpCode) {
		$.ajax({
			url : "../point/pointInfo",
			data : {
				calId : ctdCode,
				codes : mmpCode
			},
			dataType : "json",
			type : "post",
			success : function(result) {
				for (var i = 0; i < result.list.length; i++) {
					var id = result.list[i].calId;
					var mmpUpValue = result.list[i].mmpUpValue;
					var mmpDownValue = result.list[i].mmpDownValue;
					$("#" + id+"e"+mmpCode).attr("upvalue",mmpUpValue);
					$("#" + id+"e"+mmpCode).attr("downvalue",mmpDownValue);
				}

			}
		});
	}
	//一号水泵参数显示
	function clickSB1(value) {
		var title = "";
		if (value == 1) {
			title = "一号水泵";
		}
		if (value == 2) {
			title = "二号水泵";
		}
		if (value == 3) {
			title = "三号水泵";
		}
		if (value == 4) {
			title = "四号水泵";
		}
		if (value == 5) {
			title = "五号水泵";
		}
		if (value == 6) {
			title = "六号水泵";
		}
		layui
				.use(
						'layer',
						function() {
							var layer = layui.layer;

							layer
									.open({
										type : 1,
										title : title //不显示标题栏
										,
										skin : 'layui-layer-molv' //样式类名
										,
										offset : [ '18%', '9%' ] //具体配置参考：offset参数项
										,
										area : [ '400px', '400px' ],
										content : '<div class="layui-tab layui-tab-brief" style="border:0px solid red;height:95%;" lay-filter="docDemoTabBrief"><ul class="layui-tab-title">'
												+ '<li class="layui-this">运行参数</li><li>机型参数</li></ul>'
												+ '<div class="layui-tab-content" style="border:0px solid blue;height:90%;">'
												+ '<div class="layui-tab-item layui-show">'
												+ '<table class="layui-table" lay-size="sm" style="width:100%;">'
												+ '<colgroup><col width="30px"><col width="40px"></colgroup>'
												+ '<thead><tr><th>参数类别</th><th>参数值</th></tr></thead>'
												+ '<tbody><tr><td>冷冻水出水温度：</td><td>15.6℃</td></tr><tr><td>冷冻水回水温度：</td><td>15.6℃</td>'
												+ '</tr><tr><td>冷却水出水温度：</td><td>15.6℃</td></tr><tr><td>冷却水回水温度：</td><td>15.6℃</td>'
												+ '</tr><tr><td>总负荷率：</td><td>50%</td></tr><tr><td>制冷设定温度：</td><td>15.6℃</td>'
												+ '</tr></tbody></table>'
												+ '</div>'
												+ '<div class="layui-tab-item">'
												+ '<table class="layui-table" lay-size="sm" style="width:100%;">'
												+ '<colgroup><col width="20px"><col width="40px"></colgroup>'
												+ '<thead><tr><th>参数类别</th><th>参数值</th></tr></thead>'
												+ '<tbody><tr><td>制冷量：</td><td>72.29KW</td></tr><tr><td>电源频率：</td><td>50</td>'
												+ '</tr><tr><td>产地：</td><td>上海</td></tr><tr><td>售后服务：</td><td>一年保修</td>'
												+ '</tr><tr><td>执行质量标准：</td><td>国标</td></tr><tr><td>冷暖类型：</td><td>单冷型</td>'
												+ '</tr><tr><td>空调功率：</td><td>5匹以上</td></tr><tr><td>品牌：</td><td>开立</td>'
												+ '</tr><tr><td>型号：</td><td>DBKA</td></tr><tr><td>空调技术：</td><td>定速</td></tr><tr><td>空调频率：</td><td>50（Hz）</td>'
												+ '</tr></tbody></table>'
												+ '</div>'
												+ '</div></div>'
												+ '',
										btn : '关闭',
										btnAlign : 'a' //按钮居中
										,
										anim : 3 //弹出 动画
										,
										isOutAnim : true //关闭动画效果
										,
										shade : 0 //不显示遮罩
										,
										shadeClose : true //点击遮罩关闭层
										,
										yes : function(index) {
											layer.close(index);
										}
									});
						});

	}