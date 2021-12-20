<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resource/css/icon/css/all.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>
$(document).ready(function(){
	const appRoot = "${pageContext.request.contextPath}";
	$("#button01").click(function(){
		$.ajax({
			url : appRoot+"/cont15/met01",
			success : function(data){
				console.log(data);
			}
		})
	})
	
	$("#button02").click(function(){
		$.ajax({
			url : appRoot+"/cont15/met02",
			success : function(data){
				console.log("성공");
			},
			error : function(){
				console.log("실패");
			},
			complete : function(){
				console.log("완료");
			}
		})
	})
	
	$("#button03").click(function(){
		$.ajax({
			url : appRoot+"/cont15/met03",
			success : function(data){
				console.log("성공");
			},
			error : function(){
				console.log("실패");
			},
			complete : function(){
				console.log("완료");
			}
		})
	})
	
	$("#button04").click(function(){
		$.ajax({
			url : appRoot+"/cont15/met04",
			success : function(data){
				console.log("성공 04" + data);
			},
			error : function(){
				console.log("실패 04");
			},
			complete : function(){
				console.log("완료 04");
			}
		})
	})
})
</script>

<title>ajax05</title>
</head>
<body>

<!-- button#button01{/cont15/met01} -->
<button id="button01">/cont15/met01</button>
<button id="button02">/cont15/met02 응답 200</button>
<button id="button03">/cont15/met03 403 Forbidden response</button>
<button id="button04">/cont15/met04 OK or Forbidden response</button>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>
</html>
