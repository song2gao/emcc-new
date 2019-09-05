/*
 * 用能单位维护  js
 * 通讯路由配置
 * 
 * 朱亚彬
 */

/*
 * 页面加载
 */
var pname="";
var pcodes="";
var euiIds=1;
$(function() {
	
	//加载easyUI表格
//	table();
	// 全查询页面
	InitTreeData();
//	GetData();
	// 添加人员信息
//	addPerson();
//	// 删除人员信息
//	delPerson();
//	// 修改人员信息
//	uppPerson();
////	//验证
////	check();
////	//查询
////	select();
//	$('#search').linkbutton({
//	    iconCls: 'icon-search'
//	});
	
});

/*
 * 页面加载
 */
function InitTreeData() {
	alert("测试");
	//加载 页面左边  tree
	$('#MyTree').tree({
		url : 'treeInfo',
		checkbox : false,
		animate : true,
		onBeforeExpand : function(node) {
			 //alert(node.id);
			$('#MyTree').tree('options').url = 'tree/person/treeId&eid=' + node.id;
		},onLoadSuccess:function(node,data){
			var test = $('#MyTree').tree('find', data[2].id);//找到id为”tt“这个树的节点id为”1“的对象
			$('#MyTree').tree('select', test.target);//设置选中该节点
		},
		onClick : function(node) {// 单击某个树节点,对应的Tabs发生数据变化
			euiIds=node.id;
			GetDataRefresh(euiIds);
		}
	});
	
	//加载 页面右边  页面内容
	GetDataRefresh(euiIds);

}
/**
 * 根据ID全查询所有
 * 
 * @param qyid
 */
function GetDataRefresh(qyid) {
	var test = {};
	test.qyid = qyid;
	test.pageIndex = 1;// 页索引
	test.pageSize = 10;// 页容量
	test.pname=pname;
	test.pcodes=pcodes;
	BingData("#tt", test, "communication/communInfo", null);
}
