<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.3.min.js"></script>


<title>Document</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.2/css/all.css"
	integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu"
	crossorigin="anonymous">

<%--     <link rel="stylesheet" href="${contextPath }/css/main2.css"> --%>
<%-- <link rel="stylesheet" href="${contextPath }/css/student/myReserve.css"> --%>
<%-- <link rel="stylesheet" href="${contextPath }/css/student/student_Total.css"> --%>
<%-- <link rel="stylesheet" href="${contextPath }/css/styles.css"> --%>



<link rel="stylesheet" href="${contextPath }/css/student/student_Total.css">
<link rel="stylesheet" href="${contextPath }/css/student/student_Sub.css">
<link rel="stylesheet" href="${contextPath }/css/student/myPage.css">
<link rel="stylesheet" href="${contextPath }/css/header.css"> 
<link rel="stylesheet" href="${contextPath }/css/footer.css"> 
<link rel="stylesheet" href="${contextPath }/css/mobile.css"> 

</head>
<body>
	<div class="grid-container">
		<!--   header -->
		<%@ include file="/WEB-INF/views/include/header_new.jsp"%>
		<!--   header -->
		<div class="main">
			<div class="mybox">
				<div class="lecture">
					<p>강의내역</p>
					<p>
						<a class="small active" href="${contextPath }/teacher/studio">진행중인
							강의</a>
					<ul>
						<c:forEach var="rec" items="${lectureVO }">
							<a href="${contextPath }/teacher/studio/${rec.lecture_title}"><li>${rec.lecture_title}</li></a>
						</c:forEach>
					</ul>
					</p>
					<p>
						<a class="small" href="${contextPath }/student/myReserve">예약한
							강의</a>
					</p>
					<p>
						<a class="small" href="#">찜한 강의</a>
					</p>
					<p>
						<a class="small" href="#">알림</a>
					</p>
				</div>
				<div class="privacy">
					<p>회원정보</p>
					<p>
						<a class="small" href="${contextPath }/student/modifyForm">회원수정</a>
					</p>
					<p>
						<a class="small" href="${contextPath }/student/outMemberForm">회원탈퇴</a>
					</p>
				</div>
			</div>
			<div class="page">
				<div class="list">

					<div class="list-group">
						<%-- 						<c:forEach var="rec" items="${videoList }"> --%>
						<%--   					<a href="${contextPath }/video/${rec.video_id}" class="list-group-item list-group-item-action">${rec.title }</a> --%>
						<%-- 						</c:forEach> --%>
						<!-- 					</div> -->


					</div>
				</div>
<!-- 				<div class="popup_panel"> -->
<!-- 					<div class="popup_bg"></div> -->
<!-- 					<div class="popup_contents"> -->
<!-- 						<div id="container"> -->
<!-- 							<div class="form-wrap"> -->
<!-- 								<h3>영상 업로드</h3> -->
<%-- 								<form action="${contextPath }/upload" method="post" --%>
<!-- 									enctype="multipart/form-data"> -->
<!-- 									video <input type="file" name="video" /><br /> title <input -->
<!-- 										type="text" name="title" /><br /> content <input type="text" -->
<!-- 										name="content" /><br /> <input type="hidden" -->
<!-- 										name="lecture_title" value="자바" /> <input type="submit" -->
<!-- 										value="업로드" /> -->
<!-- 								</form> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
			</div>
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