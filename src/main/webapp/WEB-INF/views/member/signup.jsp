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
<link href="<%= request.getContextPath() %>/resource/favicon/favicon.ico" rel="icon" type="image/x-icon" />

<style>
body {
  font-family: Arial, Helvetica, sans-serif;
  font-size: 14px;
}
</style>

<title>Sign-up Page</title>
</head>
<body>
<b:navBar></b:navBar>

<!-- .container>.row>.col>h1{회원 가입} -->
<div class="container">
	<div class="row">
		<div class="col">
			<h1>Sign-up Form</h1>
			
			<c:if test="${not empty alertMessage}">
				<div class="alert alert-warning">
					${alertMessage }
				</div>
			</c:if>
			
			<!-- form>.form-group*4>label[for=input$]+input.form-control#input$[required]^+button.btn.btn-outline-primary{signup} -->
			<form method="post">
				<div class="form-group">
					<label for="input1">ID</label>
					<input type="text" class="form-control" id="input1" required name="id" value="${member.id }">
				</div>
				<div class="form-group">
					<label for="input2">Password</label>
					<input type="password" class="form-control" id="input2" required name="password" value="${member.password }">
				</div>
				<div class="form-group">
					<label for="input6">Password Confirm</label>
					<input type="password" class="form-control" id="input6"aria-describedby="passwordHelp">
					 <small id="passwordHelp" class="form-text text-muted">Password must be matched</small>
				</div>
				<div class="form-group">
					<label for="input3">email</label>
					<input type="email" class="form-control" id="input3" required name="email" value="${member.email }">
				</div>
				<div class="form-group">
					<label for="input4">Address</label>
					<input type="text" class="form-control" id="input4" required name="address" value="${member.address }">
				</div>
				<div class="form-group">
					<label for="input5">NickName</label>
					<input type="text" class="form-control" id="input5" required name="nickname" value="${member.nickname }">
				</div>
				<button class="btn btn-outline-primary" id="submitButton1">Sign-up</button>
			</form>
		</div>
	</div>
</div>


<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

  <script>
$(document).ready(function() {
	// 두 개의 인풋요소의 값이 같을 때만 submit 버튼 활성화 
	// 아니면 비활성화
	const passwordInput = $("#input2");
	const passwordConfirmInput = $("#input6");
	const submitButton = $("#submitButton1");
    
	const confirmFunction = function() {
		const passwordValue = passwordInput.val();
		const passwordConfirmValue = passwordConfirmInput.val();
      
		if (passwordValue === passwordConfirmValue) {
			submitButton.removeAttr("disabled");
		} else {
			submitButton.attr("disabled", true);    
		}
	};
    
	submitButton.attr("disabled", true);
    
	passwordInput.keyup(confirmFunction);
    
	passwordConfirmInput.keyup(confirmFunction);
    
});
  </script>
</body>
</html>