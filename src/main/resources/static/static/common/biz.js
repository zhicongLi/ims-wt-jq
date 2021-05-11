var permi={};
var editors={};
var cellStyle={};
var currRowNum=0;
var isInit = true;

var appInsAttrDataUrl=myctx+"/biz/bizAppInsAttr/data";
var add_getAppInsAttr_url=myctx+"/biz/bizAppInsAttr/getByFormId";  //变量改变每页显示多少条时，会加载所有的变量，需要动态切换url
function setGridUrl(gridId,url){
	var tempGrid=mini.get(gridId);
	tempGrid.setUrl(url);
	childGridAttrsTemp[1].dataUrl=url;
}
function myConfirm(d){
        return confirm("确定更改状态？");
}
function reloadAttr(gridId){
	//showMessageBox(null,"加载中，请稍后......","loading");
    setGridUrl("datagrid2",appInsAttrDataUrl);
	var gridTemp = mini.get(gridId);
	var appInsId=mini.getbyName("id",form).getValue();
	gridTemp.setUrl(appInsAttrDataUrl+"?appInsId="+appInsId);
	gridTemp.clearRows();
	 gridTemp.load();
	// hideMessageBox( );
	
}
function deleteAppIns(){
	var appInsId =mini.getbyName("id",form).getValue();
	if(appInsId==''){
		return;
	}
	var isNewRecord=mini.get("isNewRecord").getValue();
	if(isNewRecord=='false'){
		return;
	}
	
	var urlCurr =myctx+"/biz/bizAppIns/remove";
	
	 $.ajax({
	        url: urlCurr,
	        data: { id: appInsId },
	        type: "post",
	        success: function (text) {
	        	
	        },
	        error: function (jqXHR, textStatus, errorThrown) {
	        	var callback=function (action) {
                    viewErrorDetail(jqXHR.responseText);
                }
                var buttonsTemp=["ok","详细"];
            //   showMessageBox("错误","表单加载错误","error",null,callback,buttonsTemp);
               // form.unmask();
	           // alert(jqXHR.responseText);
	            //hideMessageBox( );
	        }
	    });
	
}

function clearChange(gridTemp){
	if (gridTemp.getChanges().length > 0) {
        gridTemp.accept( );
    }
}

//单表格保存(批量保存多条)
function saveGrid1(gridId,url,appInsId) {
    var gridTemp=mini.get(gridId);
 //   var urlCurr=objNVL(url,getUrlByGridId(gridId,"saveUrl"));

    gridTemp.validate();
    if (gridTemp.isValid() == false) {
        //alert("请校验输入单元格内容");
        var error = gridTemp.getCellErrors()[0];
        gridTemp.beginEditCell(error.record, error.column);
        return;
    }
    var data = gridTemp.getChanges();
    if(data.length==0){
    	//如果没有修改就重新加载
    	 viewTable(appInsId,gridId);
    //	viewRow();
    	return;
    }
  //  var id=$("#id").val();
    
  //  var id=mini.getbyName("id",form).getValue();
    for(var i=0;i<data.length;i++){
    	data[i]['appInsId']=appInsId;
	}
    var json = mini.encode(data);
  //  gridTemp.loading("保存中，请稍后......");
  
    $.ajax({
        url: url,
        data: { data: json },
        type: "post",
        success: function (text) {
          //  gridTemp.reload();
        //	gridTemp.setChanged(false);
        clearChange(gridTemp);
	        	//  viewRow();
	        	  viewTable(appInsId,gridId);
        //	gridTemp.unmask();
        	
        },
        error: function (jqXHR, textStatus, errorThrown) {
        	var callback=function (action) {
                viewErrorDetail(jqXHR.responseText);
            }
            var buttonsTemp=["ok","详细"];
            showMessageBox("错误","表单加载错误","error",null,callback,buttonsTemp);
           // form.unmask();
           // alert(jqXHR.responseText);
           // hideMessageBox( );
        }
    });
}


function saveGridOption(option) {
	var gridId = option.gridId;
	var url = option.url;
	var appInsId = option.appInsId;
	var onAfterSave = option.onAfterSave;
	
    var gridTemp=mini.get(gridId);
 //   var urlCurr=objNVL(url,getUrlByGridId(gridId,"saveUrl"));

    gridTemp.validate();
    if (gridTemp.isValid() == false) {
        //alert("请校验输入单元格内容");
        var error = gridTemp.getCellErrors()[0];
        gridTemp.beginEditCell(error.record, error.column);
        return;
    }
    var data = gridTemp.getChanges();
    if(data.length==0){
    	//如果没有修改就重新加载
    	 viewTable(appInsId,gridId);
    //	viewRow();
    	return;
    }
  //  var id=$("#id").val();
    
  //  var id=mini.getbyName("id",form).getValue();
    for(var i=0;i<data.length;i++){
    	data[i]['appInsId']=appInsId;
	}
    var json = mini.encode(data);
  //  gridTemp.loading("保存中，请稍后......");
  
    $.ajax({
        url: url,
        data: { data: json },
        type: "post",
        success: function (text) {
          //  gridTemp.reload();
        //	gridTemp.setChanged(false);
        clearChange(gridTemp);
	        	//  viewRow();
	        	  viewTable(appInsId,gridId);
	        	  if (onAfterSave != null && onAfterSave != ''
	        			&& typeof onAfterSave == 'function'){
	        		  onAfterSave();
	        	  }
        //	gridTemp.unmask();
        	
        },
        error: function (jqXHR, textStatus, errorThrown) {
        	var callback=function (action) {
                viewErrorDetail(jqXHR.responseText);
            }
            var buttonsTemp=["ok","详细"];
            showMessageBox("错误","表单加载错误","error",null,callback,buttonsTemp);
           // form.unmask();
           // alert(jqXHR.responseText);
           // hideMessageBox( );
        }
    });
}

function onButtonEdit(e) {
	var btnEdit = this;
	mini.open({
		url : myctx+"/biz/bizApp/dict",
		title : "选择列表",
		width : 650,
		height : 380,
		ondestroy : function(action) {
			//if (action == "close") return false;
			if (action == "ok") {
				var iframe = this.getIFrameEl();
				var data = iframe.contentWindow.GetData();
				data = mini.clone(data); //必须
				if (data) {
					btnEdit.setValue(data.appNo);
					btnEdit.setText(data.name);
				}
			}

		}
	});

}
function changeVerNo(){
	var formId=mini.get("verNo1").getValue();
	var isNewRecord=mini.get("isNewRecord").getValue();
	mini.get("verNo").setValue(mini.get("verNo1").getText());
	if(isNewRecord=='false'){
		return;
	}
	if(verNo==''){
		return;
	}
	 mini.confirm("确定切换版本？", "确定？",
	            function (action) {
	                if (action == "ok") {
	                	mini.get("formId").setValue(formId);
	            		loadBizAppInsAttr();
	                }
	            }
	        );
	
}

function initBizAppInsAttr(){
	var appNo=mini.get("appNo").getValue();
	if(appNo==''){
		 setVersion();
		return;
	}
	var formData = form.getData();
	//childGridAttrsTemp[1].dataUrl=add_getAppInsAttr_url;
	showMessageBox(null,"加载中，请稍后......","loading");
	 $.ajax({
	        url: myctx+"/biz/bizAppIns/getFormId" ,
	        data: formData,
	        dataType : 'json',
	        success: function (data) {
				form.setData(data);
				 hideMessageBox( );
				 setVersion();
				loadBizAppInsAttr();
				
	        },
	        error: function (jqXHR, textStatus, errorThrown) {
	        	var callback=function (action) {
                    viewErrorDetail(jqXHR.responseText);
                }
                var buttonsTemp=["ok","详细"];
                showMessageBox("错误","表单加载错误","error",null,callback,buttonsTemp);
               // form.unmask();
	           // alert(jqXHR.responseText);
	        //    hideMessageBox( );
	        }
	    });
}
function activeTab(tabsId,index){
	var tabs = mini.get(tabsId);
	tabs.activeTab( tabs.getTab(index) );
}
function loadBizAppInsAttr(){
	activeTab("tabsSub",1);
	var formId=mini.get("formId").getValue();
	var appInsId=mini.getbyName("id",form).getValue();
	var tempGrid=mini.get("datagrid2");
	tempGrid.clearRows();
    var stufix="?formId="+formId+"&appInsId="+appInsId;
	setGridUrl("datagrid2",add_getAppInsAttr_url+stufix);
	showMessageBox(null,"加载中，请稍后......","loading");
	 $.ajax({
	        url: add_getAppInsAttr_url ,
	        data: { formId: formId,appInsId:appInsId },
	        dataType : 'json',
	        success: function (data) {
				tempGrid.set({
					data:data.data,
					pageIndex:data.pageIndex,
					pageSize:data.pageSize,
					totalCount:data.total
				});
				hideMessageBox( );
	        },
	        error: function (jqXHR, textStatus, errorThrown) {
	        	var callback=function (action) {
                    viewErrorDetail(jqXHR.responseText);
                }
                var buttonsTemp=["ok","详细"];
                showMessageBox("错误","表单加载错误","error",null,callback,buttonsTemp);
               // form.unmask();
	           // alert(jqXHR.responseText);
	          //  hideMessageBox( );
	        }
	    });
}

function onButtonEditAppNo(e,obj) {
	var isNewRecord=mini.get("isNewRecord").getValue()+"";
	 if(isNewRecord=='false'){
		showMessageBox("警告","此栏不可修改","warning");
		return;
	} 
	var btnEdit = this;
	//var url=myctx+"/biz/bizFormStatus/dict?formId="+formId;
	//var appNo=appNo;
	var url = myctx+'/biz/bizApp/dict';
	if(appNo){
		url+="?baseFilter="+encodeStr("a.app_no='"+appNo+"'");
	}
	popLov(obj,'选择应用编号',false,true,url,800,500,'appNo,formNo','appNo,formNo',null,null,initBizAppInsAttr);
	
}
function onButtonEditStatus(e,obj) {
	var isNewRecord=mini.get("isNewRecord").getValue()+"";
	 if(isNewRecord=='true'){
		showMessageBox("警告","新增实例时无须填写此栏","warning");
		return;
	} 
	var btnEdit = this;
	var formId=mini.get("formId").getValue();
	var url=myctx+"/biz/bizFormStatus/dict?formId="+formId;
	popLov(obj,'选择状态',false,true,url,800,500,'statusId,name,ctrlType','status,statusName,ctrlType',null,myConfirm,saveForm);
}
function viewRow(gridId) {
	// mini.parse();
//	var gridMain=mini.get('datagridMain');
//	var grid=mini.get('datagrid');
//	var row = gridMain.getRowByUID(row_uid);
	
	var id=mini.getbyName("id",form).getValue();
	
	if (id) {
		 viewTable(id,'datagrid');
	} 
		
	
}

function viewTableCustom(gridId,option){
	
	var grid=mini.get(gridId);
	grid.clearRows();
	if(option&&option.showLoadingType=='grid'){
		grid.loading ();
	}else{
		showMessageBox(null,"加载中，请稍后......","loading");
	}
	var url = option.url;
	var data = option.data;
	if(!data){
		data={};
	}
	$.ajax({
		url : url,
		dataType : 'json',
		data:data,
		type:'POST',
		cache : false,
		success : function(data) {
			if(data.type=="I"){
				setData(grid,data.data);
				var successFunction = option.successFunction;
				console.log(typeof successFunction);
				if(successFunction){
					successFunction();
				}
		   	  	hideMessageBox( );
			}else{
				 showMessageBox("错误",data.message,"error");
			}
			
		},
		error: function (jqXHR, textStatus, errorThrown) {
        	var callback=function (action) {
                viewErrorDetail(jqXHR.responseText);
            }
            var buttonsTemp=["ok","详细"];
            showMessageBox("错误","表单加载错误","error",null,callback,buttonsTemp);
            hideMessageBox( );
           // form.unmask();
           // alert(jqXHR.responseText);
        }
	});
}

function viewTable(id,gridId,option){
	
	var grid=mini.get(gridId);
	grid.clearRows();
	if(option&&option.showLoadingType=='grid'){
		grid.loading ();
	}else{
		showMessageBox(null,"加载中，请稍后......","loading");
	}
	
	
	$.ajax({
		url : myctx+'/biz/bizAppIns/view?id=' + id,
		dataType : 'json',
		cache : false,
		success : function(data) {
			setData(grid,data);
		   	  hideMessageBox( );
		},
		error: function (jqXHR, textStatus, errorThrown) {
        	var callback=function (action) {
                viewErrorDetail(jqXHR.responseText);
            }
            var buttonsTemp=["ok","详细"];
            showMessageBox("错误","表单加载错误","error",null,callback,buttonsTemp);
            hideMessageBox( );
           // form.unmask();
           // alert(jqXHR.responseText);
        }
	});
}
function isCombox(eId){
	if(!editors){
		return false;
	}
	if(editors){
		var editorMap=editors[eId];
		if(editorMap){
			var editorId = editorMap.editorId;
			if(editorId=='comboxEditor'){
				return true;
			}
		}
	}
	return false;
}
function setData(grid,data) {
	permi=data.permission;
	editors = data.editors;
	cellStyle=data.cellStyle;
	grid.set({
		columns : data.column,
		data : data.data
	});
	grid.on("drawcell",function(e){
		var rowIndex = e.rowIndex;
	    var columnIndex=e.columnIndex;
	    var style=cellStyle[rowIndex+'_'+columnIndex];
	    var field = e.field;
	    var record = e.record;
	    
        var col=field.replace("field_","");
    //   	var editor = getEditor(rowIndex+"_"+col);
	    var isComboxs = isCombox(rowIndex+"_"+col);
		if(isComboxs){
	    	e.cellHtml = !mini.isNull(record[field+"_text"]) ? record[field+"_text"] : record.value;
	    }
	    if(style){
	    	 e.cellStyle=style;
	    } 
	});
	grid.mergeCells(data.merage);
	new CopyExcel(grid);
	/* grid.on("update", function(e) {
		grid.mergeCells(data.merage);
	}); */
}



function getEditor(eId){
	var editorId ='textboxEditor';
	if(editors){
		var editorMap=editors[eId];
		if(editorMap){
			editorId = editorMap.editorId;
		}
	}
	 var editor = mini.get(editorId);
	 if(editorId=='comboxEditor'){
		 var url = editorMap.dicUrl;
		 url = url.replace("//","/");
		 editor.setUrl(url);
	 }
	 return editor;
	 
}
function OnCellBeginEdit(e) {
    var record = e.record, field = e.field;
   
    var row=record.rowIndex;
    var col=field.replace("field_","");
    var p=permi[row+"_"+col];
   	var editor = getEditor(row+"_"+col);
   //	if(editor.id!='textboxEditor'){
  	e.editor = editor;
    e.column.editor = editor;
 //  	}
   	
   /* var ctrlType = $("#ctrlType").val();
    if(ctrlType&&ctrlType.length>2){
    	var s = ctrlType.substr(0,2);
    	if(s=='A-'){
    		e.cancel = true;
    		return;
    	}
    }*/
    var ctrlType = getCtrlType();
    if(ctrlType=='A-'){
    	e.cancel = true;
		return;
    }
    if(p){
    	e.cancel = false; 
    }else{
    	 e.cancel = true;
    }
    
}
function OnCellBeginEdit2(e) {
	var ctrlType = getCtrlType();
    if(ctrlType=='A-'){
    	e.cancel = true;
		return;
    }
    
}
function cellcommitedit(e){
	 var record = e.record;
    if (e.editor.getText()) {
        record[e.field+"_text"] = e.editor.getText();
    } else {
        record[e.field+"_text"] = e.editor.getValue();
    }
    isInit = false;
 }
function getCtrlType(){
	var ctrlType = $("#ctrlType").val();
    if(ctrlType&&ctrlType.length>2){
    	var s = ctrlType.substr(0,2);
    	return s;
    }
    return '';
}
function ExportExcelTable( ){
	var id=mini.get("id").getValue();
	var excelForm = document.getElementById("excelForm");
    $("#excelForm #_filter").empty();
    $("#excelForm #_filter").append($("<input name='id' value='"+id+"'/>"));
    excelForm.action=myctx+"/biz/bizAppIns/exportTable";
    excelForm.submit();
}
function clearData(appInsId,gridId){
	mini.confirm("确定清空数据？", "确定？",
            function (action) {
                if (action == "ok") {
                	var ctrlType = getCtrlType();
                    if(ctrlType=='A-'){
                    	showMessageBox(null,'审核状态下不可清空数据',"error");
                		return;
                    }
            		var id=mini.get("id").getValue();
            		$.ajax({
            			url : myctx+'/biz/bizAppInsCellValue/clearData?appInsId=' + appInsId,
            			dataType : 'json',
            			cache : false,
            			success : function(data) {
            				
            				if(data.type=="I"){
            					//viewRow();
            					viewTable(appInsId,gridId);
            				}else{
            					// alert(data.message);
            					showMessageBox(null,data.message,"error");
            				}
            			}
            		});
                }
            }
        );
	
}
function onGridOpMiClick(e){
	if(e.item.menuNo=='aduit'){
        var row = grid.getSelecteds();
        if(row){
            var data =cloneJSON(row);
            var json = mini.encode(fixJSONObj(data));
            var urlCurr=myctx+"/biz/bizAppIns/aduit";
            $.ajax({
                url: urlCurr,
                data: { data: json },
                type: "post",
                success: function (text) {
                    var o = mini.decode(text);
                    if(objIsNotNull(o.type)){
                        //alert(text);
                        if(o.type=="E"){
                            showMessageBox("错误",o.message,"error");
                            return;
                        }else if(o.type=="W"){
                            showMessageBox("警告",o.message,"warning");
                        }else if(o.type=="I"){
                            showTipM("info","提示",o.message);
                        }

                    }

                    hideMessageBox();

                    gridTemp.reload();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    var callback=function (action) {
                        viewErrorDetail(jqXHR.responseText);
                    }
                    var buttonsTemp=["ok","详细"];
                    showMessageBox("错误","保存失败","error",null,callback,buttonsTemp);
                }
            });
        }
        
}
} 
function printTable3() {
	//$("#datagrid").jqprint();
	$("body").printArea();
}
function printTable4() {
	//$("#datagrid").jqprint();
	$("#datagrid").jqprint();
}
function printTable1() {
    var oldDocumentBody;
    oldDocumentBody = document.body.innerHTML;
    var item = $("#datagrid");
    item=item[0];
    var iframe = document.createElement('IFRAME');  
    var idocument = iframe.contentWindow.document; 
    
    html2canvas(item, {
        onrendered: function (canvas_source) {
            var numImage = 0;
 			var grid = mini.get("datagrid");
        //    var pasWidth = canvas_source.width;
        //    var pasHeight = canvas_source.height;
            var pasWidth = canvas_source.width;
            var pasHeight = 6000;
            // Reinitialisation de la page courante
            document.body.innerHTML = "<html><head><title></title></head><body></body>";
 
            // Creation d'un canvas tampon
            var canvas_tampon = document.createElement("canvas");
            canvas_tampon.height = pasHeight;
            canvas_tampon.width = pasWidth;
            var canvas_tampon_context = canvas_tampon.getContext('2d');
 
            // Parcours du canvas_source dans la hauteur
         //   var heightRestantAImprimer = canvas_source.height;
            var heightRestantAImprimer = pasHeight;
            var numLigne = 1;
            while (heightRestantAImprimer > 0) {
 
                // Parcours du canvas_source dans la largeur
         //       var widthRestantAImprimer = canvas_source.width;
                var widthRestantAImprimer = pasWidth;
                var numColonne = 1;
                while (widthRestantAImprimer > 0) {
                    numImage++;
 
                    // Export d'une partie du canvas_source dans le canvas_tampon
                    canvas_tampon_context.drawImage(canvas_source, ((numColonne - 1) * pasWidth), ((numLigne - 1) * pasHeight), pasWidth, pasHeight, 0, 0, pasWidth, pasHeight);
 
                    // Creation d'une image afin de contenir la découpe
                    var img = new Image;
                    img.id = 'tempPrintImage' + numImage;
                    img.src = canvas_tampon.toDataURL();
 
                    // Ajout de l'image à la page courante
                    document.body.appendChild(img);
 
                    // Passage à la colonne suivante
                    widthRestantAImprimer = widthRestantAImprimer - pasWidth;
                    numColonne++;
                }
 
                // Passage à la ligne suivante
                heightRestantAImprimer = heightRestantAImprimer - pasHeight;
                numLigne++;
            }
 
            // Print Document
            window.print();
          //  document.close();
            // Restore document
            document.body.innerHTML = oldDocumentBody;
 			mini.parse();
            // Clean memory
            oldDocumentBody = "";
        }
    });
}
function printTable() {
	var item = $("#print_test")[0];
    var iframe = document.createElement('IFRAME');  
  //  var iframeStyle = 'position:absolute;width:0px;height:0px;left:-500px;top:-500px;';
    var iframeStyle = 'position:absolute;width:1500px;height:5000px;';
    
    $(iframe).attr({  
        style: iframeStyle,  
        id: 'iframeId'  
    }); 
    document.body.appendChild(iframe);  
    alert($("#datagrid"));
    alert($("#datagrid").width("100%"));
    var idocument = iframe.contentWindow.document; 
    idocument.head.innerHTML=document.head.innerHTML;
    idocument.body.innerHTML=$("#print_test").html();
    $("body",idocument).show();
    iframe.contentWindow.print();
    iframe.contentWindow.close();
}
function printTable5() {
    var oldDocumentBody;
    oldDocumentBody = document.body.innerHTML;
    var item = $("#datagrid")[0];
    var iframe = document.createElement('IFRAME');  
  //  var iframeStyle = 'position:absolute;width:0px;height:0px;left:-500px;top:-500px;';
    var iframeStyle = 'position:absolute;width:1000px;height:1000px;';
    
    $(iframe).attr({  
        style: iframeStyle,  
        id: 'iframeId'  
    }); 
    document.body.appendChild(iframe);  
    var idocument = iframe.contentWindow.document; 
    html2canvas(item, {
    	 allowTaint: false,
    	    taintTest: false,
        onrendered: function (canvas_source) {
            var numImage = 0;
 			var grid = mini.get("datagrid");
        //    var pasWidth = canvas_source.width;
        //    var pasHeight = canvas_source.height;
            var pasWidth = 2000;
            var pasHeight = 3000;
            // Reinitialisation de la page courante
          //  idocument.body.innerHTML = "<html><head><title></title></head><body></body>";
          //  idocument.body.innerHTML=document.body.innerHTML;
            idocument.body.innerHTML=$("#datagrid").html();
            // Creation d'un canvas tampon
            var canvas_tampon = idocument.createElement("canvas");
            canvas_tampon.height = pasHeight;
            canvas_tampon.width = pasWidth;
            var canvas_tampon_context = canvas_tampon.getContext('2d');
 
            // Parcours du canvas_source dans la hauteur
         //   var heightRestantAImprimer = canvas_source.height;
            var heightRestantAImprimer = pasHeight;
            var numLigne = 1;
            while (heightRestantAImprimer > 0) {
 
                // Parcours du canvas_source dans la largeur
         //       var widthRestantAImprimer = canvas_source.width;
                var widthRestantAImprimer = pasWidth;
                var numColonne = 1;
                while (widthRestantAImprimer > 0) {
                    numImage++;
 
                    // Export d'une partie du canvas_source dans le canvas_tampon
                    canvas_tampon_context.drawImage(canvas_source, ((numColonne - 1) * pasWidth)-100, ((numLigne - 1) * pasHeight)-100, pasWidth, pasHeight, 0, 0, pasWidth, pasHeight);
 
                    // Creation d'une image afin de contenir la découpe
                    var img = new Image;
                    img.id = 'tempPrintImage' + numImage;
                    img.src = canvas_tampon.toDataURL();
 
                    // Ajout de l'image à la page courante
                //    idocument.body.appendChild(img);
 
                    // Passage à la colonne suivante
                    widthRestantAImprimer = widthRestantAImprimer - pasWidth;
                    numColonne++;
                }
 
                // Passage à la ligne suivante
                heightRestantAImprimer = heightRestantAImprimer - pasHeight;
                numLigne++;
            }
 
            // Print Document
         //   window.print();
            iframe.contentWindow.print();
            iframe.contentWindow.close();
          //  document.close();
            // Restore document
          //  document.body.innerHTML = oldDocumentBody;
 			//mini.parse();
            // Clean memory
            oldDocumentBody = "";
        }
    });
}