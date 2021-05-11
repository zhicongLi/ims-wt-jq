<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<meta charset="utf-8">
	<%@ include file="/WEB-INF/views/include/head.jsp" %>
	<script type="text/javascript" src="${rootDocOnlineEditUrl}/web-apps/apps/api/documents/api.js"></script>
</head>
<body>
<div id="placeholder" class="nav"></div>
<script language="javascript" type="text/javascript">


	function getDocInfo(){
		var docPath = '${param.docPath}';
		docPath = decodeURIComponent(docPath);
		var url ="${ctx}/f-center/documentCenter/getPathAndKey?link="+docPath;
		 $.ajax({
	            url: url,
	         	data : {},
	            type: "GET",
	            success: function (data) {
	            	if(!data){
	            		mini.alert("获取文件信息错误");
	            		return;
	            	}
	            	var key = data.key;
	            	var path = data.path;
	            	if(!key || !path){
	            		mini.alert("获取文件信息错误");
	            		return;
	            	}
	            	editDocView(path,key);
	            },
	            error: function (jqXHR, textStatus, errorThrown) {
	                var callback=function (action) {
	                    if(action=='详细')  viewErrorDetail(jqXHR.responseText);
	                }
	                var buttonsTemp=["ok","详细"];
	                showMessageBox("错误","获取文件信息错误","error",null,callback,buttonsTemp);
	                form.unmask();
	            }
	        });
	}

	function editDocView(path,key){
		console.log("path:",path);
		console.log("key:",key);
		var docPath = '${param.docPath}';
	  // var path = "abc/def/abcd";
	    var url = rootDocUrl+docPath;
	    var iamCode = iamCode_;
	    if(!iamCode){
	    	iamCode = getCookie('iamCode');
	    }
	    var callbackurl = "${ctx}/ims-ext/dm/dmDoc/onlineEdidSave" + "?url="+url+"&path="+path+"&iamCode="+iamCode;
	    // var callbackurl = "http://192.168.0.199:8080/onlyoffice/document" + "?url="+url+"&path="+path;
	    var end = url.split(".")[url.split('.').length - 1];
	    var text = "doc,docm,docx,dot,dotm,dotx,epub,fodt,htm,html,mht,odt,ott,pdf,rtf,txt,djvu,xps";
	    var spreadsheet = "csv,fods,ods,ots,xls,xlsm,xlsx,xlt,xltm,xltx";
	    var ppt = "fodp,odp,otp,pot,potm,potx,pps,ppsm,ppsx,ppt,pptm,pptx";
	    var documentType = "text";
	    if (text.indexOf(end)!= -1){
	        documentType = "text";
	    }else if (spreadsheet.indexOf(end)!= -1){
	        documentType = "spreadsheet";
	    }else if (ppt.indexOf(end)!= -1) {
	        documentType = "presentation";
	    }
	    new DocsAPI.DocEditor("placeholder", {
	        "document": {
	            //"fileType": "xlsx",
	            "key": key,
	            "title": "office",
	            "url": url
	        },
	        "documentType": documentType,
	        "width": "1600px",
	        "height": "900px",
	        "editorConfig": {
	            "callbackUrl": callbackurl,
	            //"lang":"zh-cmn-Hans",
	            "lang":"zh-CN",
	             "user": {
	                 "id": "${userInfo.id}",
	                 "name": "${userInfo.name}"
	             },
	            "mode": "edit",
	            "autosave": true
	        },
	        "permissions": {
	            "comment": true,
	            "download": true,
	            "edit": true,
	            "fillForms": true,
	            "print": true,
	            "review": true
	        }
	    });
	}
	
	$(function(){
		getDocInfo();
	});
</script>
</body>
</html>