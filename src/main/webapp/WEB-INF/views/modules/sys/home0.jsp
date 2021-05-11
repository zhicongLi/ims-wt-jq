<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=8,IE=9,IE=10,IE=edge">
    <title>Title</title>
    <!--[if lte IE 10]>
    <script src="${ctxStatic}/html5shiv/dist/html5shiv.min.js" type="text/javascript"></script>
    <script src="${ctxStatic}/es5-shim/es5-shim.min.js" type="text/javascript"></script>
    <script src="${ctxStatic}/es5-shim/es5-sham.min.js" type="text/javascript"></script>
    <![endif]-->
    <script src="${ctxStatic}/trepsui/scripts/boot.js" type="text/javascript"></script>
    <link href="${ctxStatic}/common/treps.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" href="${ctxStatic}/e-calendar/css/jquery.e-calendar.css"/>

    <link rel="stylesheet" href="${ctxStatic}/mui/dist/css/mui.min.css">

    <script src="${ctxStatic}/mui/dist/js/mui.min.js"></script>
    <script src="${ctxStatic}/mui/dist/js/app.js"></script>
    <script src="${ctxStatic}/common/trepsui-ext.min.js"></script>
    <link rel="stylesheet" href="${ctxStatic}/bootstrap/2.3.1/awesome/font-awesome.min.css">
</head>
<body>
<div id="calendar"></div>
<div id="gtasks"></div>
<div id="shortcut">

    <%--<p><a style="text-decoration:underline;cursor: pointer;"  onclick="javascript:newTabPage('客户分布图','${ctx}/pt/ptCustomerMap/view?action=view&showList=0',true)"><i class="icon-globe"></i> 客户分布图<a style="color:#CCCCCC;">&nbsp;&nbsp;&nbsp;&nbsp;区域内大用户地理分布图,图例大小表示合同或交易电量大小</a></a></p>--%>

    <%--<p><a style="text-decoration:underline;cursor: pointer;"  onclick="javascript:newTabPage('报价方案','${ctx}/sd/sdBidPrice/form?action=view&showList=0',true);"><i class="icon-magic"></i> 报价方案<a style="color:#CCCCCC;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;使用量本利方法,为交易报价提供参考</a></a></p>--%>

    <%--<p><a style="text-decoration:underline;cursor: pointer;" onclick="javascript:newTabPage('成本分析','${ctx}/pt/ptCostAnalysis/view?action=view&showList=0',true);"><i class="icon-bar-chart"></i> 成本分析<a style="color:#CCCCCC;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;分析公司各项相关成本</a></a></p>--%>
    <%--&lt;%&ndash;<p><hr style="height:1px;border:none;border-top:1px dashed #0066CC;" /></p>&ndash;%&gt;--%>
    <p><a style="text-decoration:underline;cursor: pointer;" onclick="javascript:newTabPage('新建政策文件','${ctx}/cms/cmsArticle/form?action=view&showList=0',true);"><i class="icon-briefcase"></i> 新建政策文件</a></p>
    <p><a style="text-decoration:underline;cursor: pointer;"  onclick="javascript:newTabPage('新建客户','${ctx}/sd/sdCust/form?action=new&showList=0',true);"><i class="icon-group"></i> 新建客户</a></p>

    <p> <a style="text-decoration:underline;cursor: pointer;" onclick="javascript:newTabPage('新建合同','${ctx}/cm/cmCon/form?action=new&showList=0',true)"><i class="icon-money"></i> 新建合同</a></p>
<%--     <p> <a style="text-decoration:underline;cursor: pointer;" onclick="javascript:newTabPage('新建订单','${ctx}/sd/sdSo/form?action=new&showList=0',true)"><i class="icon-shopping-cart"></i> 新建订单</a></p>
 --%>
</div>
<div id="cmsArticleList"></div>

<!-- newTabPage("工作详情",ctx+"/oa/oaWorkPlan/form?action=view&showList=0&planStartDate="+date,true); -->
</body>
</html>
<script type="text/javascript">
	var ctx  = '${ctx}';
</script>
<script type="text/javascript" src="${ctxStatic}/e-calendar/js/jquery.e-calendar.js"></script>
<script type="text/javascript" src="${ctxStatic}/e-calendar/example/index.js"></script>

<link href="${ctxStatic}/common/portal/portal.css" rel="stylesheet" type="text/css" />
<script src="${ctxStatic}/common/portal/Portal.js" type="text/javascript"></script>
  <style>
	.texthidden{
	   float: left;
	   width:280px;
	   overflow:hidden;
	   text-overflow:ellipsis;
	   white-space:nowrap;
			}
	</style>
<script type="text/javascript">
    mui.init();

    fetchCmsArticle(false);
    fetchOaWorkPlan(false );

    var portal = new mini.ux.Portal();
    portal.set({
        style: "width: 100%;height:100%",
        columns: [  "100%", 500]
    });
    portal.render(document.body);

    //panel
    portal.setPanels([
        { column: 0, id: "p1", title: "工作提醒 (双击日历新建)", showCloseButton: false ,showCollapseButton: true,height: 320 ,body:"#calendar"},
        { column: 0, id: "p2", title: "待办任务", showCloseButton: false,showCollapseButton: true ,height: 400,body:"#gtasks"},
        { column: 1, id: "p3", title: "<a style = 'cursor: pointer;' onclick=\"javascript:newTabPage('政策文件','${ctx}/cms/cmsArticle/form',true)\">政策文件</a>", showCloseButton: false,showCollapseButton: true,height: 320 ,body:"#cmsArticleList"},
        { column: 1, id: "p4", title: "快捷方式", showCloseButton: false ,showCollapseButton: true, height: 400,body:"#shortcut"},


    ]);

    var bodyEl = portal.getPanelBodyEl("p2");
   // bodyEl.appendChild(document.getElementById("Button2"));

    //获取配置的panels信息
    var panels = portal.getPanels();
    //alert(panels.length);
    if(document.body.clientHeight>340){
        panels[1].setHeight(document.body.clientHeight-340);
        panels[3].setHeight(document.body.clientHeight-340);

    }

    function fetchCmsArticle(async) {
        var res='';
        $.ajax({
            url: ctx+"/cms/cmsArticle/data",
            async:async,
            data:{},
            success: function (text) {
                 //console.log(text);
                 var o = mini.decode(text);
                //console.log(o);
                //console.log(o.data);
                //alert(o['sqlWhere']);
                //alert(o.sqlWhere);
                for (var i = 0; i < o.data.length; i++) {
                    var row=o.data[i];
                    var publishName = row.publishName;
                    if(publishName){
                    	var nameLength = publishName.length;
                    	var qLength = 20;
                    	var reg = new RegExp("[\\u4E00-\\u9FFF]+","g");
                   		if(reg.test(publishName)){     
                   		 qLength = qLength - parseInt(nameLength)*3;
                 	　　}else{
                   		 qLength = qLength - parseInt(nameLength)*2;
               		　　}  
                   		for(var j = 0;j < qLength; j++) {
                   			publishName = "&nbsp;"+publishName;
                   		}	
                    }else{
                    	publishName="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
                    }
                    //s = '<a href="${pageContext.request.contextPath}${fns:getFrontPath()}/view-' + categoryId + '-' + id + '${fns:getUrlSuffix()}" target="_blank">访问</a>'
                    //$('#cmsArticleList').append("<p><a style=\"text-decoration:underline;cursor: pointer;\"  onclick=\"javascript:newTabPage('政策文件','"+ctx+"/cms/cmsArticle/form?action=view&showList=0&id="+row.id+"',true)\"><i class='icon-arrow-right'></i> "+row.title+" ["+row.orgName+"]["+row.publishName+" "+row.updateDate.format('MM-dd')+"]</a></p>");
                    //<abbr title="People's Republic of China">PRC</abbr>
                    $('#cmsArticleList').append("<p><a style=\"text-decoration:none;cursor: pointer;\"  onclick=\"javascript:newTabPage('政策文件','${pageContext.request.contextPath}${fns:getFrontPath()}/view-"+row.categoryId+ "-" + row.id + "${fns:getUrlSuffix()}',true)\"><div class='texthidden'><i class='icon-arrow-right'></i><abbr title='"+row.title+"'>"+row.title+"</abbr></div>"+publishName+" ["+row.updateDate.format('yyyy-MM-dd')+"]</a></p>");
                }



            },
            error: function (jqXHR, textStatus, errorThrown) {
                var callback=function (action) {
                    viewErrorDetail(jqXHR.responseText);
                }
                var buttonsTemp=["ok","详细"];
                showMessageBox("错误","获取查询失败","error",null,callback,buttonsTemp);

            }
        });

    }
    
    function fetchOaWorkPlan(async) {
        var res='';
        $.ajax({
            url: ctx+"/oa/oaWorkPlan/getDataByCondition",
            async:async,
            data:{
            	query:'home'
            },
            success: function (text) {
                var o = mini.decode(text);
                //console.log(text);
                //console.log(o);
                for (var i = 0; i < o.length; i++) {
                    var row=o[i];
                    var descr = row.descr;
                    if(!descr){
                    	descr = '';
                    }
                    if(row.status=='1'){
                    	$('#gtasks').append("<p><a style=\"cursor: pointer;font-weight:bold;\"  onclick=\"javascript:newTabPage('待办任务','${ctx}/oa/oaWorkPlan/form?action=view&showList=0&id="+row.id+"',true)\"><i class='icon-exclamation-sign'></i> "+row.planStartDate.format('yyyy-MM-dd')+"&nbsp;&nbsp;"+row.name+"</a></p>");
                    }
                    else{
                    	$('#gtasks').append("<p><a style=\"cursor: pointer;\"  onclick=\"javascript:newTabPage('待办任务','${ctx}/oa/oaWorkPlan/form?action=view&showList=0&id="+row.id+"',true)\"><i class='icon-exclamation-sign'></i> "+row.planStartDate.format('yyyy-MM-dd')+"&nbsp;&nbsp;"+row.name+"</a></p>");
                    }
                }

            },
            error: function (jqXHR, textStatus, errorThrown) {
                var callback=function (action) {
                    viewErrorDetail(jqXHR.responseText);
                }
                var buttonsTemp=["ok","详细"];
                showMessageBox("错误","获取查询失败","error",null,callback,buttonsTemp);

            }
        });

    }

</script>