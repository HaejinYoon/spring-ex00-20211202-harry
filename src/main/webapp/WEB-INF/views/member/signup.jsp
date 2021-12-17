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
					<div class="alert alert-warning">${alertMessage }</div>
				</c:if>

				<!-- form>.form-group*4>label[for=input$]+input.form-control#input$[required]^+button.btn.btn-outline-primary{signup} -->
				<form method="post">
					<div class="form-group">
						<label for="input1">ID</label>
						<!-- .input-group>.input-group-append>button.btn.btn-secondary#idCheckButton{Dup check} -->
						<div class="input-group">
							<input type="text" class="form-control" id="input1" required name="id" value="${member.id }">
							<div class="input-group-append">
								<button class="btn btn-secondary" id="idCheckButton" type="button">Overlap Check</button>
							</div>
						</div>
						<small id="IdCheckMessage" class="form-text"></small>
					</div>
					<div class="form-group">
						<label for="input2">Password</label>
						<input type="password" class="form-control" id="input2" required name="password" value="${member.password }">
						<small id="PwCheckMessage" class="form-text"></small>
					</div>
					<div class="form-group">
						<label for="input6">Password Confirm</label>
						<input type="password" class="form-control" id="input6" aria-describedby="passwordHelp">
						<small id="passwordHelp" class="form-text text-muted">Password must be matched</small>
					</div>
					<div class="form-group">
						<label for="input5">NickName</label>
						<div class="input-group">
							<input type="text" class="form-control" id="input5" required name="nickname" value="${member.nickname }">
							<div class="input-group-append">
								<button class="btn btn-secondary" id="nickNameCheckButton" type="button">Overlap Check</button>
							</div>
						</div>
						<small id="nicknameCheckMessage" class="form-text"></small>
					</div>
					<div class="form-group">
						<label for="input3">email</label>
						<input type="email" class="form-control" id="input3" required name="email" value="${member.email }">
					</div>
					<div class="form-group">
						<label for="input4">Address</label>
						<input type="text" class="form-control" id="input4" required name="address" value="${member.address }">
					</div>
					<button class="btn btn-primary" id="submitButton1">Sign-up</button>
				</form>
			</div>
		</div>
	</div>


	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

	<script>
		$(document).ready(function() {
			// 두 개의 인풋요소의 값이 같을 때만 submit 버튼 활성화 
			// 아니면 비활성화
			const passwordInput = $("#input2");
			const passwordConfirmInput = $("#input6");
			const submitButton = $("#submitButton1");
			
			// submit button 활성화 조건 변수
			let idAble = false;
			let passwordCheck = false;
			let nicknameAble = false;
			
			// submit 버튼 활성화 메소드
			let enableSubmit = function() {
				if(idAble && passwordCheck&& nicknameAble){
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
			const appRoot ="${pageContext.request.contextPath}";
			
			$("#idCheckButton").click(function() {
				$("#IdCheckMessage").attr("disabled", true);
				const idValue=$("#input1").val().trim();
				// 아이디 input에 입력이 안됬을 때 안내 메시지
				if(idValue.trim()===""){
					$("#IdCheckMessage").text("Please input ID you want.").removeClass("text-primary text-danger").addClass("text-warning");
					$("#IdCheckMessage").removeAttr("disabled");
					return;
				}
				$.ajax({
					url : appRoot+"/member/idcheck",
					data : {
						id : idValue 
					},
					success : function(data){
						switch(data){
						case "able":
							// 사용가능할 때
							$("#IdCheckMessage").text("You can use this ID.").removeClass("text-danger text-warning").addClass("text-primary");
							// submit 버튼 활성화 조건 추가
							idAble = true;
							break;
						case "unable":
							// 사용 불가능할 때
							$("#IdCheckMessage").text("ID alread exists. Use different ID.").removeClass("text-primary text-warning").addClass("text-danger");
							// submit 버튼 비활성화 조건 추가
							idAble = false;
							break;	
						default:
							break;
						}
					},
					complete : function() {
						enableSubmit(); // 조건이 충족되었을 때만 submit 버튼 활성화
						$("#IdCheckMessage").removeAttr("disabled");
					}
				});
			});
			
			// nickname duplication check
			$("#nickNameCheckButton").click(function() {
				$("#nickNameCheckMessage").attr("disabled", true);
				const nicknameValue=$("#input5").val().trim();
				// nickname input에 입력이 안됬을 때 안내 메시지
				if(nicknameValue.trim()===""){
					$("#nicknameCheckMessage").text("Please input Nickname you want.").removeClass("text-primary text-danger").addClass("text-warning");
					$("#nicknameCheckMessage").removeAttr("disabled");
					return;
				}
				$.ajax({
					url : appRoot+"/member/nickcheck",
					data : {
						nickname : nicknameValue 
					},
					success : function(data){
						switch(data){
						case "able":
							// 사용가능할 때
							$("#nicknameCheckMessage").text("You can use this Nickname.").removeClass("text-danger text-warning").addClass("text-primary");
							// submit 버튼 활성화 조건 추가
							nicknameAble = true;
							break;
						case "unable":
							// 사용 불가능할 때
							$("#nicknameCheckMessage").text("Nickname already exists. Use different Nickname.").removeClass("text-primary text-warning").addClass("text-danger");
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
			});
			// 암호 input과 암호확인 input값 비교해서 서브밋 버튼 활성 비활성화
			$("#input6").keyup(function() {
				const confirmFunction = function() {
					const passwordValue = passwordInput.val();
					const passwordConfirmValue = passwordConfirmInput.val();
	
					if (passwordValue === passwordConfirmValue) {
						//submitButton.removeAttr("disabled");
						$("#PwCheckMessage").text("Password matches.").removeClass("text-danger text-warning").addClass("text-primary");
						passwordCheck = true;
					} else {
						//submitButton.attr("disabled", true);
						$("#PwCheckMessage").text("Password doesn't match.").removeClass("text-primary text-warning").addClass("text-danger");
						passwordCheck = false;
					}
					enableSubmit(); // 조건이 충족되었을 때만 submit 버튼 활성화
				};
				submitButton.attr("disabled", true);
				passwordInput.keyup(confirmFunction);
				passwordConfirmInput.keyup(confirmFunction);
			});

		});
	</script>
</body>
</html>