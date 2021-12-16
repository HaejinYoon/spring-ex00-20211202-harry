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
<link href="<%=request.getContextPath()%>/resource/favicon/favicon.ico" rel="icon" type="image/x-icon" />

<style>
body {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
}
</style>

<title>Member Information</title>
</head>
<body>
	<b:navBar></b:navBar>

	<!-- .container>.row>.col>h1{Member Information} -->
	<div class="container">
		<div class="row">
			<div class="col">
				<h1>Member Information</h1>
				<!-- form>.form-group*4>label[for=input$]+input.form-control[name][value] -->
				<form method="post" id="infoForm">
					<div class="form-group">
						<label for="input1">ID</label>
						<input type="text" required class="form-control" id="input1" name="id" value="${sessionScope.loggedInMember.id }" readonly>
					</div>
					<div class="form-group">
						<label for="input2">Password</label>
						<input type="password" required class="form-control" id="input2" name="password" value="${sessionScope.loggedInMember.password }">
					</div>
					<div class="form-group">
						<label for="input6">Password</label>
						<input type="password" required class="form-control" id="input6" aria-describedby="passwordHelp">
						<small id="passwordHelp" class="form-text text-muted">Password must be matched</small>
					</div>
					<div class="form-group">
						<label for="input3">E-Mail</label>
						<input type="email" required class="form-control" id="input3" name="email" value="${sessionScope.loggedInMember.email }">
					</div>
					<div class="form-group">
						<label for="input4">Address</label>
						<input type="text" required class="form-control" id="input4" name="address" value="${sessionScope.loggedInMember.address }">
					</div>
					<div class="form-group">
						<label for="input5">NickName</label>
						<input type="text" required class="form-control" id="input5" name="nickname" value="${sessionScope.loggedInMember.nickname }">
					</div>
					<div class="form-group">
						<label for="input7">Joined us Since</label>
						<input type="text" required class="form-control" id="input7" value="${sessionScope.loggedInMember.inserted }" readonly>
					</div>
					<!-- button.btn.btn-outline-secondary{Modify}+button.btn.btn-outline-danger{Delete} -->
					<button class="btn btn-outline-secondary" id="modifyButton">Modify</button>
					<button class="btn btn-outline-danger" id="removeButton">End Membership</button>
				</form>
			</div>
		</div>
	</div>



	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
	<script>
		$(document).ready(function() {
			const infoForm = $("#infoForm");

			$("#modifyButton").click(function(e) {
				e.preventDefault();
				infoForm.attr("action", "");
				infoForm.submit();
			});

			$("#removeButton").click(function(e) {
				e.preventDefault();
				if (confirm("Would you like to end Membership?")) {

					infoForm.attr("action", "remove");
					infoForm.submit();
				}
			})

			//password confirm
			const passwordInput = $("#input2");
			const passwordConfirmInput = $("#input6");
			const submitButton = $("#modifyButton");

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