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

<html>
<head>
<style type="text/css">
	.nav-item{
		margin-right: 50px;
	}		
</style>
</head>
<body>
		
		<br>
		<div style="text-align: center">
			<a href="${root }/"><img src="${root}/img/happyhouse.png"></a>
      	</div>
      	<div>
		   	<div style="text-align: right;">
	      		<strong>${userinfo.name}</strong>님 환영합니다.
	      		<a href="${root }/logout">로그아웃</a> 
	        </div>
	       <nav class="navbar navbar-expand-sm bg-dark navbar-dark justify-content-center">
	       		<ul class="navbar-nav">
		       		<li class="nav-item">
			       		<a class="nav-link" href="${root }/list?pg=1">거래목록</a>
			     	</li>
			      	<li class="nav-item">
			      		<a class="nav-link" href="${root }/notice">공지사항</a>
			      	</li>
			      	<li class="nav-item">
			       		<a class="nav-link" href="${root }/qna">QnA</a>
			       	</li>
			    	<li class="nav-item" >
			     		<a class="nav-link" href="${root }/mypage">마이페이지</a>
			      	</li>
			      	<li class="nav-item" >
			     		<a class="nav-link" href="${root }/info">제작자</a>
			      	</li>
			    </ul>
			</nav>	       	
	    <br>
      	</div>
</body>
</html>