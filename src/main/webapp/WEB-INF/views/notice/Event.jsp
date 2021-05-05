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
<title>이벤트</title>
<!-- 폰트어썸 -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.2/css/all.css"
	integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu"
	crossorigin="anonymous">
<script defer src="https://kit.fontawesome.com/946dc76c2e.js" crossorigin="anonymous"></script>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<!-- CSS -->
<link rel="stylesheet" href="${contextPath }/css/notice/Notice.css">
<!-- 헤더 -->
<link rel="stylesheet" href="${contextPath }/css/header.css">
<!-- 푸터 -->
<link rel="stylesheet" href="${contextPath }/css/footer.css">
<!-- 자바스크립트 -->
<script defer src="${contextPath }/js/notice/Event.js"></script>
<script defer src="https://kit.fontawesome.com/946dc76c2e.js" crossorigin="anonymous"></script>
</head>

<body>
	<!--   header -->
	<%@ include file="/WEB-INF/views/include/header_new.jsp"%>
	<!--   section -->
	<section  id="card_slider">
		<p id="title">이벤트</p>
				<br><br>
				<div class="board">
					<table class="table table-hover" id="noticeItem">
					  <thead>
					    <tr>
					      <th scope="col">제목</th>
					      <th scope="col">작성자</th>
					      <th scope="col">작성일</th>
					      <th scope="col"><i class="far fa-eye"></i></th>
					    </tr>
					  </thead>
					  <tbody>
					    	<c:forEach var="rec" items="${eventList }" >
						    <tr>
						      <td><a href="${contextPath}/notice/view/${rec.nnum}">${rec.ntitle }</a></td>
						      <td>${rec.nnickname }</td>
						      <td>
						      <fmt:formatDate value="${rec.ncdate }" pattern="yy.MM.dd" />
						      </td>
						      <td>${rec.nhit }</td>			    			    	
						    </tr>
					    	</c:forEach>
					  </tbody>
					</table>
				</div>
				<!-- 글쓰기버튼 (관리자만) -->
					  <div class="text-end">
					  	<button id="writeBtn" type="button" class="btn btn-warning btn-sm">글쓰기</button>
					  </div>
					<input id="mType" type="hidden" value="${sessionScope.member.type }" readonly="readonly" />
			  	<!-- 페이징 -->
				  <div>
					  <ul class="pagination pagination-sm justify-content-center" >
					  	<!-- 보여줄 이전페이지가 있는 경우만 보이게  -->
					  	<c:if test="${pc.prev }">
					    <!-- 첫 페이지 -->
					    <li class="page-item">
					    	<a class="page-link" href="${contextPath }/notice/event/1/">처음</a>
					    </li>	
					    <!-- 이전 페이지 -->		
					    <li class="page-item">
					    	<a class="page-link" href="${contextPath }/notice/event/${pc.startPage-1}">이전</a>
					    </li>	
					    </c:if>
					  
					    <c:forEach var="pageNum" begin="${pc.startPage }" end="${pc.endPage }">
					    <!-- 현재페이지와 요청페이지가 같은경우 -->
					    <c:if test="${pageNum eq pc.rc.reqPage}">
 					    <li class="page-item active" aria-current="page">
								<a class="page-link" href="${contextPath }/notice/event/${pageNum}">${pageNum }</a>
					    </li>
					    </c:if>
					    
					    <!-- 현재페이지와 요청페이지가 다른경우 -->
					    <c:if test="${pageNum ne pc.rc.reqPage}">
					    <li class="page-item">
					    	<a class="page-link" href="${contextPath }/notice/event/${pageNum}">${pageNum }</a>
					    </li>
					    </c:if>			    
					    </c:forEach>
					    <!-- 보여줄 다음페이지가 있는 경우만 보이게 -->
					    <c:if test="${pc.next }">
					    <!-- 다음페이지 -->
					    <li class="page-item">
					    	<a class="page-link" href="${contextPath }/notice/event/${pc.endPage + 1}">다음</a>
					    </li>	
					    <!-- 최종페이지 -->		
					    <li class="page-item">
					    	<a class="page-link" href="${contextPath }/notice/event/${pc.finalEndPage}">최종</a>
					    </li>	
					    </c:if>
					  </ul>
					</div>
				<!-- // 페이징 -->	
				<!-- 검색 -->
					<div class="find">
						<form action="#">
							<select name="searchType" id="searchType">
								<option value="TC">제목+내용</option>
								<option value="T">제목</option>
								<option value="C">내용</option>
								<option value="I">아이디</option>
								<option value="N">별칭</option>
								<option value="A">전체</option>
							</select>
							<input type="text" name="keyword" id="keyword" />
							<button id="findBtn" type="button" class="btn btn-outline-secondary btn-sm">검색</button>
						</form>
					</div>

		
	</section>
	<!-- footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>
</html>