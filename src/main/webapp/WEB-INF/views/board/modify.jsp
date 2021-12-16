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
<link href="<%= request.getContextPath() %>/resource/favicon/favicon.png" rel="icon" type="image/x-icon" />

<style>
body {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
}

#input2 {
	width: 1110px;
	height: 300px;
}
</style>

<title>Board Modification</title>
</head>
<body>

	<b:navBar></b:navBar>

	<!-- .container>.row>.col>h1{게시물 작성} -->
	<div class="container">
		<div class="row">
			<div class="col">
				<h1>Board Modification</h1>
				<!-- form>.form-group*3>label[for=input$]+input.form-control#input$ -->
				<form id="modifyForm" method="post">
					<input type="hidden" name="id" value="${board.id }">
					<div class="form-group">
						<label for="input1">Title</label>
						<input type="text" class="form-control" id="input1" name="title" value="${board.title }">
					</div>
					<div class="form-group">
						<label for="input2">Contents</label>
						<textarea class="form-control" id="input2" name="content">${board.content }</textarea>
					</div>
					<div class="form-group">
						<label for="input3">Writer</label>
						<input type="text" class="form-control" id="input3" value="${board.nickName }" readonly>
					</div>
					<input type="hidden" name="writer" value="${board.writer }">
					<button id="modifySubmitButton" class="btn btn-outline-primary" type="submit">
						<i class="fas fa-edit"> Modify</i>
					</button>
					<!-- button.btn.btn-outline-danger{Delete} -->
					<button id="removeSubmitButton" class="btn btn-outline-danger">
						<i class="fas fa-trash"> Delete</i>
					</button>
					<a href="${pageContext.request.contextPath }/board/list" class="btn btn-outline-secondary">Cancel</a>
				</form>
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
		});
	</script>
</body>
</html>