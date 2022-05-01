<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<meta name="viewport" content="width=device-width, initial-sale=1" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"
	integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2"
	crossorigin="anonymous"></script>

<script src="vendor/jquery.easing.1.3.js"></script>
<script src="js/jquery.bxslider.js"></script>
<link rel="stylesheet" href="css/jquery.bxslider.css" type="text/css" />

<link rel="stylesheet" href="css/style.css" type="text/css" />


<!-- 상단 알림 -->
<div class="top1">
	<div id="slideImg" class="carousel slide" data-ride="carousel" data-interval="3000"><!-- carousel 전체 start -->
		<!-- 아이콘 : controller -->
		<ul class="carousel-indicators">
			<li data-target="#slideImg" data-slide-to="0" class="active"></li>
			<li data-target="#slideImg" data-slide-to="1"></li>
			<li data-target="#slideImg" data-slide-to="2"></li>
			<!-- <li data-target="#slideImg" data-slide-to="3"></li> -->
		</ul>
		
		<!-- 컨텐츠 -->
		<div class="carousel-inner">
			<div class="carousel-item active"><!-- 0 -->
				<a href="${url }/myapp/map/mapView"><img src="./img/지도바로가기.jpg"/></a>
				<!-- 이미지 위에 표시될 문자 -->
				<div class="carousel-caption">
					<!-- <h2>지도 바로가기</h2>
					<p>길거리 음식 어딨는지 궁금하다면 눌러주세요!!!</p> -->
				</div>
			</div>
			<div class="carousel-item"><!-- 1 -->
				<a href="${url }/myapp/Notice/NoticeView?no=1"><img src="./img/오픈이벤트가기.jpg"/></a>
				<!-- 이미지 위에 표시될 문자 -->
				<div class="carousel-caption">
					<!-- <h2>오픈 이벤트</h2>
					<p>회원가입 시, 1000원 지원 이벤트</p> -->
				</div>
			</div>
			<div class="carousel-item"><!-- 2 -->
				<a href="${url }/myapp/support/supportView"><img src="./img/고객센터바로가기2.jpg"/></a>
				<!-- 이미지 위에 표시될 문자 -->
				<div class="carousel-caption">
					<!-- <h2>문의 사항</h2>
					<p>이런 부분이 불편해요 ㅠㅠ!! 빠른 개선하겠습니다.</p> -->
				</div>
			</div>

		</div>
		
		<!-- 좌우버튼 -->
		<a href="#slideImg" class="carousel-control-prev" data-slide="prev"><span class="carousel-control-prev-icon"></span></a>
		<a href="#slideImg" class="carousel-control-next" data-slide="next"><span class="carousel-control-next-icon"></span></a>
		
	</div><!-- carousel 전체 end -->
</div>
