<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.container{
	overflow: hidden;
}
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
	top : 5%;
	left : 50%;
	width : 700px;
	background-color : white;
	text-align : center;
	border-radius: 10px;
	margin-left : -350px;
	height : 720px;
	overflow : overlay;
}
.messageListTitle{
	margin-top : 30px;
	font-weight : bold;
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
	margin-top: 10%;
	font-size : 35px;
	font-weight : bold;
}
hr{
	margin-bottom : 60px !important;
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
.messageUl{
	padding: 15px 10px;
	text-align: center;
	width: 250px;
	height: 250px;
	border-right : 3px solid #8e8e8e;
	border-bottom : 3px solid #8e8e8e;
	margin-left: 65px;
	list-style: none;
	margin-bottom: 30px;
	border-radius: 10px;
	position : relative;
}
.messageUlWrap{
	float: left;
}
.messageUl textarea {
	padding: 10px;
	margin-top: 10px;
	margin-bottom: 4px;
	height: 120px;
	border-radius: 5px;
}
.messageReply, .messageDetail{
	margin: 0px 6px;
	font-size: 15px;
	color: white;
	background-color:#3f51b5;
	text-decoration: none;
	padding: 6px;
	border-radius: 5px;
	width : 70px;
	border : none;
}
.deleteMessage{
	position : absolute;
	right : 10px;
	top : 10px;
}
.deleteMessage:hover, .messageReply:hover, .messageDetail:hover {
	cursor : pointer;
}
.storeList{
	position : absolute;
	left : 25px;
	top : 100px;
	height : 35px;
}
.messageUl:hover{
	-webkit-transform:scale(1.1); 
	transition: all 0.3s ease-in-out;
}
</style>
</head>
<body>
	
<!-- ///////////메시지 모달창/////////// -->
		<div class = "messageModal" id = "messageModal">
			<div class="messageWrap">
				<h1 class="messageListTitle">메시지 리스트</h1>
				<div id = "adminStoreList" class = "adminStoreList"></div>
				<input type = "button" class = "btn btn-outline-elegant waves-effect" id = "writeMessage" value = "쪽지쓰기">
				<hr>
				<div id = "messageList">
				<p id = "messageText"style = "color : red; margin-bottom : 20px; font-size : 30px;">※ 매장을 먼저 선택하세요.</p></div>
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
								value = "관리자" id = "send_id" style = "background-color : darkgrey;" readonly/>
						</div>
						<div class="col-md-12 form-group">
							<label class="name">받는 사람</label>
							<div id = "sendWrap" style = "width : 40%; float : left;"></div>
							<div id = "selectStore" style = "width : 55%; float : right;"></div>
							<div class = "receiveWrap">
							<input type = "text" id = "receiveReply" class = "form-control" style = "display : none; background-color : darkgrey;" readonly >
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
</body>
<script>
	var send_id = "";
	$(document).ready(function(){
		$('#messageModal').hide(); //페이지 시작시 메세지 모달창 가림
		$('#writeMessageModal').hide(); // 페이지 시작시 쪽지쓰기 모달창 가림
		$('#sendBtn').css("display","block"); //윈도우 시작하면 보내기버튼이 나옴
		$('#replyBtn').css("display","none"); //윈도우 시작하면 답장에서 보내기버튼이 사라짐
		//alarm();
	});
	function alarm(){
		$.ajax({
			url : '${pageContext.request.contextPath}' + '/admin/messageCnt',
			success : function(data){
				console.log(data);
			}
		});
	}
	
	///////////// 쪽지함 클릭 /////////////
	$('#messageBtn').click(function(){
		var storeList = "";
		$('#messageModal').show(); //쪽지함을 클릭하면 모달창 뜸
		$.ajax({ //사용자가 갖고있는 매장목록 select
			url : '${pageContext.request.contextPath}' + '/admin/storeList',
			type : 'get',
			success : function(data){
				storeList = '<select id = "storeList" class = "storeList"><option>매장을 선택하세요</option>';
				for(var j = 0; j < data.length; j++){
					storeList += '<option>' + data[j].store_name + '</option>';
				} //리스트 반복문 끝
				storeList += '</select>';
				$('#adminStoreList').html(storeList);
			}
		});
		storeList = "";
	});
	////////////////// 메시지리스트 불러오는 메서드 //////////////
	function getMessageList(){
		var str = '';
		var selectedStore = $('#adminStoreList option:selected').val(); // 선택된 스토어 이름
			$.ajax({
			url : '${pageContext.request.contextPath}' + '/admin/message',
			type : 'post',
			data : {
				receive_id : $('#send_id').val(),
				store_name : selectedStore
			},
			success : function(data){
				//console.log(data);
				if(selectedStore == "매장을 선택하세요"){
					$('#messageList').html("<p style = 'color : red; margin-bottom : 20px; font-size : 30px;'>※ 매장을 먼저 선택하세요.</p>");
				} else {
					if(data.length > 0){
					//console.log(data[1].message_con);
					$('#messageList').html("");
						for(var i = 0; i < data.length; i++){
							str = '<div id="messageUlWrap" class = "messageUlWrap">';
							if(data[i].message_read != "Y"){
								str += '<ul id="' + data[i].message_id + '" class = "messageUl" style = "background-color : #eee;">';
							} else {
								str += '<ul id="' + data[i].message_id + '" class = "messageUl" style = "background-color : #4285f4; color : white; font-weight : bold">';
								str += '<img src = "${pageContext.request.contextPath}/images/delete2.png" onclick = "deleteMessage(' + data[i].message_id + ')"style = "width : 17px; height : 20px;"class = "deleteMessage" id = "' + data[i].message_id + '">'
							}
							str += '	<li id = "li_message_id">메시지 번호 : ' + data[i].message_id + '</li>';
							str += '	<li id = "li_send_id" class = "li_send_id">보내는 사람 : ' + data[i].send_id + '</li>';
							if(data[i].message_read != "Y"){
								str += '	<li><textarea readonly cols="20" id = "li_message_con">' + data[i].message_con + '</textarea></li>';
							} else {
								str += '	<li><textarea readonly style = "background-color : #eee;" cols="20" id = "li_message_con">' + data[i].message_con + '</textarea></li>';
							}
							str += '	<input type = "button" onclick = "messageReply(' + data[i].message_id +','+ data[i].send_id + ')" class = "messageReply" value = "답장">';
							str += '	<input type = "button" id = "messageDetail" class = "messageDetail" value = "상세">';
							str += '<div id = "userStore_id" style = "display : none;">' + data[i].store_id + '</div>';
							str += '<div id = "messageRead" style = "display : none;">' + data[i].message_read + '</div>';
							str += '</ul></div>';
							$('#messageList').append(str);
						} str = '';
					} else{
						$('#messageList').html("<p style = 'color : red; margin-bottom : 20px; font-size : 30px;'>※ 도착한 메시지가 없습니다.</p>");
					}
				}
			}
		});
	}
	////////////// 매장목록이 바뀔때 메시지 리스트를 가져옴 ///////////
	$('#adminStoreList').change(function(){
		//console.log(selectedStore);
		//console.log($('#send_id').val());
		getMessageList();
	});
			
	/////////////쪽지 삭제 이벤트/////////////
	function deleteMessage(message_id){
		$.ajax({
			url : '${pageContext.request.contextPath}' + '/member/deleteMessage/' + message_id,
			success : function(data){
				alert("메시지 삭제 성공");
				getMessageList();
			}
		});//삭제 ajax 끝
	}
				
	 /////////////쪽지 답장 이벤트//////////////
	function messageReply(message_id, send_id){
		$('#writeMessageModal').show();
		$('#send_id').val("관리자");
		$('#sendWrap, #selectStore').css("display","none");
		$('#receiveReply').css("display","block");
		$('#receiveReply').val(send_id);
	}
		
	///////////// 쪽지쓰기버튼 이벤트///////////////
	$('#writeMessage').click(function(){
		$('#writeMessageModal').show(); //쪽지쓰기를 클릭하면 모달창 뜸
		$('#sendWrap, #selectStore').css("display","block");
		$('#receiveReply').css("display","none");
		var list = "";
		$.ajax({
			url : '${pageContext.request.contextPath}' + '/member/sendList',
			type : 'get',
			success : function(data){
				list = "<select class = 'sendList' id = 'sendList' style = 'width : 100%; height : 40px; padding : 3px;'><option>사용자를 선택하세요</option>";
				for(var i = 0; i < data.length; i++){
					list += "<option name = 'send_id' id = '"+ data[i].store_id +"'>" + data[i].user_id + "</option>";
				}
				list += "</select>";
				$('#sendWrap').html(list);
			} 
		});
		list = "";
	});
	///////////// 사용자 매장 선택 /////////////////
	$(document).on("change", "#sendList", function(){ //받는사람 리스트 변경 이벤트
		send_id = $('#sendList option:selected').val(); //선택된 아이디값을 가져옴
		console.log(send_id);
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

	///////////////// 보내기버튼 이벤트//////////////////
	$('#sendBtn').click(function(){
		var store_id = $('#userStore_id').text();
		console.log($('#userStore_id').attr("id"));
		$.ajax({
			url : '${pageContext.request.contextPath}' + '/member/writeMessage',
			data : { //보내는사람, 받는사람, 받는사람의 매장아이디, 제목, 내용
				send_id : $('#send_id').val(),
				receive_id : send_id,
				store_id : store_id,
				message_title : $('#message_title').val(),
				message_con : $('#message_con').val()
			},
			success : function(data){
				alert("메시지를 성공적으로 보냈습니다.");
				
				$('#writeMessageModal').hide(); //쪽지쓰기 모달창 끔
				$('#messageModal').show(); // 리스트 모달창 뜸
			}// 성공 끝
		}); // ajax 끝
	}); //메시지 보내기 이벤트 끝
	
	$(document).on("click",".messageUl",function(){ // 동적으로 생성된 태그들은 이런식으로 이벤트를 줘야함
		//var str = "onclick = "readChk(' + data[i].message_id + ')"";
		$(this).css("background-color","#4285f4").css("font-weight","bold").css("color","white");
		var message_id = $(this).attr("id");
		var read_message = "Y";
		$.ajax({
			url : '${pageContext.request.contextPath}' + '/member/readMessage',
			type : 'post',
			data : {
				message_id : message_id,
				message_read : read_message
			},
			success : function(data){
				getMessageList();
			}
		});
	});
	
	///////////////모달창 밖의 영역을 누르면 띄워져 있는 모달창을 닫음
    $(window).on('click', function() {
      //jquery는 dom 객체를 jquery 객체로 한 번 감싸 리턴하므로 dom 객체를 얻어와야 비교 가능
       if (event.target == $('#messageModal').get(0)) {
    	   $('#messageModal').hide();
       } else if (event.target == $('#writeMessageModal').get(0)){
      	   $('#writeMessageModal').hide();
       }
    });
		
</script>
</html>