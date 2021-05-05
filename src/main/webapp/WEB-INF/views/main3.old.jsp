<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath }" />


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document123</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<link rel="stylesheet" href="${contextPath }/css/reset.css">
<link rel="stylesheet" href="${contextPath }/css/slick.css">
<link rel="stylesheet" href="${contextPath }/css/slick-theme.css">
<link rel="stylesheet" href="${contextPath }/css/html5tooltips.css">
<link rel="stylesheet"
	href="${contextPath }/css/html5tooltips.animation.css">
<link rel="stylesheet" href="${contextPath }/css/main.css">
<link rel="stylesheet" href="${contextPath }/css/lecture/offline.css">
<link rel="stylesheet" href="${contextPath }/css/home.css">
<link rel="stylesheet" href="${contextPath }/css/header.css">
<link rel="stylesheet" href="${contextPath }/css/footer.css">

<script src="${contextPath }/js/html5tooltips.js"></script>

<style>
.fa-user-alt{
color: grey;
}
</style>
</head>

<body>
	
	<div class="grid-container">
		<!--   header -->
		<%@ include file="/WEB-INF/views/include/header_new.jsp"%>
		<!--   slider -->
		<div id="slider">
			<div>
				<img src="img/a1.jpg" alt="">
			</div>
			<div>
				<img src="img/a2.jpg" alt="">
			</div>
			<div>
				<img src="img/a3.jpg" alt="">
			</div>
		</div>
		<div class="main">
			<fieldset>
				<legend>최신 온라인강의</legend>
				<div id="card_slider" class="card_slider">
					<c:forEach var="rec" items="${onNewLecture }">
							<div class="card" style="width: 15rem;">
								<img src="img/thumbnail/${rec.thumbnail }"
									class="card-img-top" alt="...">
								<ul class="list-group list-group-flush">
									<li class="list-group-item">${rec.lecture_title }</li>
									<li class="list-group-item"><i class="fas fa-user-alt"></i> ${rec.memberVO.nickname }</li>
									<li class="list-group-item">${rec.price }원</li>
									
									<%@ include file="/WEB-INF/views/include/ratingMain.jsp"%>

								</ul>
								<a href="${contextPath }/lecture/${rec.lecture_title}/detail">
									<div class="caption">
										<p class="intro">${rec.lecture_intro }</p>
									</div>
								</a>
							</div>
					</c:forEach>

				</div>
			</fieldset>

			<fieldset>
				<legend>인기 온라인강의</legend>
				<div id="card_slider" class="card_slider">
					<c:forEach var="rec" items="${onBestLecture }">
							<div class="card" style="width: 15rem;">
								<img src="img/thumbnail/${rec.thumbnail }"
									class="card-img-top" alt="...">
								<ul class="list-group list-group-flush">
									<li class="list-group-item">${rec.lecture_title }</li>
									<li class="list-group-item"><i class="fas fa-user-alt"></i> ${rec.memberVO.nickname }</li>
									<li class="list-group-item">${rec.price }원</li>
									<%@ include file="/WEB-INF/views/include/ratingMain.jsp"%>

								</ul>
								<a href="${contextPath }/lecture/${rec.lecture_title}/detail">
									<div class="caption">
									<p class="intro">${rec.lecture_intro }</p>
								</div>
							</a>
							</div>
					</c:forEach>

				</div>
			</fieldset>

			<fieldset>
				<legend>추천 온라인강의</legend>
				<div id="card_slider" class="card_slider">
					<c:forEach var="rec" items="${onRecommendLecture }">
							<div class="card" style="width: 15rem;">
								<img src="img/thumbnail/${rec.thumbnail }"
									class="card-img-top" alt="...">
								<ul class="list-group list-group-flush">
									<li class="list-group-item">${rec.lecture_title }</li>
									<li class="list-group-item"><i class="fas fa-user-alt"></i> ${rec.memberVO.nickname }</li>
									<li class="list-group-item">${rec.price }원</li>
									<%@ include file="/WEB-INF/views/include/ratingMain.jsp"%>

								</ul>
								<a href="${contextPath }/lecture/${rec.lecture_title}/detail">
									<div class="caption">
										<p class="intro">${rec.lecture_intro }</p>
									</div>
								</a>
							</div>
					</c:forEach>

				</div>
			</fieldset>
			
					<c:set var="Location" value="${location }"/>
				<legend>선착순 한정! ${fn:substring(Location,0,2) } 오프라인 강의 </legend>
			<c:forEach var="rec" items="${offLecture }" begin="0" end="3">
			<div class="lecture">
							<a href="${contextPath }/lecture/${rec.lecture_title}/detail" class="lecture__list">
				<div class="list__img">
					<img src="img/thumbnail/${rec.thumbnail }">
				</div>
				<div class="list__content">
					<h4>${rec.lecture_title }</h4>
					<h6 class="content__count">
						<span>현재 인원 ${rec.count }명</span> / <span>정원 ${rec.amount }명</span>
					</h6>
					<h6 class="content__location">
						<span>강의 장소</span> : <span>${rec.location } </span>
					</h6>
				</div>
				<div class="content__reserve">
					<div class="reserve__price">
						<h5 class="price">가격 ${rec.price }</h5>
						<h6 class="reserve__wrapper">
							<c:if test="${rec.amount == rec.count}">
							<button class="end__wrapper-btn" onclick="location.href='#' ">마감</button>
							</c:if>
							<c:if test="${rec.amount != rec.count}">
							<button class="reserve__wrapper-btn" onclick="location.href='#' ">예약하기</button>
							</c:if>
						</h6>
					</div>
				</div>
			</a>
			</div>
			</c:forEach>
			
			<br><br>
			

			<div class="recommendation">
				<img src="img/xxx.jpg" alt="img">
				<ul class="recommendation__content">
					<c:forEach var="rec" items="${newReviewList }">
						<li class="recommendation__text">
							<h6>${rec.lecture_title}</h6> <c:choose>
								<c:when test="${rec.rating>=4.5}">
									<div>
										<i class="fas fa-star"></i><i class="fas fa-star"></i><i
											class="fas fa-star"></i><i class="fas fa-star"></i><i
											class="fas fa-star"></i>
									</div>
								</c:when>
								<c:when test="${rec.rating<4.5 && rec.rating>=3.5}">
									<div>
										<i class="fas fa-star"></i><i class="fas fa-star"></i><i
											class="fas fa-star"></i><i class="fas fa-star"></i>
									</div>
								</c:when>
								<c:when test="${rec.rating<3.5 && rec.rating>=2.5}">
									<div>
										<i class="fas fa-star"></i><i class="fas fa-star"></i><i
											class="fas fa-star"></i>
									</div>
								</c:when>
								<c:when test="${rec.rating<2.5 && rec.rating>=1.5}">
									<div>
										<i class="fas fa-star"></i><i class="fas fa-star"></i>
									</div>
								</c:when>
								<c:when test="${rec.rating<1.5 &&rec.rating>=0.5}">
									<div>
										<i class="fas fa-star"></i>
									</div>
								</c:when>

							</c:choose> ${rec.rcontent} ${rec.cdate }
							<button class="goLecture"
								onclick="location.href='${contextPath}/lecture/${rec.lecture_title}/detail' ">강의로
								이동 ></button>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
			<!-- footer -->
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>

	<script src="https://code.jquery.com/jquery-2.2.0.min.js"
		type="text/javascript"></script>
	<script src="js/slick.js" type="text/javascript"></script>
	<script src="js/slider.js" type="text/javascript"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
		crossorigin="anonymous"></script>
	<script>
		// for(var i=10;i--;)
		html5tooltips([
				,
				{
					contentText : "<div class='createClass left'><a href='${contextPath}/admin/registerOnLectureForm'><i class='fas fa-laptop'></i><p>온라인</p></a></div> <div class='createClass right'><a href='${contextPath}/admin/registerOffLectureForm'><i class='fas fa-map-marker-alt'></i><p>오프라인</p></a></div>",
					contentMore : "May contain d<span style='color:red;'>1</span>g<span style='color:red;'>1</span>ts and sp<span style='color:red;'>3</span>c<span style='color:red;'>!</span>al sym<span style='color:red;'>6</span>ols",
					targetSelector : ".bottom_tooltip",
					stickTo : "bottom",
					color : 'rgba(0,0,0,0.4)',
					// maxWidth: 180,
					persistent : true
				} ]);
		

	</script>
</body>
</html>