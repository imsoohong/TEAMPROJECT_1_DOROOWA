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
<title>공지사항/이벤트 글쓰기</title>
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
<link rel="stylesheet" href="${contextPath }/css/notice/NoticeView.css">
<link rel="stylesheet" href="${contextPath }/css/notice/NoticeWrite.css">
<!-- 헤더 -->
<link rel="stylesheet" href="${contextPath }/css/header.css">
<!-- 푸터 -->
<link rel="stylesheet" href="${contextPath }/css/footer.css">
<!-- 자바스크립트 -->
<script defer src="${contextPath }/js/notice/NoticeWrite.js"></script>
<script defer src="https://kit.fontawesome.com/946dc76c2e.js" crossorigin="anonymous"></script>
<!-- ck에디터용 -->
<script src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script>
<script defer src="${contextPath }/js/notice/UploadAdapter.js"></script>
</head>

<body>
	<!--   header -->
	<%@ include file="/WEB-INF/views/include/header_new.jsp"%>
	<!--   section -->
	<section  id="card_slider">
		    	<p id="title">공지사항/이벤트 작성</p>
    	<hr>
    		<!-- 글쓰기 폼 시작 -->
    		<form method="post" 
    					id="NoticeWriteForm"
    					action="${contextPath }/notice/write"
    		>
			    	<label for="ntitle">제목</label>
			    	<input id="ntitle" type=text id="ntitle" name="ntitle" />
    			<span>
			    	<!-- <label for="nnickname">작성자</label>	 -->					
			    	<input name="nnickname" type="hidden" readonly="readonly" value="${sessionScope.member.nickname }" />					
			    	<!-- <label for="nid">작성자 아이디</label>	 -->					
			    	<input name="nid" type="hidden" readonly="readonly" value="${sessionScope.member.member_id }" />
    			</span>
					<br>
					<!-- ck에디터5 시작--> 
					<label for="ncontent"><h3>글 내용</h3></label><br>
					<textarea name="ncontent" id="ncontent" style="display:none"></textarea>
					<div id="word-count"></div>	
					
					<!-- ck에디터5 끝-->
					<select name="noticeCategoryVO.cid" id="cid">
						<option value="">선택</option>
						<option value="1010">공지사항</option>
						<option value="1020">이벤트</option>				
					</select>
					<!-- 저장, 취소 버튼 -->
		  		<button id="writeBtn" type="submit" class="btn btn-warning btn-sm">저장</button>
		  		
		  		<span id="cid_errmsg"></span>
		  		<span id="ntitle_errmsg"></span>
		  		<span id="ncontent_errmsg"></span>
    		</form>
    		<!-- 글쓰기 폼 끝 -->
		  <div class="text-end">
		  	<!-- 공통버튼 -->
				<button id="listBtn"  type="button" class="btn btn-outline-dark btn-sm">목록</button>
		  </div>
			<input id="mType" type="hidden" value="${sessionScope.member.type }" readonly="readonly" />

		
	</section>
	<!-- footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>
</html>