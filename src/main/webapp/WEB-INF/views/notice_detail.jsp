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

<c:if test="${userinfo == null}">
	<c:redirect url="/" />
</c:if>
<c:if test="${userinfo != null}">
<html>
<head>
	<script type="text/javascript">
		$(document).ready(function(){
			$('#listBtn').click(function(){
				$('#noticeForm').attr('action',"${root}/notice");
			});
			$('#modifyBtn').click(function(){
				$('#noticeForm').attr('action',"${root}/notice/modify");
			});
		});
	</script>
	
	<style type="text/css">
		h2, #noticeForm{
			text-align: center;
		}
		#title{
			font-size: 20;
			font-weight: 550;
		}
		
	</style>
</head>
<body>
	<div>
		<jsp:include page="header.jsp"></jsp:include>
		<br>
		<div class="row">
			<div class = "col-sm-2"></div>
			
			<div class = "col-sm-8">
				<h2>공지사항</h2>
				<br>
				<p id="title">&nbsp;${notice.title}</p>
				<p>&nbsp;작성일: ${notice.date}&nbsp;작성자: 관리자 </p> 
				<hr>
				${notice.content}
				<hr>
				<br>
				
				<form id="noticeForm" method="post" action="">
					<button id="listBtn" class="btn btn-primary">목록</button>
					<c:if test="${userinfo.id == 'admin'}">
						<button id="modifyBtn" class="btn btn-warning">수정</button>
						<input type="hidden" id="no" name="no" value="${notice.no}">
						<input type="hidden" id="title" name="title" value="${notice.title}">
						<input type="hidden" id="content" name="content" value="${notice.content}">
					</c:if>
				</form>
				
			</div>
			
			<br>
			<div class="col-sm-2"></div>
		</div>
	</div>
</c:if>

</body>
</html>