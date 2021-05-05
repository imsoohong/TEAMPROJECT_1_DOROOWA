<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var="contextPath" value="${pageContext.request.contextPath }" /> 
    
    
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>회원 수정</title>
  	<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet" />
    <link rel="stylesheet" href="${contextPath }/css/member/Member_Total.css">
  	<link rel="stylesheet" href="${contextPath }/css/member/Two_Button.css">
  	<script defer src="${contextPath }/js/member/modifyForm.js"></script>
</head>

<body>
  <div id="container">
    <div class="form-wrap">
      <h1>회원수정</h1>
      <form id="modifyForm" modelAttribute="memberVO" action="${contextPath }/member/modify" method="post">
        <div class="form-group">
          <label for="member_id">아이디</label>
          <input type="text" name="member_id" id="member_id" value="${sessionScope.member.member_id}" readonly="readonly" required />
        </div>
        <div class="form-group">
          <label for="nickname">별명</label>
          <input type="text" name="nickname" id="nickname" value="${sessionScope.member.nickname }" required />
        </div>
        <span id="errmsg_nickname"></span>
        <div class="form-group">
          <label for="name">이름</label>
          <input type="text" name="name" id="name" value="${sessionScope.member.name }" readonly="readonly" required />
        </div>
        <div class="form-group">
          <label for="region">주소</label>
          <input type="text" name="region" id="region" value="${sessionScope.member.region }" readonly />
          <span id="errmsg_addr"></span>
          
        </div>
        <div class="form-group">
          <label for="tel">전화번호</label>
          <input type="tel" name="tel" id="tel" value="${sessionScope.member.tel }" required />
        </div>
        <span id="errmsg_tel"></span>
        <div class="form-group">
          <label for="pw">비밀번호</label>
          <input type="password" name="pw" id="pw" placeholder="회원정보 수정을 하려면 비밀번호를 입력하세요" required />
        </div>
        <span id="errmsg_pw"></span>
        <div class="button-group">
	        <button type="submit" id="modifyBtn" class="btn">수정하기</button>
	        <button type="cancel" id="cancelBtn" class="btn">취소하기</button>
        </div>
      </form>
    </div>
  </div>
  </div>
</body>

</html>