<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.messageModal, .writeMessageModal{
	position : fixed;
	width : 100%;
	height : 100%;
	left : 0px;
    top : 0px;
    z-index : 1;
    background-color : rgba(0, 0, 0, 0.4);
    display : none;
}
.messageWrap, .messageWriteWrap{
	position : absolute;
	top : 10%;
	left : 50%;
	width : 700px;
	background-color : white;
	text-align : center;
	border-radius: 10px;
	margin-left : -350px;
}
.messageListTitle{
	margin-top : 30px;
}
#writeMessage{
	position : absolute;
	right : 20px;
	top : 30px;
	border : none;
	font-weight : bold;
	font-size : 15px;
}
.post {
	padding: 0 1.5%;
}
.comment-form .form-control {
	border: 0px;
	background: #eee;
	min-height: 50px;
}
.comment-form>.row {
	margin: 0 -1.5%;
}
.comment-form [class*="col-"] {
	padding: 0 1.5%
}
.form-group {
	margin-bottom: 40px !important;
}
.messageTitle {
	margin-top: 20%;
	font-size : 35px;
	font-weight : bold;
}
hr{
	margin-bottom : 50px !important;
}
#userId {
	background-color : darkgray;
	font-weight : bold;
	font-size : 20px;
}
@media ( min-width :992px) {
	.post {
		width: 50%;
		max-width: 500px;
		margin: 0 auto;
		background-color : white;
		border-radius : 10px;
		height : 710px;
	}
	.comment-form label {
		position: absolute;
		width: 200px;
	}
	.comment-form .name, .comment-form .email, .comment-form .message {
		top: -27px;
		font-weight: bold;
	}
}
@media ( min-width :1200px) {
	.post {
		max-width: 525px;
	}
}
#submit {
	font-size : 15px;
}
.messageTitle p {
	text-align : center;
	padding-top : 20px;
}
.receiveWrap{
	width : 100%;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<h1>관리자 메인페이지입니다.</h1>
	
		<input type = "button" id = "messageBtn" class = "messageBtn" value = "쪽지함">

<!-- ///////////메시지 모달창/////////// -->
		<div class = "messageModal" id = "messageModal">
			<div class="messageWrap">
				<h1 class="messageListTitle">메시지 리스트</h1>
				<input type = "button" class = "btn btn-outline-elegant waves-effect" id = "writeMessage" value = "쪽지쓰기">
				<hr>
				<c:if test="${empty list}">
					<!-- jstl 에서 null값인지 확인할때는 empty를 넣어줘야함 -->
					<div id="noMessage">※ 메세지가 없습니다.</div>
				</c:if>

				<c:if test="${list != null}">
					<c:forEach var="message" items="${list}" varStatus="status">
						<div id="messageUlWrap">
							<ul id="messageUl">
								<li>메시지 번호 : ${message.message_id}</li>
								<li>보내는 사람 : ${message.send_id}</li>
								<li><textarea readonly cols="20">${message.message_con}</textarea></li>
								<input type = "button" id = "messageReply" class = "messageReply" value = "답장">
								<input type = "button" id = "messageDetail" class = "messageDetail" value = "상세">
							</ul>
						</div>
					</c:forEach>
				</c:if>
			</div>
		</div>
	
<!--///////////////// 쪽지쓰기 모달창/////////////////// -->
		<div class = "writeMessageModal" id = "writeMessageModal">
		<div class="post">
			<div class="contact">
				<div class="messageTitle">
					<p>메시지 남기기</p>
				</div>
				<hr>
				<form class="comment-form">
					<div class="row">
						<div class="col-md-12 form-group">
							<label class="name">보내는 사람</label> <input type="text"
								class="form-control" name="send_id"
								value = "${adminSession.admin_id }" id = "send_id" style = "background-color : darkgrey;" readonly/>
						</div>
						<div class="col-md-12 form-group">
							<label class="name">받는 사람</label>
							<div class = "receiveWrap">
							<div id = "sendWrap" style = "width : 40%; float : left;"></div>
							<div id = "selectStore" style = "width : 55%; float : right;"></div>
							</div>
						</div>
						<div class="col-md-12 form-group">
							<label class="email">메시지 제목</label> <input type="text"
								class="form-control" placeholder="message Title"
								name="message_title" id = "message_title" required />
						</div>
						<div class="clearfix"></div>
						<div class="col-md-12 form-group">
							<label class="message">메시지 내용</label>
							<textarea class="form-control" cols="47" rows="7"
								placeholder="Message" name="message_con" id = "message_con" required></textarea>
						</div>
						<div class="col-md-12 form-group">
							<input type="button" class="btn btn-block btn-lg btn-success"
								value="메시지 남기기" id = "sendBtn">
						</div>
					</div>
				</form>
			</div>
		</div>
		</div>
   	</div>
</body>
<script>
	var send_id = "";
	$(document).ready(function(){
		$('#messageModal').hide(); //페이지 시작시 메세지 모달창 가림
		$('#writeMessageModal').hide(); // 페이지 시작시 쪽지쓰기 모달창 가림
	
		$('#messageBtn').click(function(){
			$('#messageModal').show(); //쪽지함을 클릭하면 모달창 뜸
			
			$.ajax({
				url : '${pageContext.request.contextPath}' + '/admin/message',
				success : function(data){
					console.log(data);
				}
			}); //쪽지함클릭 ajax끝
		});
		
		$('#writeMessage').click(function(){
			$('#messageModal').hide(); //쪽지쓰기 클릭하면 리스트창 끔
			$('#writeMessageModal').show(); //쪽지쓰기를 클릭하면 모달창 뜸
			
			$.ajax({
				url : '${pageContext.request.contextPath}' + '/member/sendList',
				type : 'get',
				success : function(data){
					list = "<select class = 'sendList' id = 'sendList' style = 'width : 100%; height : 40px; padding : 3px;'><option>사용자를 선택하세요</option>";
					for(var i = 0; i < data.length; i++){
						list += "<option name = 'send_id' id = '"+ data[i].store_id +"'>" + data[i].user_id + "</option>";
					}
					list += "</select>";
					$('#sendWrap').append(list);
					
					$('#sendList').change(function(){ //받는사람 리스트 변경 이벤트
						send_id = $('#sendList option:selected').val(); //선택된 아이디값을 가져옴
						//console.log(store_id);
						var store_name = "<select class = 'store_name' id = 'store_name' style = 'width : 100%; height : 40px; padding : 3px;'><option>사용자의 매장을 선택하세요</option>";
						$.ajax({
							url : '${pageContext.request.contextPath}' + '/member/sendStore/' + send_id,
							success : function(data2){
								//console.log(data);
								for(var j = 0; j < data2.length; j++){
									store_name += "<option>" + data2[j].store_name + "</option>";
								}
							store_name += "</select>";
							$('#selectStore').html(store_name);
							} //매장이름 가져오기 성공 끝
						}); // 보내는아이디에 해당하는 매장번호 구하는 ajax 끝
						
					});
					
				} //성공 끝
			}); //ajax 끝
		}); //쪽지쓰기 이벤트 끝
		
		$('#sendBtn').click(function(){
			console.log(send_id);
			$.ajax({
				url : '${pageContext.request.contextPath}' + '/member/writeMessage',
				type : 'post',
				data : { //보내는사람, 받는사람, 받는사람의 매장아이디, 제목, 내용
					send_id : $('#send_id').val(),
					receive_id : send_id,
					store_id : $('#sendList option:selected').attr("id"),
					message_title : $('#message_title').val(),
					message_con : $('#message_con').val()
				},
				success : function(data){
					alert("메시지를 성공적으로 보냈습니다.");
					location.reload();
				}// 성공 끝
				
			}); // ajax 끝
		}); //메시지 보내기 이벤트 끝
		
		//모달창 밖의 영역을 누르면 띄워져 있는 모달창을 닫음
        $(window).on('click', function() {
           //jquery는 dom 객체를 jquery 객체로 한 번 감싸 리턴하므로 dom 객체를 얻어와야 비교 가능
           if (event.target == $('#messageModal').get(0)) {
               $('#messageModal').hide();
           } else if (event.target == $('#writeMessageModal').get(0)){
        	   $('#writeMessageModal').hide();
           }
        });
	});
</script>
</html>