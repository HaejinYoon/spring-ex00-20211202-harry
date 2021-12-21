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
}
</style>

<title>Member Information</title>
</head>
<body>
	<!-- .container>.row>.col>h1{Member Information} -->
	<div class="container">
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
							<input type="hidden" id="input8" name="nicknameOriginal" value="${sessionScope.loggedInMember.nickname }">
							<div class="input-group-append">
								<button class="btn btn-secondary" id="nickNameCheckButton" type="button">Overlap Check</button>
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
					<a href="${pageContext.request.contextPath }/board/list"  class="btn btn-outline-secondary" >Cancel</a>
				</form>
			</div>
		</div>
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
			// 두 개의 인풋요소의 값이 같을 때만 submit 버튼 활성화 
			// 아니면 비활성화
			const passwordInput = $("#input2");
			const passwordConfirmInput = $("#input6");
			const submitButton = $("#modifyButton");

			// submit button 활성화 조건 변수
			let passwordCheck = false;
			let nicknameAble = true;

			// submit 버튼 활성화 메소드
			let enableSubmit = function() {
				if (passwordCheck && nicknameAble) {
					submitButton.removeAttr("disabled");
				} else {
					submitButton.attr("disabled", true);
				}
			};

			// ID 중복확인 버튼이 클릭되면
			// ID Input요소에 입력된 값을 서버에 전송 후
			// 응답받은 값에 따라서 
			// 1> 서브밋 버튼 활성화 또는 비활성화
			// 2> 사용 가능 또는 불가능 메시지 출력

			// context path
			const appRoot = "${pageContext.request.contextPath}"
			
			// nickname duplication check method
			const nickDupCheck = function() {
				const nicknameValue = $("#input5").val().trim();
				const nicknameOriginalValue = $("#input8").val().trim();
				// nickname input에 입력이 안됬을 때 안내 메시지
				if (nicknameValue.trim() === "") {
					$("#nicknameCheckMessage")
						.text("Please input Nickname you want.")
						.removeClass(	"text-primary text-danger")
						.addClass("text-warning");
					$("#nicknameCheckMessage").removeAttr("disabled");
					return;
				}
				$.ajax({
					url : appRoot + "/member/nickcheckinfo",
					data : {
						nickname : nicknameValue,
						nicknameOriginal : nicknameOriginalValue,
					},
					success : function(data) {
						switch (data) {
						case "able":
							// 사용가능할 때
							$("#nicknameCheckMessage")
								.text("You can use this Nickname.")
								.removeClass("text-danger text-warning")
								.addClass("text-primary");
							// submit 버튼 활성화 조건 추가
							nicknameAble = true;
							break;
						case "unable":
							// 사용 불가능할 때
							$("#nicknameCheckMessage")
								.text("Nickname already exists. Use different Nickname.")
								.removeClass("text-primary text-warning")
								.addClass("text-danger");
							// submit 버튼 비활성화 조건 추가
							nicknameAble = false;
							break;
						default:
							break;
						}
					},
					complete : function() {
						enableSubmit(); // 조건이 충족되었을 때만 submit 버튼 활성화
						$("#nicknameCheckMessage").removeAttr("disabled");
					}
				});
			}
			// nickname duplication check
			$("#nickNameCheckButton").click(function() {
				nickDupCheck();
			});

			$("#input5").keyup(function() {
				nicknameAble = false;
				$("#nicknameCheckMessage")
				.text("Check the nickname again.")
				.removeClass("text-primary text-danger")
				.addClass("text-warning");
				enableSubmit();

			});
			
			// 암호 input과 암호확인 input값 비교해서 서브밋 버튼 활성 비활성화
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
					enableSubmit(); // 조건이 충족되었을 때만 submit 버튼 활성화
				};
				submitButton.attr("disabled",	true);
				passwordInput	.keyup(confirmFunction);
				passwordConfirmInput	.keyup(confirmFunction);
			});
		});
	</script>
</body>
</html>