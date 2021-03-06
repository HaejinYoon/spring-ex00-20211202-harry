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

.main {
	background-color: white;
	border-radius: 7px;
}
</style>

<title>Member Information</title>
</head>
<body>
	<!-- .container>.row>.col>h1{Member Information} -->
	<div class="container main">
		<div class="row">
			<div class="col">
				<b:navBar active="memberInfo"></b:navBar>
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
						<small id="PwCheckMessage" class="form-text"></small>
					</div>
					<div class="form-group">
						<label for="input6">Password Confirm</label>
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
						<div class="input-group">
							<input type="text" class="form-control" id="input5" required name="nickname" value="${sessionScope.loggedInMember.nickname }">
							<div class="input-group-append">
								<button class="btn btn-secondary" id="nickNameCheckButton" type="button" disabled="disabled">Overlap Check</button>
							</div>
						</div>
						<small id="nicknameHelp" class="form-text text-muted">If you want to use same, don't do overlap check.</small>
						<small id="nicknameCheckMessage" class="form-text"></small>
					</div>
					<div class="form-group">
						<label for="input7">Joined us Since</label>
						<input type="text" required class="form-control" id="input7" value="${sessionScope.loggedInMember.inserted }" readonly>
					</div>
					<!-- button.btn.btn-outline-secondary{Modify}+button.btn.btn-outline-danger{Delete} -->
					<button class="btn btn-secondary" id="modifyButton" disabled>Modify</button>
					<button class="btn btn-danger" id="removeButton">End Membership</button>
					<a href="${pageContext.request.contextPath }/board/list" class="btn btn-outline-secondary">Cancel</a>
				</form>
			</div>
		</div>
		<b:copyright></b:copyright>
	</div>



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
					infoForm.attr("action","remove");
					infoForm.submit();
				}
			})
			// ??? ?????? ??????????????? ?????? ?????? ?????? submit ?????? ????????? 
			// ????????? ????????????
			const passwordInput = $("#input2");
			const passwordConfirmInput = $("#input6");
			const submitButton = $("#modifyButton");

			// submit button ????????? ?????? ??????
			let passwordCheck = false;
			let nicknameAble = true;

			// submit ?????? ????????? ?????????
			let enableSubmit = function() {
				if (passwordCheck && nicknameAble) {
					submitButton.removeAttr("disabled");
				} else {
					submitButton.attr("disabled", true);
				}
			};

			// ID ???????????? ????????? ????????????
			// ID Input????????? ????????? ?????? ????????? ?????? ???
			// ???????????? ?????? ????????? 
			// 1> ????????? ?????? ????????? ?????? ????????????
			// 2> ?????? ?????? ?????? ????????? ????????? ??????

			// context path
			const appRoot = "${pageContext.request.contextPath}"
			
			// nickname duplication check method
			const nicknameValueOld = $("#input5").val().trim();
			const nickDupCheck = function() {
				const nicknameValue = $("#input5").val().trim();
				
				// nickname input??? ????????? ????????? ??? ?????? ?????????
				if (nicknameValue.trim() === "") {
					$("#nicknameCheckMessage")
						.text("Please input Nickname you want.")
						.removeClass(	"text-primary text-danger")
						.addClass("text-warning");
					$("#nicknameCheckMessage").removeAttr("disabled");
					return;
				}
				$.ajax({
					url : appRoot + "/member/nickcheck",
					data : {
						nickname : nicknameValue,
					},
					success : function(data) {
						switch (data) {
						case "able":
							// ??????????????? ???
							$("#nicknameCheckMessage")
								.text("You can use this Nickname.")
								.removeClass("text-danger text-warning")
								.addClass("text-primary");
							// submit ?????? ????????? ?????? ??????
							nicknameAble = true;
							break;
						case "unable":
							// ?????? ???????????? ???
							$("#nicknameCheckMessage")
								.text("Nickname already exists. Use different Nickname.")
								.removeClass("text-primary text-warning")
								.addClass("text-danger");
							// submit ?????? ???????????? ?????? ??????
							nicknameAble = false;
							break;
						default:
							break;
						}
					},
					complete : function() {
						enableSubmit(); // ????????? ??????????????? ?????? submit ?????? ?????????
						$("#nicknameCheckMessage").removeAttr("disabled");
					}
				});
			}
			// nickname duplication check
			$("#nickNameCheckButton").click(function() {
				nickDupCheck();
			});

			$("#input5").keyup(function() {
				if(nicknameValueOld==$("#input5").val().trim()) {
					console.log($("#input5").val().trim());
					nicknameAble = true;
					$("#nicknameCheckMessage")
					.text("You can use this Nickname.")
					.removeClass("text-danger text-warning")
					.addClass("text-primary");
					$("#nickNameCheckButton").attr("disabled", true);
				} else {
					nicknameAble = false;
					$("#nicknameCheckMessage")
					.text("Check the nickname again.")
					.removeClass("text-primary text-danger")
					.addClass("text-warning");
					$("#nickNameCheckButton").removeAttr("disabled");
					enableSubmit();
				}

			});
			
			// ?????? input??? ???????????? input??? ???????????? ????????? ?????? ?????? ????????????
			$("#input6").keyup(function() {
				const confirmFunction = function() {
					const passwordValue = passwordInput.val();
					const passwordConfirmValue = passwordConfirmInput.val();

					if (passwordValue === passwordConfirmValue) {
						//submitButton.removeAttr("disabled");
						$("#PwCheckMessage")
							.text(	"Password matches.")
							.removeClass("text-danger text-warning")
							.addClass("text-primary");
						passwordCheck = true;
					} else {
						//submitButton.attr("disabled", true);
						$("#PwCheckMessage")
							.text("Password doesn't match.")
							.removeClass("text-primary text-warning")
							.addClass("text-danger");
						passwordCheck = false;
					}
					enableSubmit(); // ????????? ??????????????? ?????? submit ?????? ?????????
				};
				submitButton.attr("disabled",	true);
				passwordInput	.keyup(confirmFunction);
				passwordConfirmInput	.keyup(confirmFunction);
			});
		});
	</script>
</body>
</html>