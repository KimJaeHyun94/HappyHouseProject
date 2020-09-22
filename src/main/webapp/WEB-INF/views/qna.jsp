<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:if test="${userinfo == null}">
	<c:redirect url="/" />
</c:if>
<c:if test="${userinfo != null}">

<!DOCTYPE html>
<html lang=en>
<head>
<meta charset=utf-8>
<meta http-equiv=X-UA-Compatible content="IE=edge">
<meta name=viewport content="width=device-width,initial-scale=1">
<link rel=icon href=/favicon.ico>
<link rel=stylesheet
	href=https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css>
<script
	src=https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js></script>
<script
	src=https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js></script>
<script
	src=https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js></script>
<title>vue-qna</title>
<link href=./css/app.60908a9b.css rel=preload as=style>
<link href=./js/app.5355d25c.js rel=preload as=script>
<link href=./js/chunk-vendors.4acb195f.js rel=preload as=script>
<link href=./css/app.60908a9b.css rel=stylesheet>
</head>
<body>
	<noscript>
		<strong>We're sorry but vue-qna doesn't work properly without
			JavaScript enabled. Please enable it to continue.</strong>
	</noscript>
	<div id=app></div>
	<script src=./js/chunk-vendors.4acb195f.js></script>
	<script src=./js/app.5355d25c.js></script>
</c:if>
</body>
</html>