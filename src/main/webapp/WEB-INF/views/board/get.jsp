<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags/board" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resource/css/icon/css/all.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

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

<title>Board Content</title>
</head>
<body>

<b:navBar></b:navBar>
<!-- .container>.row>.col>h1{게시물 조회} -->
<div class="container">
	<div class="row">
		<div class="col">
			<h1>Board Content</h1>
			<div class="row">
				<div class="col-6">
					<p>Written on : ${board.inserted } </p>
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
					<textarea class="form-control" id="input2"  readonly>${board.content }</textarea>
					<!-- <input type="text" class="form-control" id="input2" readonly=""> -->
				</div>
				<div class="form-group">
					<label for="input3">Writer</label>
					<input type="text" class="form-control" id="input3" readonly value="${board.nickName }">
				</div>
				<!-- a.btn.btn-outline-secondary>i.far.fa-edit -->
				<c:if test="${sessionScope.loggedInMember.id eq board.writer }">
				<a href="modify?id=${board.id }" class="btn btn-outline-secondary">
					<i class="fas fa-edit">Modify</i> / <i class="fas fa-trash">Delete</i>
					<!-- <i class="far fa-edit"></i> -->
				</a>
				</c:if><br>
				<a href="/controller/board/list" class="btn btn-outline-secondary"><i class="fas fa-chevron-left">Back to Board List</i></a>
			</div>
		</div>
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>
</html>