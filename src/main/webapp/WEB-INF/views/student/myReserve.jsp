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
<title>예약한 강의</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${contextPath }/css/student/student_Total.css">
	<link rel="stylesheet"
	href="${contextPath }/css/student/student_Sub.css">
<link rel="stylesheet" href="${contextPath }/css/student/myReserve.css">
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
			<c:if test="${!empty reserveList }">
			<c:forEach var="rec" items="${reserveList }">
				<fieldset class="list">
					<div class="lec">
								<img class="list__img"
					src="${contextPath }/img/thumbnail/${rec.lectureVO.thumbnail }"
					alt="">
						<div class="lec_info">
							<p><span>강의명 : ${rec.lecture_title }</span></p>
						<p><span>장소 : ${rec.lectureVO.location }</span></p>
						<p><span>결제금액 : ${rec.lectureVO.price }원</span></p>
						<p>시작일 : ${rec.lectureVO.startdate } </p>
						<p>종료일 : ${rec.lectureVO.enddate }</p>
						</div>
					</div>

					<a class="btn btn-primary" href="javascript:void(0)"
						id="btn_popup_open">후기 작성</a>
				</fieldset>
				</c:forEach>
				</c:if>
				
				
				<c:if test="${empty reserveList }">
				<div>예약한 오프라인 강의가 없습니다.</div>
				<br>
				<button onclick="location.href='${contextPath}/offlinelectures/list/전체' " class="btn btn-secondary">오프라인 강의 둘러보기</button>
				</div>
				</c:if>
			</div>
			<div class="popup_panel">
				<div class="popup_bg"></div>
				<div class="popup_contents">
					<div id="container">
						<div class="form-wrap">
							<h1>수강후기</h1>
							<form id="reviewForm" action="${contextPath }/lecture/review"
								method="post">
								<input type="hidden" type="number" id="rating" name="rating" />
								<input type="hidden" name="lecture_title" value="자바" /> <input
									type="hidden" name="member_id"
									value="${sessionScope.member.member_id }" />
								<!-- <%-- <input type="hidden" name="lecture_title" value="${sessionScope.lecture.lecture_title }" /> --%> -->
								<div class="star-group">
									<p>별점 선택</p>
									<p id="star_grade">
										<a href="#" class="star">★</a> <a href="#" class="star">★</a>
										<a href="#" class="star">★</a> <a href="#" class="star">★</a>
										<a href="#" class="star">★</a>
									</p>
								</div>
								<div class="form-group">
									<label for="textarea">코멘트</label>
									<textarea name="rcontent" id="textarea" cols="50" rows="8"
										placeholder="최소 3자 이상 최대 400자 이상 입력이 가능합니다."></textarea>
								</div>
								<button type="submit" class="submitBtn">등록</button>
								<button type="cancel" class="btn" aria-label="Close"
									id="btn_popup_close">취소</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		<!-- footer -->
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