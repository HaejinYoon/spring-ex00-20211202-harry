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
.main{
	background-color: white;
	border-radius: 7px;
}
</style>

<title>Home</title>
</head>
<body>
	<div class="container main">
		<div class="row">
			<div class="col">
				<b:navBar active="home"></b:navBar>
				<div class="jumbotron jumbotron-fluid">
					<div class="container">
						<h1 class="display-4">Welcome to Haejin's Homepage</h1>
						<p class="lead">This is a simple membership board system. Go to sign-up tab and write your first board!!</p>
						<hr class="my-4">
						<p>You can see, read a board without login</p>
						<p>You can access the write board tab after you login.</p>
						<p>If you haven't signed up yet, go to sign-up tab and signup!</p>
					</div>
				</div>
				<div>
					<h3>Recent</h3>
					<hr>
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
							<c:forEach items="${list }" var="board">
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
							<c:forEach items="${list }" var="board" begin="1" end="5">
								<c:if test="${board.notice < 2 }">
									<tr>
										<td>${board.id }</td>
										<td class="bTag">
											<c:if test="${board.notice eq 1}">
												<i class="fas fa-exclamation" style="color: red;"> Notice </i>
											</c:if>
										</td>
										<td class="bTitle">
											<a href="get?id=${board.id }&page=1">
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
						</tbody>
					</table>
				</div>
				<b:copyright></b:copyright>
			</div>
		</div>
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

	<script>
		
	</script>
</body>
</html>