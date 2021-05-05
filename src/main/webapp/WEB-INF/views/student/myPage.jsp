<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>구매한 강의</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${contextPath }/css/student/student_Total.css">
<link rel="stylesheet"
	href="${contextPath }/css/student/student_Sub.css">
<link rel="stylesheet" href="${contextPath }/css/student/myPage.css">
<link rel="stylesheet" href="${contextPath }/css/header.css"> 
<link rel="stylesheet" href="${contextPath }/css/footer.css"> 
       
   

</head>

<body>
	<div class="grid-container">
		<!--   header -->
		<%@ include file="/WEB-INF/views/include/header_new.jsp"%>
		<!--   main -->
		<div class="main">

<%@ include file="/WEB-INF/views/student/include/mybox.jsp"%>
			<div class="page">
			<c:if test="${!empty orderList }">
				<c:forEach var="rec" items="${orderList }">
					<div class="list" onClick="location.href='${contextPath }/lecture/${rec.lecture_title}/detail'">
						<div class="content">
							<img
								src="${contextPath }/img/thumbnail/${rec.lectureVO.thumbnail}"
								alt="프로필">
							<div class="title">
								<h4>${rec.lecture_title }</h4>
								<div class="btn btn-primary">
									<c:choose>
										<c:when test="${rec.progressbar == 100}">완강</c:when>
										<c:otherwise>수강중</c:otherwise>
									</c:choose>

								</div>
							</div>
						</div>
						<div class="progress">
							<div class="progress-bar" role="progressbar"
								style="width: ${rec.progressbar }%"
								aria-valuenow="${rec.progressbar }" aria-valuemin="0"
								aria-valuemax="100"></div>
						</div>
					</div>
				</c:forEach>
				</c:if>
				<c:if test="${empty orderList }">
				<div class="content">
				<div>구매한 온라인 강의가 없습니다.</div>
				<br>
				<button onclick="location.href='${contextPath}/offlinelectures/list/전체' " class="btn btn-secondary">온라인 강의 둘러보기</button>
				</div>
				</c:if>
			</div>
		</div>
		<!-- footer -->
	</div>
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>

</html>