<%@ page contentType="text/html;charset=UTF-8" %><meta http-equiv="Content-Type" content="text/html;charset=utf-8" /><meta name="author" content="http://treps.com/"/>
<link rel="shortcut icon" href="${ctxStatic}/images/favicon.ico" />
<meta name="renderer" content="webkit"><meta http-equiv="X-UA-Compatible" content="IE=8,IE=9,IE=10,IE=edge" />
<meta http-equiv="Expires" content="0"><meta http-equiv="Cache-Control" content="no-cache"><meta http-equiv="Cache-Control" content="no-store">
<%--<script src="${ctxStatic}/jquery/jquery-1.9.1.min.js" type="text/javascript"></script>--%>

<link href="${ctxStatic1}/bootstrap/2.3.1/css_${not empty cookie.theme.value ? cookie.theme.value : 'cerulean'}/bootstrap.min.css" type="text/css" rel="stylesheet" />
<%--&lt;%&ndash;<script src="${ctxStatic}/bootstrap/2.3.1/js/bootstrap.min.js" type="text/javascript"></script>&ndash;%&gt;--%>
<link href="${ctxStatic2}/bootstrap/2.3.1/awesome/font-awesome.min.css" type="text/css" rel="stylesheet" />
<%--<link href="${ctxStatic}/bootstrap/2.3.1/awesome/font-awesome.css" type="text/css" rel="stylesheet" />--%>
<!--[if lte IE 10]>
<script src="${ctxStatic}/html5shiv/dist/html5shiv.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/es5-shim/es5-shim.min.js" type="text/javascript"></script>

<![endif]-->
<%--<link href="${ctxStatic}/bootstrap/3.3.6/css/bootstrap.min.css" type="text/css" rel="stylesheet" />--%>
<%--<script src="${ctxStatic}/bootstrap/3.3.6/js/bootstrap.min.js" type="text/javascript"></script>--%>
<%--<link href="${ctxStatic}/bootstrap/3.3.6/awesome/font-awesome.min.css" type="text/css" rel="stylesheet" />--%>
<%--<link href="${ctxStatic}/bootstrap/3.3.6/awesome/font-awesome.css" type="text/css" rel="stylesheet" />--%>
<script src="${ctxStatic3}/trepsui/scripts/boot.js" type="text/javascript"></script>





<!--[if lte IE 11]><link href="${ctxStatic}/bootstrap/2.3.1/awesome/font-awesome-ie7.min.css" type="text/css" rel="stylesheet" /><![endif]-->
<!--[if lte IE 6]><link href="${ctxStatic}/bootstrap/bsie/css/bootstrap-ie6.min.css" type="text/css" rel="stylesheet" />
<script src="${ctxStatic}/bootstrap/bsie/js/bootstrap-ie.min.js" type="text/javascript"></script><![endif]-->

<link href="${ctxStatic4}/jquery-select2/3.4/select2.min.css" rel="stylesheet" />
<script src="${ctxStatic}/jquery-select2/3.4/select2.min.js" type="text/javascript"></script>
<%--
<link href="${ctxStatic}/jquery-validation/1.11.0/jquery.validate.min.css" type="text/css" rel="stylesheet" />
 --%>
<script src="${ctxStatic1}/jquery-validation/1.11.0/jquery.validate.min.js" type="text/javascript"></script>
<link href="${ctxStatic2}/jquery-jbox/2.3/Skins/Bootstrap/jbox.min.css" rel="stylesheet" />
<script src="${ctxStatic3}/jquery-jbox/2.3/jquery.jBox-2.3.min.js" type="text/javascript"></script>
<%-- 
<script src="${ctxStatic}/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
--%>
<script src="${ctxStatic4}/common/mustache.min.js" type="text/javascript"></script>


<link href="${ctxStatic}/common/treps.css" type="text/css" rel="stylesheet" />
<script src="${ctxStatic1}/common/treps.js" type="text/javascript"></script>


<script src="${ctxStatic2}/common/trepsui-ext.min.js?t=201804170002"></script>
<%--<script src="${ctxStatic}/common/trepsui-ext.js"></script>--%>
<script type="text/javascript">var ctx = '${ctx}', ctxStatic='${ctxStatic}';</script>

<link rel="stylesheet" href="${ctxStatic3}/jquery-querybuilder/dist/css/query-builder.default.css" id="qb-theme">
<link rel="stylesheet" href="${ctxStatic4}/bootstrap-select/dist/css/bootstrap-select.min.css">
<link rel="stylesheet" href="${ctxStatic}/selectize/dist/css/selectize.bootstrap3.css">
<link rel="stylesheet" href="${ctxStatic1}/jquery-querybuilder/dist/css/flags.css">

<%--<script src="${ctxStatic}/jquery/jquery-2.2.4.min.js"></script>--%>
<script src="${ctxStatic2}/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="${ctxStatic3}/bootstrap-select/dist/js/bootstrap-select.min.js"></script>

<script src="${ctxStatic4}/bootbox/bootbox.js"></script>
<script src="${ctxStatic}/jquery-extendext/jQuery.extendext.min.js"></script>
<script src="${ctxStatic1}/selectize/dist/js/standalone/selectize.min.js"></script>
<script src="${ctxStatic2}/sql-parser/browser/sql-parser.js"></script>
<script src="${ctxStatic3}/doT/doT.js"></script>
<script src="${ctxStatic4}/interact/interact.js"></script>


<%--<script src="${ctxStatic}/jquery-querybuilder/dist/js/query-builder.js"></script>--%>
<script src="${ctxStatic}/jquery-querybuilder/dist/js/query-builder.min.js"></script>
<script src="${ctxStatic1}/jquery-querybuilder/dist/i18n/query-builder.zh-CN.js"></script>
<script src="${ctxStatic2}/moment/min/moment.min.js"></script>
<link rel="stylesheet" href="${ctxStatic3}/bootstrap-datepicker/css/bootstrap-datepicker3.min.css">

<script src="${ctxStatic4}/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
<script src="${ctxStatic}/bootstrap-datepicker/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<script type="text/javascript">
    baseUrl="${ctx}";
    rootUrl="${ctxRoot}";
    function getNum(num){
    	Math.floor(Math.random()*num); 
    }
    function getCtxStatic(){
    	var ports="8181,8383,8484,8585,8686";
    	var portArr = ports.split(",");
    	var myport = getNum(portArr.length);
    	 var myprotocol = window.location.protocol;
   	    var myhost = window.location.host;
   	    if(myhost.indexOf(":")!=-1){
   	    	var arr = myhost.split(":");
   	    	myhost=arr[0];
   	    }
   	    var myurl = myprotocol+'//'+myhost+":"+myport+"${ctxStatic}";
   	    console.log(myurl);
    }
</script>