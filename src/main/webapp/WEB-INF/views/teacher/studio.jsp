<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>Document</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.2/css/all.css"
	integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu"
	crossorigin="anonymous">

<link rel="stylesheet" href="${contextPath }/css/teacher/myReserve.css">
<link rel="stylesheet" href="${contextPath }/css/student/student_Total.css">
<link rel="stylesheet" href="${contextPath }/css/student/student_Sub.css">
<link rel="stylesheet" href="${contextPath }/css/teacher/myPage.css">
<link rel="stylesheet" href="${contextPath }/css/header.css"> 
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
<script defer src="${contextPath }/js/teacher/studio.js"></script>
<script defer src="${contextPath }/js/common/ajax.js"></script>

<style>
/* p { */
/* 	display: block; */
/* 	width: 400px; */
/* } */
button{
 font-size: 1rem;
}
</style>
</head>
<body>
	<div class="grid-container">
		<!--   header -->
		<%@ include file="/WEB-INF/views/include/header_new.jsp"%>
		<!--   header -->
		<div class="main">
<%@ include file="/WEB-INF/views/teacher/include/mybox.jsp"%>
			<div class="page">
				<div class="list">
								<div class="chapter">
								<span class="chapter__kind"  href="${contextPath }/teacher/studio">진행중인 강의</span>
									<div class="chapter__wrapper">
										<ul id="myList">
											<c:if test="${!empty lectureVO }">
						<c:forEach var="rec" items="${lectureVO }">
							<a href="${contextPath }/teacher/studio/${rec.lecture_title}"><li>${rec.lecture_title}</li></a>
						</c:forEach>
						</c:if>
											<c:if test="${empty lectureVO }">
											<div>현재 진행중인 강의가 없습니다.</div>
						</c:if>
						
					
										</ul>
									</div>
								</div>
<!-- chapter -->
				</div>
				<!-- list -->
			</div>
			<!-- page -->
		</div>
	</div>
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<script src="${contextPath }/js/student/popup.js"></script>
	<script>
		$('#star_grade a').click(function() {

			$(this).parent().children("a").removeClass("on"); /* 별점의 on 클래스 전부 제거 */
			$(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
			return false;
		});

		$('.submitBtn').click(
				function() {
					document.getElementById('rating').value = document
							.querySelectorAll('a.star.on').length;
					document.getElementById('reviewForm').submit();

				});
	</script>
</body>
</html>