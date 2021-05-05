<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="lecture_title" value="${lecture_title }" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>진행중인 강의</title>

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
<link rel="stylesheet"
	href="${contextPath }/css/student/student_Total.css">
<link rel="stylesheet"
	href="${contextPath }/css/student/student_Sub.css">
<link rel="stylesheet" href="${contextPath }/css/teacher/myPage.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
<%-- <script defer src="${contextPath }/js/teacher/manage_vid.js"></script> --%>
<script defer src="${contextPath }/js/common/ajax.js"></script>
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
						<span class="chapter__kind"><a
							href="${contextPath }/teacher/studio/${lecture_title}">챕터</a> > <a
							href="${contextPath }/teacher/studio/${lecture_title}/vid">
								동영상</a></span>
<%@ include file="/WEB-INF/views/teacher/include/curri.jsp"%>
					</div>
					<!-- 					<a class="btn btn-primary" href="javascript:void(0)" -->
					<!-- 						id="btn_popup_open"  onclick="next()"><i class="fas fa-angle-left"></i> 이전</a> -->
					<a class="btn btn-primary" href="javascript:void(0)"
						id="btn_popup_open"><i class="fas fa-video"></i> 영상업로드</a>
				</div>
			</div>
			<div class="popup_panel">
				<div class="popup_bg"></div>
				<div class="popup_contents">
					<div id="container">
						<div class="form-wrap">
							<h3>영상 업로드</h3>
							<form action="${contextPath }/upload" method="post"
								enctype="multipart/form-data">
								<div class="form-group">
									<input type="hidden" id="lecture_title" name="lecture_title"
										value="${lecture_title}" />


									<div>
										<h5>Video</h5>
										<input type="file" name="video" />
									</div>
									<div>
										<h5>Title</h5>
										<input type="text" name="title" />
									</div>
									<div>
										<h5>Content</h5>
										<input type="text" name="content" />
									</div>
									<div>
										<h5>Chapter</h5>
										<select name="chapter_id" id="chapter_id">
											<c:forEach var="chapter" items="${chapterList }">
												<option value="${chapter.chapter_id }">${chapter.chapter_title }</option>
											</c:forEach>
										</select>
									</div>
									<div>
										<input type="radio" name="secret" id="secret" value="y"
											checked>비공개 <input type="radio" name="secret"
											id="secret" value="n">공개
									</div>
									<div>
										<input type="submit" id="upload-btn" value="업로드" />
									</div>
								</div>
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
		$('.submitBtn').click(
				function() {
					document.getElementById('rating').value = document
							.querySelectorAll('a.star.on').length;
					document.getElementById('reviewForm').submit();

				});
	</script>
</body>
</html>