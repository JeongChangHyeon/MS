<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MS</title>
<style>
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

html, body {
	height: 100%;
}

.title_text {
	font-size: 40px;
	margin-bottom: 20px;
}

.orderMain_container {
	text-align: center;
	padding: 30px;
	height: 100%;
}

.left_area, .right_area {
	overflow: auto;
	height: 95%;
	padding: 15px 15px 0 15px; 
	border: 1px solid black;
	border-radius: 15px;
	margin-bottom: 15px;
}

.left_area {
	float: left;
	width: 35%;
}

.right_area {
	float: right;
	width: 63%;
}

/* 웹에 접근한 기기가 screen일 때 가로 길이가 1170px 미만(max-width:100px) 일 때 */
@media screen and (max-width:1170px) {
	.left_area {
		width: 100%;
	}
	.right_area {
		width: 100%;
	}
}

/* 웹에 접근한 기기가 screen일 때 세로 길이가 700px 미만일 때 */
@media screen and (max-height:700px) {
	.left_area {
		border-top-right-radius: 0;
		border-bottom-right-radius: 0;
	}
}

/* 선택한 메뉴를 보여주는 테이블을 감싸고 있는 div */
.order_table_wrap {
	overflow: auto;
	background-color: white;
}

.order_table {
	width: 100%;
}

.order_table td {
	height: 50px;
	font-size: 24px;
}

.cancle_btn, .pay_btn {
	width: 46%;
	height: 85px;
	border: none;
	border-radius: 10px;
	color: white;
	cursor: pointer;
	font-size: 26px;
}

.cancle_btn:hover, .pay_btn:hover {
	opacity: 0.7;
}

.cancle_btn {
	background-color: #1C2331;
}

.pay_btn {
	background-color: #CC0000;
}

.total_price_wrap {
	background-color: lightgray;
	border-radius: 10px;
	width: 50%;
	float: left;
	text-align: left;
	vertical-align: bottom;
	padding: 5px 10px 5px 10px;
	font-size: 25px;
}

.order_btn_wrap {
	width: 50%;
	float: right;
	text-align: right;
}

/* 웹에 접근한 기기가 screen일 때 가로 길이가 1170px 이상 1480px 미만일 때 */
@media screen and (max-width:1480px) and (min-width:1170px) {
	.total_price_wrap {
		width: 100%;
	}
	.order_btn_wrap {
		width: 100%;
		text-align: center;
	}
	.cancle_btn, .pay_btn {
		width: 110px;
	}
	.left_area {
		border-top-right-radius: 0;
		border-bottom-right-radius: 0;
	}
}

/* 음식 nav bar */
.menu_nav {
	width: 100%;
}

.menu_nav ul li {
	list-style: none;
	color: white;
	background-color: #2d2d2d;
	display: inline-block;
	line-height: 50px;
	vertical-align: middle;
	text-align: center;
	line-height: 50px;
	vertical-align: middle;
	text-align: center;
	width: 140px;
}

.menu_nav ul li a {
	text-decoration: none;
	color: white;
	display: block; /* 글씨 부분 뿐만 아니라 전체 영역 클릭 가능 */
	width: 140px;
}

.menu_nav ul li a:hover {
	color: red;
	background-color: #4d4d4d;
}

.menu_content_wrap {
	position: relative;
	overflow: auto;
}

.menu_content {
	margin: 0 auto;
	width: 90%;
	font-size: 23px;
}

.menu_content > div > div {
	float: left;
	width: 24.4%; /* inline-block 속성에 속성 사이 간격 마진이 디폴트로 있으므로 */
	height: 46%;
	margin: 0 0.6% 0.6% 0px; /* top right bottom left */
	padding-top: 5px;
	border: 1px solid black;
	border-radius: 10px;
}

.menu_content div img {
	width: 65%;
	height: 60%;
}

.menu_display {
	display: none;
}

.prev, .next {
	cursor: pointer;
	position: absolute;
	top: 35%;
	padding: 16px;
	color: black;
	font-weight: bold;
	font-size: 30px;
	border-radius: 0 3px 3px 0;
}

.prev {
	left: -1%;
}

.next {
	right: 0;
	border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

.dot {
	bottom: 10px;
	height: 15px;
	width: 15px;
	margin: 0 2px;
	background-color: #bbb;
	border-radius: 50%;
	display: inline-block;
	transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fading {
  -webkit-animation-name: fading;
  -webkit-animation-duration: 1.5s;
  animation-name: fading;
  animation-duration: 1.5s;
}

@-webkit-keyframes fading {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fading {
  from {opacity: .4} 
  to {opacity: 1}
}

</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="orderMain_container">
		<div class="title_text">[${storeSelectSession.store_name}] - 음식 주문</div>
		<div class="left_area">
			<div style="height: 15%">
				<div style="font-size: 35px">주문 내역</div>
				<hr>
			</div>
			<div style="height: 70%" class="order_table_wrap">
				<table border="1" class="order_table">
					<tr style="background-color: lightgray">
						<td>메뉴</td>
						<td>수량</td>
						<td>가격</td>
					</tr>
					<!-- 예시 -->
					<tr>
						<td>햄버거</td>
						<td>1</td>
						<td>5,000</td>
					</tr>
				</table>
			</div>
			<div style="height: 15%">
				<div class="total_price_wrap">
					<div>
						주문 수량<span style="float: right">7</span>
					</div>
					<div>
						총 가격<span style="float: right">10000</span>
					</div>
				</div>
				<div class="order_btn_wrap">
					<button class="cancle_btn">전체취소</button>
					<button class="pay_btn">결제하기</button>
				</div>
			</div>
		</div>
		
		<div class="right_area">
			<div style="height: 15%">
				<div style="font-size: 35px">음식 리스트</div>
				<hr>
			</div>
			<div style="height: 10%" class="menu_nav">
				<ul>
					<li><a class="menu_link" id="korean">한식</a></li>
					<li><a class="menu_link" id="japan">일식</a></li>
					<li><a class="menu_link" id="western">양식</a></li>
					<li><a class="menu_link" id="dessert">디저트</a></li>
					<li><a class="menu_link" id="drink">음료</a></li>
				</ul>
			</div>
			<div style="height: 75%" class="menu_content_wrap">
				<div style="height: 94%" class="menu_content">
					
				</div>
				<div style="height: 6%" class="paging_dot_wrap">
				
				</div>
				<a class="prev" onclick="plusSlides(-1)">&#10094;</a> 
				<a class="next" onclick="plusSlides(1)">&#10095;</a>
			</div>
		</div>
	</div>
</body>
<script>
	$(document).ready(function() {
		
		/* 페이지 로드 시 한식 메뉴로 초기화 */
		$.ajax({
			url : '${pageContext.request.contextPath}/user/menu?menu=korean&storeId=${storeSelectSession.store_id}',
			type : 'get',

			success : function(data) {
				viewProcess(data);
			}  
		}); // end ajax
		
		/* 메뉴 클릭 시 */
		$('.menu_link').on('click',function() {
			$.ajax({
				url : '${pageContext.request.contextPath}/user/menu?menu='+ $(this).attr('id') + '&storeId=${storeSelectSession.store_id}',
				type : 'get',

				success : function(data) {
					viewProcess(data);
				}  
			}); // end ajax
		});
	});	

	//////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////////
	
	var slideIndex = 1;
	
	/* 음식 nav bar 분기 처리 함수 */
	function viewProcess(data){
		var pLength = getPagingCnt(data.length); // 페이징 표시
		
		var str = '';
		var first = 0;
		var last = data.length - 8;
		
		if(data.length < 8){
			last = 0;						
		}
		for(var i=0; i<pLength; i++){
			
			str += '<div style="height: 100%" class="menu_display fading">';
			for(var j=first; j<(data.length-last); j++){
				str += createTable(data[j].food_type, data[j].food_photo, data[j].food_name, data[j].food_price);
			}
			str += '</div>';
			
			first = ((i+1)*8);
			last = last - 8;
			
			if(last < 0 ){
				last = 0;
			}
		}
		$('.menu_content').html(str);
		showSlides(slideIndex);
	}
	
	/* 동적 테이블 생성 (음식 종류, 음식 사진, 음식 이름, 음식 가격) */
	function createTable(foodType, foodPhoto, foodName, foodPrice) {
		var str = '<div>';
		str += '<img src="../images/'+ foodType +'/'+ foodPhoto + '"/>';
		str += '<div style="height: 40%; padding-top: 4%">';
		str += '<div>'+ foodName +'</div>';
		str += '<div>'+ foodPrice +'</div>';
		str += '</div>';
		str += '</div>';
		
		return str;
	}
	
	/* 데이터 갯수에 따른 페이징 dot 표시 처리 */
	function getPagingCnt(length) {
		var str = '';
		var length = Math.ceil(length/8); // 소수점 올림 처리
		
		for(var i=0; i < length; i++){
			str += '<span class="dot" onclick="currentSlide('+ (i+1) +')"></span>';
		}
		$('.paging_dot_wrap').html(str);
		
		return length;
	}
	
	/* 페이징 화살표 클릭 시 처리 */
	function plusSlides(n) {
		showSlides(slideIndex += n);
	}

	/* 페이징 dot 클릭 시 처리  */
	function currentSlide(n) {
		showSlides(slideIndex = n);
	}

	function showSlides(n) {
		var i;
		var slides = $('.menu_display');
		var dots = $('.dot');
		  
		if (n > slides.length) {slideIndex = 1}    
		if (n < 1) {slideIndex = slides.length}
		for (i = 0; i < slides.length; i++) {
		    slides[i].style.display = "none";  
		}
		for (i = 0; i < dots.length; i++) {
		    dots[i].className = dots[i].className.replace(" active", "");
		}
		slides[slideIndex-1].style.display = "block";  
		dots[slideIndex-1].className += " active";
	} 
</script>
</html>