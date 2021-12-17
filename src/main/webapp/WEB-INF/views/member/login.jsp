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
</style>

<title>Login Page</title>
</head>
<body>
	<!-- .container>.row>.col>h1{Log-in} -->
	<div class="container">
		<div class="row">
			<div class="col">
				<b:navBar></b:navBar>
				<h1>Log-in</h1>
				<!-- form>.form-group*2>label[for=input$]+input.form-control[name][required]^button.btn.btn-outline-primary{Log-in} -->
				<form method="post">
					<div class="form-group">
						<label for="input1">ID</label>
						<input type="text" class="form-control" name="id" required>
					</div>
					<div class="form-group">
						<label for="input2">Password</label>
						<input type="password" class="form-control" name="password" required>
					</div>
					<button class="btn btn-outline-primary">Log-in</button>
				</form>
			</div>
		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>
</html>