var bootPATH = __CreateJSPath("boot.js");

mini_debugger = true;                                           //

var skin = null;
//getCookie("miniuiSkin") || 'cupertino';             //skin cookie   cupertino
var mode = 'medium';//getCookie("miniuiMode") || 'medium';                 //mode cookie     medium
var optiStyle = getCookie("optiStyle")  ;                 //mode cookie     medium
document.write('<script src="' + bootPATH + '../../jquery-ajax-cache/dist/jquery-ajax-cache.min.js" type="text/javascript" ></sc' + 'ript>');

//miniui
//document.write('<script src="' + bootPATH + 'jquery.min.js" type="text/javascript"></sc' + 'ript>');

document.write('<script src="' + bootPATH + 'trepsui/trepsui.js" type="text/javascript" ></sc' + 'ript>');
document.write('<link href="' + bootPATH + 'trepsui/res/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />');
document.write('<link href="' + bootPATH + 'trepsui/themes/default/default.css" rel="stylesheet" type="text/css" />');
document.write('<script src="' + bootPATH + 'ajaxfileupload.js" type="text/javascript"></sc' + 'ript>');
//common
//document.write('<link href="' + bootPATH + '../res/css/common.css" rel="stylesheet" type="text/css" />');
//document.write('<script src="' + bootPATH + '../res/js/common.js" type="text/javascript" ></sc' + 'ript>');
//skin
if (skin && skin != "default") document.write('<link href="' + bootPATH + 'trepsui/themes/' + skin + '/skin.css" rel="stylesheet" type="text/css" />');

//mode
if (mode && mode != "default"){
    document.write('<link href="' + bootPATH + 'trepsui/themes/default/' + mode + '-mode.css" rel="stylesheet" type="text/css" />');
    document.write('<link href="' + bootPATH + 'trepsui/themes/default/' + mode + '-mode-fix.css" rel="stylesheet" type="text/css" />');
}
//optiStyle
if (optiStyle=="true"  ) document.write('<link href="' + bootPATH + '../../common/trepsui-opti.css" rel="stylesheet" type="text/css" />');

//icon
document.write('<link href="' + bootPATH + 'trepsui/themes/icons.css" rel="stylesheet" type="text/css" />');

////////////////////////////////////////////////////////////////////////////////////////
function getCookie(sName) {
    var aCookie = document.cookie.split("; ");
    var lastMatch = null;
    for (var i = 0; i < aCookie.length; i++) {
        var aCrumb = aCookie[i].split("=");
        if (sName == aCrumb[0]) {
            lastMatch = aCrumb;
        }
    }
    if (lastMatch) {
        var v = lastMatch[1];
        if (v === undefined) return v;
        return unescape(v);
    }
    return null;
}

function __CreateJSPath(js) {
    var scripts = document.getElementsByTagName("script");
    var path = "";
    for (var i = 0, l = scripts.length; i < l; i++) {
        var src = scripts[i].src;
        if (src.indexOf(js) != -1) {
            var ss = src.split(js);
            path = ss[0];
            break;
        }
    }
    var href = location.href;
    href = href.split("#")[0];
    href = href.split("?")[0];
    var ss = href.split("/");
    ss.length = ss.length - 1;
    href = ss.join("/");
    if (path.indexOf("https:") == -1 && path.indexOf("http:") == -1 && path.indexOf("file:") == -1 && path.indexOf("\/") != 0) {
        path = href + "/" + path;
    }
    return path;
}
 