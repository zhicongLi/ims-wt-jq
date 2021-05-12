$(function(){

    $(".Main_nav ul>li").mouseover(function(){
        $(this).find("dl").show(); 
    });
    $(".Main_nav ul>li").mouseout(function(){
       $(this).find("dl").hide()
    });

    var F_public = $(".F-mcsas").find(".F-public");
    var more = null;
    F_public.each(function (index, obj) {
        var ind = $(this).data(),ind_unit = ind.unit;
        $(obj).css({'width': ind.wsize, 'height': ind.hsize})  
    });

    setScroll()


});

function setScroll(){
   $(".scroll").getNiceScroll().show();
   $(".scroll").getNiceScroll().resize();
   $(".scroll").niceScroll({
        cursorcolor:"#ccc",
        cursorborder: "1px solid #ccc",
        cursorwidth:1, 
        boxzoom:false,
        touchbehavior:true, 
        dblclickzoom:false,
        oneaxismousemode: "auto",
        scrollspeed:50,
        autohidemode: 'leave',
        background: "#ccc",  
        railpadding: {top: 0, right: 0, left:0,bottom: 0},  
        horizrailenabled:false,
    });

}
