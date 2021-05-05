<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var="contextPath" value="${pageContext.request.contextPath }" />   
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>회원 가입 선택</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css"
    integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous">
  	<link rel="stylesheet" href="${contextPath }/css/member/Member_Total.css">
  	<link rel="stylesheet" href="${contextPath }/css/member/Member_Footer.css">
  	<link rel="stylesheet" href="${contextPath }/css/member/Two_Select.css">
</head>

<body>
  <div id="container">
    <div class="form-wrap">
      <h1>회원 가입 선택</h1>
      <form>
        <div class="form-group">
          <button type="button" onclick="location.href='${contextPath}/teacher/joinForm' " >            
          <i class="fas fa-school fa-3x"></i>
            <p>강사</p>
            </button>
          <button type="button" onclick="location.href='${contextPath}/student/joinForm' " >            
          <i class="fas fa-user-graduate fa-3x"></i>
            <p>수강생</p>
            </button>
        </div>
        <footer>
          <a href="${contextPath}/">메인으로 돌아가기</a>
        </footer>
      </form>
    </div>
  </div>
</body>

</html>