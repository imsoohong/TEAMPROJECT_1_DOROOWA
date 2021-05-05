<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
    
    
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Insert title here</title>

<script defer src="${contextPath }/js/lecture/qnaForm.js"></script>
<link rel="stylesheet" href="${contextPath }/css/lecture/qnaForm.css" />

</head>
<body>

<main>

				<form id='qnaForm'
							action="${contextPath }/board/writeQna" 
							method="post"
							enctype="multipart/form-data">	
					<legend>QnA 작성</legend>
					<ul>
						<li><label for="title">제목</label></li>
						<li><input type="text" name="title" id="title" value="${qnaVO.title}" /></li>
					
						<li><label for="nickname">작성자</label></li>
						<li><input type="text" id="bid" 
											 value="${sessionScope.member.nickname }(${sessionScope.member.member_id })"
											 readonly="readonly"/>
						</li>
				
						<li><label for="content">내용</label></li>
						<li>
							<textarea name="content" id="content">${qnaVO.content }</textarea>
						
						</li>
					
						<li><label for="file">첨부</label></li>
						<li><input type="file" name="file" id="file" class="form-control" /></li>
						<li>
						<div id="profilePicArea">
							<img id="profilePic" src="data:${qnaVO.ftype };base64,${qnaVO.picBase64}" alt="" />
						</div>
						</li>
						<li>
							<button id="writeBtn" type="button" class="btn btn-outline-success btn-sm">등록</button>
							<button id="cancelBtn"  type="button" class="btn btn-outline-danger btn-sm">취소</button>
							<button id="listBtn"  type="button" class="btn btn-outline-dark btn-sm">목록</button>
						</li>
					</ul>				
				</form>

</main>

</body>
</html>