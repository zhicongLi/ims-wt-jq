<!DOCTYPE html>
<html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<head>
<meta charset="utf-8">

 <title></title>
</head>
<body>
	 <a class="mini-button mini-button-primary" onclick="buttonClick('start')">启动</a>
		
	<script type="text/javascript">
	var defKey = "cs";
	 window.onmessage = function( e ) { 
         // 把父窗口发送过来的数据显示在子窗口中
        var data = e.data || {};
      	var valid = data.valid;
      	debugger;
        if(valid===false){
         	mini.alert(data.errorMsg);
         	return;
        }
        if( data.actionName=='start'){
        	start(data.data);
        }
     };  
     
     function buttonClick(actionName){
    	 if(actionName=='start'){
    		 var msg ={type : 'getDataReady' ,name : 'subIframeCallback',actionName:actionName}
    		 
    		 window.parent.postMessage (msg, "*" );
    	 }
    	 
     }
     
     
	function start(formData){
	//	var formData =  parent.getFormData_();
		debugger;
		var id = formData.id;
		alert(formData.id);
		var data = {
				"action": "start",
				"businessKey": id,
				"data": {
					"omTestClass": formData
				},
				"defKey": defKey,
				"option": "启动"
			};
		console.log("data:",data);
		 $.ajax({
	            url: "http://192.168.0.173:8080/bpm/instance/doAction",
	         	data : formData,
	            type: "post",
	            success: function (data) {
	            	//{"code":"401","isOk":false,"msg":"登录访问超时！"}
	            	alert('success');
	            },
	            error: function (jqXHR, textStatus, errorThrown) {
	            	alert('error');
	            }
	        });
	}
	
	</script>
</body>
</html>