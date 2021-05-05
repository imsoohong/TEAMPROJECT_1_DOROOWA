<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var="contextPath" value="${pageContext.request.contextPath }" />  
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>온라인 강의 결제페이지</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
  <link rel="stylesheet" href="${contextPath }/css/student/basket_sub.css">
  <link rel="stylesheet" href="${contextPath }/css/student/basket_total.css">
  <link rel="stylesheet" href="${contextPath }/css/mobile.css">
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css"
    integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous">
	<script defer src="${contextPath }/js/student/myBasket.js"></script>
</head>

<body>
  <div class="grid-container">

		<!--   header -->
		<%@ include file="/WEB-INF/views/include/header_new.jsp"%>

    <div class="main">
      <div class="main__payment">
        <div class="payment__process">
          <h4>결제 과정</h4>
        </div>
        <div class="payment__process">결제 -> 결제완료</div>
      </div>
      <div class="main__order">
        <div class="order__items">
          <div class="items__list">
          <input type="checkbox" class="allBtn" id="checkAll"/> 모두 선택
          <c:set var="total" value="0" />
          <c:forEach var="rec" items="${basketList }" >
          
            <div class="list__item">
            <input type="checkbox" name="title" data-title="${rec.lecture_title }"/>
              <div class="item__img">
                <img src="${contextPath }/img/thumbnail/${rec.lecture_title }.jpg" class="" alt="">
              </div>
              <div class="item__intro">
                <h4>${rec.lecture_title}</h4>
                <h5><i class="fas fa-user-alt"></i>${rec.teacher_nickname}</h5>
                <p> ${rec.lecture_intro}</p>
                <p>가격: ${rec.price }</p>
              </div>
            </div>
            <c:set var="total" value="${total + rec.price}"/>
           </c:forEach>

          </div>
        </div>
        <div class="container__order">
          <div class="order__box">
            <h4 id="allPrice">총 결제금액:<c:out value="${total}"/>원</h4>
            <button id="orderBtn" class="box-btn">결제하기</button>
          </div>
        </div>
      </div>
    </div>

  </div>
  <%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>

</html>