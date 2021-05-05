<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>온라인 강의 메인 페이지</title>
<!-- 폰트어썸 -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.2/css/all.css"
	integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu"
	crossorigin="anonymous">
<script defer src="https://kit.fontawesome.com/946dc76c2e.js" crossorigin="anonymous"></script>
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<!-- CSS -->
<link rel="stylesheet" href="${contextPath }/css/lecture/offline.css">
<link rel="stylesheet" href="${contextPath }/css/lecture/online.css">
<!-- 헤더 -->
<link rel="stylesheet" href="${contextPath }/css/header.css">
<!-- 푸터 -->
<link rel="stylesheet" href="${contextPath }/css/footer.css">
<!-- 자바스크립트 -->
<script defer src="${contextPath }/js/lecture/online.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>

<body>
	<!--   header -->
	<%@ include file="/WEB-INF/views/include/header_new.jsp"%>
	<!--   section -->
	<section  id="card_slider">
		<div id="buttonGroup">
	    <button name="lectureType" id="allBtn" type="button" class="btn btn-outline-primary" value="all" >전체</button>
	    <button name="lectureType" id="itBtn" type="button" class="btn btn-outline-primary" value="it" >IT</button>
	    <button name="lectureType" id="financeBtn" type="button" class="btn btn-outline-primary" value="finance" >금융</button>
	    <button name="lectureType" id="fitnessBtn" type="button" class="btn btn-outline-primary" value="fitness" >피트니스</button>
	    <button name="lectureType" id="creationBtn" type="button" class="btn btn-outline-primary" value="creation" >창작</button>
		</div>
			<div id="search_msg">버튼을 누른 후, '돋보기' 버튼 클릭시, 해당 강의 목록이 검색 됩니다.</div>
    	<div id="searchGroup">
		    <span id="spam">
		    	<i id="search" class="fas fa-search"></i>&nbsp;
			  	<select name="selectType" class="form-control" id="selectType" data-type="">
			  		 <option>정렬 선택</option>
				     <option id="late"  value="late" >최신순</option>
				     <option id="pop"  value="pop" >인기순</option>
				     <option id="star"  value="star" >별점순</option>
			  	</select>
		    </span>
    	</div>
    <hr>
  	<div id="parentLecture" class="lecturelist">
     	<!-- 강의목록 -->
     		<div id="allLecture" class="lectureItem type">
      		<c:forEach var="rec" items="${Lecture }">
      			<div class="card" style="width: 12rem;">
					  	<img src="https://picsum.photos/200/200" class="card-img-top" alt="...">
					  <div class="card-body">
					    <h5 class="card-title"><a href="#">${rec.lecture_title }</a></h5>
					    <p class="card-text"><a href="#">${rec.lecture_intro }</a></p>
					  </div>
					  <ul class="list-group list-group-flush">
					    <li class="list-group-item">
					    	<a href="#">
					    		<c:choose>
					    			<c:when test="${rec.kinds == 'it' }">
					    				IT
					    			</c:when>
					    			<c:when test="${rec.kinds == 'finance' }">
					    				금융
					    			</c:when>
					    			<c:when test="${rec.kinds == 'fitness' }">
					    				피트니스
					    			</c:when>
					    			<c:when test="${rec.kinds == 'creation'}">
					    				창작
					    			</c:when>
					    		</c:choose>
					    	</a>
					    </li>
					    <li class="list-group-item"><a href="#">${rec.teacher_nickname }</a></li>
					    <li class="list-group-item"><a href="#">${rec.price }원</a></li>
					    <li class="list-group-item">
					    	
					    		<fmt:formatDate value="${rec.opendate }" pattern="yy.MM.dd" />
					    		<%-- ${rec.opendate } --%>
					    
				    	</li>
					    <li class="list-group-item"><a href="#">${rec.lecture_intro }</a></li>
					    <li id="rating" class="list-group-item">
								<c:choose>
									<c:when test="${rec.rating>=4.5}">
										<td><i class="fas fa-star"></i><i class="fas fa-star"></i><i
											class="fas fa-star"></i><i class="fas fa-star"></i><i
											class="fas fa-star"></i></td>
									</c:when>
									<c:when test="${rec.rating<4.5 && rec.rating>=3.5}">
										<td><i class="fas fa-star"></i><i class="fas fa-star"></i><i
											class="fas fa-star"></i><i class="fas fa-star"></i></td>
									</c:when>
									<c:when test="${rec.rating<3.5 && rec.rating>=2.5}">
										<td><i class="fas fa-star"></i><i class="fas fa-star"></i><i
											class="fas fa-star"></i></td>
									</c:when>
									<c:when test="${rec.rating<2.5 && rec.rating>=1.5}">
										<td><i class="fas fa-star"></i><i class="fas fa-star"></i></td>
									</c:when>
									<c:when test="${rec.rating<1.5 &&rec.rating>=0.5}">
										<td><i class="fas fa-star"></i></td>
									</c:when>
								</c:choose>
					    </li>
					  </ul>
					</div>
			    </c:forEach>
      	</div>
      	<div id="undefined_msg">
      		
      	</div>
      	<!-- 강의목록 -->
      </div>

		
	</section>
	<!-- footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>
</html>