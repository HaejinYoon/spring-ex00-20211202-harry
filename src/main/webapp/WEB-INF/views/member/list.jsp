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

<title>Members List</title>
</head>
<body>
	<!-- .container>.row>.col>h1{Members List} -->
	<div class="container main">
		<div class="row">
			<div class="col">
				<b:navBar active="memberList"></b:navBar>
				<h1>Members List</h1>
				<%-- <h2>HI!, ${memberList.nickname }</h2> --%>
				<!-- table.table>thead>tr>th*5^^tbody -->
				<table class="table table-hover">
					<thead>
						<tr>
							<th>ID</th>
							<th>Nickname</th>
							<th>Password</th>
							<th>E-Mail</th>
							<th>Address</th>
							<th>Join Date</th>
							<th>
								<i class="far  fa-sticky-note"></i>
							</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${memberList }" var="member">
							<tr>
								<td>${member.id }</td>
								<td>
									<c:out value="${member.nickname }" />
								</td>
								<td>
									<c:out value="${member.password}" />
								</td>
								<td>
									<c:out value="${member.email }" />
								</td>
								<td>
									<c:out value="${member.address }" />
								</td>
								<td>${member.inserted }</td>
								<td>${member.numberOfBoard }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<hr>
		<!-- pagination -->
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<c:if test="${pageInfo.hasPrevButton }">
					<c:url value="/member/list" var="pageLink">
						<c:param name="page" value="${pageInfo.leftPageNumber-1 }"></c:param>
					</c:url>
					<c:url value="/member/list" var="pageLinkStart">
						<c:param name="page" value="1"></c:param>
					</c:url>
					<li class="page-item">
						<a class="page-link" href="${pageLinkStart }" aria-label="Start">
							<i class="fas fa-angle-double-left"></i>
						</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="${pageLink }" aria-label="Previous">
							<i class="fas fa-angle-left"></i>
						</a>
					</li>
				</c:if>

				<c:forEach begin="${pageInfo.leftPageNumber }" end="${pageInfo.rightPageNumber }" var="pageNumber">
					<c:url value="/member/list" var="pageLink">
						<c:param name="page" value="${pageNumber }"></c:param>
					</c:url>
					<li class="page-item ${pageInfo.currentPage == pageNumber ? 'active' : ' ' }">
						<a class="page-link" href="${pageLink }">${pageNumber }</a>
					</li>
				</c:forEach>
				<c:if test="${pageInfo.hasNextButton }">
					<c:url value="/member/list" var="pageLink">
						<c:param name="page" value="${pageInfo.rightPageNumber+1 }"></c:param>
					</c:url>
					<c:url value="/member/list" var="pageLinkEnd">
						<c:param name="page" value="${pageInfo.lastPage }"></c:param>
					</c:url>
					<li class="page-item">
						<a class="page-link" href="${pageLink }" aria-label="Next">
							<i class="fas fa-angle-right"></i>
						</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="${pageLinkEnd }" aria-label="End">
							<i class="fas fa-angle-double-right"></i>
						</a>
					</li>
				</c:if>
			</ul>
		</nav>
		<b:copyright></b:copyright>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>
</html>