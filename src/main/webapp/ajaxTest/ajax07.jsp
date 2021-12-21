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
		const appRoot = '${pageContext.request.contextPath}';
		$("#btn01").click(function(){
			$.ajax({
				url : appRoot + "/cont16/met08",
				success : function(data){
					//$("#result01").html(data[0].nickName);
					let ulElem = $("<ul />");
					for (let i = 0; i<data.length; i++){
						let listItem = `<li>\${data[i].nickname}</li>`;
						ulElem.append(listItem);
					}
					
					$("#result01").html(ulElem);
				}
			})
		})
		
		$("#btn02").click(function(){
			$.ajax({
				url : appRoot + "/cont16/met07",
				success : function(data){
					//$("#result02").html(data[0].title);
					let ulElem = $("<ul />");
					for (let i = 0; i<data.length; i++){
						let listItemContent = `\${data[i].id} : \${data[i].title}`;
						let listItem = $("<li></li>").text(listItemContent);
						ulElem.append(listItem);
					}
					
					$("#result02").html(ulElem);
				}
			})
		})
	})
</script>

<title>ajax07</title>
</head>
<body>
<button id="btn02">/cont16/met07 요청 3개의 Board 응답 받은 data를 html에 출력</button>
<div id="result02"></div>
<hr>
<button id="btn01">/cont16/met08 요청 3개의 Member 응답 반은 것을 html에 출력</button>
<div id="result01"></div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>
</html>