var B = function() {}

B.prototype.setGridData=function (param){
	   var gridId = param.gridId;
	   var id = param.id;
	   var columnName = param.columnName;
	   var url=param.url;
	   var data=param.data;
	   
	   var grid = mini.get(gridId);
	   var column = grid.getColumn(columnName);
	   var filter = column.filter;
	   var editor = column.editor;
	   if(filter&&filter.type=='combobox'){
		   if(data){
			   filter.setData(data);
		   }else if(url){
			   filter.setUrl(url);
		   }
	   }
	   if(editor&&editor.type=='combobox'){
		   if(data){
			   editor.data=data;
		   }else if(url){
			   editor.url=url;
		   }
	   }
   }
B.prototype.setFormData= function (param){
	   var formId = param.formId;
	   var id=param.id;
	   var name= param.name;
	   var data = param.data;
	   var url = param.url;
	   var field=null;
	   if(id){
		   field = mini.get(id);
	   }else if(formId&&name){
		   var form = new mini.Form("#"+formId);
		   field = mini.getbyName(name,form);
	   }
	   if(field!=null){
		   if(data){
			   if(field){
				   field.setData(data);
			   }
		   }else if(url){
			   if(field){
				   field.setUrl(url);
			   }
		   }
	   }
   }
B.prototype.setData= function (param){
	   var success = param.success;
	   var error=param.error;
	   var data = param.data;
	   var type = param.type;
	   if(!type){
		   type="post";
	   }
	   if(!data){
		   data={};
	   }
	   var url = param.url;
	   $.ajax({
           url: url,
           data : data,
           type: type,
           success: function (data) {
        	   if (success != null && success != ''
        			&& typeof success == 'function'){
        			success(data);
        	   }
           },
           error: function (jqXHR, textStatus, errorThrown) {
        	   if (error != null && error != ''
       				&& typeof error == 'function'){
       				error(data);
        	   }else{
        		   showMessageBox("错误","加载字典时错误","error");
        	   }
           }
       });
}
B.prototype.setGridAndFormData= function (param){
	   var success = param.success;
	   var error=param.error;
	   var gridId = param.gridId;
	   var formIds=param.formIds;
	   var name=param.name;
	   var columnName=param.columnName;
	   var type = param.type;
	   var url=param.url;
	   var data=param.paramData;
	   if(!columnName){
		   colunmName=name;
	   }
	   if(!type){
		   type="post";
	   }
	   if(!data){
		   data={};
	   }
	   var url = param.url;
	   var _this = this;
	   $.ajax({
        url: url,
        data : data,
        type: type,
        success: function (data) {
     	   if (success != null && success != ''
     			&& typeof success == 'function'){
     			success(data);
     	   }else{
     		  _this.setGridData({gridId:gridId,data:data,columnName:colunmName});
     		   if(formIds){
     			  var formIdArr=formIds.split(",");
        		   for(var i=0;i<formIdArr.length;i++){
        			   myCombox.setFormData({formId:formIdArr[i],data:data,name:name}); 
        		   } 
     		   }
     		   
     	   }
        },
        error: function (jqXHR, textStatus, errorThrown) {
     	   if (error != null && error != ''
    				&& typeof error == 'function'){
    				error(data);
     	   }else{
     		   showMessageBox("错误","加载字典时错误","error");
     	   }
        }
    });
}
var myCombox = new B();
