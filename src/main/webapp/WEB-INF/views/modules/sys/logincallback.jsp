<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=8,IE=edge">
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script>
		var token='${requestScope.t}';
		var code='${requestScope.code}';
		localStorage.setItem('t',token);
		localStorage.setItem('code',code);
		var referer='${requestScope.referer}';
        window.location = referer;
	</script>
</head>
<body>

</body>
</html>