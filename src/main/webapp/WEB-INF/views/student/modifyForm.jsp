<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var="contextPath" value="${pageContext.request.contextPath }" /> 
    
    
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Form Styling</title>
  <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet" />
  <link rel="stylesheet" href="${contextPath }/css/member/Member_Total.css">
  <link rel="stylesheet" href="${contextPath }/css/member/Two_Button.css">
</head>

<body>
  <div id="container">
    <div class="form-wrap">
      <h1>회원수정</h1>
      <form>
        <div class="form-group">
          <label for="id">아이디</label>
          <input type="text" name="id" id="id" placeholder="asdf1234" autofocus required />
        </div>
        <div class="form-group">
          <label for="password">비밀번호</label>
          <input type="password" name="password" id="password" placeholder="********" required />
        </div>
        <div class="form-group">
          <label for="password2">비밀번호 재확인</label>
          <input type="password" name="pasword2" id="password2" placeholder="********" required />
        </div>
        <div class="form-group">
          <label for="name">이름</label>
          <input type="text" name="name" id="name" placeholder="홍길동" required />
        </div>
        <div class="form-group">
          <label for="email">이메일</label>
          <input type="email" name="email" id="email" placeholder="asdf1234@naver.com" required />
        </div>
        <div class="button-group">
        <button type="submit" class="btn">수정하기</button>
        <button type="cancel" class="btn">취소하기</button>
        </div>	
      </form>
    </div>
  </div>
  </div>
</body>

</html>