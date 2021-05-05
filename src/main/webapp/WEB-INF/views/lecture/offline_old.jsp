<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>오프라인 강의 메인 페이지</title>
<!-- 폰트어썸 -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.2/css/all.css"
	integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu"
	crossorigin="anonymous">
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<!-- CSS -->
<link rel="stylesheet" href="${contextPath }/css/lecture/offline.css">
<!-- 헤더 -->
<link rel="stylesheet" href="${contextPath }/css/header.css">
<!-- 푸터 -->
<link rel="stylesheet" href="${contextPath }/css/footer.css">
<!-- 자바스크립트 -->
<script defer src="${contextPath }/js/lecture/offline.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>

<body>
	<!--   header -->
	<%@ include file="/WEB-INF/views/include/header_new.jsp"%>
	
	 <a href="/doroowa/offlinelectures/list/전체"><button id="all" type="button" class="btn btn-outline-primary">전체</button></a>
      <a href="/doroowa/offlinelectures/list/서울"><button id="seoul" type="button" class="btn btn-outline-primary">서울</button></a>
      <a href="/doroowa/offlinelectures/list/부산"><button id="pusan" type="button" class="btn btn-outline-primary">부산</button></a>
      <a href="/doroowa/offlinelectures/list/울산"><button id="ulsan" type="button" class="btn btn-outline-primary">울산</button></a>
      <a href="/doroowa/offlinelectures/list/기타"><button id="etc" type="button" class="btn btn-outline-primary">기타</button></a>
      <select class="form-control" id="listset" data-location="${location }">
      	<option seleted>=====</option>      
        <option value="price">높은 가격순</option>
        <option value="opendate">최신순</option>
        <option value="rating">인기순</option>
      </select>
	
	
	<!--   section -->
	<section  id="card_slider">
	<c:forEach var="rec" items="${offlineLectureList}">
	<c:if test="${location eq rec.location}">
		<div class="lecture">
			<a href="${contextPath }/lecture/${rec.lecture_title}/detail" class="lecture__list">
				<div class="list__img">
					<img src="${contextPath }/img/xxx.jpg">
				</div>
				<div class="list__content">
					<h4>${rec.lecture_title }</h4>
					<h6 class="content__count">
						<span>현재 수강 인원</span> / <span>정원 ${rec.count }명</span>
					</h6>
					<h6 class="content__location">
						<span>강의 장소</span> : <span>${rec.location } </span>
					</h6>
				</div>
				<div class="content__reserve">
					<div class="reserve__price">
						<h5 class="price">가격 ${rec.price }</h5>
						<h6 class="reserve__wrapper">
							<button class="reserve__wrapper-btn" onclick="location.href='#' ">예약하기</button>
						</h6>
					</div>
				</div>
			</a>
		</div>
		</c:if>
		 </c:forEach>
	</section>
	<!-- footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>
</html>