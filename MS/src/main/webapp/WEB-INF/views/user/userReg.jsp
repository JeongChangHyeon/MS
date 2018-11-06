<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Management System</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/css/mdb.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/js/mdb.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Righteous&amp;subset=latin-ext"
	rel="stylesheet">
<style>
html, body {
	height: 100%;
}

body {
	margin: 0;
}

.container {
	min-height: 100%;
	width: 30%;
}

.titleStyle {
	padding: 30px;
	margin-top: 10px;
	margin-bottom: 10px;
	color: #2E64FE;
}

.container h1 {
	font-family: "Righteous";
	font-size: 80px;
	text-align: center;
}

.reg_button{
	padding: 10px;
	text-align: center;
}

</style>
</head>
<body>

	<div class="container">
		<div class="titleStyle">
			<h1>MS :p</h1>
		</div>
		<form action="">
			<!-- 아이디 -->
			<div class="form-group">
				<label for="reg_id">아이디</label> <input type="text"
					class="form-control" id="reg_id" placeholder="ID">
				<div>confirm message</div>
			</div>
			<!-- 비밀번호 -->
			<div class="form-group">
				<label for="reg_pw">비밀번호</label> <input type="text"
					class="form-control" id="reg_pw" placeholder="PASSWORD">
				<div>confirm message</div>
			</div>
			<!-- 비밀번호 재확인 -->
			<div class="form-group">
				<label for="reg_pw2">비밀번호 재확인</label> <input type="text"
					class="form-control" id="reg_pw2" placeholder="Confirm Password">
				<div>confirm message</div>
			</div>
			<!-- 이름 -->
			<div class="form-group">
				<label for="reg_name">이름</label> <input type="text"
					class="form-control" id="reg_name" placeholder="Name">
				<div>confirm message</div>
			</div>
			<!-- 생년월일 -->
			<div class="form-group">
				<label for="reg_birth">생년월일</label> <input type="text"
					class="form-control" id="reg_birth" placeholder="Birth">
				<div>confirm message</div>
			</div>
			<!-- 본인확인 이메일 -->
			<div class="form-group">
				<label for="reg_email">이메일</label> <input type="text"
					class="form-control" id="reg_email" placeholder="E-Mail">
				<div>confirm message</div>
			</div>
			<!-- 휴대전화 -->
			<div class="form-group">
				<label for="reg_birth">휴대전화</label> <input type="text"
					class="form-control" id="reg_birth" placeholder="Phone Number">
				<div>confirm message</div>
			</div>
			<div class="reg_button">
				<button type="button" class="btn btn-outline-primary waves-effect">
					<i class="fa fa-sun-o pr-2" aria-hidden="true"></i>가입하기
				</button>
			</div>
		</form>
	</div>
</body>
</html>