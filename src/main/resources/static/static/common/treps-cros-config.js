
var hadLoadDict=false;


function getCookie (name) {
    var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)"); //匹配字段
    if (arr = document.cookie.match(reg)) {
        return unescape(arr[2]);
    } else {
        return null;
    }
}


function getQueryString_(url,name) {
	
    var reg = new RegExp("(^|&|\\?)" + name + "=([^&]*)(&|$)", "i");
    var r = url.match(reg);
    if (r != null) return unescape(r[2]); return null;
}
function loadDict(types){
	if(!types){
		return ;
	}
	$.ajax({
        url: ctx+"/ims-ext/sys/sysDict/getByTypes",
        type: 'post',
        data:{types: types},
        async: false,
        dataType: 'JSON',
        success: function (data) {
           if(data&&(data.type=='I'||data.success===true)){
        	   var dictMap = data.data;
        	   var arr = types.split(",");
        	   for(var i = 0;i<arr.length;i++){
        		   var type = arr[i];
        		   var value = dictMap[type];
        		   var cacheKey = getCachekey(type);
        		   if(value){
        			   var valueStr = JSON.stringify(value);
            		   localStorage.setItem(cacheKey, valueStr);
        		   }else {
        			   localStorage.removeItem(cacheKey);
        		   }
        		  
        	   }
           }
         },
         error: function (jqXHR, textStatus, errorThrown) {
            	console.log("获取字典错误");
         }
     });
}
function handleDict(){
	if(hadLoadDict){
		return;
	}
	hadLoadDict=true;
	localStorage.clear();
    var htmlstr = $("body").html();
    if(!htmlstr){
    	return;
    }
    var regStr = '/ims-ext\/sys\/dict\/listDataStr\\?(?:\S.*?=[^&]*?)*?type=([^&"\' ])*';
   var reg = new RegExp(regStr, "ig");
   var arr = htmlstr.match(reg);
   if(!arr){
	   return;
   }
   var types = null;
   var arr2 = new Array();
   for(var i = 0 ;i<arr.length;i++){
	   var type = getQueryString_(arr[i],"type");
	   if(!type){
		   continue;
	   }
	   
	   if(arr2[type]){
		   continue;
	   }
	   arr2[type]=1;
	   if(types==null){
		   types = type;
	   }else{
		   types += ","+type;
	   }
   }
   if(types!=null){
	   loadDict(types);
   }
}

function getCachekey(str){
	
	return str;
}

function ajaxPreFilter(p){
	var url = p.url;
	if(url && url.indexOf('dict/listDataStr?type')>=0) {
			var typeStr = getQueryString_(url,"type"); 
			var data = null;
			if(typeStr){
				var cacheKey = getCachekey(typeStr);
				data = localStorage.getItem(cacheKey);
				if(data){
					p.success(data);
					console.log("##################################从缓冲中读取",data);
					return false;
				}
			}
	 }
	
	return true;
}

$.support.cors = true;
var _ajax = $.ajax;

$.ajax = function(p) {
	handleDict();
	var b = ajaxPreFilter(p);
	if(b==false){
		return;
	}
	var iamCode=null;
	var iamAccessToken = null;
	if(iamCode_){//优先从参数获取
		iamCode = iamCode_;
		iamAccessToken = iamAccessToken_;
	}else{
		iamAccessToken = getCookie('iamAccessToken');
	    iamCode = getCookie('iamCode');
	}
    
    if(p.headers) {
    	if(iamAccessToken){
    		 p.headers['iamAccessToken'] = iamAccessToken;
    	        p.headers['Blade-Auth'] = iamAccessToken;
    	}
       if(iamCode){
    	   p.headers['code'] = iamCode;
       }
       
       
       
    } else {
    	var obj = {};
    	if(iamAccessToken){
   			obj.iamAccessToken = iamAccessToken;
   			obj['Blade-Auth'] = iamAccessToken;
    	}
      if(iamCode){
    	  obj.code = iamCode;
      }
        p.headers = obj;
    }
    console.log("=======================================async======"+p.async+"================"+p.url);
    /*if(p.data) {
        p.data['iamAccessToken'] = t;
        p.data['code'] = code;
        p.data['Blade-Auth']=t;
    } else {
        p.data = {iamAccessToken:t,code:code,'Blade-Auth':t}
    }*/
    var timeout_=100000;
    var url = p.url;
    if(url&&url.indexOf("/dm/dmDoc/save")!=-1){//附件上传
    	timeout_ = 99999999999;
    }
    p['crossDomain']=true;
    if(!p['timeout']){
    	p['timeout']=timeout_;
    }
    return _ajax(p)
}
    
    
    
