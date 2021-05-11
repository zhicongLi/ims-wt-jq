<%@ page contentType="text/html;charset=UTF-8" %><meta http-equiv="Content-Type" content="text/html;charset=utf-8" /><meta name="author" content="http://treps.com/"/>
<link rel="shortcut icon" href="${ctxStatic}/images/favicon.ico" />
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static"/>
<c:set var="ctxRoot" value="${pageContext.request.contextPath}"/>

<script type="text/javascript">
var iamCode_ = '${param.iamCode}';
var iamAccessToken_ = '${iamAccessToken}';
var _imsBucketName_ = '${_imsBucketName_}';
 var ctx = '${ctx}',
     ctxStatic='${ctxStatic}',
     rootUploadDocUrl = '${rootUploadDocUrl}';
 var rootDocUrl = '${rootDownloadDocUrl}';
 var rootDocPreviewUrl = '${rootDocPreviewUrl}';
 var rootDocOnlineEditUrl = '${rootDocOnlineEditUrl}';
 var baseUrl="${ctx}";
 var rootUrl="${ctxRoot}";
 var ctxHost="${ctxRoot}";
 var _jdbcType =  "${fns:getConfig('jdbc.type')}";
 var currUser =  null;
 var templateIndex =  "${fns:getConfig('sys.templateIndex')}";
 var _currUserStr_ = '${userinfoJson}';
 var _currUser_ = JSON.parse(_currUserStr_);
</script>


<script src="${ctxStatic}/jquery/jquery-1.12.4.min.js"></script>
<script src="${ctxStatic}/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="${ctxStatic}/Font-Awesome/3.2.1/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
<link href="${ctxStatic}/Font-Awesome/5.13.1/css/all.min.css" type="text/css" rel="stylesheet" />
<link href="${ctxStatic}/Font-Awesome/5.13.1/css/v4-shims.min.css" type="text/css" rel="stylesheet" />
<script src="${ctxStatic}/trepsui/scripts/boot.js?v=1" type="text/javascript"></script>
<script src="${ctxStatic}/jquery-validation/1.17.0/dist/jquery.validate.min.js" type="text/javascript"></script>
<link href="${ctxStatic}/jquery-jbox/2.3/Skins/Blue/jbox.css" rel="stylesheet" />
<script src="${ctxStatic}/jquery-jbox/2.3/jquery.jBox-2.3.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/common/mustache.min.js" type="text/javascript"></script>
<link href="${ctxStatic}/common/treps.css" type="text/css" rel="stylesheet" />
<script src="${ctxStatic}/common/treps.js" type="text/javascript"></script>
<script src="${ctxStatic}/common/trepsui-ext.min.js?t=201911040007"></script>
<link rel="stylesheet" href="${ctxStatic}/jquery-querybuilder/dist/css/query-builder.default.css" id="qb-theme">
<script src="${ctxStatic}/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
<script src="${ctxStatic}/jquery-extendext/jQuery.extendext.js"></script>
<script src="${ctxStatic}/sql-parser-mistic/browser/sql-parser.js"></script>
<script src="${ctxStatic}/doT/doT.min.js"></script>
<script src="${ctxStatic}/interactjs/dist/interact.js"></script>
<script src="${ctxStatic}/jquery-querybuilder/dist/js/query-builder-treps.js"></script>
<script src="${ctxStatic}/jquery-querybuilder/dist/i18n/query-builder.zh-CN.js"></script>
<script src="${ctxStatic}/common/treps-cros-config.js?v=1" type="text/javascript"></script>
<script src="${ctxStatic}/templates/common/loadTemplate.js"></script>
