<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ attribute name="active" %>

<c:url value="/board/home" var="homeUrl"></c:url>
<c:url value="/board/list" var="listUrl"></c:url>
<c:url value="/board/register" var="registerUrl"></c:url>
<c:url value="/member/signup" var="signupUrl"></c:url>
<c:url value="/member/login" var="loginUrl"></c:url>
<c:url value="/member/logout" var="logoutUrl"></c:url>
<c:url value="/member/info" var="memberInfoUrl"></c:url>
<c:url value="/member/list" var="memberListUrl"></c:url>

<style>
.nav-link {
	color: white;
}
.active, .nav-item:hover {
  background-color: #666;
  color: white;
  border-radius: 7px;
}
a:hover {
	color:white;
}
nav {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	border-radius: 7px;
	color : white;
}
</style>

<nav id="myNAV" class="navbar navbar-expand-lg bg-dark">

	<ul class="navbar-nav mr-auto">
		<li class="nav-item ${active == 'home' ? 'active' : '' }" >
			<a class="nav-link" href="${homeUrl }">
				<i class="fas fa-home"></i> Home 
			</a>
		</li>
		<li class="nav-item ${active == 'list' ? 'active' : '' }">
			<a class="nav-link" href="${listUrl }">
				<i class="fas fa-list"></i> Board List
			</a>
		</li>
		<c:if test="${empty sessionScope.loggedInMember }">
			<li class="nav-item ${active == 'signup' ? 'active' : '' }">
				<a class="nav-link" href="${signupUrl }">
					<i class="fas fa-user-plus"></i> Sign-up
				</a>
			</li>
			<li class="nav-item ${active == 'login' ? 'active' : '' }">
				<a class="nav-link" href="${loginUrl }">
					<i class="fas fa-sign-in-alt"></i> Log-in
				</a>
			</li>
		</c:if>
		<c:if test="${not empty sessionScope.loggedInMember }">
			<li class="nav-item ${active == 'register' ? 'active' : '' }">
				<a class="nav-link" href="${registerUrl }">
					<i class="fas fa-pen-square"></i> Write On Board
				</a>
			</li>
			<li class="nav-item ${active == 'memberInfo' ? 'active' : '' }">
				<a class="nav-link" href="${memberInfoUrl }">
					<i class="fas fa-user-circle"></i> My Account
				</a>
			</li>
			<c:if test="${not empty sessionScope.loggedInMember.adminQuali }">
				<li class="nav-item ${active == 'memberList' ? 'active' : '' }">
					<a class="nav-link" href="${memberListUrl }">
						<i class="fas fa-list"></i> Member List
					</a>
				</li>
			</c:if>
			<li class="nav-item ">
				<a class="nav-link" href="${logoutUrl }">Log-out</a>
			</li>
		</c:if>
	</ul>
	<div class="d-flex justify-content-end">
		<c:if test="${empty sessionScope.loggedInMember }">
			<h5>Hi, GUEST!</h5>
		</c:if>
		<c:if test="${not empty sessionScope.loggedInMember }">
			<h5>Hi, ${sessionScope.loggedInMember.nickname }!</h5>
		</c:if>
	</div>
</nav>