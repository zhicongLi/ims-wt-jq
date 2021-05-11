var sys_tool_bar_ = function(){
	
}
sys_tool_bar_.prototype.addButtonOption = function(option){
	var buttonId = option.buttonId;
	var functionStr = option.functionStr;
	var name = option.name;
	var gridId = option.gridId;
	var tooltip = option.tooltip;
	var iconCls = option.iconCls;
	var posType = option.posType;  //append  放到某个容器最后，默认，  after 某个元素后面
	var toolBarId= option.toolBarId;
	if(!posType){
		posType='append';
	}
	
	
	if(!name){
		name='';
	}
	if(!tooltip){
		tooltip=name;
	}
	if(!iconCls){
		iconCls = "";
	}
	
	
	if(!toolBarId){
		if(gridId){
			toolBarId = "toolbargridsub_"+gridId+"_td_";
		}else{
			toolBarId="toolbarformmain_td_";
		}
		
	}
	if(functionStr){
		var index = functionStr.indexOf("(");//是否有括号
		if(index==-1){
			functionStr = functionStr+"()";
		}
	}else{
		functionStr="";
	}
	
	var str = '<a class="mini-button" iconCls="'+iconCls+'"  onclick="'+functionStr+'" id="'+buttonId+'" tooltip="'+tooltip+'" plain="true">'+name+'</a>';
	if($("#"+toolBarId)){
		if(posType=='append'){
			$("#"+toolBarId).append($(str));
		}else if (posType=='after'){
			$("#"+toolBarId).after($(str));
		}else{
			//以后扩展
		}
		
	}
	
	mini.parse();
}
sys_tool_bar_.prototype.addButton = function(buttonId,functionStr,name){
	var index = functionStr.indexOf("(");//是否有括号
	if(index==-1){
		functionStr = functionStr+"()";
	}
	var str = '<a class="mini-button"   onclick="'+functionStr+'" id="'+buttonId+'" plain="true">'+name+'</a>';
	if($("#toolbarformmain_td_")){
		$("#toolbarformmain_td_").append($(str));
	}
	
	mini.parse();
}
sys_tool_bar_.prototype.hideButton = function(buttonId){
	mini.parse();
	var button = mini.get(buttonId);
	if(button){
		button.hide();
	}
}
sys_tool_bar_.prototype.disableButton = function(buttonId){
	mini.parse();
	var button = mini.get(buttonId);
	if(button){
		button.setEnabled(false);
	}
}

sys_tool_bar_.prototype.enableButton = function(buttonId){
	mini.parse();
	var button = mini.get(buttonId);
	if(button){
		button.setEnabled(true);
	}
}
sys_tool_bar_.prototype.bindClick = function(buttonId,functionStr,functionParam){
	debugger;
	mini.parse();
	var button = mini.get(buttonId);
	if(button){
		button.un("click");
		button.on("click",function(e){
			debugger;
			if(functionStr){
				if(typeof functionStr === 'function'){
					functionStr(functionParam);
				}
				
			}
			
		});
	}
}
var sysToolBar_ = new sys_tool_bar_();