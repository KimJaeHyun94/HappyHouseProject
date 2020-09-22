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
			List();
			Delete();
			
			$('#createBtn').click(function(){
				location.href='${root}/notice/create';
			});
			$('#listBtn').click(function(){
				location.href='${root}/list?pg=1';
			});
			
		});
		
		function List(){
			$.ajax({
				url : 'notice_rest',
				type: 'GET',
				dataType : 'json',
				
				success: function(data){
					$('thead').empty();
					$('tbody').empty();
					//session에서 userinfo를 가져옴
					let id = '<%=session.getAttribute("userinfo")%>';
					if(id!="admin"){
						$('<tr>')
						.append($('<th width=15% bgcolor=#113366 align=center>').html('<font color=#ffffee size=2>번호'))
						.append($('<th width=55% bgcolor=#113366>').html('<font color=#ffffee size=2>제목'))
						.append($('<th width=20% bgcolor=#113366>').html('<font color=#ffffee size=2>등록일'))
						.append($('<th width=10% bgcolor=#113366 align=center>').html('<font color=#ffffee size=2>조회수'))
						.appendTo('thead');
					}else{
						$('<tr>')
						.append($('<th width=10% bgcolor=#113366 align=center>').html('<font color=#ffffee size=2>번호'))
						.append($('<th width=50% bgcolor=#113366>').html('<font color=#ffffee size=2>제목'))
						.append($('<th width=20% bgcolor=#113366>').html('<font color=#ffffee size=2>등록일'))
						.append($('<th width=10% bgcolor=#113366 align=center>').html('<font color=#ffffee size=2>조회수'))
						.append($('<th width=10% bgcolor=#113366 align=center>').html('<font color=#ffffee size=2>체크'))
						.appendTo('thead');
						
					}
					
					
					
					$.each(data, function(idx, notice){
						
						if(id!="admin"){
							$('<tr id="notice">')
							.append($('<td id="no">').html('&nbsp;<font size=2>'+notice.no))
							.append($('<td>').html('<font size=2><a href=${root}/notice/'+notice.no +'>'+notice.title+'</a>'))
							.append($('<td>').html('&nbsp;<font size=2>'+notice.date))
							.append($('<td>').html('&nbsp;<font size=2>'+notice.count))
							.appendTo('tbody');
						}else{
							
							$('<tr id="notice">')
							.append($('<td id="no">').html('&nbsp;<font size=2>'+notice.no))
							.append($('<td>').html('<font size=2><a href=${root}/notice/'+notice.no +'>'+notice.title+'</a>'))
							.append($('<td>').html('&nbsp;<font size=2>'+notice.date))
							.append($('<td>').html('&nbsp;<font size=2>'+notice.count))
							.append($('<td>').html('<input type=checkbox id=delete_notices name=delete_notices value='+notice.no+'>'))
							.appendTo('tbody');
						}
					});
				}
			});
		}
		
		function Delete(){
			$('#deleteBtn').on('click',function(){
				let nums = [];
				$("#delete_notices:checked").each(function(){
					var no = $(this).val();
					if(no != null) nums.push(no);
				});
				
				if(nums.length>0){
					$.ajax({
						url : 'notice/',
						type : 'DELETE',
						data: JSON.stringify(nums),
						contentType: 'application/json',
						dataType : 'json',//The data type from server			
						success : function(data) {
							List();
						}
					});	
				}
			});
		}
	</script>
</head>
<body>
	<div>
		<jsp:include page="header.jsp"></jsp:include>
		<br>
		<div class=row>
			<div class = "col-sm-2"></div>
		
			<div class = "col-sm-8">
			<h2 style="text-align: center;">공지사항</h2>
			<br>
			<TABLE class="table table-striped" style="text-align: left;">
				<thead></thead>
				
				<tbody></tbody>
			</table>
			<c:if test="${userinfo.id == 'admin'}">
				<div style="text-align: center;">
					<button id="createBtn" class="btn btn-primary">공지추가</button>
					<button id="deleteBtn" class="btn btn-danger">삭제</button>
				</div>
			</c:if>
			</div>
		
			<div class="col-sm-2"></div>
		</div>
	</div>

</c:if>
</body>
</html>