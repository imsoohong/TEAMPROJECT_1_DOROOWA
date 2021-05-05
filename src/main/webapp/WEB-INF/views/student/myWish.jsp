<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>찜한 강의</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="${contextPath }/css/student/student_Total.css">
<link rel="stylesheet"
	href="${contextPath }/css/student/student_Sub.css">
<link rel="stylesheet" href="${contextPath }/css/student/myWish.css">
<link rel="stylesheet" href="${contextPath }/css/header.css">
<link rel="stylesheet" href="${contextPath }/css/footer.css">

<script defer src="${contextPath }/js/student/myWish.js"></script>
</head>

<body>
	<div class="grid-container">
		<!--   header -->
		<%@ include file="/WEB-INF/views/include/header_new.jsp"%>
		<!--   header -->
		<div class="main">
<%@ include file="/WEB-INF/views/student/include/mybox.jsp"%>

			<div class="page">
				<div id="card_slider">
				<c:if test="${!empty wishList }">
					<c:forEach var="rec" items="${wishList }">
						<a href="${contextPath }/lecture/${rec.lecture_title}/detail">
							<div class="card">
								<img
									src="${contextPath }/img/thumbnail/${rec.thumbnail }"
									class="card-img-top" alt="...">
								<ul class="list-group list-group-flush">
									<li class="list-group-item">${rec.lecture_title }</li>
									<li class="list-group-item">${rec.teacher_nickname }</li>
									<li class="list-group-item">${rec.price }원</li>
		<%@ include file="/WEB-INF/views/include/ratingMain.jsp"%>		
								</ul>
<input type="hidden" value="${rec.lecture_title} "/>
										<span onclick="heart(this)" id="deleteWish" class="btn-wish"><i class="fas fa-heart"></i></span>

							</div>
						</a>
					</c:forEach>
					</c:if>
				</div>
				
				<c:if test="${empty wishList }">
				<div>찜한 강의가 없습니다.</div>
				</c:if>
			</div>
		</div>
		<!-- footer -->
	</div>
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>