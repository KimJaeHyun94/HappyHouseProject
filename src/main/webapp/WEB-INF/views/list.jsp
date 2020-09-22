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
         getSelected();
      });
      //이전에 selectBox에서 선택한 내용으로 설정
      function getSelected(){
         $('#selectBox').val("${key}")
         console.log("${key}");
      }
      
      //원하는 페이지로 이동할 때 사용
      function pageMove(pg) { 
         document.getElementById("pg").value=pg;
         document.getElementById("pageform").action = "${root}/list";
         document.getElementById("pageform").submit();
      }
   </script>
</head>
<body>
   <center>
      	<jsp:include page="header.jsp"></jsp:include>
		<br>	
      	 <h1>거래목록</h1>  	
         <br>
		<form id="pageform" method = "post" action="list">
            <input type = "hidden" name="act" value="list">
            <select id="selectBox" name="key" id="key">
               <option value="all">---선택하세요---</option>
               <option value="dong">동</option>
               <option value="name">아파트 이름</option>
            </select> 
            <input type = "hidden" id="pg" name="pg" value="1">
            <input type="text" id="word" name="word" value="${word}"/> 
            <input type="submit" value="검색">
         </form>
         <div class = "col-sm-1"></div>
         
         <div class = "col-sm-10">
       		<br>
      		<TABLE class="table table-striped" style="text-align: center; ">
            
               <TR>
                  <th width="10%" bgcolor=#113366 align=center><font color=#ffffee size=2>번호</th>
                  <th width="25%" bgcolor=#113366 align=center><font color=#ffffee size=2>동</th>
                  <th width="65%" bgcolor=#113366 align=center><font color=#ffffee size=2>아파트이름</th>
               </TR>
               <c:forEach items="${deals }" var="deal">
               <tr>
                  <td>&nbsp;<font size=2>${deal.no }</td>
                  <td>&nbsp;<font size=2>${deal.dong }</td>
   
                  <td>&nbsp;<font size=2> 
                     <a href="${root}/read?no=${deal.no }&pg=${pg}&key=${key}&word=${word}">${deal.aptName }
                  </td>
               </tr>
               </c:forEach>
            </table>
            <table style="text-align: center; ">
                 <tr>
                    <td>
                    <!-- page 출력부분 -->
                    ${navigation.navigator}
                    </td>
                 </tr>
            </table>
         
         </div>
         
         <div class="col-sm-1"></div>
</c:if>


</body>
</html>