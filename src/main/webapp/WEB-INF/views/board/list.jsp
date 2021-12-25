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
	background: url('https://www.10wallpaper.com/wallpaper/2560x1600/1807/Manhattan_skyline_New_York_City_Skyscraper_2560x1600.jpg');
	background-repeat: no-repeat;
	background-size: cover;
}
.main{
	background-color: white;
	border-radius: 7px;
}

.num {
	width: 50px;
	text-align: center;
}

.tag {
	width: 55px;
}

.title {
	width: 365px;
	text-align: center;
}

.writer {
	width: 70px;
	text-align: center;
}

.date, .m-date {
	width: 90px;
	text-align: center;
}

.views {
	width: 50px;
	text-align: center;
}

th, td {
	vertical-align: middle;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	text-align: center;
}

.bTitle {
	text-align: left;
	-webkit-text-stroke-width: 0.3px;
	-webkit-text-stroke-color: black;
}

.bTag {
	font-size: 12px;
	-webkit-text-stroke-width: 0.3px;
	-webkit-text-stroke-color: black;
	text-shadow: 0.5px 1px 1px gray;
	color: red;
}

.new-board {
	color: red;
	text-shadow: 0.5px 1px 1px gray;
}

.notice {
	font-weight: bold;
	background-color: #adb5bd;
}
</style>
<title>Board List</title>
</head>
<body>
	<!-- .container>.orw>.col>h1{게시물 목록} -->
	<div class="container main">
		<div class="row">
			<div class="col">
				<b:navBar active="list"></b:navBar>
				<h1>Board List</h1>
				<!-- table.table>thead>tr>th*4^^tbody -->
				<table class="table table-hover table-bordered " style="table-layout: fixed;">
					<thead class="thead-dark">
						<tr>
							<th class="num">
								<i class="fab fa-slack-hash"></i>
							</th>
							<th class="tag">Tag</th>
							<th class="title">Title</th>
							<th class="writer">
								<i class="fas fa-user"></i>
							</th>
							<th class="date">Date</th>
							<th class="m-date">Modified Date</th>
							<th class="views">Views</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${listAll }" var="board">
							<c:if test="${board.notice eq 1}">
								<tr class="notice">
									<td>${board.id }</td>
									<td class="bTag">
										<i class="fas fa-exclamation"></i>
										Notice
									</td>
									<td class="bTitle">
										<a href="get?id=${board.id }&page=${pageInfo.currentPage}">
											<c:out value="${board.title }" />
										</a>
										<c:if test="${board.hasFile }">
											<i class="far fa-images"></i>
										</c:if>
										<c:if test="${board.replyCount>0 }">
											<i class="far fa-comments"> [${board.replyCount }] </i>
										</c:if>
										<c:if test="${board.newMark<3}">
											<span class="new-board">new</span>
										</c:if>
									</td>
									<td>
										<c:out value="${board.nickName}"></c:out>
									</td>
									<td>${board.customInserted }</td>
									<td>${board.customUpdated }</td>
									<td>${board.views }</td>
								</tr>
							</c:if>
						</c:forEach>
						<c:forEach items="${list }" var="board">
							<c:if test="${board.notice < 2 }">
								<tr>
									<td>${board.id }</td>
									<td class="bTag">
										<c:if test="${board.notice eq 1}">
											<i class="fas fa-exclamation" style="color: red;"> Notice </i>
										</c:if>
									</td>
									<td class="bTitle">
										<a href="get?id=${board.id }&page=${pageInfo.currentPage}">
											<c:out value="${board.title }" />
										</a>
										<c:if test="${board.hasFile }">
											<i class="far fa-images"></i>
										</c:if>
										<c:if test="${board.replyCount>0 }">
											<i class="far fa-comments"> [${board.replyCount }]</i>
										</c:if>
										<c:if test="${board.newMark<3}">
											<span class="new-board">new</span>
										</c:if>
									</td>
									<td>
										<c:out value="${board.nickName}"></c:out>
									</td>
									<td>${board.customInserted }</td>
									<td>${board.customUpdated }</td>
									<td>${board.views }</td>
								</tr>
							</c:if>
						</c:forEach>
						<c:forEach items="${listSearch }" var="board1">
							<c:if test="${not empty listSearch }">
								<tr>
									<td>${board1.id }</td>
									<td class="bTag">
										<c:if test="${board1.notice eq 1}">
											<i class="fas fa-exclamation" style="color: red;"> Notice </i>
										</c:if>
									</td>
									<td class="bTitle">
										<a href="get?id=${board1.id }&page=${pageInfo.currentPage}">
											<c:out value="${board1.title }" />
										</a>
										<c:if test="${board1.hasFile }">
											<i class="far fa-images"></i>
										</c:if>
										<c:if test="${board1.replyCount>0 }">
											<i class="far fa-comments"> [${board1.replyCount }]</i>
										</c:if>
										<c:if test="${board1.newMark<3}">
											<span class="new-board">new</span>
										</c:if>
									</td>
									<td>
										<c:out value="${board1.nickName}"></c:out>
									</td>
									<td>${board1.customInserted }</td>
									<td>${board1.customUpdated }</td>
									<td>${board1.views }</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
				<hr>
				<div class="d-flex justify-content-end">
					<a href="<%=request.getContextPath()%>/board/register" class="btn btn-primary">
						<i class="fas fa-pen-square"> Write </i>
					</a>
				</div>
			</div>
		</div>
	<!-- search bar -->
	<hr>
	<form method="post" class="form-inline my-2 my-lg-0 justify-content-center">
		<input class="form-control mr-sm-2" type="search" placeholder="Search by Title " aria-label="Search" name="search">
		<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
	</form>
	<br>
		<!-- pagination -->
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<c:if test="${pageInfo.hasPrevButton }">
					<c:url value="/board/list" var="pageLink">
						<c:param name="page" value="${pageInfo.leftPageNumber-1 }"></c:param>
					</c:url>
					<c:url value="/board/list" var="pageLinkStart">
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
					<c:url value="/board/list" var="pageLink">
						<c:param name="page" value="${pageNumber }"></c:param>
					</c:url>
					<li class="page-item ${pageInfo.currentPage == pageNumber ? 'active' : ' ' }">
						<a class="page-link" href="${pageLink }">${pageNumber }</a>
					</li>
				</c:forEach>
				<c:if test="${pageInfo.hasNextButton }">
					<c:url value="/board/list" var="pageLink">
						<c:param name="page" value="${pageInfo.rightPageNumber+1 }"></c:param>
					</c:url>
					<c:url value="/board/list" var="pageLinkEnd">
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


	<!-- modal -->
	<c:if test="${not empty result }">
		<div class="modal" tabindex="-1" id="modal1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Process Result</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<p>${result }</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
	<script>
		$(document).ready(function() {
			if (history.state == null) {
				$("#modal1").modal('show');
				history.replaceState({}, null);
			}
		});
	</script>
</body>
</html>