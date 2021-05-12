var _gs_containers=[];


function processContent(node,content){
    //guid,user,org,var list
    var attrValues=getPlCellAttrValues(node.id);
    content=replaceVarValue(content,"guid",guid());
    content=replaceVarValue(content,"path",baseUrl);
    content=replaceVarValue(content,"cellId",node.id);
    content=replaceVarValue(content,"unitId",node.unitId);
    content=replaceVarValue(content,"title",node.title);
    content=replaceVarValue(content,"isShowTitle",node.isShowTitle);
    content=replaceVarValue(content,"canResize",node.canResize);
    content=replaceVarValue(content,"canMove",node.canMove);
    content=replaceVarValue(content,"canMin",node.canMin);
    content=replaceVarValue(content,"canMax",node.canMax);
    content=replaceVarValue(content,"canClose",node.canClose);
    if(objIsNotNull(attrValues)) {
        for (var i = 0; i < attrValues.length; i++) {
            var item = attrValues[i];
            content = replaceVarValue(content, item.varId, item.value);

        }
    }
    return content;
}
function replaceVarValue(str,name,value){
    //guid,user,org,var list
    if(objIsNotNull(str)){
        var reg = new RegExp("\\[" + name + "\\]", "ig");
        str = str.replace(reg, value);
    }


    return str;
}
function getPlCellAttrValues(cellId){
    var res=[];
    $.ajax({
        url: baseUrl+"/sys/sysPlCellAttrValue/allData" +"?cellId=" + cellId,
        async:false,
        success: function (text) {
            //alert(text);

            var o = mini.decode(text);
            if(objIsNotNull(o) ) {
                res=mini.clone(o);
                console.log(o);
            }else{
                console.log('o is null');
            }


        },
        error: function (jqXHR, textStatus, errorThrown) {
            var callback=function (action) {
                if(action=='详细')  viewErrorDetail(jqXHR.responseText);
            }
            var buttonsTemp=["ok","详细"];
            showMessageBox("错误","获取布局参数值","error",null,callback,buttonsTemp,true);

        }
    });
    return res;
}

/**************************************时间格式化处理************************************/
function dateFtt(fmt,date)
{
    var o = {
        "M+" : date.getMonth()+1,                 //月份
        "d+" : date.getDate(),                    //日
        "h+" : date.getHours(),                   //小时
        "m+" : date.getMinutes(),                 //分
        "s+" : date.getSeconds(),                 //秒
        "q+" : Math.floor((date.getMonth()+3)/3), //季度
        "S"  : date.getMilliseconds()             //毫秒
    };
    if(/(y+)/.test(fmt))
        fmt=fmt.replace(RegExp.$1, (date.getFullYear()+"").substr(4 - RegExp.$1.length));
    for(var k in o)
        if(new RegExp("("+ k +")").test(fmt))
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
    return fmt;
}
//创建时间格式化显示
function dateFormat(value){
    var crtTime = new Date(value);
    return dateFtt("yyyy-MM-dd hh:mm:ss",crtTime);//直接调用公共JS里面的时间类处理的办法
}