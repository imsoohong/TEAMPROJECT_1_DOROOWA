<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var="contextPath" value="${pageContext.request.contextPath }" />   
    
    
    
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="${contextPath }/css/member/Member_Total.css">
  <link rel="stylesheet" href="${contextPath }/css/member/Two_Button.css">
  <script defer src="${contextPath }/js/member/outMemberForm.js"></script>
  <title>회원 탈퇴</title>
</head>

<body>

이게 탈퇴야 포지션 마크용 !!
  <div id="container">
    <div class="form-wrap">
      <h1>회원탈퇴</h1>
      <form id="outMemberForm" modelAttribute="memberVO" action="${contextPath }/member/outMember" method="post">
        <div class="form-group">
          <label for="memner_id">아이디</label>
          <input type="member_id" name="member_id" id="member_id" value="${sessionScope.member.member_id}" readonly="readonly" required />
        </div>
        <div class="form-group">
        	<sapn>회원 탈퇴 진행시 회원과 관련된 모든 정보(구매정보 및 예약정보등)가 삭제됩니다.<br>유료강의 구매가 있을 경우 탈퇴시 환불 또는 재가입 후 복구가 되지 않습니다.</sapn><br><br>
          <label for="pw">비밀번호</label>
          <input type="password" name="pw" id="pw" placeholder="비밀번호를 입력하세요"/>
        </div>
        <span id="errmsg_pw"></span>
        <div class="button-group">
        <button type="submit" id="outMemberBtn" class="btn">탈퇴하기</button>
        <button type="cancel" id="cancelBtn" class="btn">취소하기</button>
        </div>
      </form>
    </div>
  </div>

</body>
</html>