var plId=getUrlParam("plId");
//alert(plId);
var layoutData = [];
var nodeExtInfo=[];

var options = {
    staticGrid :true,
    cell_height: 80,
    vertical_margin: 10,
    resizable:false,
    removable :false,
    removeTimeout:100,
    disableResize  :true,
    disableDrag  :true
};
$('.grid-stack').gridstack(options);
var gridMain= $('#gridMain').data('gridstack');
loadLayout(plId);

window.addEventListener('resize', function () {
    for(var i=0;i<_gs_containers.length;i++){
        var item=_gs_containers[i];
        var containerId=item.id;

        if(item.beforeResize!=null && item.beforeResize!=undefined){
            item.beforeResize();
        }

        var panel_body = $('#'+containerId).parent();//父节点；
        //var c3 = $("#dom").next();//下一个兄弟节点
        var panel_header = panel_body.prev();//上一个兄弟节点
        var container = document.getElementById(containerId);
        //自适应窗口大小
        //alert(panel_header.height());
        //container.style.width = window.innerWidth*0.95+'px';
        if(panel_header.height()>0)
            container.style.height = (80)+'%';
        else
            container.style.height = (93)+'%';
        if(item.afterResize!=null && item.afterResize!=undefined){
            item.afterResize();
        }

    }

});



////////////////////////////////////////////
function loadLayout(plId) {
    var res='';
    $.ajax({
        url: baseUrl+"/sys/sysPlCell/allData" +"?plId=" + plId,
        async:false,
        success: function (text) {
            //alert(text);

            var o = mini.decode(text);
            if(objIsNotNull(o) ) {
                layoutData=mini.clone(o);
                nodeExtInfo=mini.clone(o);

                drawLayoutGrid();
                //$(window).trigger("resize");
                // var e = document.createEvent("Event");
                // e.init("resize", true, true);
                // window.dispatchEvent(e);
                console.log(o);
            }else{
                console.log('o is null');
                $('#gridMainPreview').height(300);
            }


        },
        error: function (jqXHR, textStatus, errorThrown) {
            var callback=function (action) {
                if(action=='详细')  viewErrorDetail(jqXHR.responseText);
            }
            var buttonsTemp=["ok","详细"];
            showMessageBox("错误","获取布局","error",null,callback,buttonsTemp,true);

        }
    });
    return res;
}
function drawLayoutGrid(){
    gridMain.removeAll();
    var items =GridStackUI.Utils.sort( layoutData); //
    _.each(items, function (node) {
        //var nodePalette=getPaletteItemById(node.unitId);
        //var nodeContentHtml=genContentHtml(node.id);
        var nodeExt=getExtItemById(node.id);
        //if(objIsNotNull(nodePalette)){
        //    nodeContentHtml=nodePalette.contentHtml;
        // }
        //debugger;
        gridMain.addWidget($('<div><div class="panel panel-warning grid-stack-item-content" >'+ genContentHtml(nodeExt )+'</div></div>'),
            node.x, node.y, node.width, node.height,undefined,undefined,undefined,undefined,undefined, node.id);
    }.bind(this));
    return false;
}
function genContentHtml(node ) {
    var res="";
        if(node.isShowTitle==='1'){
            res=
                "        <div class=\"panel-heading\">" +
                "            <h3 class=\"panel-title\" data-toggle=\"tooltip\" data-placement=\"bottom\">" +

                "                "+objNVL(node.title,"")+
                "                <span>" +

                "                    <a href=\"javascript:void(0);\" onclick=\"configWidgetPreview('"+node.id+"','"+objNVL(node.unitId,"") +"','"+objNVL(node.title,"")+"')\" class=\"icon-separator refresh-button\" data-style=\"dark\" data-theme=\"bg-white\" data-opacity=\"40\">\n" +
                "                        <i class=\"glyph-icon icon-gear\"></i>\n" +
                "                    </a>\n" +

                "                </span>\n" +
                "            </h3>\n" +
                "        </div> "+
                "            <div class=\"panel-body\" >" +
                "                "+objNVL(processContent(node,node.content),"<P>华电天仁通过CMMI3级正式评估，成为集团公司仅有的几家获得CMMI3级资质认证的单位之一。 CMMI全称为能力成熟度模型集成</P>")+
                "            </div>\n"


            ;
        }else{
            res=

                "            <div class=\"panel-body\">" +
                "                "+objNVL(processContent(node,node.content),"<P>华电天仁通过CMMI3级正式评估，成为集团公司仅有的几家获得CMMI3级资质认证的单位之一。 CMMI全称为能力成熟度模型集成</P>")+
                "            </div>\n"


            ;
        }


    return res;
}

function getExtItemById(id){
    for(var i=0;i<nodeExtInfo.length;i++) {
        if(nodeExtInfo[i].id===id){
            return nodeExtInfo[i];
        }
    }
    return null;
}
function configWidgetPreview(id,paletteId,title){
    //alert(111);
    // popWindow(null,"配置属性",url,width,height,showModal,data,actionLoad,actionOk,actionClose );
    //saveLayoutClick( );
    //var nodePalette=getPaletteItemById(paletteId);
    popWindow(null,"配置属性-"+title,baseUrl+"/sys/sysPlCell/form?showList=0&action=view&showForm=1&addCan=0&cloneCan=0&removeCan=0&nextCan=0&id="+id,950,600,true );

}
