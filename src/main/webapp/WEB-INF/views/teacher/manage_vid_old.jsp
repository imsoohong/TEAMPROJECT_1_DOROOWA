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
<link rel="stylesheet" href="${contextPath }/css/teacher/student_Total.css">
<link rel="stylesheet" href="${contextPath }/css/teacher/student_Sub.css">
<link rel="stylesheet" href="${contextPath }/css/teacher/myPage.css">
<link rel="stylesheet" href="${contextPath }/css/header.css"> 
<link rel="stylesheet" href="${contextPath }/css/footer.css"> 
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
<%-- <script defer src="${contextPath }/js/teacher/manage_vid.js"></script> --%>
<script defer src="${contextPath }/js/common/ajax.js"></script>

<style>
p {
	display: inline-block;
	width: 400px;
}
</style>
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
								<div class="chapter">
								<span class="chapter__kind"><a href="${contextPath }/teacher/studio/${lecture_title}">챕터</a> > 
								<a href="${contextPath }/teacher/studio/${lecture_title}/vid">
								동영상</a></span>
							<div class="list-group">
					<c:forEach var="chapter" items="${chapterList }">
						<div class="accordion accordion-flush" id="accordionFlushExample">
							<div class="accordion-item">
								<h2 class="accordion-header" id="flush-heading${chapter.chapter_id }">
									<button class="accordion-button  collapse show" type="button"
										data-bs-toggle="collapse" data-bs-target="#flush-collapse${chapter.chapter_id }"
										aria-expanded="false" aria-controls="flush-collapse${chapter.chapter_id }">
										${chapter.chapter_title }</button>
								</h2>
								<div id="flush-collapse${chapter.chapter_id }" class="accordion-collapse collapse"
									aria-labelledby="flush-heading${chapter.chapter_id }"
									data-bs-parent="#accordionFlushExample">
									<div class="accordion-body">
								<c:forEach var="curriculum" items="${curriculum }">
								<c:if test="${chapter.chapter_id == curriculum.chapter_id}">
								
								<a href="${contextPath }/teacher/studio/${chapter.lecture_title}/vid/${curriculum.video_id}" class="curriculum__text">
										<div><i class="far fa-play-circle"></i> ${curriculum.title }</div>
								</a>
								<hr />
							
								</c:if>
								
								</c:forEach>
									</div>
								</div>
							</div>
							</div>
							</c:forEach>
							</div>
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
								<input type="hidden" id="lecture_title" name="lecture_title"
									value="${lecture_title}" /> 
									
									
										<div>video<input type="file" name="video" /></div>
										<div>title <input type="text" name="title" /></div>
										<div>content <input type="text" name="content" /></div>
										<div>chapter 
										<select name="chapter_id" id="chapter_id">
										<c:forEach var="chapter" items="${chapterList }">
											<option value="${chapter.chapter_id }">${chapter.chapter_title }</option>
										</c:forEach>
									</select>
									</div>
										<div><input type="radio" name="secret" id="secret" value="y" checked>비공개
									<input type="radio" name="secret" id="secret" value="n">공개</div>
									<div><input type="submit" value="업로드" /></div>
									
									
									

							</form>




						</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	</div>
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