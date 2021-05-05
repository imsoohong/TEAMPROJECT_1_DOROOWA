<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var="contextPath" value="${pageContext.request.contextPath }" /> 

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>로그인</title>
  <link rel="stylesheet" href="${contextPath }/css/member/Member_Total.css">
  <link rel="stylesheet" href="${contextPath }/css/member/One_Button.css">
  <link rel="stylesheet" href="${contextPath }/css/member/Member_Footer.css">
</head>

<body>
  <div id="container">
    <div class="form-wrap">
      <h1>로그인</h1>
      <form action="${contextPath }/login" method="post">
        <div class="form-group">
          <label for="member_id">아이디</label>
          <input type="text" name="member_id" id="member_id" placeholder="이메일을 입력하세요"/>
        </div>
        <div class="form-group">
          <label for="pw">비밀번호</label>
          <input type="password" name="pw" id="pw" placeholder="비밀번호를 입력하세요"/>
        </div>
        <span class="loginErr_msg" id="loginErr_msg">${loginErr_msg }</span>
        <button type="submit" class="btn">로그인</button>
        <footer>
          <a href="${contextPath }/">메인으로 돌아가기</a>
        </footer>
      </form>
    </div>
  </div>
</body>

</html>