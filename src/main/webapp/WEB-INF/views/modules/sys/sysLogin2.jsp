<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html lang="en" >
<!--begin::Head-->
<head><base href="../../../">
	<meta charset="utf-8"/>
	<title>${fns:getConfig('productName')} 登录</title>
	<meta name="description" content=""/>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
	<link rel="shortcut icon" href="${ctxStatic}/images/favicon.ico" />


	<!--begin::Page Custom Styles(used by this page)-->
	<link href="${ctxStatic}/templates/2/assets/css/pages/login/login-3.css" rel="stylesheet" type="text/css"/>
	<!--end::Page Custom Styles-->

	<!--begin::Global Theme Styles(used by all pages)-->
	<link href="${ctxStatic}/templates/2/assets/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css"/>
	<link href="${ctxStatic}/templates/2/assets/plugins/custom/prismjs/prismjs.bundle.css" rel="stylesheet" type="text/css"/>
	<link href="${ctxStatic}/templates/2/assets/css/style.bundle.css" rel="stylesheet" type="text/css"/>
	<!--end::Global Theme Styles-->

	<!--begin::Layout Themes(used by all pages)-->
	<style>
		.aside-img{
			background-image: url(${ctxStatic}/templates/2/assets/media/logos/ML.jpg)!important;
			background-size:cover!important;
		}
		.bgi-position-x-center {

			background-position-y: center!important;
		}
		/*.flex-center {*/

		/*	align-items: initial!important;*/
		/*}*/
	</style>

	<link href="${ctxStatic}/templates/2/assets/css/themes/layout/header/base/light.css" rel="stylesheet" type="text/css"/>
	<link href="${ctxStatic}/templates/2/assets/css/themes/layout/header/menu/light.css" rel="stylesheet" type="text/css"/>
	<link href="${ctxStatic}/templates/2/assets/css/themes/layout/brand/dark.css" rel="stylesheet" type="text/css"/>
	<link href="${ctxStatic}/templates/2/assets/css/themes/layout/aside/dark.css" rel="stylesheet" type="text/css"/>        <!--end::Layout Themes-->
	<link href="${ctxStatic}/templates/common/css/skin2.css" rel="stylesheet" type="text/css"/>        <!--end::Layout Themes-->
	<script type="text/javascript">
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
				document.getElementById("kt_login_singin_form").submit();
			}
		}
	</script>
</head>
<!--end::Head-->

<!--begin::Body-->
<body  id="kt_body"  class="header-fixed header-mobile-fixed subheader-enabled subheader-fixed subheader-mobile-fixed aside-enabled aside-fixed aside-minimize-hoverable page-loading"  >

<!--begin::Main-->
<div class="d-flex flex-column flex-root">
	<!--begin::Login-->
	<div class="login login-3 wizard d-flex flex-column flex-lg-row flex-column-fluid">
		<!--begin::Aside-->
		<div class="login-aside d-flex flex-column flex-row-auto">
			<!--begin::Aside Top-->
<%--			<div class="d-flex flex-column-auto flex-column pt-lg-40 pt-15">--%>


<%--				<!--begin::Aside Title-->--%>

<%--				<!--end::Aside Title-->--%>
<%--			</div>--%>
			<!--end::Aside Top-->

			<!--begin::Aside Bottom-->
			<div class="aside-img d-flex flex-row-fluid bgi-no-repeat bgi-position-x-center"
				 style="background-position-y: calc(100% + 5rem); background-image: url(assets/media/svg/illustrations/login-visual-5.svg)">
			</div>
			<!--end::Aside Bottom-->
		</div>
		<!--begin::Aside-->

		<!--begin::Content-->
		<div class="login-content flex-row-fluid d-flex flex-column p-10">
			<!--begin::Top-->
<%--			<div class="text-right d-flex justify-content-center">--%>
<%--&lt;%&ndash;				<div class="top-signin text-right d-flex justify-content-end pt-5 pb-lg-0 pb-10">&ndash;%&gt;--%>
<%--&lt;%&ndash;					<span class="font-weight-bold text-muted font-size-h4">Having issues?</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;					<a href="javascript:;" class="font-weight-bold text-primary font-size-h4 ml-2" id="kt_login_signup">Get Help</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;				</div>&ndash;%&gt;--%>
<%--				<!--begin::Aside header-->--%>

<%--				<!--end::Aside header-->--%>

<%--			</div>--%>

			<a href="javascript:;" class="text-center  mb-10">
				<img src="${ctxStatic}/images/logo.png" class="max-h-70px" alt=""/>
			</a>
			<!--end::Top-->
			<h3 class="font-weight-bolder text-center font-size-h4 font-size-h1-lg" style="color: #986923;">
				国家能源集团江苏电力有限公司<br>
				智慧企业统一认证平台
			</h3>

			<!--begin::Wrapper-->
			<div class="d-flex flex-row-fluid flex-center">

				<!--begin::Signin-->
				<div class="login-form">
					<!--begin::Form-->
					<form class="form" id="kt_login_singin_form" name="loginForm" action="${ctx}/login" method="post">
						<!--begin::Title-->
<%--						<div class="pb-5 pb-lg-15">--%>
<%--							<h3 class="font-weight-bolder text-dark font-size-h2 font-size-h1-lg">Sign In</h3>--%>
<%--							<div class="text-muted font-weight-bold font-size-h4">--%>
<%--								New Here?--%>
<%--								<a href="custom/pages/login/login-3/signup.html" class="text-primary font-weight-bolder">Create Account</a>--%>
<%--							</div>--%>
<%--						</div>--%>
						<!--begin::Title-->

						<!--begin::Form group-->
						<div class="form-group">
							<label class="font-size-h6 font-weight-bolder text-dark">用户名</label>
							<input class="form-control h-auto py-7 px-6 rounded-lg border-0" type="text" name="username" autocomplete="off"/>
						</div>
						<!--end::Form group-->

						<!--begin::Form group-->
						<div class="form-group">
							<div class="d-flex justify-content-between mt-n5">
								<label class="font-size-h6 font-weight-bolder text-dark pt-5">密码</label>

								<a href="custom/pages/login/login-3/forgot.html" class="text-primary font-size-h6 font-weight-bolder text-hover-primary pt-5">
									忘记密码 ?
								</a>
							</div>
							<input class="form-control h-auto py-7 px-6 rounded-lg border-0" type="password" name="password" autocomplete="off"/>
						</div>
						<!--end::Form group-->

						<!--begin::Action-->
						<div class="pb-lg-0 pb-5">
							<button type="submit" id="kt_login_singin_form_submit_button" onclick="submitForm()" class="btn btn-primary font-weight-bolder font-size-h6 px-8 py-4 my-3 mr-3">登录</button>

						</div>
						<!--end::Action-->
					</form>
					<!--end::Form-->
				</div>
				<!--end::Signin-->
			</div>
			<!--end::Wrapper-->
		</div>
		<!--end::Content-->
	</div>
	<!--end::Login-->
</div>
<!--end::Main-->

<!--begin::Global Theme Bundle(used by all pages)-->
<script src="${ctxStatic}/templates/2/assets/plugins/global/plugins.bundle.js"></script>
<script src="${ctxStatic}/templates/2/assets/plugins/custom/prismjs/prismjs.bundle.js"></script>
<script src="${ctxStatic}/templates/2/assets/js/scripts.bundle.js"></script>
<!--end::Global Theme Bundle-->


<!--begin::Page Scripts(used by this page)-->
<script src="${ctxStatic}/templates/2/assets/js/pages/custom/login/login-3.js"></script>
<!--end::Page Scripts-->
<script>var HOST_URL = "https://preview.keenthemes.com/metronic/theme/html/tools/preview";</script>
<!--begin::Global Config(global config for global JS scripts)-->
<script>
	var KTAppSettings = {
		"breakpoints": {
			"sm": 576,
			"md": 768,
			"lg": 992,
			"xl": 1200,
			"xxl": 1400
		},
		"colors": {
			"theme": {
				"base": {
					"white": "#ffffff",
					"primary": "#3699FF",
					"secondary": "#E5EAEE",
					"success": "#1BC5BD",
					"info": "#8950FC",
					"warning": "#FFA800",
					"danger": "#F64E60",
					"light": "#E4E6EF",
					"dark": "#181C32"
				},
				"light": {
					"white": "#ffffff",
					"primary": "#E1F0FF",
					"secondary": "#EBEDF3",
					"success": "#C9F7F5",
					"info": "#EEE5FF",
					"warning": "#FFF4DE",
					"danger": "#FFE2E5",
					"light": "#F3F6F9",
					"dark": "#D6D6E0"
				},
				"inverse": {
					"white": "#ffffff",
					"primary": "#ffffff",
					"secondary": "#3F4254",
					"success": "#ffffff",
					"info": "#ffffff",
					"warning": "#ffffff",
					"danger": "#ffffff",
					"light": "#464E5F",
					"dark": "#ffffff"
				}
			},
			"gray": {
				"gray-100": "#F3F6F9",
				"gray-200": "#EBEDF3",
				"gray-300": "#E4E6EF",
				"gray-400": "#D1D3E0",
				"gray-500": "#B5B5C3",
				"gray-600": "#7E8299",
				"gray-700": "#5E6278",
				"gray-800": "#3F4254",
				"gray-900": "#181C32"
			}
		},
		"font-family": "Poppins"
	};

</script>
<!--end::Global Config-->
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