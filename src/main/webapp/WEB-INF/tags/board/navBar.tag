<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:url value="/board/home" var="homeUrl"></c:url>
<c:url value="/board/list" var="listUrl"></c:url>
<c:url value="/board/register" var="registerUrl"></c:url>
<c:url value="/member/signup" var="signupUrl"></c:url>
<c:url value="/member/login" var="loginUrl"></c:url>
<c:url value="/member/logout" var="logoutUrl"></c:url>
<c:url value="/member/info" var="memberInfoUrl"></c:url>
<c:url value="/member/list" var="memberListUrl"></c:url>

<nav class="navbar navbar-expand-lg navbar-light bg-primary">

	<ul class="navbar-nav mr-auto">
		<li class="nav-item active ">
			<a class="nav-link" href="${homeUrl }">
				<i class="fas fa-home"> Home </i>
			</a>
		</li>
		<li class="nav-item active">
			<a class="nav-link" href="${listUrl }">
				<i class="fas fa-list"> Board List</i>
			</a>
		</li>
		<c:if test="${empty sessionScope.loggedInMember }">
			<li class="nav-item active">
				<a class="nav-link" href="${signupUrl }">
					<i class="fas fa-user-plus"> Sign-up</i>
				</a>
			</li>
			<li class="nav-item active">
				<a class="nav-link" href="${loginUrl }">
					<i class="fas fa-sign-in-alt"> Log-in</i>
				</a>
			</li>
		</c:if>
		<c:if test="${not empty sessionScope.loggedInMember }">
			<li class="nav-item active">
				<a class="nav-link" href="${registerUrl }">
					<i class="fas fa-pen-square"> Write On Board</i>
				</a>
			</li>
			<li class="nav-item active">
				<a class="nav-link" href="${memberInfoUrl }">
					<i class="fas fa-user-circle"> My Account</i>
				</a>
			</li>
			<c:if test="${not empty sessionScope.loggedInMember.adminQuali }">
				<li class="nav-item active">
					<a class="nav-link" href="${memberListUrl }">
						<i class="fas fa-list"> Member List</i>
					</a>
				</li>
			</c:if>
			<li class="nav-item active">
				<a class="nav-link" href="${logoutUrl }">Log-out</a>
			</li>
		</c:if>
	</ul>
	<c:if test="${empty sessionScope.loggedInMember }">
		<h5>Hi, GUEST!</h5>
	</c:if>
	<c:if test="${not empty sessionScope.loggedInMember }">
		<h5>Hi, ${sessionScope.loggedInMember.nickname }!</h5>
	</c:if>
</nav>