<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var="contextPath" value="${pageContext.request.contextPath }" />   

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <link rel="stylesheet" href="main.css">
    <link rel="stylesheet" href="수강페이지.css">

</head>
<body>
  <div class="grid-container">
    <div class="header">
      <div class="logo"><a href="#"><img src="성현/캡처.PNG"></a></div>
      <div class="blank"></div>
      <div class="top">
        <div class="input-group mb-3">
          <input type="text" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2" id="search">
          <button class="btn btn-outline-secondary" type="button" id="button-addon2">검색</button>
        </div>
      <div class="right">
        <a href="#">로그인</a> |
        <a href="#">회원가입</a>
      </div>
      </div>
      <div class="bottom">
        <nav>
          <a href="#">온라인 강의</a>
          <a href="#">오프라인 강의</a>
          <a href="#">게시판</a>
          <a href="#">강사 지원</a>
        </nav>
      </div>
    </div>
    <div class="main">
        <div class="mybox">
            <div class="lecture">
                <p>강의내역</p>
                <p><a class="small" href="#">구매한 강의</a></p>
                <p><a class="small" href="#">예약한 강의</a></p>
                <p><a class="small" href="#">찜한 강의</a></p>
                <p><a class="small" href="#">알림</a></p>
            </div>
            <div class="privacy">
                <p>회원정보</p>
                <p><a class="small" href="#">회원수정</a></p>
                <p><a class="small" href="#">회원탈퇴</a></p>
            </div>
        </div>
        <div class="page">
          <div class="list">
            <div class="content">
               <img src="img/a1.jpg" alt="프로필">
               <div class="title">
                   <h4>가장 쉬운 JAVA</h4>
                 <div class="btn btn-primary">수강중</div>
               </div> 
            </div>
             <div class="progress">
               <div class="progress-bar" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
             </div>
         </div>
            <div class="list">
               <div class="content">
                  <img src="img/a1.jpg" alt="프로필">
                  <div class="title">
                      <h4>가장 쉬운 JAVA</h4>
                    <div class="btn btn-primary">수강중</div>
                  </div> 
               </div>
                <div class="progress">
                  <div class="progress-bar" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
            </div>
        </div>
    </div>
  </div>
  <div class="footer">
    <hr>
  </div>
</body>
</html>