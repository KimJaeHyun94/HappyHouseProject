<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.0.5/gsap.min.js"></script>
    <script   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
  <style type="text/css">
 /* 
** ALL CREDIT GOES TO 
** Craig Buckler
** http://www.sitepoint.com/css3-starwars-scrolling-text/
**
** Blame me for the music via embedded video bit
*/

@import url(https://fonts.googleapis.com/css?family=Droid+Sans:400,700);

* { padding: 0; margin: 0; }

#starwars
{
  width: 100%;
  height: 100%;
  font-family: "Droid Sans", arial, verdana, sans-serif;
	font-weight: 700;
	color: #ff6;
	background-color: #000;
	overflow: hidden;
}

p#start
{
	position: relative;
	width: 16em;
	font-size: 200%;
	font-weight: 400;
	margin: 20% auto;
	color: #4ee;
	opacity: 0;
	z-index: 1;
	-webkit-animation: intro 2s ease-out;
	-moz-animation: intro 2s ease-out;
	-ms-animation: intro 2s ease-out;
	-o-animation: intro 2s ease-out;
	animation: intro 2s ease-out;
}

@-webkit-keyframes intro {
	0% { opacity: 1; }
	90% { opacity: 1; }
	100% { opacity: 0; }
}

@-moz-keyframes intro {
	0% { opacity: 1; }
	90% { opacity: 1; }
	100% { opacity: 0; }
}

@-ms-keyframes intro {
	0% { opacity: 1; }
	90% { opacity: 1; }
	100% { opacity: 0; }
}

@-o-keyframes intro {
	0% { opacity: 1; }
	90% { opacity: 1; }
	100% { opacity: 0; }
}

@keyframes intro {
	0% { opacity: 1; }
	90% { opacity: 1; }
	100% { opacity: 0; }
}

h1
{
	position: absolute;
	width: 2.6em;
	left: 50%;
	top: 70%;
	font-size: 10em;
	text-align: center;
	margin-left: -1.3em;
	line-height: 0.8em;
	letter-spacing: -0.05em;
	color: #000;
	text-shadow: -2px -2px 0 #ff6, 2px -2px 0 #ff6, -2px 2px 0 #ff6, 2px 2px 0 #ff6;
	opacity: 0;
	z-index: 1;
	-webkit-animation: logo 5s ease-out 2.5s;
	-moz-animation: logo 5s ease-out 2.5s;
	-ms-animation: logo 5s ease-out 2.5s;
	-o-animation: logo 5s ease-out 2.5s;
	animation: logo 5s ease-out 2.5s;
}

h1 sub
{
	display: block;
	font-size: 0.3em;
	letter-spacing: 0;
	line-height: 0.8em;
}

@-webkit-keyframes logo {
	0% { -webkit-transform: scale(1); opacity: 1; }
	50% { opacity: 1; }
	100% { -webkit-transform: scale(0.1); opacity: 0; }
}

@-moz-keyframes logo {
	0% { -moz-transform: scale(1); opacity: 1; }
	50% { opacity: 1; }
	100% { -moz-transform: scale(0.1); opacity: 0; }
}

@-ms-keyframes logo {
	0% { -ms-transform: scale(1); opacity: 1; }
	50% { opacity: 1; }
	100% { -ms-transform: scale(0.1); opacity: 0; }
}

@-o-keyframes logo {
	0% { -o-transform: scale(1); opacity: 1; }
	50% { opacity: 1; }
	100% { -o-transform: scale(0.1); opacity: 0; }
}

@keyframes logo {
	0% { transform: scale(1); opacity: 1; }
	50% { opacity: 1; }
	100% { transform: scale(0.1); opacity: 0; }
}

/* the interesting 3D scrolling stuff */
#titles
{
	position: absolute;
	width: 18em;
	height: 50em;
	bottom: 0;
	left: 50%;
	margin-left: -9em;
	font-size: 350%;
	text-align: justify;
	overflow: hidden;
	-webkit-transform-origin: 50% 100%;
	-moz-transform-origin: 50% 100%;
	-ms-transform-origin: 50% 100%;
	-o-transform-origin: 50% 100%;
	transform-origin: 50% 100%;
	-webkit-transform: perspective(300px) rotateX(25deg);
	-moz-transform: perspective(300px) rotateX(25deg);
	-ms-transform: perspective(300px) rotateX(25deg);
	-o-transform: perspective(300px) rotateX(25deg);
	transform: perspective(300px) rotateX(25deg);
}

#titles:after
{
	position: absolute;
	content: ' ';
	left: 0;
	right: 0;
	top: 0;
	bottom: 60%;
	background-image: -webkit-linear-gradient(top, rgba(0,0,0,1) 0%, transparent 100%);
	background-image: -moz-linear-gradient(top, rgba(0,0,0,1) 0%, transparent 100%);
	background-image: -ms-linear-gradient(top, rgba(0,0,0,1) 0%, transparent 100%);
	background-image: -o-linear-gradient(top, rgba(0,0,0,1) 0%, transparent 100%);
	background-image: linear-gradient(top, rgba(0,0,0,1) 0%, transparent 100%);
	pointer-events: none;
}

#titles p
{
	text-align: justify;
	margin: 0.8em 0;
}

#titles p.center
{
	text-align: center;
}

#titles a
{
	color: #ff6;
	text-decoration: underline;
}

#titlecontent
{
	position: absolute;
	top: 100%;
	-webkit-animation: scroll 100s linear 4s infinite;
	-moz-animation: scroll 100s linear 4s infinite;
	-ms-animation: scroll 100s linear 4s infinite;
	-o-animation: scroll 100s linear 4s infinite;
	animation: scroll 100s linear 4s infinite;
}

/* animation */
@-webkit-keyframes scroll {
	0% { top: 100%; }
	100% { top: -170%; }
}

@-moz-keyframes scroll {
	0% { top: 100%; }
	100% { top: -170%; }
}

@-ms-keyframes scroll {
	0% { top: 100%; }
	100% { top: -170%; }
}

@-o-keyframes scroll {
	0% { top: 100%; }
	100% { top: -170%; }
}

@keyframes scroll {
	0% { top: 100%; }
	100% { top: -170%; }
}

  </style>
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
<!-- ALL CREDIT FOR THE SCROLLING TEXT GOES TO 
     Craig Buckler
     http://www.sitepoint.com/css3-starwars-scrolling-text/ 

Blame me for the music via embedded video bit
-->
 <center>
      	<jsp:include page="header.jsp"></jsp:include>
  </center>
  <div id = "starwars">
<div style="overflow:hidden; position:relative; left:0; top:0; width:50px; height:25px;">
  <div style="margin-top:-290px;">
  <object width="420" height="315">
    <param name="movie" value="https://www.youtube.com/v/MkNeIUgNPQ8?version=3&amp;hl=en_US&autoplay=1&amp;autohide=2"></param>
    <param name="allowFullScreen" value="true"></param>
    <param name="allowscriptaccess" value="always"></param>
    <embed src="https://www.youtube.com/v/MkNeIUgNPQ8?version=3&amp;hl=en_US&autoplay=1&amp;autohide=2" type="application/x-shockwave-flash" width="420" height="315" allowscriptaccess="always" allowfullscreen="true"></embed>
  </object>
  </div>
</div>

<p id="start">Thank You!!!!!&hellip;</p>

<h1>Bye</h1>

<div id="titles">
  <div id="titlecontent">

    <p class="center">20/21시즌 맨유무관기원<br />
      SSAFY 서울 13반</p>
    <p>개발도구 및 기술 : Vue.js, BootStrap, MyBatis, Spring, Spring boot, Google API, MySQL, Visual Studio Code</p>  
    <p>개발 동기 : 내가 살고 싶은 좋은 집을 찾기위해 필요한 간단한 정보들을 빠르게 필요로 함, 집의 가격과 평수 같은 기본정보 뿐만 아니라 주변의 지형을 한눈에 보고 싶다</p>
    <p>기본 기술 : List 출력, QnA 게시판, 회원가입, 로그인 및 로그아웃, 아파트 이름 및 동 검색, 아파트 정보 자세히</p>
    <p>추가 기술 : Paging 적용, 지도 적용, 집 주변의 CCTV 지도 마커 표시, 공지사항, MyPage</p>
    <p>출처 : <a href="https://www.youtube.com/watch?v=8B8lFCJOerM">음악</a>, <a href=https://codepen.io>CSS 적용</a></p>
    <p>팀장 : 배현석, 조원 : 김재현, 사랑꾼♥임건호♥</p>
    </div>
    <iframe style="visibility:hidden" width="560" height="315" src="https://www.youtube.com/watch?v=MkNeIUgNPQ8" frameborder="0" allowfullscreen></iframe>
</div>
</div>
</body>
</html>