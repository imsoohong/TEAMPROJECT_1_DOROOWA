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

<%-- <link rel="stylesheet" href="${contextPath }/css/teacher/myReserve.css"> --%>
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
	display: inline-block;
	width: 400px;
}
.list {
	width: 50vw;
	position: relative;
}
video {
	width: 100%;
}
.btn{
	all:unset;
	background-color: rgba(0,0,0,0.4);
	border-radius: 4px;
	color: white;
	cursor: pointer;
	text-align: center;
	width: 40px;
	position: absolute;
	bottom: 1em;
	right: 1em;
}
.btn:hover{
	background-color: black;
	color: white;
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
								동영상</a> > 수정</span>
									<div class="chapter__wrapper">
																	<form action="${contextPath }/modifyVid" method="post"
								enctype="multipart/form-data">
								<input type="hidden" id="lecture_title" name="lecture_title"
									value="${lecture_title}" /> 
								<input type="hidden" id="video_id" name="video_id"
									value="${videoVO.video_id}" /> 
								<input type="hidden" id="currentVid" name="currentVid"
									value="${videoVO.filename}" /> 
									
									<video id="myvideo" src="${contextPath }/video/${videoVO.filename }" controls="controls" data-vid="${videoVO.video_id }"></video>
										<div>현재파일:${videoVO.filename }</div>
										<div>video<input type="file" class="text" name="video"/></div>
										<div>title <input type="text" class="text" name="title" value="${videoVO.title }" /></div>
										<div>content <input type="text" class="text" name="content" value="${videoVO.content }"/></div>
																				<div>chapter 
										<select name="chapter_id" id="chapter_id">
										<c:forEach var="chapter" items="${chapterList }">
											<option value="${chapter.chapter_id }" ${(chapter.chapter_id eq videoVO.chapter_id) ? "selected":""}>${chapter.chapter_title }</option>
										</c:forEach>
									</select>
									</div>
										<div><input type="radio" name="secret" id="secret" value="y" ${(videoVO.secret eq "y") ? "checked":""}>비공개
									<input type="radio" name="secret" id="secret" value="n" ${(videoVO.secret eq "n") ? "checked":""}>공개</div>
									<div><input type="submit" class="btn" value="수정" /></div>
									
									
									

							</form>
									</div>
								</div>
					
				</div>
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