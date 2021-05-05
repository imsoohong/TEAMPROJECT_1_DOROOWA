<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var="contextPath" value="${pageContext.request.contextPath }" />   

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>아이디 찾기</title>
    <link rel="stylesheet" href="${contextPath }/css/member/Member_Total.css">
  	<link rel="stylesheet" href="${contextPath }/css/member/One_Button.css">
  	<link rel="stylesheet" href="${contextPath }/css/member/Member_Footer.css">
</head>

<body>
  <div id="container">
    <div class="form-wrap">
      <h1>아이디 찾기</h1>
      <form>
        <div class="form-group">
          <label for="name">이름</label>
          <input type="text" name="name" id="name" />
        </div>
        <div class="form-group">
          <label for="email">이메일</label>
          <input type="email" name="email" id="email" />
        </div>
        <button type="submit" class="btn" onclick="location.href='findPw2.html'"/>찾기</button>
        <footer>
          <a href="${contextPath }/">메인으로 돌아가기</a>
        </footer>
      </form>
    </div>
  </div>
</body>

</html>