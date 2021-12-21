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
$(document).ready(function() {
	const appRoot = "${pageContext.request.contextPath}";
	$("#btn01").click(function(){
		$.ajax({
			url : appRoot + "/cont18/met01" ,
			type : "delete" // method는 type 속성으로 변경 가능, 값은 HTTP Method (ex: get, post, put, delete)
		});
	})
	$("#btn021").click(function(){
		$.ajax({
			url : appRoot + "/cont18/met02" ,
			type : "get"
		});
	})
	$("#btn022").click(function(){
		$.ajax({
			url : appRoot + "/cont18/met02" ,
			type : "post"
		});
	})
	$("#btn023").click(function(){
		$.ajax({
			url : appRoot + "/cont18/met02" ,
			type : "put"
		});
	})
	$("#btn024").click(function(){
		$.ajax({
			url : appRoot + "/cont18/met02",
			type : "delete"
		});
	})
	$("#btn031").click(function(){
		$.ajax({
			url : appRoot + "/cont18/met03" ,
			type : "get"
		});
	})
	$("#btn032").click(function(){
		$.ajax({
			url : appRoot + "/cont18/met03" ,
			type : "post"
		});
	})
	$("#btn033").click(function(){
		$.ajax({
			url : appRoot + "/cont18/met03" ,
			type : "put"
		});
	})
	$("#btn034").click(function(){
		$.ajax({
			url : appRoot + "/cont18/met03",
			type : "delete"
		});
	});
	$("#btn041").click(function(){
		$.ajax({
			url : appRoot + "/cont18/met04" ,
			type : "get"
		});
	})
	$("#btn042").click(function(){
		$.ajax({
			url : appRoot + "/cont18/met04" ,
			type : "post"
		});
	})
	$("#btn043").click(function(){
		$.ajax({
			url : appRoot + "/cont18/met04" ,
			type : "put"
		});
	})
	$("#btn044").click(function(){
		$.ajax({
			url : appRoot + "/cont18/met04",
			type : "delete"
		});
	});
	
	$("#btn04").click(function(){
		const boardId = $("#boardId").val();
		$.ajax({
			url : appRoot + "/cont18/met09/" + boardId,
			type : "get",
			success : function(data){
				$("#title").text(data.title);
				$("#body").text(data.content);
			}
		})
	})
});
</script>

<title>ajax09</title>
</head>
<body>
<input type="text" id="boardId">
<button id="btn04">/cont18/met09/{id}</button>
<div id="result">
Title : <span id="title"></span><br>
Content : <span id="body"></span><br>
</div>

<button id="btn041">/cont18/met04 get request</button>
<button id="btn042">/cont18/met04 post request</button>
<button id="btn043">/cont18/met04 put request</button>
<button id="btn044">/cont18/met04 delete request</button>
<hr>
<button id="btn031">/cont18/met03 get request</button>
<button id="btn032">/cont18/met03 post request</button>
<button id="btn033">/cont18/met03 put request</button>
<button id="btn034">/cont18/met03 delete request</button>
<hr>
<button id="btn021">/cont18/met02 get request</button>
<button id="btn022">/cont18/met02 post request</button>
<button id="btn023">/cont18/met02 put request</button>
<button id="btn024">/cont18/met02 delete request</button>
<hr>
<button id="btn01">/cont18/met01 request</button>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>
</html>