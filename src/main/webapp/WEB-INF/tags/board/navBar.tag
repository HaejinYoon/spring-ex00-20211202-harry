<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:url value="/board/list" var="listUrl"></c:url>
<c:url value="/board/register" var="registerUrl"></c:url>
<c:url value="/member/signup" var="signupUrl"></c:url>
<c:url value="/member/login" var="loginUrl"></c:url>
<c:url value="/member/logout" var="logoutUrl"></c:url>
<c:url value="/member/info" var="memberInfoUrl"></c:url>
<c:url value="/member/list" var="memberListUrl"></c:url>

<nav class="navbar navbar-expand-lg navbar-light bg-light">

    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="${listUrl }">Board List</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="${registerUrl }">Write</a>
      </li>
      <c:if test="${empty sessionScope.loggedInMember }">
      <li class="nav-item active">
      	<a class="nav-link" href="${signupUrl }">Sign-up</a>
      </li>
      <li class="nav-item active">
      	<a class="nav-link" href="${loginUrl }">Log-in</a>
      </li>
      </c:if>
      <c:if test="${not empty sessionScope.loggedInMember }">
      <li class="nav-item active">
      	<a class="nav-link" href="${memberInfoUrl }">Member Info</a>
      </li><li class="nav-item active">
      	<a class="nav-link" href="${memberListUrl }">Member List</a>
      </li>
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