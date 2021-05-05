<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var="contextPath" value="${pageContext.request.contextPath }" />   

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>강사 회원가입</title>
    <link rel="stylesheet" href="${contextPath }/css/member/Member_Total.css">
  	<link rel="stylesheet" href="${contextPath }/css/member/One_Button.css">
  	<link rel="stylesheet" href="${contextPath }/css/member/Member_Footer.css">
  	<script defer src="${contextPath }/js/member/teacherJoinForm.js"></script>
</head>

<body>
  <div id="container">
    <div class="form-wrap">
      <h1>강사 회원가입</h1>
      <form action="${contextPath }/teacher/teacherJoin" id="joinForm" method="post">
        <div class="form-group">
          <label for="member_id">아이디</label>
          <input type="text" name="member_id" id="member_id" placeholder="아이디로 사용하고자 하는 이메일 주소를 입력하세요" autofocus />
          <span id="errmsg_member_id"></span>
        </div>
        <div class="form-group">
          <label for="pw">비밀번호</label>
          <input type="password" name="pw" id="pw" placeholder="4~10자 사이의 비밀번호를 입력하세요" />
          <span id="errmsg_password_main"></span>
        </div>
        <div class="form-group">
          <label for="pwchk">비밀번호 재확인</label>
          <input type="password" name="pwchk" id="pwchk" placeholder="비빌번호를 한번 더 입력하세요" />
          <span id="errmsg_password"></span>
        </div>
        <div class="form-group">
          <label for="nickname">별명</label>
          <input type="text" name="nickname" id="nickname" placeholder="별명을 입력하세요" />
          <span id="errmsg_nickname"></span>
        </div>
        <div class="form-group">
          <label for="name">이름</label>
          <input type="text" name="name" id="name" placeholder="이름을 입력하세요" />
          <span id="errmsg_name"></span>
        </div>
        <div class="form-group">
          <label for="region">주소</label>
          <input type="text" name="region" id="region" placeholder="주소를 입력하세요" readonly />
          <span id="errmsg_addr"></span>
        </div>
        <div class="form-group">
          <label for="tel">전화번호</label>
          <input type="tel" name="tel" id="tel" placeholder="'-'을 포함하여 전화번호를 입력하세요" />
          <span id="errmsg_tel"></span>
        </div>
        <div class="form-group">
          <label for="code">인증코드</label>
          <input type="text" name="code" id="code" placeholder="6자리 인증코드" />
          <span id="errmsg_aucode"></span>
          <span class="svr_msg" id="svr_smg">${svr_msg }</span>
        </div>
        <button type="submit" id="joinBtn" class="btn">가입하기</button>
      </form>
    <footer>
      <a href="${contextPath}/">메인으로 돌아가기</a>
    </footer>
    </div>
  </div>
</body>

</html>