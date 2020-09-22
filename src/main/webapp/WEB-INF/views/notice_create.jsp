<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

<c:if test="${userinfo.id != 'admin'}">
	<c:redirect url="/" />
</c:if>
<c:if test="${userinfo.id == 'admin'}">

<html>
<head>
<script type="text/javascript">
$(document).ready(function() {
	$("#createBtn").click(function() {
		
		if($("#title").val() == "") {
			alert("제목 입력!!!");
			return;
		} else if($("#content").val() == "") {
			alert("내용 입력!!!");
			return; 
		} else {
			$("#noticeForm").attr("action", "${root}/notice/create").submit();
		}
	});
});
</script>
</head>
<body>
<div align="center">
	<jsp:include page="header.jsp"></jsp:include>
	<br>
	
	<div class="col-sm-8" align="center">
		<form id="noticeForm" method="post" action="">
			<br>
			<h2>공지사항등록</h2>
			<br>
			<div class="form-group" align="left">
				<label for="">제목</label>
				<input type="text" class="form-control" id="title" name="title" placeholder="">
			</div>
			
			<div class="form-group" align="left">
				<label for="">내용</label>
				<textarea class="form-control" id="content" name="content" placeholder="" rows="18"
				style="width: 100%; overflow: visible; text-overflow: ellipsis; resize: none;"></textarea>
			</div>
			<div class="form-group" align="center">
				<button type="button" class="btn btn-primary" id="createBtn">등록</button>
				<button type="reset" class="btn btn-warning">초기화</button>
			</div>
		</form>
	</div>
</div>	
</c:if>
</body>
</html>