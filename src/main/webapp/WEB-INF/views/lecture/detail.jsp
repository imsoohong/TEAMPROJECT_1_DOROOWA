<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="openYn" value="${openYn }" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${lectureVO.lecture_title }</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.2/css/all.css"
	integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu"
	crossorigin="anonymous">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="${contextPath }/css/main.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath }/css/lecture/detail.css" />
	<link rel="stylesheet" type="text/css"
	href="${contextPath }/css/mobile.css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>
<script defer src="${contextPath }/js/common/ckeditor.js"></script>
<script defer src="${contextPath }/js/lecture/detail.js"></script>
<script defer src="${contextPath }/js/include/reviewList.js"></script>

</head>
<style>

/* .accordion-button { */
/* padding: 0px;} */

/* #subElement.accordion-button { */
/* background-color: white;} */

/* #subElement.accordion-button::after { */
/* display: none;} */
.far {
	color: black;
}

.ck.ck-toolbar.ck-toolbar_grouping {
	visibility: hidden;
}

.ck-blurred.ck.ck-content.ck-editor__editable {
	border: 0px;
}

/*수정모드*/
.umode {
	display: none;
}

.accordion-button {
	backgroun-color: #e7f1ff;
}

.accordion-body {
	display: flex;
	flex-direction: column;
	padding: 0;
}

.curriculum__text {
	display: block;
	width: 100%;
	text-align: left;
	text-indent: 0.6em;
	height: auto;
	font-size: 1.3em;
	border-bottom: 1px solid rgb(234, 234, 234);
	font-weight:800;
}
.curriculum__text a{
	color: black;
}
.curriculum__text:hover {
	background-color: rgb(230, 230, 230);

</style>




<body>

	<div class="grid-container">
		<!--   header -->
		<%@ include file="/WEB-INF/views/include/header_new.jsp"%>
		<!--   header -->
		<div id="slider">
			<div class="lecture__thumnail">
				<img
					src="${contextPath }/img/thumbnail/${lectureVO.thumbnail }"
					alt="">
			</div>
			<div class="lecture__info">
				<div class="lecture__kind">카테고리 > ${lectureVO.kinds }</div>
				<div class="lecture__title">
					<h1 id="lecture_title_ele">${lectureVO.lecture_title }</h1>
				</div>
				<div class="lecture__rating">
					<%@ include file="/WEB-INF/views/lecture/rating.jsp"%>
				</div>
				<div class="teacher_nickname">
					<i class="fas fa-user-alt"></i>${lectureVO.teacher_nickname }<i
						class="fas fa-crown"></i>
				</div>
				<div class="teacher_intro">
				${lectureVO.teacher_intro }
				</div>
				<div>${studentCnt }명의 수강생·${reviewCnt }개의 수강평</div>

			</div>


		</div>
		<!--lec__info-->

		<div class="main">
			<div class="lecture_menu">
				<ul class="lecture__ul">
					<li data-link=".intro">강의 소개</li>
					<c:if test="${lectureVO.type eq 'on' }">
					<li data-link=".curry">커리큘럼</li>
					</c:if>
					<c:if test="${lectureVO.type eq 'off' }">
					<li data-link=".location">위치</li>
					</c:if>
					<li data-link=".review">강의 후기</li>
					<li data-link=".qna">강의 질문</li>
				</ul>
			</div>
			<div class="left">
				<div class="intro">
					<form id="modifyForm" action="${contextPath }/admin/modifyIntro"
						method="post">
							<br> <br>
						<h2>강의 소개</h2>
						<div id="lecture_intro">
							<input type="hidden" id="lecture_title" name="lecture_title"
								value="${lectureVO.lecture_title }" /> <input type="hidden"
								id="member_id" name="member_id"
								value="${sessionScope.member.member_id }" />
							<textarea name="intro" id="intro" readonly="readonly"
								style="display: none">${lectureVO.intro }</textarea>
							<!-- 관리자만 수정 가능 -->
							<c:if test="${sessionScope.member.type  eq '관리자' }">
								<button id="modifyBtn" type="button"
									class="btn rmode btn-outline-danger btn-sm">수정</button>
								<!-- 수정모드 버튼 시작-->
								<button id="saveBtn" type="button"
									class="btn umode btn-outline-dark btn-sm">저장</button>
								<button id="cancelBtn" type="button"
									class="btn umode btn-outline-danger btn-sm">취소</button>
								<!-- 수정모드 버튼 끝-->
							</c:if>
							<!-- 관리자만 수정 가능 끝 -->
						</div>
					</form>


				</div>

				<c:if test="${lectureVO.type eq 'on' }">
					<div class="curry">
						<br> <br>
						<h2>커리큘럼</h2>

						<%@ include file="/WEB-INF/views/lecture/curri.jsp"%>

					</div>

				</c:if>
				<c:if test="${lectureVO.type eq 'off' }">
					<div class="location">
					<br> <br>
						<h2>위치</h2>
						<div id="address">${lectureVO.location}</div>
						<%@ include file="/WEB-INF/views/map.jsp"%>
					</div>
				</c:if>




				<div class="review">
					<br> <br>
					<h2>강의 후기</h2>
					
										<div class="review__info">
						<div class="review__rating">
							<h1>${lectureVO.rating}</h1>
							<h5>					
								<%@ include file="/WEB-INF/views/lecture/rating.jsp"%>
							</h5>
							<h5>
								${reviewCnt }개의수강평
							</h5>
						</div>
						<div class="review__graph">
						<c:forEach var="ratingCnt" items="${ratingCnt}" varStatus = "status">
							<span>${ status.count}점</span><progress class="graph" max="${reviewCnt }" value="${ ratingCnt}" ></progress> 
							
							</c:forEach>
						</div>
					</div>


					

					<a class="btn btn-primary" href="javascript:void(0)"
						id="btn_popup_open" style="display: ${reviewYn}">후기 작성</a>
							<!-- 후기 -->
		<%@ include file="/WEB-INF/views/include/review.jsp"%>
					
<%@ include file="/WEB-INF/views/include/reviewPopup.jsp"%>
					

				</div>
				<div class="qna">
					<br> <br>
					<h2>강의 질문</h2>
					<c:if test="${!empty qnaList }">
					<div class="container">
						<div class="content">
							<div class="table-responsive">
								<table class="table table-sm table-hover caption-top">
									<thead class="table-dark">
										<tr>
											<!-- 								<th scope="col">번호</th> -->
											<th scope="col">제목</th>
											<th scope="col">작성자</th>
											<th scope="col">작성일</th>
										</tr>
									</thead>

									<tbody class="table-white">
										<c:forEach var="rec" items="${qnaList }">
											<tr
												onClick="location.href='${contextPath }/qna/view/${rec.qna_num}'"
												style="cursor: pointer;">

												<%-- 									<th scope="col">${rec.qna_num }</th> --%>
												<th scope="col">${rec.title }</th>

												<th scope="col">${rec.nickname }</th>
												<th scope="col">${rec.cdate }</th>

											</tr>
										</c:forEach>
									</tbody>

								</table>
								<div class="text-end">
									<a
										href="${contextPath }/lecture/${lectureVO.lecture_title}/writeQnaForm"><button
											id="writeBtn" type="button" class="btn btn-warning btn-sm">글쓰기</button></a>
								</div>

								<div class="text-center">
									<ul class="pagination pagination-sm justify-content-center">
										<li class="page-item active" aria-current="page"><span
											class="page-link">1</span></li>
										<li class="page-item"><a class="page-link" href="#">2</a></li>
										<li class="page-item"><a class="page-link" href="#">3</a></li>
									</ul>
								</div>


							</div>


						</div>
					</div>
					</c:if>					
					<c:if test="${empty qnaList }">
					작성된 QnA가 없습니다.
					</c:if>
				</div>
			</div>
			<div class="rright">
				<div class="right__text">
				<h2>${lectureVO.price }원</h2>
				<h6>${studentCnt }명의 수강생·${reviewCnt }개의 수강평</h6>
				<h6>${lectureVO.kinds } | ${lectureVO.teacher_nickname }</h6>
				</div>
				<c:choose>
				<c:when test="${lectureVO.type eq 'off' && lectureVO.amount eq lectureVO.count}">
							<button class="end__wrapper-btn" onclick="" disabled>마감되었습니다</button>
				</c:when>
				<c:otherwise>
				<button class="right__btn" onclick="order(this)" id=${orderYn }>${orderContent }</button>
				</c:otherwise>
				</c:choose>
				<p class="basket">
					장바구니에 담겼습니다. <a class="basket__delete"><i class="fas fa-times"></i></a>
					<button onClick="location.href='${contextPath }/student/myBasket'"
						type="button" class="basket__move">장바구니로 이동</button>
				</p>
				<button class="right__btn" onclick="wish(this)" id=${wishYn }>${wishContent }</button>

			</div>
			<div class="height"></div>
		</div>
	</div>
		<!-- footer -->
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>

	<script src="${contextPath }/js/student/popup.js"></script>
	<script>
$('#star_grade a').click(function () {
		
    $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */
    $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
    return false;
  });




  $('.submitBtn').click(function () {
	  document.getElementById('rating').value = document.querySelectorAll('a.star.on').length;
      document.getElementById('reviewForm').submit();

  });
</script>
</body>
<script>
  $(document).ready(function () {
    var jbOffset = $('.lecture__ul').offset();
    $(window).scroll(function () {
      if ($(document).scrollTop() > jbOffset.top) {
        $('.lecture__ul').addClass('lecture__ul--fixed');
      }
      else {
        $('.lecture__ul').removeClass('lecture__ul--fixed');
      }
    });
  });

// Handle scrolling when tapping on the navbar menu
const lecture__ul = document.querySelector('.lecture__ul');

lecture__ul.addEventListener('click', (event) => {
  const target = event.target;
  const link = target.dataset.link;
  if(link == null) { 
    return;
  } 

  console.log(event.target.dataset.link); // 링크가 있어야 클릭이 됨//
  scrollIntoView(link);

});

function scrollIntoView(selector) {
  const scrollTo = document.querySelector(selector);
  scrollTo.scrollIntoView({behavior: 'smooth'});
}


// const lock = document.querySelector('.locked');
// const lockParent = lock.parentNode;
// lockParent.addEventListener('click', (evt)=>{
// 	  evt.preventDefault();
// })


const locks = document.querySelectorAll('.locked');
for(let i=0;i<locks.length;i++){
	var lockParent = locks[i].parentNode;
	lockParent.addEventListener('click', (evt)=>{
		  evt.preventDefault();
	})
}



</script>

</html>