//分页
function Async(action,args,callback){
	$.ajax({
	url: action ,
	type:"POST",
	async:false,
	dataType:"json",
	timeout: 10000,
	data: args,
	success: function(data){
		if(callback){
			callback(data);
		}
	}
	}); 
}
 function BingData(pid,args,action,callback){
	Async(action,args,function(data){
		if(data!=null&&data.list!=null){
			var _dataCount=data.size;//总条数
			var _data=data.list;//数据
			if(callback){
				callback(_data);
			}
			 $(pid).datagrid('loadData', _data);
	         $(pid).datagrid('getPager').pagination({
	                pageSize: args.pageSize,
	                total: _dataCount,
	                pageNumber: args.pageIndex,
	                pageList:args.pageList,
	                onSelectPage: function (pageNumber, pageSize) {
	        	 		args.pageIndex = pageNumber;
	                    args.pageSize = pageSize;
	                    BingData(pid, args, action,null);
	                },
	                onRefresh: function (pageNumber, pageSize) {
	                    args.pageIndex = pageNumber;
	                    args.pageSize = pageSize;
	                    BingData(pid, args, action,null);
	                }
	            });
		}
	});  
}
 
 function BingNewData(pid,args,action,callback){
		var returndata;
		AsyncNew(action,args,function(data){
			returndata=data;
			if(data!=null&&data.list!=null){
				var _dataCount=data.size;//总条数
				var _data=data.list;//数据
				if(callback){
					callback(_data);
				}
				 $(pid).datagrid('loadData', _data);
		         $(pid).datagrid('getPager').pagination({
		                pageSize: args.pageSize,
		                total: _dataCount,
		                pageNumber: args.pageIndex,
		                pageList:args.pageList,
		                onSelectPage: function (pageNumber, pageSize) {
		                    args.pageIndex = pageNumber;
		                    args.pageSize = pageSize;
		                    BingNewData(pid, args, action,null);
		                },
		                onRefresh: function (pageNumber, pageSize) {
		                    args.pageIndex = pageNumber;
		                    args.pageSize = pageSize;
		                    BingNewData(pid, args, action,null);
		                }
		            });
			}
		});  
		return returndata;
	}
 function AsyncNew(action,args,callback){
		$.ajax({
		url: action ,
		type:"POST",
		async:false,
		dataType:"json",
		timeout: 10000,
		data: args,
		success: function(data){
			if(callback){
				callback(data);
			}
		}
		}); 
	}
