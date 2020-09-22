<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<style>
body {
  margin:0;
  background: #41740e;
}

#catch_screen {
   width: 70%;
   height: 400px;
     padding-top: 110px;
   background: url("https://github.com/ZeChrales/PogoAssets/blob/master/static_assets/png/Parkscene_Background.png?raw=true") center top, url("https://github.com/ZeChrales/PogoAssets/blob/master/static_assets/png/SkyDay.png?raw=true") center top / cover;
   text-align: center;
   user-select: none;
   clear: both;
   position : relative;
   
}

#pokemon, #shiny {
   user-select: none;
  -webkit-user-select: none;
  -webkit-touch-callout: none;
  margin: 0 auto 5px auto;
   cursor: pointer;
}

#shiny, #sparkle { display: none; }

#encounter { position:relative; }

#sparkles {
  position: absolute;
  width: 256px;
  height: 256px;
  top:48px;
  left:calc(50% - 128px);
  pointer-events: none;
}

#pokemons {
  font-size: 16px;
  -webkit-appearance: none;
  padding: 10px 36px 10px 20px;
  border-radius: 20px;
  color: white;
  background: url("https://github.com/ZeChrales/PogoAssets/blob/master/static_assets/png/Arrow_rounded.png?raw=true") no-repeat center right 16px / 12px 12px, rgba(0, 0, 0, 0.6);
  border: none;
  outline: none;
  margin-bottom: 10px;
  cursor: pointer;
}

#stats, label {
  color: black;
  font-family: Sans-serif;
  font-weight: 100;
  font-size: 16px;
  line-height: 22px;
  margin: auto; 
  text-align: right;
}

label, input[type="checkbox"] { cursor: pointer; }

#stats td:last-child { text-align: left; width: 50px; }
#stats td[colspan="2"] { text-align: center; }

#flash {
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  background: white;
  pointer-events:none;
}

#map_ma {
   width: 70%;
   height: 400px;
   clear: both;
   border: solid 1px red;
}

#hidden{
	visibility : hidden;
	backgroud : gold;
}
</style>
<title>SSAFY</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyB8grAj7r7Y0Xy7uDqWCmIg6ZD-b-QtdaY"></script>

<script type="text/javascript">
$(document).ready(function() {
   $("#main").click(function(){
      $("#memberform").attr("action", "${root}/list").submit();
   });
   $("#hidden").click(function(){
	      $("#memberform").attr("action", "${root}/hidden").submit();
	   });
});
</script>
</head>
<body>
   <div align="center">
      <img src="img/house.jpg">
      <c:if test="${userinfo == null}">
         <h3>${msg}</h3>
         <%@ include file="login.jsp"%>
      </c:if>
      <c:if test="${userinfo != null}">
         <form method="get" id="memberform" action="">
            <input type="hidden" id="pg" name="pg" value="1">
            <div>
               <strong>${userinfo.name}</strong>님 환영합니다. <a href="${root}/logout">로그아웃</a>
               <a href="${root}/mypage">마이페이지</a>
            </div>
            <%-- 리스트 출력 --%>
            <br>
            <button type="button" class="btn btn-primary" id="main">아파트 리스트</button>
            <button type="button" class="btn btn-success" id="hidden">Hidden</button>

            <div id="map_ma"></div>
            <script type="text/javascript">
               
            </script>
            <%-- 리스트 출력 --%>
         </form>
   <div id="catch_screen">
     <div id="encounter">
    <img id="pokemon"/>
    <img id="shiny"/>
    <canvas id="sparkles" width="256" height="256"></canvas>
    <img src="https://github.com/ZeChrales/PogoAssets/blob/master/static_assets/png/sparkle.png?raw=true" id="sparkle"/>
  </div>
  <select id="pokemons"></select>
  <table id="stats">
    <tr>
      <td>Encounters:</td>
      <td id="encounters_stat"></td>
    </tr>
    <tr>
      <td>Shinies:</td>
      <td id="shinies_stat"></td>
    </tr>
    <tr>
      <td>Current streak:</td>
      <td id="streak_stat"></td>
    </tr>
    <tr>
      <td>Best streak:</td>
      <td id="best_streak_stat"></td>
    </tr>
    <tr>
      <td>Worst streak:</td>
      <td id="worst_streak_stat"></td>
    </tr>
  </table>
  <label><input type="checkbox" id="noflash"> No flash
</div>
<div id="flash"></div>

<script type="text/javascript">
var pokemon_selector = document.getElementById("pokemons");
var catch_screen = document.getElementById("catch_screen");
var pokemon = document.getElementById("pokemon");
var shiny = document.getElementById("shiny");
var stats = document.getElementById("stats");
var encounters_stat = document.getElementById("encounters_stat");
var shinies_stat = document.getElementById("shinies_stat");
var streak_stat = document.getElementById("streak_stat");
var worst_streak_stat = document.getElementById("worst_streak_stat");
var best_streak_stat = document.getElementById("best_streak_stat");
var flash = document.getElementById("flash");

var pokemons = {
   1: ["임건호", 512],
   2: ["김재현", 512],
   3: ["임진희", 512],
   4: ["김정현", 512],
   5: ["강세응", 512],
   6: ["배현석", 512],
};

for (var p in pokemons){
  var option = document.createElement("option");
  var number = p;
  if (number < 10) number = "00" + number;
  else if (number < 100) number = "0" + number;
  option.textContent = number + " " + pokemons[p][0];
  option.value = p;
  pokemon_selector.appendChild(option);
}

var current, odds, encounters, shinies, streak, worst_streak, best_streak;
var autochecking = false;
var autostarter = null;
var autochecker = null;
var sparkling = false;
var noflash = false;

pokemon.onmousedown = pokemon.ontouchstart = shiny.onmousedown = shiny.ontouchstart = function(e){
  e.preventDefault();
  if (autostarter == null) autostarter = setTimeout(autocheck, 500);
}

pokemon.onmouseup = pokemon.ontouchend = shiny.onmouseup = shiny.ontouchend = function(){
  if (!autochecking && !sparkling){
    flash.style.transition = "none";
    if (!noflash) flash.style.opacity = 0.4;
    setTimeout(reveal, 5);
  }
  autochecking = false;
  clearTimeout(autostarter);
  clearInterval(autochecker);
  autostarter = null;
}

pokemon_selector.onchange = function(){
  current = this.value;
  odds = pokemons[current][1];
  pokemon.onload = function(){ pokemon.onmouseup(); };
  var array=[ ["/임건호.jpg", 37.414499, 127.125274,"건호"], ["/김재현.jpg",37.653267, 126.779152,"재현"], ["/임진.jpg",37.290256, 127.045445,"임진"], ["/김정현.jpg",37.675007, 127.060604,"정현"], ["/강세응.jpg",37.539242, 127.100929,"세응"],["/hyunsuck.jpg", 37.298121, 126.866036, "현석"]]
  if (current != "412"){
    pokemon.src = "img"+array[current-1][0];
    $(function(){
   	if(current==6){
   		document.getElementById('hidden').style.visibility='visible'
   	}
   	else{
   		document.getElementById('hidden').style.visibility='hidden'
   	}
    });
    shiny.src = "https://github.com/ZeChrales/PogoAssets/blob/master/pokemon_icons/pokemon_icon_" + current + "_00_shiny.png?raw=true";
    $(document).ready(
            function() {
               var lat = array[current-1][1];  // Y 좌표 
               var lng = array[current-1][2]; // X 좌표
               console.log(lat);
               var myLatlng = new google.maps.LatLng(
                     lat,lng); // 위치값 위도 경도 
               var zoomLevel = 18; // 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼 
               var markerTitle = "하이"; // 현재    위치 마커에 마우스를 오버을때 나타나는 정보
               var markerMaxWidth = 300; // 마커를 클릭했을때 나타나는 말풍선의 최대 크기 // 말풍선 내용 
            
               var image = pokemon.src;
               
               var contentString = '<div>' + '<h2>'+array[current-1][3]+'`s 하우스</h2>'
                     + '<p>안녕하세요. '+array[current-1][3]+'입니다.</p>' +
                     '</div>';
               var myLatlng = new google.maps.LatLng(lat,
                     lng);
               var mapOptions = {
                  zoom : zoomLevel,
                  center : myLatlng,
                  mapTypeId : google.maps.MapTypeId.ROADMAP
               }
               var map = new google.maps.Map(document
                     .getElementById('map_ma'), mapOptions);
               var marker = new google.maps.Marker({
                  position : myLatlng,
                  map : map,
                  title : markerTitle,
                  icon : image
               });
               var infowindow = new google.maps.InfoWindow({
                  content : contentString,
                  maxWizzzdth : markerMaxWidth
               });
               google.maps.event.addListener(marker, 'click',
                     function() {
                        infowindow.open(map, marker);
                     });
            });
  } else { // Burmy
    pokemon.src = "https://github.com/ZeChrales/PogoAssets/blob/master/pokemon_icons/pokemon_icon_" + current + "_11.png?raw=true";
    shiny.src = "https://github.com/ZeChrales/PogoAssets/blob/master/pokemon_icons/pokemon_icon_" + current + "_11_shiny.png?raw=true"; 
  }
  encounters = shinies = streak = worst_streak = 0;
  best_streak = "-";
}
pokemon_selector.onchange();

function autocheck(){
  autochecking = true;
  autochecker = setInterval(reveal, 5);
}

function reveal(){
   encounters++;
   
   if (shiny.style.display == "block") streak = 0;
   streak++;
  if (streak > worst_streak) worst_streak = streak;

   if (Math.ceil(Math.random() * odds) == odds){
    shinies++;
    sparkling = true;
    clearInterval(autochecker);
      if (best_streak > streak || best_streak == "-") best_streak = streak;
      pokemon.style.display = "none";
    shiny.style.display = "block";
    setTimeout(shine, 400);
   } else {
      pokemon.style.display = "block";
    shiny.style.display = "none";
  }
   
   encounters_stat.textContent = encounters;
  shinies_stat.textContent = shinies;
   streak_stat.textContent = streak;
   worst_streak_stat.textContent = worst_streak;
   best_streak_stat.textContent = best_streak;

   flash.style.transition = "opacity 0.4s";
   flash.style.opacity = 0;
}

var sparkle = document.getElementById("sparkle");
var sparkles = document.getElementById("sparkles");
var ctx = sparkles.getContext("2d");
var particles = [];
var drawer;

function addSparkles(){
   for (var i = 0; i < 8; i++) particles.push({ "scale": 1, "radius": 60, "angle": 45 * i });
}

function drawSparkles(){
   ctx.clearRect(0, 0, 256, 256);
   for (p of particles){
      var x = 128 + p.radius * Math.cos(p.angle * Math.PI / 180);
      var y = 128 + p.radius * Math.sin(p.angle * Math.PI / 180);
      var scaled = Math.max(32 * p.scale, 0);
      ctx.drawImage(sparkle, x - scaled / 2, y - scaled / 2, scaled, scaled);
      if (p.scale > 0.6) p.scale -= 0.2;
      else p.scale -= 0.05;
      p.angle -= 5;
      p.radius += 5;
    }
}

function stopDrawing(){
   clearInterval(drawer);
   particles = [];
  sparkling = false;
}

function shine(){
  if (!particles.length){
    for (var i = 0; i < 5; i++) setTimeout(addSparkles, i * 100);
    drawer = setInterval(drawSparkles, 50);
    setTimeout(stopDrawing, 1000);
  }
}

document.getElementById("noflash").onchange = function(){
  noflash = this.checked;
}

document.body.onkeydown = function(e){
    e.preventDefault();
    if (e.keyCode == 32 && !sparkling) reveal();
}

pokemon.oncontextmenu = shiny.oncontextmenu = function(e){
  e.preventDefault();
  e.stopPropagation();
  e.stopImmediatePropagation();
  return false;
}

</script>
</c:if>
   </div>
</body>
</html>