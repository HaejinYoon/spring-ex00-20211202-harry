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
</style>

<title>Write On Board</title>
</head>
<body>

	<!-- .container>.row>.col>h1{게시물 작성} -->
	<div class="container main">
		<div class="row">
			<div class="col">
				<b:navBar active="register"></b:navBar>
				<h1>Fill in Board</h1>
				<!-- form>.form-group*3>label[for=input$]+input.form-control#input$ -->
				<form method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label for="input1">Title</label>
						<div class="input-group">
							<input type="text" class="form-control" id="input1" name="title">
						</div>
					</div>
					<c:if test="${sessionScope.loggedInMember.adminQuali eq 1 }">
						<br>
						<div>
							<input type="checkbox" name="notice" id="input5" value="1">
							Notice
							<hr>
						</div>
					</c:if>
					<div style="visibility: hidden">
						<input type="hidden" name="notice" id="input6" value="0">
					</div>
					<div class="form-group">
						<label for="input2">Contents</label>
						<textarea class="form-control" id="input2" name="content"></textarea>
					</div>

					<!-- .form-group>label[for=input4]+input[type=file].form-control-file#input4[name=files] -->
					<div class="form-group">
						<label for="input4">Image</label>
						<input type="file" class="form-control-file" id="input4" name="files" accept="image/*" multiple>
					</div>

					<div class="form-group">
						<label for="input3">Writer</label>
						<c:if test="${not empty sessionScope.loggedInMember }">
							<input type="text" class="form-control" id="input3" readonly value="${sessionScope.loggedInMember.nickname }">
						</c:if>
						<c:if test="${empty sessionScope.loggedInMember }">
							<input type="text" class="form-control" id="input3" readonly value="Guest">
						</c:if>
					</div>
					<input type="hidden" name="writer" value="${sessionScope.loggedInMember.id }">


					<button class="btn btn-outline-primary" type="submit">Register</button>
					<a href="${pageContext.request.contextPath }/board/list" class="btn btn-outline-secondary">Cancel</a>
				</form>
			</div>
		</div>
		<b:copyright></b:copyright>
	</div>


	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>
</html>