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

<title>File Upload01</title>
</head>
<body>

<form action="${pageContext.request.contextPath }/cont19/met01" method="post" enctype="multipart/form-data">
	<input type="text" name="name"><br>
	<input type="text" name="age"><br>
	<input type="file" name="file1"><br>
	<input type="submit" value="submit"><br>
</form>
<hr>
<form action="${pageContext.request.contextPath }/cont19/met02" method="post" enctype="multipart/form-data">
<input type="file" name="file1" id=""><br>
<input type="file" name="file2" id=""><br>
<input type="submit" value="send"><br>
</form>
<hr>
<form action="${pageContext.request.contextPath }/cont19/met03" method="post" enctype="multipart/form-data">
<input type="file" multiple name="files" accept="image/*"><br>
<input type="submit" value="send"><br>
</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>
</html>