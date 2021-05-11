var AA = function() {
	 this.flowSecList = {};
	 this.editList = [];
	 this.loadSuccess= false;
};

AA.prototype.loadEditList = function( objName, queryKey){
	var _this = this;
	debugger;
	$.ajax({
		url : ctx +"/ims-ext/sys/sysEditControl/dataList",
		type : "post",
		data:{
			'objName':objName,
			'queryKey':queryKey
		},
		success : function(text) {
			var data = mini.decode(text);
			if(data.type == "I")
			{
				_this.loadSuccess=true;
				_this.editList = data.data;
			}
			else if(data.type=="E"){
                showMessageBox("错误",data.message,"error");
                return;
			}
		},
		error:function(jqXHR, textStatus, errorThrown){
			/*mini.mask({
				html:'加载失败',
				cls: "",
			    style: ""
			});*/
			mini.showMessageBox({
				title: "加载失败",    
				message: "加载编辑控制失败",
				buttons: ["确定", "详细"],    
				iconCls: "mini-messagebox-question",
				html: "",
				width:250,
				callback: function(action){
					if(action=='详细')  alert(jqXHR.responseText);
				}
    	   });
		}
	});
	
}

AA.prototype.afterLoad = function(o){
	
	if(!o){
		return true;
	}
	var secList = this.editList;
	if(!secList){
		return true;
	}
	var newSecList = new Array();
	for(var i = 0;i<secList.length;i++){
		var sec = secList[i];
		var seccList = sec.seccList;
		var b = true;
		if(seccList){
			for(var j=0;j<seccList.length;j++){
				var secc = seccList[j];
				var value='';
				if(secc.condGroup!='1'){//流程提交时验证
					continue;
				}
				if(secc.valueMethod=='2'||secc.valueMethod=='1'){//前端从值里取,或者后端获取
					value = o[secc.fieldName];
				}else if(secc.valueMethod=='3'){//根据id get
					var field = mini.get(secc.fieldName);
					if(field){
						value = field.getValue();	
					}else{
						mini.alert("未找到id为"+secc.fieldName+"的字段");
					}
				}else{
					continue;
				}
				if(value!=secc.fieldValue){
					b=false;
					break;
				}
			}
		}
		if(b){
			newSecList.push(sec);
		}
	}
	
	this.flowSecList = newSecList;
	var setReadOnlyArrs={};
	for(var k=0;k<newSecList.length;k++){
		var sec = newSecList[k];
		
		var formIds = sec.disabledFormIds;
		if(formIds&&formIds!=''){
			var formArr = formIds.split(",");
			for(var i=0;i<formArr.length;i++){
				var formId = formArr[i];
				if(formId.indexOf("#")!=0){
					formId = "#"+formId;
				}
				if(!setReadOnlyArrs["formId_"+formId]){
					var miniForm = $(formId);
					var b = false;
					if(miniForm&&miniForm.length&&miniForm.length>0){
						b=true;
					}
					if(!b){
						continue;
					}
					var myform = new mini.Form(formId); 
					myform.setEnabled(false);
					setReadOnlyArrs["formId_"+formId]='1';
				}
				
			}
		}
		var gridIds = sec.disabledGridIds;
		if(gridIds&&gridIds!=''){
			var gridArr = gridIds.split(",");
			for(var i=0;i<gridArr.length;i++){
				var grid = mini.get(gridArr[i]);
				if(!grid){
					continue;
				}
				if(!setReadOnlyArrs["gridId_"+gridArr[i]]){
					//设置grid  按钮不可用
					var gridAdd= "_tb"+gridArr[i]+"_add";
					var gridRemove= "_tb"+gridArr[i]+"_remove";
					var gridClone= "_tb"+gridArr[i]+"_clone";    
					
					var arr = new Array(gridAdd,gridRemove,gridClone);
					for(var kk =0;kk<arr.length;kk++){
						var itemId = arr[kk];
						if(!setReadOnlyArrs["itemId_"+itemId]){
							var item = mini.get(itemId);
							if(item){
								item.setEnabled(false);
							}
							setReadOnlyArrs["itemId_"+itemId]='1';
						}
					}
					
					var columns = grid.getColumns();
					if(columns){
						for(var j=0;j<columns.length;j++){
							var column = columns[j];
							column.readOnly=true;
							var vtype = column.vtype;
							if(vtype!=''){
								if(vtype.indexOf('required')!=-1){
									vtype.replace('required','');
									vtype.replace(';;',';');
								}
								
							}
							
						}
					}
					setReadOnlyArrs["gridId_"+gridArr[i]]='1';
				}
			}
		}
		var itemIds = sec.disabledGetItemIds;
		if(itemIds&&itemIds!=''){
			var itemArr = itemIds.split(",");
			for(var i=0;i<itemArr.length;i++){
				var itemId = itemArr[i];
				if(!setReadOnlyArrs["itemId_"+itemId]){
					var item = mini.get(itemId);
					if(item){
						item.setEnabled(false);
					}
					setReadOnlyArrs["itemId_"+itemId]='1';
				}
				
			}
		}
		var seclList = sec.seclList;
		if(seclList){
			for(var i=0;i<seclList.length;i++){
				var secl = seclList[i];
			//	if(secl.condGroup!='1'){//流程提交时验证
			//		continue;
			//	}
				if(secl.type=='1'){//表单
					var field = mini.get(secl.fieldName);
					if(secl.formId!=undefined&&secl.formId!=''){//有重名，用form 根据name获取
						var formId = secl.formId;
						if(formId.indexOf("#")!=0){
							formId = "#"+formId;
						}
						var myform = new mini.Form(formId); 
						field = mini.getByName(secl.fieldName,myform);
					}
					if(field){
						if(secl.isEdit=='1'){
							field.setEnabled(true);
							field.setReadOnly(false);
						}
						if(field.required!=undefined &&secl.isRequired=='1'&&secl.condGroup=='1'){//保存必填
							field.setRequired(true);
						}else{
							if(field.required!=undefined){//其他情况改为不是必填
								field.setRequired(false);
							}
							
						}
						 
					}
				}else if(secl.type='2'){//grid
					var grid = mini.get(secl.formId);
					if(!grid){
						//mini.alert("未找到grid,gridid为"+secl.formId);
						//return false;
						continue;
					}
					if(!setReadOnlyArrs["gridId_"+secl.formId]){
						var columns = grid.getColumns();
						if(columns){
							for(var j=0;j<columns.length;j++){
								var column = columns[j];
								column.readOnly=true;
							}
						}
						setReadOnlyArrs["gridId_"+secl.formId]='1';
					}
					if(secl.isEdit=='1'){
						var setColumn = grid.getColumn(secl.fieldName);
						if(setColumn){
							setColumn.readOnly=false;
						}
						
					}
					if(secl.isRequired=='1'&&secl.condGroup=='1'){
						var setColumn = grid.getColumn(secl.fieldName);
						if(setColumn){
							var vtype = setColumn.vtype;
							if(vtype==''){
								vtype='required';
							}else{
								if(vtype.lastIndexOf(';')!=vtype.length-1){
									vtype += ';';
								}
								vtype += 'required';
							}
							setColumn.vtype=vtype;
						}
						
					}
					
					
				}
				
			}
		}
		
		
		
	}
	
	
	
}

AA.prototype.flowAction=function(){
	var newSecList = new Array();
	for(var i = 0;i<this.flowSecList.length;i++){
		var sec = this.flowSecList[i];
		var seccList = sec.seccList;
		var b = true;
		if(seccList){
			for(var j=0;j<seccList.length;j++){
				var secc = seccList[j];
				var value='';
				/*if(secc.condGroup=='1'){//普通验证
					continue;
				}*/
				if(secc.valueMethod=='1'||secc.valueMethod=='2'){//后端获取，jsget获取，已经验证
					continue;
				}
				if(secc.valueMethod=='3'){//根据id get
					var field = mini.get(secc.fieldName);
					if(field){
						value = field.getValue();	
					}else{
						mini.alert("未找到id为"+secc.fieldName+"的字段");
						return false;
					}
				}else{
					mini.alert("流程提交时，只能配置从get取值");
					//showMessageBox("提醒","流程提交时，只能配置从get取值","warring");
					return false;
				}
				if(value!=secc.fieldValue){
					b=false;
					break;
				}
			}
		}
		if(b){
			newSecList.push(sec);
		}
	}
	for(var k=0;k<newSecList.length;k++){
		var sec = newSecList[k];
		var seclList = sec.seclList;
		if(seclList){
			for(var i=0;i<seclList.length;i++){
				var secl = seclList[i];
				if(secl.condGroup=='1'){//普通验证
					continue;
				}
				if(secl.type=='1'){//表单
					var field = mini.get(secl.fieldName);
					if(secl.formId!=undefined&&secl.formId!=''){//有重名，用form 根据name获取
						var formId = secl.formId;
						if(formId.indexOf("#")!=0){
							formId = "#"+formId;
						}
						var myform = new mini.Form(formId); 
						field = mini.getByName(secl.fieldName,myform);
					}
					
					if(field){
						if(secl.isRequired=='1'){
							if(field.getValue()==''){
								var message = secl.message;
								if(!message){
									if(secl.fieldDesc){
										message = "请填写"+secl.fieldDesc;
									}else{
										message = "有必填字段未填！";
									}
								}
								mini.alert(message);
								//showMessageBox("提醒",message,"warring");
								return false;
							}
						}
						if(secl.maxLength&&secl.maxLength!=''&&secl.maxLength>0){
							if(field.getValue().length>secl.maxLength){
								mini.alert(secl.fieldDesc+"最大为"+secl.maxLength+"个字符");
								//showMessageBox("提醒",secl.fieldDesc+"最大为"+secl.maxLength+"个字符","warring");
								return false;
							}
						}
					}
				}else if(secl.type=='2'){//grid
					var tmpGrid = mini.get(secl.formId);
					if(!tmpGrid){
						continue;
					}
					
					var gridData = tmpGrid.getData();
					if(!gridData.length){
						continue;
					}
					for(var m=0;m<gridData.length;m++){
						var row = gridData[m];
						var fieldValue = row[secl.fieldName];
						if(secl.isRequired=='1'){//不是必填不验证
							if(!fieldValue||fieldValue==''){
								//showMessageBox("提醒",secl.message,"warring");
								mini.alert(secl.message);
								return false;
							}
						}
						if(secl.maxLength&&secl.maxLength!=''&&secl.maxLength>0){
							if(fieldValue&&fieldValue.length>secl.maxLength){
								mini.alert(secl.fieldDesc+"最大为"+secl.maxLength+"个字符");
								//showMessageBox("提醒",secl.fieldDesc+"最大为"+secl.maxLength+"个字符","warring");
								return false;
							}
						}
					}
				}
			}
		}
	}
	return true;
	
}

AA.prototype.beforeSave=function(){
	var newSecList = new Array();
	for(var i = 0;i<this.flowSecList.length;i++){
		var sec = this.flowSecList[i];
		var seccList = sec.seccList;
		var b = true;
		if(seccList){
			for(var j=0;j<seccList.length;j++){
				var secc = seccList[j];
				var value='';
				if(secc.condGroup=='1'&&(secc.valueMethod=='1'||secc.valueMethod=='2')){//普通验证,且获取方式是后端获取  或 js返回获取，这两个值已验证过
					continue;
				}
				if(secc.condGroup=='2'){//流程提交，保存时流程提交条件忽略
					continue;
				}
				if(secc.valueMethod=='3'){//根据id get
					var field = mini.get(secc.fieldName);
					if(field){
						value = field.getValue();	
					}else{
						//showMessageBox("提醒","未找到id为"+o.fieldName+"的字段","warring");
						mini.alert("未找到id为"+secc.fieldName+"的字段");
						return false;
					}
				}else{
					mini.alert("流程提交时，只能配置从get取值");
					//showMessageBox("提醒","流程提交时，只能配置从get取值","warring");
					return false;
				}
				if(value!=secc.fieldValue){
					b=false;
					break;
				}
			}
		}
		if(b){
			newSecList.push(sec);
		}
	}
	for(var k=0;k<newSecList.length;k++){
		var sec = newSecList[k];
		var seclList = sec.seclList;
		if(seclList){
			for(var i=0;i<seclList.length;i++){
				var secl = seclList[i];
				if(secl.condGroup=='2'){//流程提交时验证
					continue;
				}
				if(secl.type=='1'){//表单
					var field = mini.get(secl.fieldName);
					if(secl.formId!=undefined&&secl.formId!=''){//有重名，用form 根据name获取
						var formId = secl.formId;
						if(formId.indexOf("#")!=0){
							formId = "#"+formId;
						}
						var myform = new mini.Form(formId); 
						field = mini.getByName(secl.fieldName,myform);
					}
					if(field){
						if(secl.isRequired=='1'){
							if(field.getValue()==''){
								var message = secl.message;
								if(!message){
									if(secl.fieldDesc){
										message = "请填写"+secl.fieldDesc;
									}else{
										message = "有必填字段未填！";
									}
								}
								mini.alert(message);
								//showMessageBox("提醒",message,"warring");
								return false;
							}
						}
						if(secl.maxLength&&secl.maxLength!=''&&secl.maxLength>0){
							if(field.getValue().length>secl.maxLength){
								mini.alert(secl.fieldDesc+"最大为"+secl.maxLength+"个字符");
								//showMessageBox("提醒",secl.fieldDesc+"最大为"+secl.maxLength+"个字符","warring");
								return false;
							}
						}
					}
				}else if(secl.type=='2'){//grid
					
					var tmpGrid = mini.get(secl.formId);
					if(!tmpGrid){
						continue;
					}
					
					var gridData = tmpGrid.getData();
					if(!gridData.length){
						continue;
					}
					for(var m=0;m<gridData.length;m++){
						var row = gridData[m];
						var fieldValue = row[secl.fieldName];
						if(secl.isRequired=='1'){//不是必填不验证
							
							if(!fieldValue||fieldValue==''){
								var message = secl.message;
								if(!message){
									if(secl.fieldDesc){
										message = "请填写"+secl.fieldDesc;
									}else{
										message = "有必填字段未填！";
									}
								}
								mini.alert(message);
								//showMessageBox("提醒",message,"warring");
								return false;
							}
						}
						
						if(secl.maxLength&&secl.maxLength!=''&&secl.maxLength>0){
							if(fieldValue&&fieldValue.length>secl.maxLength){
								mini.alert(secl.fieldDesc+"最大为"+secl.maxLength+"个字符");
								//showMessageBox("提醒",secl.fieldDesc+"最大为"+secl.maxLength+"个字符","warring");
								return false;
							}
						}
					}
				}
			}
		}
	}
	return true;
	
}

var editControl = new AA();
