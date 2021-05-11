<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<html>
<head>
    <title>图标选择</title>
	<meta name="decorator" content="blank"/>
    <style type="text/css">
    	.page-header {clear:both;margin:0 20px;padding-top:20px;}
		.the-icons {padding:25px 10px 15px;list-style:none;}
		.the-icons li {float:left;width:25%;line-height:25px;margin:2px 5px;cursor:pointer;}
		.the-icons i {margin:1px 5px;font-size:16px;} .the-icons li:hover {background-color:#efefef;}
        .the-icons li.active {background-color:#0088CC;color:#ffffff;}
        .the-icons li:hover i{font-size:20px;}
    </style>
    <script type="text/javascript">
	    $(document).ready(function(){
	    	$("#icons li").click(function(){
	    		$("#icons li").removeClass("active");
	    		$("#icons li i").removeClass("icon-white");
	    		$(this).addClass("active");
	    		$(this).children("i").addClass("icon-white");
	    		$("#icon").val($(this).text());
	    	});
	    	$("#icons li").each(function(){
	    		if ($(this).text()=="${value}"){
	    			$(this).click();
	    		}
	    	});
	    	$("#icons li").dblclick(function(){
				closeWindow("ok");
	    	});
	    });
    </script>
</head>
<body>
<input type="hidden" id="icon" value="${value}" />
<div id="icons">
		
	    <h2 class="page-header"> Web 应用的图标</h2>
	    
	    <ul class="the-icons">
	      <li><i class="fa fa-adjust"></i> icon-adjust</li>
	      <li><i class="fa fa-asterisk"></i> icon-asterisk</li>
	      <li><i class="fa fa-ban-circle"></i> icon-ban-circle</li>
	      <li><i class="fa fa-bar-chart"></i> icon-bar-chart</li>
	      <li><i class="fa fa-barcode"></i> icon-barcode</li>
	      <li><i class="fa fa-beaker"></i> icon-beaker</li>
	      <li><i class="fa fa-beer"></i> icon-beer</li>
	      <li><i class="fa fa-bell"></i> icon-bell</li>
	      <li><i class="fa fa-bell-alt"></i> icon-bell-alt</li>
	      <li><i class="fa fa-bolt"></i> icon-bolt</li>
	      <li><i class="fa fa-book"></i> icon-book</li>
	      <li><i class="fa fa-bookmark"></i> icon-bookmark</li>
	      <li><i class="fa fa-bookmark-empty"></i> icon-bookmark-empty</li>
	      <li><i class="fa fa-briefcase"></i> icon-briefcase</li>
	      <li><i class="fa fa-bullhorn"></i> icon-bullhorn</li>
	      <li><i class="fa fa-calendar"></i> icon-calendar</li>
	      <li><i class="fa fa-camera"></i> icon-camera</li>
	      <li><i class="fa fa-camera-retro"></i> icon-camera-retro</li>
	      <li><i class="fa fa-certificate"></i> icon-certificate</li>
	      <li><i class="fa fa-check"></i> icon-check</li>
	      <li><i class="fa fa-check-empty"></i> icon-check-empty</li>
	      <li><i class="fa fa-circle"></i> icon-circle</li>
	      <li><i class="fa fa-circle-blank"></i> icon-circle-blank</li>
	      <li><i class="fa fa-cloud"></i> icon-cloud</li>
	      <li><i class="fa fa-cloud-download"></i> icon-cloud-download</li>
	      <li><i class="fa fa-cloud-upload"></i> icon-cloud-upload</li>
	      <li><i class="fa fa-coffee"></i> icon-coffee</li>
	      <li><i class="fa fa-cog"></i> icon-cog</li>
	      <li><i class="fa fa-cogs"></i> icon-cogs</li>
	      <li><i class="fa fa-comment"></i> icon-comment</li>
	      <li><i class="fa fa-comment-alt"></i> icon-comment-alt</li>
	      <li><i class="fa fa-comments"></i> icon-comments</li>
	      <li><i class="fa fa-comments-alt"></i> icon-comments-alt</li>
	      <li><i class="fa fa-credit-card"></i> icon-credit-card</li>
	      <li><i class="fa fa-dashboard"></i> icon-dashboard</li>
	      <li><i class="fa fa-desktop"></i> icon-desktop</li>
	      <li><i class="fa fa-download"></i> icon-download</li>
	      <li><i class="fa fa-download-alt"></i> icon-download-alt</li>
	    

	      <li><i class="fa fa-edit"></i> icon-edit</li>
	      <li><i class="fa fa-envelope"></i> icon-envelope</li>
	      <li><i class="fa fa-envelope-alt"></i> icon-envelope-alt</li>
	      <li><i class="fa fa-exchange"></i> icon-exchange</li>
	      <li><i class="fa fa-exclamation-sign"></i> icon-exclamation-sign</li>
	      <li><i class="fa fa-external-link"></i> icon-external-link</li>
	      <li><i class="fa fa-eye-close"></i> icon-eye-close</li>
	      <li><i class="fa fa-eye-open"></i> icon-eye-open</li>
	      <li><i class="fa fa-facetime-video"></i> icon-facetime-video</li>
	      <li><i class="fa fa-fighter-jet"></i> icon-fighter-jet</li>
	      <li><i class="fa fa-film"></i> icon-film</li>
	      <li><i class="fa fa-filter"></i> icon-filter</li>
	      <li><i class="fa fa-fire"></i> icon-fire</li>
	      <li><i class="fa fa-flag"></i> icon-flag</li>
	      <li><i class="fa fa-folder-close"></i> icon-folder-close</li>
	      <li><i class="fa fa-folder-open"></i> icon-folder-open</li>
	      <li><i class="fa fa-folder-close-alt"></i> icon-folder-close-alt</li>
	      <li><i class="fa fa-folder-open-alt"></i> icon-folder-open-alt</li>
	      <li><i class="fa fa-food"></i> icon-food</li>
	      <li><i class="fa fa-gift"></i> icon-gift</li>
	      <li><i class="fa fa-glass"></i> icon-glass</li>
	      <li><i class="fa fa-globe"></i> icon-globe</li>
	      <li><i class="fa fa-group"></i> icon-group</li>
	      <li><i class="fa fa-hdd"></i> icon-hdd</li>
	      <li><i class="fa fa-headphones"></i> icon-headphones</li>
	      <li><i class="fa fa-heart"></i> icon-heart</li>
	      <li><i class="fa fa-heart-empty"></i> icon-heart-empty</li>
	      <li><i class="fa fa-home"></i> icon-home</li>
	      <li><i class="fa fa-inbox"></i> icon-inbox</li>
	      <li><i class="fa fa-info-sign"></i> icon-info-sign</li>
	      <li><i class="fa fa-key"></i> icon-key</li>
	      <li><i class="fa fa-leaf"></i> icon-leaf</li>
	      <li><i class="fa fa-laptop"></i> icon-laptop</li>
	      <li><i class="fa fa-legal"></i> icon-legal</li>
	      <li><i class="fa fa-lemon"></i> icon-lemon</li>
	      <li><i class="fa fa-lightbulb"></i> icon-lightbulb</li>
	      <li><i class="fa fa-lock"></i> icon-lock</li>
	      <li><i class="fa fa-unlock"></i> icon-unlock</li>
	    

	      <li><i class="fa fa-magic"></i> icon-magic</li>
	      <li><i class="fa fa-magnet"></i> icon-magnet</li>
	      <li><i class="fa fa-map-marker"></i> icon-map-marker</li>
	      <li><i class="fa fa-minus"></i> icon-minus</li>
	      <li><i class="fa fa-minus-sign"></i> icon-minus-sign</li>
	      <li><i class="fa fa-mobile-phone"></i> icon-mobile-phone</li>
	      <li><i class="fa fa-money"></i> icon-money</li>
	      <li><i class="fa fa-move"></i> icon-move</li>
	      <li><i class="fa fa-music"></i> icon-music</li>
	      <li><i class="fa fa-off"></i> icon-off</li>
	      <li><i class="fa fa-ok"></i> icon-ok</li>
	      <li><i class="fa fa-ok-circle"></i> icon-ok-circle</li>
	      <li><i class="fa fa-ok-sign"></i> icon-ok-sign</li>
	      <li><i class="fa fa-pencil"></i> icon-pencil</li>
	      <li><i class="fa fa-picture"></i> icon-picture</li>
	      <li><i class="fa fa-plane"></i> icon-plane</li>
	      <li><i class="fa fa-plus"></i> icon-plus</li>
	      <li><i class="fa fa-plus-sign"></i> icon-plus-sign</li>
	      <li><i class="fa fa-print"></i> icon-print</li>
	      <li><i class="fa fa-pushpin"></i> icon-pushpin</li>
	      <li><i class="fa fa-qrcode"></i> icon-qrcode</li>
	      <li><i class="fa fa-question-sign"></i> icon-question-sign</li>
	      <li><i class="fa fa-quote-left"></i> icon-quote-left</li>
	      <li><i class="fa fa-quote-right"></i> icon-quote-right</li>
	      <li><i class="fa fa-random"></i> icon-random</li>
	      <li><i class="fa fa-refresh"></i> icon-refresh</li>
	      <li><i class="fa fa-remove"></i> icon-remove</li>
	      <li><i class="fa fa-remove-circle"></i> icon-remove-circle</li>
	      <li><i class="fa fa-remove-sign"></i> icon-remove-sign</li>
	      <li><i class="fa fa-reorder"></i> icon-reorder</li>
	      <li><i class="fa fa-reply"></i> icon-reply</li>
	      <li><i class="fa fa-resize-horizontal"></i> icon-resize-horizontal</li>
	      <li><i class="fa fa-resize-vertical"></i> icon-resize-vertical</li>
	      <li><i class="fa fa-retweet"></i> icon-retweet</li>
	      <li><i class="fa fa-road"></i> icon-road</li>
	      <li><i class="fa fa-rss"></i> icon-rss</li>
	      <li><i class="fa fa-screenshot"></i> icon-screenshot</li>
	      <li><i class="fa fa-search"></i> icon-search</li>
	    

	      <li><i class="fa fa-share"></i> icon-share</li>
	      <li><i class="fa fa-share-alt"></i> icon-share-alt</li>
	      <li><i class="fa fa-shopping-cart"></i> icon-shopping-cart</li>
	      <li><i class="fa fa-signal"></i> icon-signal</li>
	      <li><i class="fa fa-signin"></i> icon-signin</li>
	      <li><i class="fa fa-signout"></i> icon-signout</li>
	      <li><i class="fa fa-sitemap"></i> icon-sitemap</li>
	      <li><i class="fa fa-sort"></i> icon-sort</li>
	      <li><i class="fa fa-sort-down"></i> icon-sort-down</li>
	      <li><i class="fa fa-sort-up"></i> icon-sort-up</li>
	      <li><i class="fa fa-spinner"></i> icon-spinner</li>
	      <li><i class="fa fa-star"></i> icon-star</li>
	      <li><i class="fa fa-star-empty"></i> icon-star-empty</li>
	      <li><i class="fa fa-star-half"></i> icon-star-half</li>
	      <li><i class="fa fa-tablet"></i> icon-tablet</li>
	      <li><i class="fa fa-tag"></i> icon-tag</li>
	      <li><i class="fa fa-tags"></i> icon-tags</li>
	      <li><i class="fa fa-tasks"></i> icon-tasks</li>
	      <li><i class="fa fa-thumbs-down"></i> icon-thumbs-down</li>
	      <li><i class="fa fa-thumbs-up"></i> icon-thumbs-up</li>
	      <li><i class="fa fa-time"></i> icon-time</li>
	      <li><i class="fa fa-tint"></i> icon-tint</li>
	      <li><i class="fa fa-trash"></i> icon-trash</li>
	      <li><i class="fa fa-trophy"></i> icon-trophy</li>
	      <li><i class="fa fa-truck"></i> icon-truck</li>
	      <li><i class="fa fa-umbrella"></i> icon-umbrella</li>
	      <li><i class="fa fa-upload"></i> icon-upload</li>
	      <li><i class="fa fa-upload-alt"></i> icon-upload-alt</li>
	      <li><i class="fa fa-user"></i> icon-user</li>
	      <li><i class="fa fa-user-md"></i> icon-user-md</li>
	      <li><i class="fa fa-volume-off"></i> icon-volume-off</li>
	      <li><i class="fa fa-volume-down"></i> icon-volume-down</li>
	      <li><i class="fa fa-volume-up"></i> icon-volume-up</li>
	      <li><i class="fa fa-warning-sign"></i> icon-warning-sign</li>
	      <li><i class="fa fa-wrench"></i> icon-wrench</li>
	      <li><i class="fa fa-zoom-in"></i> icon-zoom-in</li>
	      <li><i class="fa fa-zoom-out"></i> icon-zoom-out</li>
	    </ul>
	
	  
	    <h2 class="page-header">文本编辑器图标</h2>
	  
	    <ul class="the-icons">
	      <li><i class="fa fa-file"></i> icon-file</li>
	      <li><i class="fa fa-file-alt"></i> icon-file-alt</li>
	      <li><i class="fa fa-cut"></i> icon-cut</li>
	      <li><i class="fa fa-copy"></i> icon-copy</li>
	      <li><i class="fa fa-paste"></i> icon-paste</li>
	      <li><i class="fa fa-save"></i> icon-save</li>
	      <li><i class="fa fa-undo"></i> icon-undo</li>
	      <li><i class="fa fa-repeat"></i> icon-repeat</li>
	    

	      <li><i class="fa fa-text-height"></i> icon-text-height</li>
	      <li><i class="fa fa-text-width"></i> icon-text-width</li>
	      <li><i class="fa fa-align-left"></i> icon-align-left</li>
	      <li><i class="fa fa-align-center"></i> icon-align-center</li>
	      <li><i class="fa fa-align-right"></i> icon-align-right</li>
	      <li><i class="fa fa-align-justify"></i> icon-align-justify</li>
	      <li><i class="fa fa-indent-left"></i> icon-indent-left</li>
	      <li><i class="fa fa-indent-right"></i> icon-indent-right</li>
	    

	      <li><i class="fa fa-font"></i> icon-font</li>
	      <li><i class="fa fa-bold"></i> icon-bold</li>
	      <li><i class="fa fa-italic"></i> icon-italic</li>
	      <li><i class="fa fa-strikethrough"></i> icon-strikethrough</li>
	      <li><i class="fa fa-underline"></i> icon-underline</li>
	      <li><i class="fa fa-link"></i> icon-link</li>
	      <li><i class="fa fa-paper-clip"></i> icon-paper-clip</li>
	      <li><i class="fa fa-columns"></i> icon-columns</li>
	    

	      <li><i class="fa fa-table"></i> icon-table</li>
	      <li><i class="fa fa-th-large"></i> icon-th-large</li>
	      <li><i class="fa fa-th"></i> icon-th</li>
	      <li><i class="fa fa-th-list"></i> icon-th-list</li>
	      <li><i class="fa fa-list"></i> icon-list</li>
	      <li><i class="fa fa-list-ol"></i> icon-list-ol</li>
	      <li><i class="fa fa-list-ul"></i> icon-list-ul</li>
	      <li><i class="fa fa-list-alt"></i> icon-list-alt</li>
	    </ul>
	
	    <h2 class="page-header">指示方向的图标</h2>
	  
	    <ul class="the-icons">
	      <li><i class="fa fa-angle-left"></i> icon-angle-left</li>
	      <li><i class="fa fa-angle-right"></i> icon-angle-right</li>
	      <li><i class="fa fa-angle-up"></i> icon-angle-up</li>
	      <li><i class="fa fa-angle-down"></i> icon-angle-down</li>
	      <li><i class="fa fa-arrow-down"></i> icon-arrow-down</li>
	      <li><i class="fa fa-arrow-left"></i> icon-arrow-left</li>
	      <li><i class="fa fa-arrow-right"></i> icon-arrow-right</li>
	      <li><i class="fa fa-arrow-up"></i> icon-arrow-up</li>
	    

	      <li><i class="fa fa-caret-down"></i> icon-caret-down</li>
	      <li><i class="fa fa-caret-left"></i> icon-caret-left</li>
	      <li><i class="fa fa-caret-right"></i> icon-caret-right</li>
	      <li><i class="fa fa-caret-up"></i> icon-caret-up</li>
	      <li><i class="fa fa-chevron-down"></i> icon-chevron-down</li>
	      <li><i class="fa fa-chevron-left"></i> icon-chevron-left</li>
	      <li><i class="fa fa-chevron-right"></i> icon-chevron-right</li>
	      <li><i class="fa fa-chevron-up"></i> icon-chevron-up</li>
	    

	      <li><i class="fa fa-circle-arrow-down"></i> icon-circle-arrow-down</li>
	      <li><i class="fa fa-circle-arrow-left"></i> icon-circle-arrow-left</li>
	      <li><i class="fa fa-circle-arrow-right"></i> icon-circle-arrow-right</li>
	      <li><i class="fa fa-circle-arrow-up"></i> icon-circle-arrow-up</li>
	      <li><i class="fa fa-double-angle-left"></i> icon-double-angle-left</li>
	      <li><i class="fa fa-double-angle-right"></i> icon-double-angle-right</li>
	      <li><i class="fa fa-double-angle-up"></i> icon-double-angle-up</li>
	      <li><i class="fa fa-double-angle-down"></i> icon-double-angle-down</li>
	    

	      <li><i class="fa fa-hand-down"></i> icon-hand-down</li>
	      <li><i class="fa fa-hand-left"></i> icon-hand-left</li>
	      <li><i class="fa fa-hand-right"></i> icon-hand-right</li>
	      <li><i class="fa fa-hand-up"></i> icon-hand-up</li>
	      <li><i class="fa fa-circle"></i> icon-circle</li>
	      <li><i class="fa fa-circle-blank"></i> icon-circle-blank</li>
	    </ul>
	  
	
	    <h2 class="page-header">视频播放器图标</h2>
	  
	    <ul class="the-icons">
	      <li><i class="fa fa-play-circle"></i> icon-play-circle</li>
	      <li><i class="fa fa-play"></i> icon-play</li>
	      <li><i class="fa fa-pause"></i> icon-pause</li>
	      <li><i class="fa fa-stop"></i> icon-stop</li>
	    

	      <li><i class="fa fa-step-backward"></i> icon-step-backward</li>
	      <li><i class="fa fa-fast-backward"></i> icon-fast-backward</li>
	      <li><i class="fa fa-backward"></i> icon-backward</li>
	      <li><i class="fa fa-forward"></i> icon-forward</li>
	    

	      <li><i class="fa fa-fast-forward"></i> icon-fast-forward</li>
	      <li><i class="fa fa-step-forward"></i> icon-step-forward</li>
	      <li><i class="fa fa-eject"></i> icon-eject</li>
	    

	      <li><i class="fa fa-fullscreen"></i> icon-fullscreen</li>
	      <li><i class="fa fa-resize-full"></i> icon-resize-full</li>
	      <li><i class="fa fa-resize-small"></i> icon-resize-small</li>
	    </ul>
	
	
	    <h2 class="page-header">SNS图标</h2>
	  
	    <ul class="the-icons">
	      <li><i class="fa fa-phone"></i> icon-phone</li>
	      <li><i class="fa fa-phone-sign"></i> icon-phone-sign</li>
	      <li><i class="fa fa-facebook"></i> icon-facebook</li>
	      <li><i class="fa fa-facebook-sign"></i> icon-facebook-sign</li>
	    

	      <li><i class="fa fa-twitter"></i> icon-twitter</li>
	      <li><i class="fa fa-twitter-sign"></i> icon-twitter-sign</li>
	      <li><i class="fa fa-github"></i> icon-github</li>
	      <li><i class="fa fa-github-alt"></i> icon-github-alt</li>
	    

	      <li><i class="fa fa-github-sign"></i> icon-github-sign</li>
	      <li><i class="fa fa-linkedin"></i> icon-linkedin</li>
	      <li><i class="fa fa-linkedin-sign"></i> icon-linkedin-sign</li>
	      <li><i class="fa fa-pinterest"></i> icon-pinterest</li>
	    

	      <li><i class="fa fa-pinterest-sign"></i> icon-pinterest-sign</li>
	      <li><i class="fa fa-google-plus"></i> icon-google-plus</li>
	      <li><i class="fa fa-google-plus-sign"></i> icon-google-plus-sign</li>
	      <li><i class="fa fa-sign-blank"></i> icon-sign-blank</li>
	    </ul>
	  
	  
	    <h2 class="page-header">医疗图标</h2>
	  
	    <ul class="the-icons">
	      <li><i class="fa fa-ambulance"></i> icon-ambulance</li>
	      <li><i class="fa fa-beaker"></i> icon-beaker</li>
	    

	      <li><i class="fa fa-h-sign"></i> icon-h-sign</li>
	      <li><i class="fa fa-hospital"></i> icon-hospital</li>
	    

	      <li><i class="fa fa-medkit"></i> icon-medkit</li>
	      <li><i class="fa fa-plus-sign-alt"></i> icon-plus-sign-alt</li>
	    

	      <li><i class="fa fa-stethoscope"></i> icon-stethoscope</li>
	      <li><i class="fa fa-user-md"></i> icon-user-md</li>
	    </ul>
	<br/><br/>
</div>
</body>