console.log('templateIndex:'+templateIndex);
if(templateIndex=='1'){//piaf
    document.write('<script src="' + ctxStatic + '/templates/1/js/dore.script.js" type="text/javascript" ></sc' + 'ript>');
    document.write('<script src="' + ctxStatic + '/templates/1/js/scripts.js" type="text/javascript" ></sc' + 'ript>');
}else if(templateIndex=='2') {//metronic
    //document.write('<script src="' + ctxStatic + '/templates/1/js/dore.script.js" type="text/javascript" ></sc' + 'ript>');
    document.write('<link href="' + ctxStatic + '/templates/common/css/skin2.css" rel="stylesheet" type="text/css"  />');
}else if(templateIndex=='3') {//MonarchUI(不支持菜单树，暂未完成)
    //document.write('<script src="' + ctxStatic + '/templates/1/js/dore.script.js" type="text/javascript" ></sc' + 'ript>');
    document.write('<link href="' + ctxStatic + '/templates/common/css/skin3.css" rel="stylesheet" type="text/css"  />');
}else if(templateIndex=='4') {//porto admin
    //document.write('<script src="' + ctxStatic + '/templates/1/js/dore.script.js" type="text/javascript" ></sc' + 'ript>');

    document.write('<link href="' + ctxStatic + '/templates/common/css/skin4.css" rel="stylesheet" type="text/css"  />');
    // var root = document.querySelector(':root');
    // root.setAttribute('style', '--theme-color-1: '+getCookie("colorPrimary"));
    // root.setAttribute('style', '--theme-color-2: '+getCookie("colorSecondary"));
    // root.setAttribute('style', '--theme-color-3: '+getCookie("colorTertiary"));
    // root.setAttribute('style', '--theme-color-4: '+getCookie("colorQuaternary"));
    console.log("colorPrimary");
    console.log(getCookie("colorPrimary"));
    var colorPrimary= "2DB7F5";


    if(getCookie("colorPrimary")!=null){
        colorPrimary =getCookie("colorPrimary");
    }
    document.documentElement.style.setProperty('--theme-color-1' ,'#'+colorPrimary);
    document.documentElement.style.setProperty('--theme-color-2' ,'#'+getCookie("colorSecondary"));
    document.documentElement.style.setProperty('--theme-color-3' ,'#'+getCookie("colorTertiary"));
    document.documentElement.style.setProperty('--theme-color-4' ,'#'+getCookie("colorQuaternary"));
}else if(templateIndex=='5') {//
    //document.write('<script src="' + ctxStatic + '/templates/1/js/dore.script.js" type="text/javascript" ></sc' + 'ript>');
    document.write('<link href="' + ctxStatic + '/templates/common/css/skin5.css" rel="stylesheet" type="text/css"  />');
}

// document.write('<link href="' + bootPATH + 'trepsui/res/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />');
// document.write('<link href="' + bootPATH + 'trepsui/themes/default/default.css" rel="stylesheet" type="text/css" />');
// document.write('<script src="' + bootPATH + 'ajaxfileupload.js" type="text/javascript"></sc' + 'ript>');
function loadResAysc() {
    if(templateIndex=='4') {//porto admin
        document.write('<script src="' + ctxStatic + '/templates/4/js/theme.js" type="text/javascript" ></sc' + 'ript>');
        document.write('<script src="' + ctxStatic + '/templates/4/js/custom.js" type="text/javascript" ></sc' + 'ript>');
        document.write('<script src="' + ctxStatic + '/templates/4/js/theme.init.js" type="text/javascript" ></sc' + 'ript>');
        //document.write('<script src="' + ctxStatic + '/templates/1/js/theme.init.js" type="text/javascript" ></sc' + 'ript>');
        //document.write('<link href="' + ctxStatic + '/templates/common/css/skin4.css" rel="stylesheet" type="text/css"  />');
    }
}