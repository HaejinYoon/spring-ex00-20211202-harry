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

<title>Board List</title>
</head>
<body>

<b:navBar></b:navBar>
<!-- .container>.orw>.col>h1{게시물 목록} -->
<div class="container">
	<div class="row">
		<div class="col">
			<h1>Board List</h1>
			<!-- table.table>thead>tr>th*4^^tbody -->
			<table class="table">
				<thead>
					<tr>
						<th><i class="fab fa-slack-hash"></i></th>
						<th>Title</th>
						<th><i class="fas fa-user"></i></th>
						<th>Date</th>
						<th>Modified Date</th>
						<th>Views</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="board">
						<tr>
							<td>${board.id }</td>
							<td>
                  				<a href="get?id=${board.id }">
                   					<c:out value="${board.title }"/> 
                  				</a>
                			</td>
							<td><c:out value="${board.nickName}"></c:out></td>
							<td>${board.customInserted }</td>
							<td>${board.updated }</td>
							<td>${board.views }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
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

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script>
$(document).ready(function() {
	if(history.state == null){
	$("#modal1").modal('show');
	history.replaceState({}, null);
	}
});
</script>
</body>
</html>