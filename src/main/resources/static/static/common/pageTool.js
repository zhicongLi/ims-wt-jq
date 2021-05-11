$(document).ready(function(){
	var url = "";
	var func = "";
	var id = "";
	var pageSize = "";
	var readFlag = "";
	var procDefKey = "";
	var pageCount = 0;
	var needVar = "";
	var isToDo = "";
	$(".first_page").click(function(){
		var pid = $(this).attr("pid")
		init(pid);
		debugger;
		var pageNo = parseInt($("#"+pid+" #pageNoReal").val());
		if(pageCount=="0"||pageCount=="1"){
		}else{
			if(pageNo==1){
				alert("已是第一页")
			}else{
				load(id,url,pageSize,'1','1',func,readFlag,procDefKey,needVar);
			}
			$("#"+pid+" #pageNo").val("1")
			$("#"+pid+" #pageNoReal").val("1")
		}
	})
	
	$(".next_page").click(function(){
		debugger;
		var pid = $(this).attr("pid")
		init(pid);
		//var pageCount = $("#"+pid+" :input[name='pageCount']").val();
		var pageNo = parseInt($("#"+pid+" #pageNoReal").val());
		if(pageCount=="0"||pageCount=="1"){
		}else{
			if(pageNo!=pageCount){
				load(id,url,pageSize,pageNo+1,'1',func,readFlag,procDefKey,needVar);
				$("#"+pid+" #pageNo").val(pageNo+1)
				$("#"+pid+" #pageNoReal").val(pageNo+1)
			}else{
				alert("已是最后一页")
				$("#"+pid+" #pageNo").val(pageCount)
				$("#"+pid+" #pageNoReal").val(pageCount)
			}
		}
	})
	
	$(".prev_page").click(function(){
		debugger;
		var pid = $(this).attr("pid")
		init(pid);
		var pageNo = parseInt($("#"+pid+" #pageNoReal").val());
		if(pageCount=="0"||pageCount=="1"){
		}else{
			if(pageNo!=1){
				load(id,url,pageSize,pageNo-1,'1',func,readFlag,procDefKey,needVar);
				$("#"+pid+" #pageNo").val(pageNo-1)
				$("#"+pid+" #pageNoReal").val(pageNo-1)
			}else{
				alert("已是第一页")
				$("#"+pid+" #pageNo").val("1")
				$("#"+pid+" #pageNoReal").val("1")
			}
		}
	})
	
	$(".last_page").click(function(){
		debugger;
		var pid = $(this).attr("pid")
		init(pid);
		//var pageCount = $("#"+pid+" :input[name='pageCount']").val();
		var pageNo = parseInt($("#"+pid+" #pageNoReal").val());
		if(pageCount=="0"||pageCount=="1"){
		}else{
			if(pageNo==pageCount){
				alert("已是最后一页")
			}else{
				load(id,url,pageSize,pageCount,'1',func,readFlag,procDefKey,needVar);
			}
			$("#"+pid+" #pageNo").val(pageCount)
			$("#"+pid+" #pageNoReal").val(pageCount)
		}
	})
	
	function load(cid,url,pageSize,pageNo,isSelf,currFunc,readFlag,procDefKey,needVar){
		debugger;
//		var count = 1;
//		var datas = null;
		$.ajax({
	        url: url,
	     	data:{isSelf:isSelf,pageSize:pageSize,pageNo:pageNo,readFlag:readFlag,procDefKey:procDefKey,needVar:needVar},
	        type:"post",
	        dataType:"json",
	        async:false,
	        success: function (data) {
	        	//datas = data;
	        	var d = data.data;
	        	if(d.length==0){
	        		//count = 0;
	        	}else{
	        		 var fun = window[currFunc];
		   			 if(fun && typeof(fun)=='function'){
		   				 fun(data,cid,isToDo);
		   			 }
	        	}
	    	}
		 });
//		 if(count==0){
//			 //alert("已是最后一页");
//		 }else{
//			 var fun = window[currFunc];
//			 if(fun && typeof(fun)=='function'){
//				 fun(datas,cid)
//			 }
//		 }
	}
	
	$(".pageNo").on('keyup',function(event){ 
		debugger;
		var pid = $(this).attr("pid")
		init(pid);
		if(pageCount=="0"||pageCount=="1"){
			$("#"+pid+" #pageNo").val("1");
			$("#"+pid+" #pageNoReal").val("1");
		}else{
			if(event.keyCode == 13)      
			{  
				var val = parseInt($("#"+pid+" #pageNo").val());
				if(val>parseInt(pageCount)){
					alert("最多"+pageCount+"页")
					return ;
				}
				$("#"+pid+" #pageNo").val(val);
				$("#"+pid+" #pageNoReal").val(val);
				load(id,url,pageSize,val,'1',func,readFlag,procDefKey,needVar);
			}  
		}
	});
	
	
	
	function init(pid){
		url = $("#"+pid+" :input[name='url']").val();
		func = $("#"+pid+" :input[name='func']").val();
		id = $("#"+pid+" :input[name='id']").val();
		pageSize = $("#"+pid+" :input[name='pageSize']").val();
		pageCount = $("#"+pid+" :input[name='pageCount']").val();
		readFlag = $("#"+pid+" :input[name='readFlag']").val();
		procDefKey = $("#"+pid+" :input[name='procDefKey']").val();
		needVar = $("#"+pid+" :input[name='needVar']").val();
		isToDo = $("#"+pid+" :input[name='isToDo']").val();
	}
})
