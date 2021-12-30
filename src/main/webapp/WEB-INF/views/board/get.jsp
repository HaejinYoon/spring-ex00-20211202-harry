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

<style>
body {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	background: url('https://s20211227-17499.s3.ap-northeast-2.amazonaws.com/wp2231069-3440x1440-wallpapers.jpg');
	background-repeat: no-repeat;
	background-size: cover;
}
.main{
	background-color: white;
	border-radius: 7px;
}

#input2 {
	height: 300px;
}

#replyTextarea, #sendReply {
	margin-bottom: 10px;
}

p, .reply-body {
	margin-bottom: 0px;
}

.reply-header {
	height: 20px;
}

textarea {
	width: 100%;
	height: 20%;
	border: none;
	resize: none;
}
</style>

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
								<table class="table table-bordered">
									<thead class="thead-light">
										<tr>
											<th>
												<div class="reply-header d-flex justify-content-between align-items-center">
													<div class="reply-nickName">
														<i class="far fa-comment"></i>
													</div>
													<div class="reply-menu">
															\${list[i].inserted}에 작성 
													</div>
												</div>
											</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>
												<p class="reply-body" style="white-space: pre;"></p>
												<div class="input-group" style="display:none;">
												<textarea id="replyTextarea\${list[i].id}" class="form-control reply-modi"></textarea>
													<div class="input-group-append">
														<button class="btn btn-outline-secondary cancel-button"><i class="fas fa-ban"></i></button>
														<button class="btn btn-outline-secondary" id="sendReply\${list[i].id}">
															<i class="far fa-comment-dots fa-lg"></i>
														</button>
													</div>
												</div>
											</td>										
										</tr>									
									</tbody>
								</table>
							</div>
						</div>`);
						
						replyMediaObject.find("#sendReply" + list[i].id).click(function() {
							const reply = replyMediaObject.find("#replyTextarea"+list[i].id).val();
							const data =  {
									reply : reply		
							};
							$.ajax({
								url : appRoot + "/reply/" + list[i].id,
								type : "put",
								contentType : "application/json",
								data : JSON.stringify(data),
								complete : function() {
									listReply();
								}
							});
						});
						
						replyMediaObject.find(".reply-nickName").append(list[i].nickName);
						replyMediaObject.find(".reply-body").text(list[i].reply);
						replyMediaObject.find(".form-control").text(list[i].reply);
						replyMediaObject.find(".cancel-button").click(function() {
							replyMediaObject.find(".reply-body").show();
							replyMediaObject.find(".input-group").hide();
							replyMediaObject.find("#replyModify").show();
							replyMediaObject.find("#replyDelete").show();
						});
						
						if (list[i].own || ${sessionScope.loggedInMember.adminQuali eq 1 }) {
							// 삭제버튼도 추가
							const removeButton = $("<button id='replyDelete' class='btn btn-outline-danger'><i class='far fa-trash-alt'></i></button>");
							const blank = $(" ");
							removeButton.click(function(){
								if (confirm("Sure you want to delete?")){
									$.ajax({
										url : appRoot +"/reply/"+list[i].id,
										type : "delete",
										complete : function(){
											listReply();
											listReplyCount();
										}
									})
								}
							})
							replyMediaObject.find(".reply-menu").prepend(removeButton);
						};
						if (list[i].own) {
							// 본인이 작성한 것만 수정버튼 추가
							const modifyButton = $("<button id='replyModify' class='btn btn-outline-primary'><i class='fas fa-edit'></i></button>")
							modifyButton.click(function() {
								$(this).parent().parent().parent().parent().parent().parent().find('.reply-body').hide();// this는 클릭이벤트가 발생한 버튼
								$(this).parent().parent().parent().parent().parent().parent().find('.input-group').show();
								$(this).parent().find('#replyModify').hide();
								$(this).parent().find('#replyDelete').hide();
							});
							replyMediaObject.find(".reply-menu").prepend(modifyButton);
							
						}
						
						$("#replyListContainer").append(replyMediaObject);
					}
				}
			})
		}
		listReply(); // 페이지 로딩 후 댓글 리스트 가져오는 함수 한 번 실행
		
		//댓글 전송
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
					// textarea reset
					$("#replyTextarea").val(""); 
				},
				error : function(){
					alert("Logged out! Please log in again!");
				},
				complete : function() {
					// list refresh
					listReply();
					listReplyCount();
				}
			})
		})//댓글전송
		//댓글 갯수
		const listReplyCount = function() {
			const boardId = '${board.id}';
			$.ajax({
				url : appRoot+ "/reply/count/"+${board.id},
				type : "get",
				success : function(count) {
					const replyCountObject = $(`<p class="replyCount" style="margin-bottom:0px;"><i class="far fa-comment-dots fa-lg cnt"></i> </p>`);
					$(".replyCount").parents().find(".replyCount").replaceWith(replyCountObject);
					$(".replyCount").parents().find(".replyCount").append(count);
				}
			})
		}
		listReplyCount();
	})
</script>


<title>${board.title } - ${board.nickName } </title>
</head>
<body>
	<!-- .container>.row>.col>h1{게시물 조회} -->
	<div class="container main">
		<div class="row">
			<div class="col">
				<b:navBar active="list"></b:navBar>
				<hr>
				<div class="content-header d-flex justify-content-start">
					<div class="mr-auto p-2">
						<p>Written on : ${board.inserted } || Updated on : ${board.updated }</p>
					</div>
					<div class="p-2">
						<p>
							<i class="fas fa-eye"></i>
							${board.views }
						</p>
					</div>
					<div class="p-2">
						<p class="replyCount" style="margin-bottom: 0px;">
							<i class="far fa-comment-dots fa-lg cnt"></i>
						</p>
					</div>
				</div>
				<hr>
				<div class="board-view ">
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
					<c:if test="${empty fileName }">
					<table class="table table-hover table-bordered">
						<thead class="thead-dark">
							<tr>
								<th>Uploaded Images</th>
							</tr>
						</thead>
						<c:forEach items="${fileNames }" var="fileName">
							<tbody>
								<tr>
									<td>
										<img class="img-fluid" src="${staticUrl }/${board.id }/${fileName }" alt="${fileName }">
									</td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
					</c:if>
					<div class="form-group">
						<label for="input3">Writer</label>
						<input type="text" class="form-control" id="input3" readonly value="${board.nickName }">
					</div>
					<!-- a.btn.btn-outline-secondary>i.far.fa-edit -->
					<c:choose>
						<c:when test="${sessionScope.loggedInMember.id eq board.writer }">
							<div class="d-flex justify-content-between">
								<a href="modify?id=${board.id }&page=${currentPage}" class="btn btn-outline-secondary">
									<i class="fas fa-edit"> Modify</i>
									/
									<i class="fas fa-trash"> Delete</i>
									<!-- <i class="far fa-edit"></i> -->
								</a>
								<a href="${pageContext.request.contextPath }/board/list?page=${currentPage}" class="btn btn-outline-secondary ">
									<i class="fas fa-list"> Back to Board List</i>
								</a>
							</div>
						</c:when>
						<c:otherwise>
							<div class="d-flex justify-content-end">
								<a href="${pageContext.request.contextPath }/board/list?page=${currentPage}" class="btn btn-outline-secondary ">
									<i class="fas fa-list"> Back to Board List</i>
								</a>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<!--  댓글 작성 container  -->
		<div class="container">
			<hr>
			<br>
			<p style="margin-bottom: 0px;" class="replyCount">
				<i class="far fa-comment-dots fa-lg cnt"></i>
			</p>
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
		<b:copyright></b:copyright>
	</div>

	
		<!-- Modal -->
	<c:if test="${not empty result }">
		<div class="modal" tabindex="-1" id="modal1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Process Result</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<p>${result }</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
	<script>
		$(document).ready(function() {
			if (history.state == null) {
				$("#modal1").modal('show');
				history.replaceState({}, null);
			}
		});
	</script>
</body>
</html>