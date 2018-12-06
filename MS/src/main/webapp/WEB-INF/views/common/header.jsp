<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/css/mdb.min.css" rel="stylesheet">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/js/mdb.min.js"></script>

<!-- 폰트 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR" rel="stylesheet">

<!-- 셀렉트 플러그인 -->
<script src="${pageContext.request.contextPath}/select/select-mania.js"></script>
<link href="${pageContext.request.contextPath}/select/select-mania.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/select/themes/select-mania-theme-red.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/select/themes/select-mania-theme-square.css" rel="stylesheet">
<style>

* {
	/* font-family: 'Noto Sans KR', sans-serif; */
	font-family: 'Do Hyeon', sans-serif;
}

.navbar-nav li {
   	margin-left: 20px;
   	font-size: 24px;
}

</style>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<c:if test="${!empty adminSession}">
		<a id="adminBrand" class="navbar-brand"><img src="${pageContext.request.contextPath}/images/ms-logo.png" style="height: 80px; margin-left: 10px;" /></a>
	</c:if>
	<c:if test="${!empty userSession}">
		<a class="navbar-brand" href="${pageContext.request.contextPath}/user/main"><img src="${pageContext.request.contextPath}/images/ms-logo.png" style="height: 80px; margin-left: 10px;"/></a>
	</c:if>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    	<span class="navbar-toggler-icon"></span>
  	</button>
	<div class="collapse navbar-collapse" id="navbarNav" style="font-size: 1.8em">
		<ul class="navbar-nav">
			<c:if test="${!empty adminSession}">
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/adminMypage"><i	class="fa fa-address-card-o" aria-hidden="true"></i>내정보</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/notice?page=1"><i class="fa fa-bullhorn" aria-hidden="true"></i>공지사항</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/userList"><i class="fa fa-users" aria-hidden="true"></i>회원목록</a></li>
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"	aria-haspopup="true" aria-expanded="false"> 관리하기 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="${pageContext.request.contextPath}/admin/salesCalender"><i class="fa fa-pie-chart" aria-hidden="true"></i> 매출기록</a> 
						<a class="dropdown-item" href="${pageContext.request.contextPath}/admin/adminOrders"><i class="fa fa-book"	aria-hidden="true"></i> 상품관리</a> 
						<a class="dropdown-item" href="${pageContext.request.contextPath}/admin/seat"><i class="fa fa-eye" aria-hidden="true"></i> 좌석관리</a> 
						<a class="dropdown-item" href="${pageContext.request.contextPath}/user/userBoard?page=1&keyword="><i class="fa fa-comments" aria-hidden="true"></i> 유저게시판</a>
						<a class="dropdown-item" href="${pageContext.request.contextPath}/admin/CEOBoard?page=1&keyword="><i class="fa fa-won" aria-hidden="true"></i> CEO게시판</a>
						<a class="dropdown-item" href="${pageContext.request.contextPath}/member/photoBoard?page=1"><i class="fa fa-instagram" aria-hidden="true"></i> 포토게시판</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/logout"><i class="fa fa-unlock-alt" aria-hidden="true"></i>로그아웃</a></li>
				<li class="nav-item">
					<select id="storeList">
						<!-- 전체스토어세션 매장이름 중에 선택한 스토어세션 매장이름을 비교하여 selected로 만듬 -->
						<c:forEach items="${storeSession}" var="store" varStatus="status">
							<option value="${status.index}" <c:if test="${store.store_name eq storeSelectSession.store_name}"> 
							selected
							</c:if>>${store.store_name}</option>
						</c:forEach>
					</select>
				</li>
			</c:if>
			<c:if test="${!empty userSession}">
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/user/userMypage"><i class="fa fa-address-card-o" aria-hidden="true"></i>내정보</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/notice?page=1"><i class="fa fa-bullhorn" aria-hidden="true"></i>공지사항</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/user/userOrders"><i class="fa fa-cutlery" aria-hidden="true"></i>음식주문</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/user/userBoard?page=1&keyword="><i class="fa fa-comments" aria-hidden="true"></i>유저게시판</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/photoBoard?page=1"><i class="fa fa-instagram" aria-hidden="true"></i>포토게시판</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/logout"><i class="fa fa-unlock-alt" aria-hidden="true"></i>로그아웃</a></li>
			</c:if>
		</ul>
	</div>
</nav>
<script>
	$(document).ready(function() {
		//헤더 브랜드이미지 클릭시 메인페이지로 이동
		$('#adminBrand').click(function() { 
			location.href="${pageContext.request.contextPath}/admin/main?store=" + $('#storeList').val();
		});
		
		//셀렉트를 선택하고 다른 옵션을 눌러 상태값이 바뀔때 이벤트 발생(change) -> 선택한 메인페이지로 이동
		$('#storeList').change(function(){
			location.href="${pageContext.request.contextPath}/admin/main?store=" + $('#storeList').val();		
		});
		
		//셀렉트 플러그인
		$('#storeList').selectMania({
			themes: ['square','red'],
			size: 'large',
			search: true,
		});
		
		var timer = setInterval(function (){
			useTime += 1;
		}, 1000);
		
		
	});
	
	/* 웹페이지 닫기, 새로고침, 다른 URL로 이동 시에 발생 */
	var useTime = 0;
	window.onbeforeunload = function() {
		$.ajax({
			// 사용 시간 전송
			url: '${pageContext.request.contextPath}/user/updateSaveTime?storeId=${storeSelectSession.store_id}&userId=${userSession.user_id}&useTime='+useTime, 
			type: 'get',
			
			success:function(){
				console.log("시간 저장 완료");
			}
		});
	};
	
	// 실시간 세션 확인
	var sessionConfirm = setInterval(function (){
		
		$.ajax({				
			url: '${pageContext.request.contextPath}/user/redundantout', 
			type: 'get',
			
			success:function(data){
				console.log("실시간 세션 확인중 : [ " + data + " ]")
								
				if(data == -1){
					alert('다른 기기에서 로그인 되었습니다');
					location.href="${pageContext.request.contextPath}/";
				}
			} // end success  
		}); // end ajax
	}, 500);
</script>