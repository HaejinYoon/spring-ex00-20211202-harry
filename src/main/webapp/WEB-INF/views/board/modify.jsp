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

<style>
body {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	background: url('https://s20211227-17499.s3.ap-northeast-2.amazonaws.com/wp2231069-3440x1440-wallpapers.jpg');
	background-repeat: no-repeat;
	background-size: cover;
}

.main {
	background-color: white;
	border-radius: 7px;
}

#input2 {
	height: 300px;
}

.button-group {
	margin-bottom: 100px;
}
</style>

<title>Board Modification</title>
</head>
<body>
	<!-- .container>.row>.col>h1{게시물 작성} -->
	<div class="container main">
		<div class="row">
			<div class="col">
				<b:navBar active="list"></b:navBar>
				<h1>Board Modification</h1>
				<!-- form>.form-group*3>label[for=input$]+input.form-control#input$ -->
				<form id="modifyForm" method="post" enctype="multipart/form-data">
					<input type="hidden" name="id" value="${board.id }">
					<div class="form-group">
						<label for="input1">Title</label>
						<div class="input-group">
							<input type="text" class="form-control" id="input1" name="title" value="${board.title }">
						</div>
						<c:choose>
							<c:when test="${board.notice eq 1 }">
								<br>
								<input type="checkbox" name="notice" id="input8" value="1" checked="checked">Notice
							</c:when>
							<c:when test="${sessionScope.loggedInMember.adminQuali eq 1 }">
								<br>
								<input type="checkbox" name="notice" id="input5" value="1">
								Notice <hr>
							</c:when>
						</c:choose>
						<div style="visibility: hidden">
							<input type="hidden" name="notice" id="input6" value="0">
						</div>
					</div>
					<div class="form-group">
						<label for="input2">Contents</label>
						<textarea class="form-control" id="input2" name="content">${board.content }</textarea>
					</div>
					<c:if test="${not empty fileNames }">
						<table class="table table-hover table-bordered">
							<thead class="thead-dark">
								<tr>
									<th>Select files to delete</th>
									<th>Images</th>
								</tr>
							</thead>
							<c:forEach items="${fileNames }" var="fileName">
								<tbody>
									<tr>
										<td>
											<div class="col d-flex justify-content-center align-items-center">
												<input class="check" type="checkbox" name="removeFile" value="${fileName }">
											</div>
										</td>
										<td>
											<div class="col">
												<img class="img-fluid" src="${staticUrl }/${board.id }/${fileName }" alt="${fileName }">
											</div>
										</td>
									</tr>
								</tbody>
							</c:forEach>
						</table>
					</c:if>

					<div class="form-group">
						<label for="input4">Image</label>
						<input type="file" class="form-control-file" id="input4" name="files" accept="image/*" multiple>
					</div>

					<div class="form-group">
						<label for="input3">Writer</label>
						<input type="text" class="form-control" id="input3" value="${board.nickName }" readonly>
					</div>
					<input type="hidden" name="writer" value="${board.writer }">
					<input type="hidden" name="currentPage" value="${currentPage}">
					<!-- button.btn.btn-outline-danger{Delete} -->
				</form>
				<div class="button-group">
					<button id="modifySubmitButton" class="btn btn-outline-primary" type="submit">
						<i class="fas fa-edit"> Modify</i>
					</button>
					<button id="" class="btn btn-outline-danger" data-toggle="modal" data-target="#confirmModal1">
						<i class="fas fa-trash"> Delete</i>
					</button>
					<a href="${pageContext.request.contextPath }/board/get?id=${board.id }&page=${currentPage}" class="btn btn-outline-secondary">Cancel</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="confirmModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Delete Confirmation</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">Are you sure want to delete?</div>
				<div class="modal-footer">
					<button id="removeSubmitButton" type="submit" class="btn btn-danger">
						<i class="fas fa-trash"> Delete</i>
					</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
				</div>
			</div>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
	<script>
		$(document).ready(function() {
			$("#removeSubmitButton").click(function(e) {
				e.preventDefault(); // 기본동작을 진행하지 않도록 함
				$("#modifyForm").attr("action", "remove").submit();
			});
			$("#modifySubmitButton").click(function(e) {
				e.preventDefault();
				$("#modifyForm").attr("action", "modify").submit();
			});
			if (history.state == null) {
				$("#modal1").modal('show');
				history.replaceState({}, null);
			}
		});
	</script>
</body>
</html>