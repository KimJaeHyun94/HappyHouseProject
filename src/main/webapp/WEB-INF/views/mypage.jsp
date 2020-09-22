<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:if test="${userinfo == null}">
	<c:redirect url="/" />
</c:if>
<c:if test="${userinfo != null}">
<!DOCTYPE html>
<html>
<head>
<title>SSAFY-마이페이지</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$("#main").click(function(){
		$("#memberform").attr("action", "${root}/index").submit();
	});
	$("#modify").click(function(){
		$("#memberform").attr("action", "${root}/modify1").submit();
	});
	$("#delete").click(function(){
		$("#memberform").attr("action", "${root}/delete").submit();
	});
});
</script>

</head>
<body>
<div align="center">
	<jsp:include page="header.jsp"></jsp:include>
	<br>
	
	<div class="col-lg-6" align="center">
		<form id="memberform" method="post" action="">
		<input type="hidden" name="act" id="act" value="lookup">
			<h1>회원정보조회</h1>
			<div class="form-group" align="left">
				<label for="">아이디</label>
				<input type="text" class="form-control" id="id" name="id" placeholder="" readonly="readonly" value="${userinfo.id}">
			</div>
			<div class="form-group" align="left">
				<label for="">비밀번호</label>
				<input type="text" class="form-control" id="password" name="password" placeholder="" readonly="readonly" value="${userinfo.password}">
			</div>
			<div class="form-group" align="left">
				<label for="">이름</label>
				<input type="text" class="form-control" id="name" name="name" placeholder="" readonly="readonly" value="${userinfo.name}">
			</div>
			<div class="form-group" align="left">
				<label for="">주소</label>
				<input type="text" class="form-control" id="address" name="address" placeholder="" readonly="readonly" value="${userinfo.address}">
			</div>
			<div class="form-group" align="left">
				<label for="">핸드폰번호</label>
				<input type="text" class="form-control" id="phone" name="phone" placeholder="" readonly="readonly" value="${userinfo.phone}">
			</div>
			<div class="form-group" align="center">
				<button type="button" class="btn btn-warning" id="modify">회원정보수정</button>
				<button type="button" class="btn btn-danger" id="delete">회원탈퇴</button>
			</div>
		</form>
	</div>
</div>
</c:if>
</body>
</html>