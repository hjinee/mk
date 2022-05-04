<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:url var="R" value="/" />
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>딸기마켓 회원검색결과</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="res/index.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Cute+Font|Poor+Story&display=swap&subset=korean"
	rel="stylesheet">
</head>
<style>
.imgg {
	width: 100%;
	position: relative;
	height: 130px;
	overflow: hidden;
	border-radius: 8px 8px 0 0;
	/* max-width: 200px;
	max-height: 200px;
	overflow: hidden; */
}

.imggg {
	width: auto;
	height: auto;
}

.pl {
	width: 220px;
	height: 280px;
	margin: 10px;
}

ul.aa li {
	list-style-type: none;
	float: left;
	margin-left: 20px;
	display: inline-block;
}

div .abcd {
	height: 250px;
	width: 180px;
	float: left;
	margin: 25px;
	cursor: pointer;
}

div .well {
	padding: 0px;
	background-color: #f8f9fa;
	border-radius: 8px;
}

div .name {
	padding: 5px;
	font-size:13px;
}

div .d {
	padding: 5px;
	border-bottom: 1px solid #e9ecef;
}
h1 {
	margin-left: 30px;
	margin-right: auto;
	display: block;
}
</style>
<body>
<%@ include file="../include/nav.jsp"%>
	<br />
	<div class="container" style="text-align: center;">
		<form action="/shop/searchUser" class="form-inline my-2 my-lg-0" style="text-align: right; display: block;">
			<span style="font-size: 15px; color: #000000; font-weight: bold;">회원 검색</span>
			<input class="form-control mr-sm-2" type="search" name="word" placeholder="닉네임을 입력하세요" aria-label="Search" style="width: 300px;">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">
				<span class="glyphicon glyphicon-search" style="margin-top: 10px; margin: 2px;"></span>
			</button>
		</form>
		<br />
		<br />
		<c:forEach var="p" items="${list}">
				<span style="font-size: 20px; color: #000000; font-weight: bold;">
					<c:out value="${p}"></c:out>
				</span>
		</c:forEach>
	</div>
<%@ include file="../include/bottom.jsp"%>
</body>
</html>