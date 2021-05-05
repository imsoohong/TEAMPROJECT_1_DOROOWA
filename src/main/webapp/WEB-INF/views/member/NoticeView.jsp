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
<title>공지사항</title>
<!-- 폰트어썸 -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.2/css/all.css"
	integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu"
	crossorigin="anonymous">
<script defer src="https://kit.fontawesome.com/946dc76c2e.js" crossorigin="anonymous"></script>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
<!-- CSS -->
<link rel="stylesheet" href="${contextPath }/css/notice/NoticeView.css">
<!-- 헤더 -->
<link rel="stylesheet" href="${contextPath }/css/header.css">
<!-- 푸터 -->
<link rel="stylesheet" href="${contextPath }/css/footer.css">
<!-- 자바스크립트 -->
<script defer src="${contextPath }/js/notice/NoticeView.js"></script>
<script defer src="https://kit.fontawesome.com/946dc76c2e.js" crossorigin="anonymous"></script>
</head>

<body>
	<!--   header -->
	<%@ include file="/WEB-INF/views/include/header_new.jsp"%>
	<!--   section -->
	<section  id="card_slider">
		    	<p id="title">공지사항</p>
    	<hr>
    	<div class="readForm">

				<div class="noticeInfo">
					<div id="test"> </div>
					<h3 id="ntitle">${Noticeview.ntitle }</h3>
						<ul>
							<li><h3>${Noticeview.nnickname }</h3></li>
							<li>
							<fmt:formatDate value="${Noticeview.ncdate }" pattern="yy.MM.dd" />
							</li>
							<li><i class="far fa-eye"></i>${Noticeview.nhit }</li>
						</ul>
				</div>
				<hr>
				<div id="ncontent_box">
					<div id="ncontent">
						${Noticeview.ncontent }
					</div>
				</div>
    	</div>
    	
		  <div class="text-end">
		  <hr>
		  <!-- 버튼 모음 시작 -->
			<!-- 글쓰기버튼,삭제 (관리자만) -->
		  	<button id="writeBtn" type="button" class="btn btn-warning btn-sm">글쓰기</button>

		  <!-- 수정,삭제 버튼 (작성자만) -->
		  <c:if test="${selectNid eq sessionScope.member.member_id }">
		  	<button id="modifyBtn"  type="button" class="btn rmode btn-outline-danger btn-sm">수정</button>
			<button type="button" 
	        		class="btn rmode btn-outline-dark btn-sm" 
		        	data-bs-toggle="modal" data-bs-target="#popUp">삭제</button>
		  </c:if>
		  	<!-- 공통버튼 -->
				<button id="listBtn"  type="button" class="btn btn-outline-dark btn-sm">목록</button>
		  </div>
		  <!-- 버튼 모음 끝 -->
			<input id="mType" type="hidden" value="${sessionScope.member.type }" readonly="readonly" />
			<input  type="hidden" value="${selectNid }" readonly="readonly" />
			<!-- 게시글번호 -->
			<input id="nnum" name="nnum" type="hidden" value="${Noticeview.nnum }" readonly="readonly" />
			<!-- Modal -->
			<div class="modal fade" id="popUp" data-bs-backdrop="static" data-bs-keyboard="false" 
					 tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered modal-sm">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="staticBackdropLabel">
			          <span class="badge bg-danger"></span> 
			        </h5>
			        <!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
			      </div>
			      <div class="modal-body"></div>
			      <div class="modal-footer">
			      	
			        <button type="button" class="btn btn-secondary btn-sm" 
			        				data-bs-dismiss="modal">취소</button>
			        <button type="button" class="btn btn-primary btn-sm" 
			        				data-bs-dismiss="modal" id="deleteBtn" 
			        				data-bnum="${Noticeview.nnum }">삭제</button>
			      </div>
			    </div>
			  </div>
			</div>

		
	</section>
	<!-- footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>
</html>