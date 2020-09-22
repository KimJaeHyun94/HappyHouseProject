<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<c:if test="${userinfo == null}">
	<c:redirect url="/" />
</c:if>
<c:if test="${userinfo != null}">
	<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="http://maps.google.com/maps/api/js?key=AIzaSyB8grAj7r7Y0Xy7uDqWCmIg6ZD-b-QtdaY"></script>

<style type="text/css">
table {
	border: 1px solid black;
	border-collapse: collapse;
}

tr, td {
	border: 1px solid black;
}

td:nth-child(2n) {
	background-color: #bbdefb;
}

td:nth-child(2n+1) {
	background-color: #e3f2fd;
}

#map_ma {
	width: 70%;
	height: 400px;
	clear: both;
	border: solid 1px red;
}
</style>

</head>
<body>
	<center>
		<jsp:include page="header.jsp"></jsp:include>
		<br>
		<h1>아파트 거래 정보</h1>

		<!-- *********요기********** -->
		<script type="text/javascript">
				let arr = [];			
				<c:forEach items="${cctvs}" var="cctv">
	                arr.push('{ "no":"${cctv.no}",'+
	                '"dong":"${cctv.dong}",'+	
	                '"purpose":"${cctv.purpose }",'+
	                '"lat":"${cctv.lat}",'	+
	                '"lng":"${cctv.lng}"}'
	                );
	            </c:forEach>	           
	        </script>
		<br>
		<br>
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<div id="map" style="width: 95%; height: 95%;"></div>

					<script type="text/javascript">
					var myLatlng = new google.maps.LatLng(${deal.lat}, ${deal.lng});
					var map = new google.maps.Map(document.getElementById('map'), {
						zoom : 18,
						center : myLatlng,
						mapTypeId : google.maps.MapTypeId.ROADMAP
					});

					var infowindow = new google.maps.InfoWindow();
					var markerTitle = "현재 위치"; 
                    var image = "img/icon.png";

					var marker = new google.maps.Marker(
							{
								position : myLatlng,
								map : map,
								title : markerTitle,
								icon : image
							});
					var contentString = '<div>'
						+ '<h2>'+'${deal.aptName}'+'</h2>'
						+ '</div>';
					
					var locations = new Array();
					for (var i = 0; i < arr.length; i++) {
						locations[i] = JSON.parse(arr[i]).purpose;
					}
					google.maps.event.addListener(marker, 'click',
								(function(marker) {
									return function() {
										infowindow.setContent(contentString);
										infowindow.open(map, marker);
									}
								})(marker));
					var i;
					image = "img/cctv2.jpg";
					console.log(arr.length);
					
					for(i = 0; i < arr.length;i++){
					    var json = JSON.parse(arr[i]);  
						marker = new google.maps.Marker({
					        id:i,
					        position: new google.maps.LatLng(json.lat, json.lng),
					        map: map,
					        icon : image
					      });
					      google.maps.event.addListener(marker, 'click', (function(marker, i) {
					        return function() {
					          infowindow.setContent(locations[i]);
					          infowindow.open(map, marker);
					        }
					      })(marker, i));
					 }
					  </script>

				</div>
				<div class="col-sm-6">
					<div>
						<img src="img/${imgsrc}" width="90%">
					</div>
					<br>
					<TABLE style="text-align: center;">
						<TR>
							<TD width=150 align=center>주택명</TD>
							<TD width=550 align=center>${deal.aptName }</TD>
						</TR>
						<TR>
							<TD width=150 align=center>거래금액</TD>
							<TD width=550 align=center>${deal.dealAmount }</TD>
						</TR>

						<TR>
							<TD width=150 align=center>건축년도</TD>
							<TD width=550 align=center>${deal.buildYear }</TD>
						</TR>
						<TR>
							<TD width=150 align=center>전용면적</TD>
							<TD width=550 align=center>${deal.area }</TD>
						</TR>
						<TR>
							<TD width=150 align=center>거래일</TD>
							<TD width=550 align=center>${deal.dealYear }년${deal.dealMonth }월
								${deal.dealDay }일</TD>
						</TR>
						<TR>
							<TD width=150 align=center>법정동</TD>
							<TD width=550 align=center>${deal.dong }</TD>
						</TR>
					</TABLE>

				</div>
			</div>
			<br>
			<br>
			<br>
		</div>
</c:if>
</center>
</body>
</html>