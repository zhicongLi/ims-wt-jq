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


	<!-- Vendor CSS -->
	<link rel="stylesheet" href="${ctxStatic}/templates/4/vendor/bootstrap/css/bootstrap.css" />
	<link rel="stylesheet" href="${ctxStatic}/templates/4/vendor/animate/animate.css">

	<link rel="stylesheet" href="${ctxStatic}/templates/4/vendor/font-awesome/css/all.min.css" />
	<link rel="stylesheet" href="${ctxStatic}/templates/4/vendor/magnific-popup/magnific-popup.css" />
	<link rel="stylesheet" href="${ctxStatic}/templates/4/vendor/bootstrap-datepicker/css/bootstrap-datepicker3.css" />

	<!-- Theme CSS -->
	<link rel="stylesheet" href="${ctxStatic}/templates/4/css/theme.css" />

	<!-- Skin CSS -->
	<link rel="stylesheet" href="${ctxStatic}/templates/4/css/skins/default.css" />

	<!-- Theme Custom CSS -->
	<link rel="stylesheet" href="${ctxStatic}/templates/4/css/custom.css">

	<!-- Head Libs -->
	<script src="${ctxStatic}/templates/4/vendor/modernizr/modernizr.js"></script>

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
				document.getElementById("loginForm").submit();
			}
		}
	</script>


</head>
<body>
<!-- start: page -->
<section class="body-sign">
	<div class="center-sign">
		<a href="javascript:;" class="logo float-left">
			<img src="${ctxStatic}/images/logo.png" height="54" alt="Porto Admin" />
		</a>

		<div class="panel card-sign">
			<div class="card-title-sign mt-3 text-right">
				<h2 class="title text-uppercase font-weight-bold m-0"><i class="fas fa-user mr-1"></i> 登录</h2>
			</div>
			<div class="card-body">
				<form    id="loginForm" name="loginForm" action="${ctx}/login"  method="post">
					<div class="form-group mb-3">
						<label>用户名</label>
						<div class="input-group">
							<input id="username" name="username" type="text"  placeholder="用户名" class="form-control form-control-lg" />
							<span class="input-group-append">
										<span class="input-group-text">
											<i class="fas fa-user"></i>
										</span>
									</span>
						</div>
					</div>

					<div class="form-group mb-3">
						<div class="clearfix">
							<label class="float-left">密码</label>
							<a href="pages-recover-password.html" class="float-right">Lost Password?</a>
						</div>
						<div class="input-group">
							<input type="password" id="password" name="password" placeholder="密码" class="form-control form-control-lg" />
							<span class="input-group-append">
										<span class="input-group-text">
											<i class="fas fa-lock"></i>
										</span>
									</span>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-8">
							<div class="checkbox-custom checkbox-default">
								<input id="RememberMe" name="rememberme" type="checkbox"/>
								<label for="RememberMe">记住我</label>
							</div>
						</div>
						<div class="col-sm-4 text-right">
							<button type="submit" class="btn btn-primary mt-2" onclick="submitForm()" >登录</button>
						</div>
					</div>

<%--					<span class="mt-3 mb-3 line-thru text-center text-uppercase">--%>
<%--								<span>or</span>--%>
<%--							</span>--%>

<%--					<div class="mb-1 text-center">--%>
<%--						<a class="btn btn-facebook mb-3 ml-1 mr-1" href="#">Connect with <i class="fab fa-facebook-f"></i></a>--%>
<%--						<a class="btn btn-twitter mb-3 ml-1 mr-1" href="#">Connect with <i class="fab fa-twitter"></i></a>--%>
<%--					</div>--%>

<%--					<p class="text-center">Don't have an account yet? <a href="pages-signup.html">Sign Up!</a></p>--%>

				</form>
			</div>
		</div>

		<p class="text-center text-muted mt-3 mb-3">&copy; Copyright 2020. All Rights Reserved.</p>
	</div>
</section>
<!-- end: page -->



<!-- Vendor -->
<script src="${ctxStatic}/templates/4/vendor/jquery/jquery.js"></script>
<script src="${ctxStatic}/templates/4/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
<script src="${ctxStatic}/templates/4/vendor/popper/umd/popper.min.js"></script>
<script src="${ctxStatic}/templates/4/vendor/bootstrap/js/bootstrap.js"></script>
<script src="${ctxStatic}/templates/4/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="${ctxStatic}/templates/4/vendor/common/common.js"></script>
<script src="${ctxStatic}/templates/4/vendor/nanoscroller/nanoscroller.js"></script>
<script src="${ctxStatic}/templates/4/vendor/magnific-popup/jquery.magnific-popup.js"></script>
<script src="${ctxStatic}/templates/4/vendor/jquery-placeholder/jquery.placeholder.js"></script>

<!-- Theme Base, Components and Settings -->
<script src="${ctxStatic}/templates/4/js/theme.js"></script>

<!-- Theme Custom -->
<script src="${ctxStatic}/templates/4/js/custom.js"></script>

<!-- Theme Initialization Files -->
<script src="${ctxStatic}/templates/4/js/theme.init.js"></script>
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