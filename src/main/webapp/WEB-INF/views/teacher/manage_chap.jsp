<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="lecture_title" value="${lecture_title }"/>

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
<link rel="stylesheet" href="${contextPath }/css/footer.css"> 
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
<script defer src="${contextPath }/js/teacher/studio.js"></script>
<script defer src="${contextPath }/js/common/ajax.js"></script>

<style>
p {
	display: block;
}
li{
	height: 2em;
}
input{
	display: inline-block;
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
								<span class="chapter__kind"><a href="${contextPath }/teacher/studio/${lecture_title}">챕터</a> > 
								<a href="${contextPath }/teacher/studio/${lecture_title}/vid">
								동영상</a></span>
									<div class="input_wrapper">
										<input id="inputText" class="form-control"  aria-describedby="button-addon2"></input>
										<button id="addBtn" class="btn btn-outline-secondary">등록</button>		
									</div>
									<div class="chapter__wrapper">
										<ul id="myList">
										<c:if test="${!empty chapterList }"> 
											<c:forEach var="rec" items="${chapterList }">
											<input type="hidden" id="lecture_title" name="lecture_title" value="${rec.lecture_title}"/>
												<li><span idx=${rec.chapter_id }>${rec.chapter_title}</span>
												<i onclick="modify(this)" class="fas fa-pen"></i>
												<i onclick="del(this)" class="fas fa-eraser"></i>
											</c:forEach>
											</c:if>
										<c:if test="${empty chapterList }"> 	
										<input type="hidden" id="lecture_title" name="lecture_title" value="${lecture_title}"/>
										</c:if>	
										</ul>
									</div>
								</div>
<!-- chapter -->
					<a class="btn btn-primary" href="javascript:void(0)"
						id="btn_popup_open">다음<i class="fas fa-angle-right"></i></a>
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