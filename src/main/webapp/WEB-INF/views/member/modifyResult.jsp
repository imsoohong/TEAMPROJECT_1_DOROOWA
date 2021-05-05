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
      <h1>회원정보 수정</h1>
      <form>
        <span class="loginErr_msg" id="loginErr_msg">회원정보가 수정 되었습니다 !</span>
        <footer>
          <a href="${contextPath }/">메인으로 돌아가기</a>
        </footer>
      </form>
    </div>
  </div>
</body>

</html>