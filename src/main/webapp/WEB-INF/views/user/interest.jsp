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
<title>딸기마켓 내관심상품</title>
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
	font-size: 13px;
}

div .d {
	padding: 5px;
	border-bottom: 1px solid #e9ecef;
}

div .aa {
	margin-bottom: 100px;
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
	<div class="container">

		<h1>
			<sec:authentication property="user.nickname" />
			님의 관심상품
		</h1>
		<div class="aa">

			<c:if test="${count ==0 }">
				<span style="font-size: 20px; margin: 50; margin-left: 100px;">관심상품이
					없습니다</span>
				<br />
				<br />
				<a href="/shop/index"
					style="font-size: 20px; margin: 50; margin-left: 100px;">상품
					목록으로 가기</a>
			</c:if>
			<c:if test="${count != 0}">
				<c:forEach var="i" items="${interest}">
					<c:forEach var="pi" items="${product_image}">
						<c:if test="${i.product.id == pi.productid}">
							<div class="abcd well"
								onclick="location.href='/shop/product/${i.product.id}'">
								<img src="/images/s/s_${pi.filename}" class="imgg">

								<div class="name">
									<span
										style="font-size: 17px; color: #585858; font-weight: bold;"><b><c:choose>
												<c:when test="${fn:length(i.product.title) gt 13}">
													<c:out value="${fn:substring(i.product.title, 0, 12)}">...
        									</c:out>
												</c:when>
												<c:otherwise>
													<c:out value="${i.product.title}">
													</c:out>
												</c:otherwise>
											</c:choose></b></span>
								</div>
								<div class="d">
									<span style="font-size: 15px;"><b><fmt:formatNumber
												value="${i.product.price}" pattern="###,###,###" />원</b></span>
								</div>



								<div class="name">
									<span>조회수 ${i.product.click}</span>
									<c:forEach var="c" items="${cnt}">
										<c:choose>
											<c:when test="${i.product.id == c.id}">
												<span style="margin-left: 2px;">관심: ${c.cnt}</span>
											</c:when>
											<c:when test="${c.id == null}">관심: 0</c:when>
										</c:choose>
									</c:forEach>
									<c:forEach var="c" items="${commentcnt}">
										<c:choose>
											<c:when test="${i.product.id == c.id}">
												<span style="margin-left: 2px;">댓글: ${c.cnt}</span>
											</c:when>
											<c:when test="${c.id == null}">댓글: 0</c:when>
										</c:choose>
									</c:forEach>
								</div>
							</div>


						</c:if>
					</c:forEach>
				</c:forEach>
			</c:if>

		</div>
	</div>
	
	<%@ include file="../include/bottom.jsp"%>
	
</body>
</html>

