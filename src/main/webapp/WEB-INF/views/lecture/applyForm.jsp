<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var="contextPath" value="${pageContext.request.contextPath }" />   


<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script defer type="module" src="${contextPath }/js/lecture/applyForm.js"></script>
  <script defer src="${contextPath }/js/common/ajax.js"></script>
  
  <title>Document</title>
  <style>
    @font-face {
        font-family: 'NanumSquareRound';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }
    body{
      display: flex;
      justify-content: center;
      font-family: 'NanumSquareRound';
    }
    legend{text-align: center;}
    fieldset{
      display: flex;
      flex-direction: column;
      padding: 5em;
      width: 50%;
    }
    .category{
      display: flex;
      flex-direction: column;
    }
    .underline{
      font-size: 1.5em;
      width: 20%;
      BORDER-BOTTOM: teal 1px solid;
      BORDER-LEFT: medium none;
      BORDER-RIGHT: medium none;
      BORDER-TOP: medium none;
    }
    .underline:focus{
      outline: none;
    }
    textarea{
      width: 20%;
    }
    textarea:focus{
      width: 50%;
      transition: 0.5s;
    }
    #etctext{
      font-size: 1em;
    }
    .sub{
      margin-top: 2em;
      width: 100%;
      display: flex;
      justify-content: center;
      
    }
    #submit{
      width: 5em;
      background-color: white;
      border: 1px solid black;
    }
    span{
      color: red;
    }
  </style>
</head>
<body>
  <fieldset>
    <legend>강의 개설 신청 폼</legend>
    <h3><span>*</span> 성함</h3>
    <input type="text" class="underline" id="name">
    <br>
    <h3><span>*</span> 연락처</h3>
    <input type="text" class="underline" id="tel">
    <br>
    <div class="category">
      <h3><span>*</span> 희망 카테고리</h3>
      <label for="category"><input type="radio" name="category" id="category" value="IT">IT</label>
      <label for="category"><input type="radio" name="category" id="category" value="피트니스">피트니스</label>
      <label for="category"><input type="radio" name="category" id="category" value="창작">창작</label>
      <label for="category"><input type="radio" name="category" id="category" value="기타">기타</label>
      <br>
      <input type="text" class="underline" name="etctext" placeholder="기타 입력" id="etctext">
    </div>
    <br>
    <h3>강의 이름</h3>
    <input type="text" class="underline" id="title">
    <br>
    <h3>희망 가격</h3>
    <input type="text" class="underline" id="price">
    <br>
    <h3><span>*</span> 강의 소개</h3>
    <textarea name="" id="description" cols="30" rows="10"></textarea>
    <div class="sub"><button id="applyBtn">제출</button></div>
  </fieldset>
</body>
</html>