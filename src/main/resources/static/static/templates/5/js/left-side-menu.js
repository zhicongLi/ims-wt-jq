$(function(){

	$(document).on('mouseover','.lsm-mini .lsm-container ul:first>li',function(){	
		$(".lsm-popup.third").hide();
		$(".lsm-popup.second").length==0&&($(".lsm-container").append("<div class='second lsm-popup second_menu'><span class='menu_jt'><i></i></span><div></div></div>"));
		$(".lsm-popup.second>div").html($(this).html());
		$(".lsm-popup.second").css({ width: "190px" }).show();
		$('.menu_jt').removeClass("active")
		$(".lsm-popup.third").hide();
	    setScroll()
	});


	$(document).on('mouseover','.lsm-mini',function(event){
          event.stopPropagation()
    });


	$(document).on('mouseover','body',function(){
	     $(this).parent().addClass("active")
         $(".lsm-popup.second").css({ width: "0" }).hide();

	});




     $(document).on('click','.menu_jt i',function(){
         if($(this).parent().hasClass("active")){
              $(this).parent().removeClass("active")
              $(".lsm-popup.second").css({ width: "190px" }).show();
         }else{
              $(this).parent().addClass("active")
              $(".lsm-popup.second").css({ width: "0" }).hide();
         }
	 });




	$(document).on('click','.second > div > ul > li>a',function(){
	     if($(this).parent().hasClass("on")){
	     	$(this).parent().removeClass("on")
			$(this).siblings().hide();
		 }else{
		 	 $(this).parent().addClass("on")
		 	 $(this).siblings().show();
		 } 
		 setScroll()
	});


    $(document).on('click','.third > li>a',function(){
	     if($(this).parent().hasClass("on")){
	     	$(this).parent().removeClass("on")
			$(this).siblings().hide();
		 }else{
		 	 $(this).parent().addClass("on")
		 	 $(this).siblings().show();
		 }
		 setScroll() 
	});



     $("#mini").on("click",function(){
			if(!$(".contain").hasClass("nav-mini")){
				//$(".nav-item.nav-show").removeClass("nav-show");
				//$(".nav-item").children("ul").removeAttr("style");
				$(".contain").addClass("nav-mini");
			}else{
				$(".contain").removeClass("nav-mini");
			}
			setScroll()
     })




      //树形菜单一级
		$(document).on('click','.contain.nav-mini .nav_list ul li.nav-item>a',function(){
		     if($(this).parent().hasClass("on")){
		     	$(this).parent().removeClass("on")
				$(this).siblings().hide();
			 }else{
			 	 $(this).parent().addClass("on")
			 	 $(this).siblings().show();
			 } 
			 setScroll()
		});


      //树形菜单二级
        $(document).on('click','.contain.nav-mini .nav-item>ul.two_tree>li>a',function(){
		     if($(this).parent().hasClass("on")){
		     	$(this).parent().removeClass("on")
				$(this).siblings().hide();
			 }else{
			 	 $(this).parent().addClass("on")
			 	 $(this).siblings().show();
			 }
			 setScroll() 
		});


      //树形菜单三级
		$(document).on('click','.nav-item ul.three_tree li a',function(){
		     if($(this).parent().hasClass("on")){
		     	 $(this).parent().removeClass("on")
		     	 $(this).siblings().hide();
			 }else{
			 	 $(this).parent().addClass("on")
			 	 $(this).siblings().show();
			 } 
			 setScroll()
		});


      //树形菜单四级
		$(document).on('click','.four_tree li a',function(){
		     if($(this).parent().hasClass("on")){
		     	 $(this).parent().addClass("on")
			 	 $(this).siblings().show();
			 }else{
			 	 

			 	 $(this).parent().removeClass("on")
		     	 $(this).siblings().hide();
			 } 
			 setScroll()
		});


});