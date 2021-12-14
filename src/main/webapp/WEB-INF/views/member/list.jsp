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
</style>

<title>Members List</title>
</head>
<body>
<b:navBar></b:navBar>

<!-- .container>.row>.col>h1{Members List} -->
<div class="container">
	<div class="row">
		<div class="col">
			<h1>Members List</h1>
			<%-- <h2>HI!, ${memberList.nickname }</h2> --%>
			<!-- table.table>thead>tr>th*5^^tbody -->
			<table class="table">
				<thead>
					<tr>
						<th>ID</th>
						<th>Nickname</th>
						<th>Password</th>
						<th>E-Mail</th>
						<th>Address</th>
						<th>Join Date</th>
						<th><i class="far  fa-sticky-note"></i></th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${memberList }" var="member">
					<tr>
						<td>${member.id }</td>
						<td>${member.nickname }</td>
						<td>${member.password}</td>
						<td>${member.email }</td>
						<td>${member.address }</td>
						<td>${member.inserted }</td>
						<td>${member.numberOfBoard }</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>
</html>