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
<title>Document</title>
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
<link rel="stylesheet" href="${contextPath }/css/home.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath }/css/lecture/detail.css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>
<script defer src="${contextPath }/js/common/ckeditor.js"></script>
<script defer src="${contextPath }/js/lecture/detail.js"></script>
<script defer src="${contextPath }/js/lecture/review.js"></script>
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
	text-indent: 1em;
	height: auto;
	border-bottom: 1px solid rgb(234, 234, 234);
}

.curriculum__text:hover {
	background-color: rgb(230, 230, 230);
}
</style>




<body>

	<div class="grid-container">
		<!--   header -->
		<%@ include file="/WEB-INF/views/include/header_new.jsp"%>
		<!--   header -->
		<div id="slider">
			<div class="lecture__thumnail">
				<img
					src="${contextPath }/img/thumbnail/${lectureVO.lecture_title }.jpg"
					alt="">
			</div>
			<div class="lecture__info">
				<div class="lecture__kind">카테고리 > ${lectureVO.kinds }</div>
				<div class="lecture__title">
					<h1>${lectureVO.lecture_title }</h1>
				</div>
				<div class="lecture__rating">
					<%@ include file="/WEB-INF/views/lecture/rating.jsp"%>
				</div>
				<div class="teacher_nickname">
					<i class="fas fa-user-alt"></i>${lectureVO.teacher_nickname }<i
						class="fas fa-crown"></i>
				</div>
				<div>${studentCnt }명의수강생·${reviewCnt }개의수강평</div>

			</div>


		</div>
		<!--lec__info-->

		<div class="main">
			<div class="lecture_menu">
				<ul class="lecture__ul">
					<li data-link=".intro">강의 소개</li>
					<li data-link=".location">위치</li>
					<li data-link=".curry">커리큘럼</li>
					<li data-link=".review">강의 후기</li>
					<li data-link=".qna">강의 질문</li>
				</ul>
			</div>
			<div class="left">
				<div class="intro">
					<form id="modifyForm" action="${contextPath }/admin/modifyIntro"
						method="post">
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
				
				<div class="location">
				<h2>위치</h2>
				<%@ include file="/WEB-INF/views/map.jsp"%>
				</div>
				
				<div class="curry">
					<br> <br> <br>
					<h2>커리큘럼</h2>
					<div class="list-group">
						<c:forEach var="chapter" items="${chapterList }">
							<div class="accordion accordion-flush" id="accordionFlushExample">
								<div class="accordion-item">
									<h2 class="accordion-header"
										id="flush-heading${chapter.chapter_id }">
										<button class="accordion-button  collapse show" type="button"
											data-bs-toggle="collapse"
											data-bs-target="#flush-collapse${chapter.chapter_id }"
											aria-expanded="false"
											aria-controls="flush-collapse${chapter.chapter_id }">
											${chapter.chapter_title }</button>
									</h2>
									<div id="flush-collapse${chapter.chapter_id }"
										class="accordion-collapse collapse"
										aria-labelledby="flush-heading${chapter.chapter_id }"
										data-bs-parent="#accordionFlushExample">
										<div class="accordion-body">
											<c:forEach var="curriculum" items="${curriculum }">
												<c:if test="${chapter.chapter_id == curriculum.chapter_id}">
													<a
														href="${contextPath }/video/${chapter.lecture_title}/${curriculum.video_id}"
														class="curriculum__text"> <c:choose>
															<c:when test="${openYn=='true'}">

																<c:forEach var="myProgress" items="${myProgress }">
																	<c:if
																		test="${myProgress.video_id == curriculum.video_id && myProgress.progress==1}">

																		<i class="fas fa-check-circle"></i>${curriculum.title }
										
										</c:if>
																	<c:if
																		test="${myProgress.video_id == curriculum.video_id && myProgress.progress==0}">

																		<i class="far fa-check-circle"></i>${curriculum.title }
										
										</c:if>

																</c:forEach>

															</c:when>


															<c:when test="${openYn2=='true'}">

																<i class="far fa-check-circle"></i>${curriculum.title }
										
										
										</c:when>


															<c:otherwise>

																<c:if test="${curriculum.secret eq 'y'}">
																	<i class="fas fa-lock locked"></i>${curriculum.title }
										</c:if>

																<c:if test="${curriculum.secret eq 'n'}">

																	<i class="fas fa-unlock-alt"></i>${curriculum.title }
										
										</c:if>




															</c:otherwise>



														</c:choose>


													</a>

												</c:if>

											</c:forEach>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>


				</div>
				<div class="review">
					<h2>강의 후기</h2><a class="btn btn-primary" href="javascript:void(0)"
						id="btn_popup_open" style="display: ${reviewYn}">후기 작성</a>
							<!-- 후기 -->
		<%@ include file="/WEB-INF/views/include/review.jsp"%>
					

					
					<div class="popup_panel">
						<div class="popup_bg"></div>
						<div class="popup_contents">
							<div id="container">
								<div class="form-wrap">
									<h1>수강후기</h1>
									<form id="reviewForm" action="${contextPath }/lecture/review"
										method="post">
										<input type="hidden" type="number" id="rating" name="rating" />
										<input type="hidden" name="lecture_title"
											value="${lectureVO.lecture_title }" /> <input type="hidden"
											name="member_id" value="${sessionScope.member.member_id }" />
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
				<div class="qna">
					<br> <br> <br>
					<h2>강의 질문</h2>
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
				</div>
			</div>
			<div class="rright">
				<h3>까치가 물어온 선착순 설날 특별 쿠폰 받자!</h3>
				<p>선착순 특별 쿠폰으로 추가 할인을 받아보세요.</p>
				가격
				<p>반갑습니다</p>
				<button onclick="order(this)" id=${orderYn }>${orderContent }</button>
				<p class="basket">
					장바구니에 담겼습니다. <a class="basket__delete"><i class="fas fa-times"></i></a>
					<button onClick="location.href='${contextPath }/student/myBasket'"
						type="button" class="basket__move">장바구니로 이동</button>
				</p>
				<button onclick="wish(this)" id=${wishYn }>${wishContent }</button>

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