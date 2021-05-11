<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html lang="en" >
<!--begin::Head-->
<head>
	<style>
		/* Loading Spinner */
		.spinner{margin:0;width:70px;height:18px;margin:-35px 0 0 -9px;position:absolute;top:50%;left:50%;text-align:center}.spinner > div{width:18px;height:18px;background-color:#333;border-radius:100%;display:inline-block;-webkit-animation:bouncedelay 1.4s infinite ease-in-out;animation:bouncedelay 1.4s infinite ease-in-out;-webkit-animation-fill-mode:both;animation-fill-mode:both}.spinner .bounce1{-webkit-animation-delay:-.32s;animation-delay:-.32s}.spinner .bounce2{-webkit-animation-delay:-.16s;animation-delay:-.16s}@-webkit-keyframes bouncedelay{0%,80%,100%{-webkit-transform:scale(0.0)}40%{-webkit-transform:scale(1.0)}}@keyframes bouncedelay{0%,80%,100%{transform:scale(0.0);-webkit-transform:scale(0.0)}40%{transform:scale(1.0);-webkit-transform:scale(1.0)}}
	</style>
	<meta charset="UTF-8">
	<!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->
	<title>${fns:getConfig('productName')} 登录</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

	<!-- Favicons -->
	<link rel="shortcut icon" href="${ctxStatic}/images/favicon.ico" />
	<link rel="apple-touch-icon-precomposed" sizes="144x144" href="${ctxStatic}/templates/3/assets/images/icons/apple-touch-icon-144-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="114x114" href="${ctxStatic}/templates/3/assets/images/icons/apple-touch-icon-114-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="72x72" href="${ctxStatic}/templates/3/assets/images/icons/apple-touch-icon-72-precomposed.png">
	<link rel="apple-touch-icon-precomposed" href="${ctxStatic}/templates/3/assets/images/icons/apple-touch-icon-57-precomposed.png">


	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/bootstrap/css/bootstrap.css">


	<!-- HELPERS -->

	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/helpers/animate.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/helpers/backgrounds.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/helpers/boilerplate.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/helpers/border-radius.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/helpers/grid.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/helpers/page-transitions.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/helpers/spacing.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/helpers/typography.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/helpers/utils.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/helpers/colors.css">

	<!-- ELEMENTS -->

	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/elements/badges.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/elements/buttons.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/elements/content-box.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/elements/dashboard-box.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/elements/forms.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/elements/images.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/elements/info-box.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/elements/invoice.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/elements/loading-indicators.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/elements/menus.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/elements/panel-box.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/elements/response-messages.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/elements/responsive-tables.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/elements/ribbon.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/elements/social-box.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/elements/tables.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/elements/tile-box.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/elements/timeline.css">



	<!-- ICONS -->

	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/icons/fontawesome/fontawesome.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/icons/linecons/linecons.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/icons/spinnericon/spinnericon.css">


	<!-- WIDGETS -->

	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/accordion-ui/accordion.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/calendar/calendar.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/carousel/carousel.css">

	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/charts/justgage/justgage.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/charts/morris/morris.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/charts/piegage/piegage.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/charts/xcharts/xcharts.css">

	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/chosen/chosen.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/colorpicker/colorpicker.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/datatable/datatable.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/datepicker/datepicker.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/datepicker-ui/datepicker.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/daterangepicker/daterangepicker.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/dialog/dialog.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/dropdown/dropdown.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/dropzone/dropzone.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/file-input/fileinput.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/input-switch/inputswitch.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/input-switch/inputswitch-alt.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/ionrangeslider/ionrangeslider.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/jcrop/jcrop.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/jgrowl-notifications/jgrowl.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/loading-bar/loadingbar.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/maps/vector-maps/vectormaps.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/markdown/markdown.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/modal/modal.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/multi-select/multiselect.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/multi-upload/fileupload.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/nestable/nestable.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/noty-notifications/noty.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/popover/popover.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/pretty-photo/prettyphoto.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/progressbar/progressbar.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/range-slider/rangeslider.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/slidebars/slidebars.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/slider-ui/slider.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/summernote-wysiwyg/summernote-wysiwyg.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/tabs-ui/tabs.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/theme-switcher/themeswitcher.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/timepicker/timepicker.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/tocify/tocify.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/tooltip/tooltip.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/touchspin/touchspin.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/uniform/uniform.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/wizard/wizard.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/xeditable/xeditable.css">

	<!-- SNIPPETS -->

	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/snippets/chat.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/snippets/files-box.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/snippets/login-box.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/snippets/notification-box.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/snippets/progress-box.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/snippets/todo.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/snippets/user-profile.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/snippets/mobile-navigation.css">

	<!-- APPLICATIONS -->

	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/applications/mailbox.css">

	<!-- Admin theme -->

	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/themes/admin/layout.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/themes/admin/color-schemes/default.css">

	<!-- Components theme -->

	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/themes/components/default.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/themes/components/border-radius.css">

	<!-- Admin responsive -->

	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/helpers/responsive-elements.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/helpers/admin-responsive.css">

	<!-- JS Core -->

	<script type="text/javascript" src="${ctxStatic}/templates/3/assets/js-core/jquery-core.js"></script>
	<script type="text/javascript" src="${ctxStatic}/templates/3/assets/js-core/jquery-ui-core.js"></script>
	<script type="text/javascript" src="${ctxStatic}/templates/3/assets/js-core/jquery-ui-widget.js"></script>
	<script type="text/javascript" src="${ctxStatic}/templates/3/assets/js-core/jquery-ui-mouse.js"></script>
	<script type="text/javascript" src="${ctxStatic}/templates/3/assets/js-core/jquery-ui-position.js"></script>
	<!--<script type="text/javascript" src="${ctxStatic}/templates/3/assets/js-core/transition.js"></script>-->
	<script type="text/javascript" src="${ctxStatic}/templates/3/assets/js-core/modernizr.js"></script>
	<script type="text/javascript" src="${ctxStatic}/templates/3/assets/js-core/jquery-cookie.js"></script>





	<script type="text/javascript">
		$(window).load(function(){
			setTimeout(function() {
				$('#loading').fadeOut( 400, "linear" );
			}, 300);
		});

		var ctx = '${ctx}',
				ctxStatic='${ctxStatic}',
				ctxHost='${ctxHost}',
				ctxFull='${ctxFull}'
		;
		baseUrl="${ctx}";
		rootUrl="${ctxRoot}";
		function submitForm() {
			//if(verifyTel1() && verifyTel2())
			{  //alert();
				document.getElementById("login-validation").submit();
			}
		}
	</script>


</head>
<body>
<div id="loading">
	<div class="spinner">
		<div class="bounce1"></div>
		<div class="bounce2"></div>
		<div class="bounce3"></div>
	</div>
</div>

<style type="text/css">

	html,body {
		height: 100%;
	}

</style>
<div class="center-vertical bg-black">
	<div class="center-content row">
		<form   id="login-validation" class="center-margin col-xs-11 col-sm-5"  name="loginForm" action="${ctx}/login" method="post">
			<h3 class="text-center pad25B font-gray font-size-23">智慧企业管理平台<span class="opacity-80">v1.0</span></h3>
			<div id="login-form" class="content-box">
				<div class="content-box-wrapper pad20A">

					<div class="form-group">
						<label for="username">用户名:</label>
						<div class="input-group input-group-lg">
                            <span class="input-group-addon addon-inside bg-white font-primary">
                                <i class="glyph-icon icon-envelope-o"></i>
                            </span>
							<input type="text" class="form-control"  id="username" name="username" placeholder="用户名">
						</div>
					</div>
					<div class="form-group">
						<label for="password">密码:</label>
						<div class="input-group input-group-lg">
                            <span class="input-group-addon addon-inside bg-white font-primary">
                                <i class="glyph-icon icon-unlock-alt"></i>
                            </span>
							<input type="password" class="form-control" type="password" id="password" name="password" placeholder="密码">
						</div>
					</div>
					<div class="row">
						<div class="checkbox-primary col-md-6" style="height: 20px;">
							<label>
								<input type="checkbox" id="loginCheckbox1" class="custom-checkbox">
								记住我
							</label>
						</div>
						<div class="text-right col-md-6">
							<a href="#" class="switch-button" switch-target="#login-forgot" switch-parent="#login-form" title="Recover password">忘记密码?</a>
						</div>
					</div>
				</div>
				<div class="button-pane">
					<button type="submit" class="btn btn-block btn-primary" onclick="submitForm()" >登录</button>
				</div>
			</div>



		</form>

	</div>
</div>


<!-- WIDGETS -->

<script type="text/javascript" src="${ctxStatic}/templates/3/assets/tether/js/tether.js"></script>
<script type="text/javascript" src="${ctxStatic}/templates/3/assets/bootstrap/js/bootstrap.js"></script>

<!-- Bootstrap Dropdown -->

<!-- <script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/dropdown/dropdown.js"></script> -->

<!-- Bootstrap Tooltip -->

<!-- <script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/tooltip/tooltip.js"></script> -->

<!-- Bootstrap Popover -->

<!-- <script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/popover/popover.js"></script> -->

<!-- Bootstrap Progress Bar -->

<script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/progressbar/progressbar.js"></script>

<!-- Bootstrap Buttons -->

<!-- <script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/button/button.js"></script> -->

<!-- Bootstrap Collapse -->

<!-- <script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/collapse/collapse.js"></script> -->

<!-- Superclick -->

<script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/superclick/superclick.js"></script>

<!-- Input switch alternate -->

<script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/input-switch/inputswitch-alt.js"></script>

<!-- Slim scroll -->

<script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/slimscroll/slimscroll.js"></script>

<!-- Slidebars -->

<script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/slidebars/slidebars.js"></script>
<script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/slidebars/slidebars-demo.js"></script>

<!-- PieGage -->

<script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/charts/piegage/piegage.js"></script>
<script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/charts/piegage/piegage-demo.js"></script>

<!-- Screenfull -->

<script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/screenfull/screenfull.js"></script>

<!-- Content box -->

<script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/content-box/contentbox.js"></script>

<!-- Overlay -->

<script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/overlay/overlay.js"></script>

<!-- Widgets init for demo -->

<script type="text/javascript" src="${ctxStatic}/templates/3/assets/js-init/widgets-init.js"></script>

<!-- Theme layout -->

<script type="text/javascript" src="${ctxStatic}/templates/3/assets/themes/admin/layout.js"></script>

<!-- Theme switcher -->

<script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/theme-switcher/themeswitcher.js"></script>

<script>

	$(function(){
		if(window.top != window.self){
			top.location.href = location.href;
		}
	});

</script>
</body>
<!--end::Body-->
</html>