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
<title>SSAFY-회원가입</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$("#registerBtn").click(function() {
		
		if($("#name").val() == "") {
			alert("이름 입력!!!");
			return;
		} else if($("id").val() == "") {
			alert("아이디 입력!!!");
			return;
		} else if($("#address").val() == "") {
			alert("주소 입력!!!");
			return;
		} else if($("#phone").val() == "") {
			alert("핸드폰 번호 입력!!!");
			return;
		} else if($("#password").val() == "") {
			alert("비밀번호 입력!!!");
			return;
		} else {
			$("#memberform").attr("action", "${root}/modify2").submit();
		}
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
		<input type="hidden" name="act" id="act" value="modify">
			<h1>회원정보수정</h1>
			<div class="form-group" align="left">
				<label for="">아이디</label>
				<input type="text" class="form-control" id="id" name="id" placeholder="" readonly="readonly" value="${userinfo.id}">
			</div>
			<div class="form-group" align="left">
				<label for="">비밀번호</label>
				<input type="password" class="form-control" id="password" name="password" placeholder="">
			</div>
			<div class="form-group" align="left">
				<label for="">이름</label>
				<input type="text" class="form-control" id="name" name="name" placeholder="">
			</div>
			<div class="form-group" align="left">
				<label for="">주소</label>
				<input type="text" class="form-control" id="address" name="address" placeholder="">
			</div>
			<div class="form-group" align="left">
				<label for="">핸드폰번호</label>
				<input type="text" class="form-control" id="phone" name="phone" placeholder="">
			</div>
			<div class="form-group" align="center">
				<button type="button" class="btn btn-primary" id="registerBtn">수정</button>
				<button type="reset" class="btn btn-warning">초기화</button>
			</div>
		</form>
	</div>
</div>

</c:if>
</body>
</html>