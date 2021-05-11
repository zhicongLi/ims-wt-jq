<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html lang="zh-cn">
<head>
	<title>${fns:getConfig('productName')} 登录</title>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="decorator" content="base"/>
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/login/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/login/css/login.css">
	<!--[if lt IE 9]>
	<script src="${ctxStatic}/js/html5shiv.min.js"></script>
	<script src="${ctxStatic}/js/respond.min.js"></script>
	<![endif]-->
	<script type="text/javascript">
		
		$(document).ready(function() {
			$("#loginForm").validate({

				messages: {
					username: {required: "请填写用户名."},password: {required: "请填写密码."}
				},
				errorLabelContainer: "#messageBox",
				errorPlacement: function(error, element) {
					error.appendTo($("#loginError").parent());
				}
			});
			var message = '${message}';
		/*	if(message==''){
				$("#message").css("visibility","hidden");
				$("#loginError").css("visibility","hidden");
			}else{
				$("#message").css("visibility","visible");
				$("#loginError").css("visibility","visible");
			}*/
			if(message==''){
				$("#message").hide();
				$("#loginError").hide();
			}else{
				$("#message").show();
				$("#loginError").show();
			}
		});
		// 如果在框架或在对话框中，则弹出提示并跳转到首页
		if(self.frameElement && self.frameElement.tagName == "IFRAME" || $('#left').length > 0 || $('.jbox').length > 0){
			alert('未登录或登录超时。请重新登录，谢谢！');
			top.location = "${ctx}";
		}
		//////////////////////////////////////
         function CookieGet (sName) {
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
            };
            function CookieSet(name, value, expires, domain) {
                var LargeExpDate = new Date();
                if (expires != null) {


                    LargeExpDate = new Date(LargeExpDate.getTime() + (expires * 1000 * 3600 * 24));
                }

                document.cookie = name + "=" + escape(value) + ((expires == null) ? "" : ("; expires=" + LargeExpDate.toGMTString())) + ";path=/" + (domain ? "; domain=" + domain : "");
            };
            function CookieDel(name, domain) {
                CookieSet(name, null, -100, domain);
            };


        function onSkinChange(skin) {
            CookieSet('miniuiSkin', skin,300);
            //mini.Cookie.set('miniuiSkin', skin, 100);//100天过期的话，可以保持下次登录也是切换后的效果
            window.location.reload()
        }
        function onModeChange(skin) {
            CookieSet('miniuiMode', skin,300);
            //mini.Cookie.set('miniuiMode', skin, 100);//100天过期
            window.location.reload()
        }
        function onOptiStyleChange(value) {
            CookieSet('optiStyle', value,300);
            //mini.Cookie.set('miniuiMode', skin, 100);//100天过期
            window.location.reload()
        }
        window.onload = function () {
            var skin = CookieGet("miniuiSkin");
            if (skin) {
                var selectSkin = document.getElementById("selectSkin");
                selectSkin.value = skin;
            }
            var mode = CookieGet("miniuiMode");
            if (mode) {
                var select = document.getElementById("selectMode");
                select.value = mode;
            }
            var optiStyle = CookieGet("optiStyle");
              if (optiStyle) {
                var optiStyleObj = document.getElementById("optiStyle");
                  if (optiStyle=='true') {
                      optiStyleObj.checked = true;
                  }else{
                      optiStyleObj.checked = false;
				  }
              }

        }

	</script>
	<style type="text/css">
		body {background: #FFF url('${ctxStatic}/login/imgs/${fns:getConfig("loginBgImage")}') no-repeat  center -40px;overflow:hidden;}
		.sumbit {width:584px;height:476px;margin:0 auto; background: transparent url('${ctxStatic}/login/imgs/${fns:getConfig("loginInputBgImage")}') no-repeat top left;}

		select{


			appearance:none;
			-moz-appearance:none;    /*for firefox*/
			-webkit-appearance:none;    /*for chrome*/

			padding-right: 2px;
			color:#FFF;
			font-size: 14px;


			overflow: hidden;

		}
	</style>
</head>
<body>
	<!--[if lte IE 6]><br/><div class='alert alert-block' style="text-align:left;padding-bottom:10px;"><a class="close" data-dismiss="alert">x</a><h4>温馨提示：</h4><p>你使用的浏览器版本过低。为了获得更好的浏览体验，我们强烈建议您 <a href="http://browsehappy.com" target="_blank">升级</a> 到最新版本的IE浏览器，或者使用较新版本的 Chrome、Firefox、Safari 等。</p></div><![endif]-->
	<div class="header">

	</div>
	<div class="blk-center clearfix">
	<%--<h1 class="form-signin-heading">${fns:getConfig('productName')}</h1>--%>
		<form id="loginForm" class="sumbit" action="${ctx}/login" method="post" autocomplete="off">

		<div class="user-info">
			
			<div class="ip-s"><i class="ico-user"></i><input type="text" autocomplete="off" id="username" name="username" value="${username}"></div>
			<div class="ip-s"><i class="ico-pw"></i><input type="password"  autocomplete="off" id="password" name="password"></div>
			<%--<label class="ip-s" for="username">登录名</label>--%>
			<%--<input type="text" id="username" name="username" value="${username}">--%>
			<%--<label class="ip-s" for="password">密码</label>--%>
			<%--<input type="password" id="password" name="password">--%>
			<%--<c:if test="${isValidateCodeLogin}"><div class="validateCode">--%>
				<%--<label class="input-label mid" for="validateCode">验证码</label>--%>
				<%--<sys:validateCode name="validateCode" inputCssStyle="margin-bottom:0;"/>--%>
			<%--</div></c:if>--%>
			<div id="messageBox" class="alert alert-error" >
				<label id="loginError" class="error">${message}</label>
			</div>
		 </div>
		<div class="user-btn"><input type="submit" class="login-btn" value="登 录"/></div>
		<div class="user-sel"><label for="rememberMe" title="下次不需要再登录"><input   type="checkbox" id="rememberMe" name="rememberMe" ${rememberMe ? 'checked' : ''}/> 记住我（公共场所慎用）</label></div>

		<%--<input class="btn btn-large btn-primary" type="submit" value="登 录"/>&nbsp;&nbsp;--%>
		<%--<label for="rememberMe" title="下次不需要再登录"><input type="checkbox" id="rememberMe" name="rememberMe" ${rememberMe ? 'checked' : ''}/> 记住我（公共场所慎用）</label>--%>
		<%--<div id="themeSwitch" class="dropdown">--%>
			<%--<a class="dropdown-toggle" data-toggle="dropdown" href="#">${fns:getDictLabel(cookie.theme.value,'theme','默认主题')}<b class="caret"></b></a>--%>
			<%--<ul class="dropdown-menu">--%>
			  <%--<c:forEach items="${fns:getDictList('theme')}" var="dict"><li><a href="#" onclick="location='${pageContext.request.contextPath}/theme/${dict.value}?url='+location.href">${dict.label}</a></li></c:forEach>--%>
			<%--</ul>--%>
			<%--<!--[if lte IE 6]><script type="text/javascript">$('#themeSwitch').hide();</script><![endif]-->--%>
		<%--</div>--%>

			<div style="position:relative;top:13.6em;left:100px;background:transparent;color:#FFF; " >
				主题：
				<select id="selectSkin" onchange="onSkinChange(this.value)" style="color:#000;"   >
					<optgroup label="传统风格">
						<option value="default"  style="background-color:#E7EAEE">系统</option>
						<option value="blue" style="background-color:#d4e2f1">浅蓝</option>
						<option value="pure" style="background-color:#fbfbfb">纯净</option>
						<option value="gray" style="background-color:#F3F3F3">灰色</option>
						<option value="olive2003" style="background-color:#cfd9a3">橄榄色</option>
						<option value="blue2003" style="background-color:#81a9e2" >蓝色</option>
						<option value="blue2010"  style="background-color:#e4effa">天蓝色</option>
						<option value="bootstrap" style="background-color:#fbfbfb">简约</option>
						<option value="treps" style="background-color:#fbfbfb">简约定制</option>
						<option value="jqueryui-cupertino" style="background-color:#f2f5f7">梦幻天蓝</option>
						<option value="jqueryui-smoothness" style="background-color:#f5f5f5">浅灰平滑</option>
					</optgroup>
					<optgroup label="扁平风格">
						<option value="cupertino" style="background-color:#deedf7" selected>梦幻天蓝(推荐)</option>
						<option value="metro-white" style="background-color:#fff" >优雅白</option>
						<option value="metro-green" style="background-color:#dae5bb">优雅绿</option>
						<option value="metro-orange" style="background-color:#f3dea2">优雅橘色</option>
						<option value="metro-gray" style="background-color:#ddd">优雅灰色</option>
						<option value="metro-blue" style="background-color:#d3e1f1">优雅蓝色</option>
					</optgroup>
				</select>

				尺寸：
				<select id="selectMode" onchange="onModeChange(this.value)" style="color:#000;" >
					<option value="default">较小</option>
					<option value="medium" selected >适中(推荐)</option>
					<option value="large">较大</option>
				</select>
			</div>
			<div style="position:relative;top:13.6em;left:100px;background:transparent;color:#FFF; " >

				<label for="optiStyle" title="优化风格(个人颜色显示较浅时可开启，来增强部分颜色显示对比度)"><input   type="checkbox" checked="checked" id="optiStyle" name="optiStyle" onchange="onOptiStyleChange(this.checked)" /> 优化风格(增强部分颜色显示对比度)</label>
			</div>
	</form>

		</div>
	
	<div class="blk-center clearfix">
		<div class="login-footer">
			Copyright &copy; 2015-${fns:getConfig('copyrightYear')} <a href="${pageContext.request.contextPath}${fns:getFrontPath()}">${fns:getConfig('productName')}</a> - Powered By <a href="http://treps.com" target="_blank">treps</a> ${fns:getConfig('version')}
		</div>
	</div>

	<%--<script src="${ctxStatic}/flash/zoom.min.js" type="text/javascript"></script>--%>


</body>
</html>