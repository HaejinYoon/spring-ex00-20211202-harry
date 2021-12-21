<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags/board"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/icon/css/all.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<link href="<%=request.getContextPath()%>/resource/favicon/favicon.png" rel="icon" type="image/x-icon" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>
$(document).ready(function(){
	/*context path*/
	const appRoot = '${pageContext.request.contextPath}';
	/* 현재 게시물의 댓글 목록 불러오는 함수*/
	const listReply = function() {
		$("#replyListContainer").empty();
		$.ajax({
			url : appRoot + "/reply/board/${board.id}",
			success : function (list) {
				for (let i = 0; i<list.length; i++){
					const replyMediaObject = $(`
					<hr>
					<div class="media">
						<div class="media-body">
							<h5 class="mt-0"><i class="far fa-comment"></i>
							<span class="reply-nickName"></span>가
							\${list[i].inserted}에 작성</h5>
							<p class="reply-body"></p>
						</div>
					</div>`);
					replyMediaObject.find(".reply-nickName").text(list[i].nickName);
					replyMediaObject.find(".reply-body").text(list[i].reply);
					
					$("#replyListContainer").append(replyMediaObject);
				};
			}
		})
	};
	listReply(); // 페이지 로딩 후 댓글 리스트 가져오는 함수 한 번 실행
	/*댓글 전송*/
	$("#sendReply").click(function() {
		const reply =$("#replyTextarea").val();
		const memberId = '${sessionScope.loggedInMember.id}';
		const boardId = '${board.id}';
		
		const data = {
				reply : reply,
				memberId : memberId,
				boardId : boardId
		};
		$.ajax({
			url : appRoot+ "/reply/write",
			type : "post",
			data : data,
			success : function() {
				// list refresh
				listReply();
				// textarea reset
				$("#replyTextarea").val(""); 
			}
		})
	})
})
</script>

<style>
body {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
}

#input2 {
	height: 300px;
}
</style>

<title>Board Content</title>
</head>
<body>
	<!-- .container>.row>.col>h1{게시물 조회} -->
	<div class="container">
		<div class="row">
			<div class="col">
				<b:navBar></b:navBar>
				<h1>Board Content</h1>
				<div class="row">
					<div class="col-6">
						<p>Written on : ${board.inserted }</p>
					</div>
					<div class="col-4">
						<p>Updated on : ${board.updated }</p>
					</div>
					<div class="col-2">
						<p>Views : ${board.views }</p>
					</div>
				</div>

				<div class="board-view">
					<!-- .form-group*3>label[for=input$]+input.form-control#input$[readonly] -->
					<div class="form-group">
						<label for="input1">Title</label>
						<input type="text" class="form-control" id="input1" readonly value="${board.title }">
					</div>
					<div class="form-group">
						<label for="input2">Content</label>
						<textarea class="form-control" id="input2" readonly>${board.content }</textarea>
						<!-- <input type="text" class="form-control" id="input2" readonly=""> -->
					</div>
					<div class="form-group">
						<label for="input3">Writer</label>
						<input type="text" class="form-control" id="input3" readonly value="${board.nickName }">
					</div>
					<!-- a.btn.btn-outline-secondary>i.far.fa-edit -->
					<c:if test="${sessionScope.loggedInMember.id eq board.writer }">
						<a href="modify?id=${board.id }&page=${currentPage}" class="btn btn-outline-secondary">
							<i class="fas fa-edit"> Modify</i>
							/
							<i class="fas fa-trash"> Delete</i>
							<!-- <i class="far fa-edit"></i> -->
						</a>
					</c:if>
					<a href="${pageContext.request.contextPath }/board/list?page=${currentPage}" class="btn btn-outline-secondary">
						<i class="fas fa-chevron-left"> Back to Board List</i>
					</a>
				</div>
			</div>
		</div>
	</div>
	
	<!--  댓글 작성 container  -->
	<div class="container">
		<hr>
		<h1>Reply</h1>
		<c:if test="${not empty sessionScope.loggedInMember }">
			<div class="row">
				<div class="col">
					<hr>
					<!-- .input-group>textarea#replyTextarea.form-control+.input-group-append>button.btn.btn-outline-secondary#sendReply -->
					<div class="input-group">
						<textarea id="replyTextarea" class="form-control"></textarea>
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" id="sendReply">
								<i class="far fa-comment-dots fa-lg"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
		</c:if>
	</div>
	<!--  댓글 container -->
	<div class="container">
		<div class="row">
			<div class="col">
				<div id="replyListContainer"></div>
			</div>
		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>
</html>