<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>${fns:getConfig('productName')} 登录</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="shortcut icon" href="${ctxStatic}/images/favicon.ico" />
	<link rel="stylesheet" href="${ctxStatic}/templates/1/font/iconsmind-s/css/iconsminds.css" />
	<link rel="stylesheet" href="${ctxStatic}/templates/1/font/simple-line-icons/css/simple-line-icons.css" />

	<link rel="stylesheet" href="${ctxStatic}/templates/1/css/vendor/bootstrap.min.css" />
	<link rel="stylesheet" href="${ctxStatic}/templates/1/css/vendor/bootstrap.rtl.only.min.css" />
	<link rel="stylesheet" href="${ctxStatic}/templates/1/css/vendor/bootstrap-float-label.min.css" />
	<link rel="stylesheet" href="${ctxStatic}/templates/1/css/main.css" />
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
	<style>

		input:-webkit-autofill,
		input:-webkit-autofill:hover,
		input:-webkit-autofill:focus,
		input:-webkit-autofill:active  {
			-webkit-box-shadow: 0 0 0 30px var(--foreground-color) inset !important;
		}

	</style>

</head>
<body class="background show-spinner no-footer">
<div class="fixed-background"></div>
<main>
	<div class="container">
		<div class="row h-100">
			<div class="col-12 col-md-10 mx-auto my-auto">
				<div class="card auth-card">
					<div class="position-relative image-side ">

						<p class=" text-white h2">TREPS</p>

						<p class="white mb-0">
							心有多大，
							<br>舞台就有多大

						</p>
                        <p class="white mb-0">

                        </p>
                        <p class="white mb-0">
                            <a href="#" class="white">注册</a>.
                        </p>
                        <p class="white mb-0">

                        </p>
						<p class="white mb-0">

							Copyright &copy; 2015-${fns:getConfig('copyrightYear')} <a href="${pageContext.request.contextPath}${fns:getFrontPath()}">${fns:getConfig('productName')}</a>
						</p>
					</div>
					<div class="form-side">
<%--						<a href="Dashboard.Default.html">--%>
<%--							<span class="logo-single"></span>--%>
<%--						</a>--%>
<%--						<div id="messageBox" class="alert alert-error" >--%>
<%--							<label id="loginError" class="error">${message}</label>--%>
<%--						</div>--%>
						<h6 class="mb-4">登录</h6>
						<form id="loginForm" name="loginForm" action="${ctx}/login" method="post" autocomplete="off">
							<label class="form-group has-float-label mb-4">
								<input class="form-control" id="username" name="username" value="${username}" />
								<span>用户名</span>
							</label>

							<label class="form-group has-float-label mb-4">
								<input class="form-control" type="password" id="password" name="password" autocomplete="off" placeholder="" />
								<span>密码</span>
							</label>
							<div class="d-flex justify-content-between align-items-center">
								<a href="#">忘记密码?</a>
								<button class="btn btn-primary btn-lg btn-shadow" onclick="submitForm()" >登录</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
<script src="${ctxStatic}/templates/1/js/vendor/jquery-3.3.1.min.js"></script>
<script src="${ctxStatic}/templates/1/js/vendor/bootstrap.bundle.min.js"></script>
<script src="${ctxStatic}/templates/1/js/dore.script.js"></script>
<script src="${ctxStatic}/templates/1/js/scripts.js"></script>

<script>

	$(function(){
		if(window.top != window.self){
			top.location.href = location.href;
		}
	});

</script>
</body>

</html>