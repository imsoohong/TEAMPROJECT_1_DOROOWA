<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
<title>구매이력</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${contextPath }/css/student/student_Total.css">
<link rel="stylesheet"
	href="${contextPath }/css/student/student_Sub.css">
<link rel="stylesheet" href="${contextPath }/css/student/myOrders.css">
<link rel="stylesheet" href="${contextPath }/css/header.css">
<link rel="stylesheet" href="${contextPath }/css/footer.css">
<script defer src="${contextPath }/js/student/myOrders.js"></script>
<script defer src="${contextPath }/js/common/ajax.js"></script>


</head>

<body>
	<div class="grid-container">
		<!--   header -->
		<%@ include file="/WEB-INF/views/include/header_new.jsp"%>
		<!--   main -->
		<div class="main">
<%@ include file="/WEB-INF/views/student/include/mybox.jsp"%>
			<div class="page">
				<table class="table table-striped">
					<thead>
						<th>번호</th>
						<th>날짜</th>
						<th>상태</th>
						<th colspan="3">강의명</th>
						<th>금액</th>
						<th class="none">환불여부</th>
						<tr></tr>
					</thead>
					<tbody>
						<c:forEach var="rec" items="${orderList }">
							<tr>
								<td>${rec.order_id }</td>
								<td>${rec.udate }</td>
								<td>${rec.status }</td>
								<td colspan="3">${rec.lecture_title }</td>
								<td>${rec.lectureVO.price }</td>
								<td class="none">
<%-- 								<c:if test="${rec.studydate eq null && rec.status eq '구매완료'}"> --%>
<!-- 										<button onclick="refund(this)" class="btn btn-primary refund">환불하기</button> -->
<%-- 									</c:if> --%>
									<c:choose>
									<c:when test="${rec.studydate eq null && rec.status eq '구매완료'}">
									<button onclick="refund(this)" class="btn btn-primary refund">환불하기</button>
									</c:when>
									<c:when test="${rec.studydate eq null && rec.status eq '구매취소'}">
									<span style="color:red;">환불완료</span>
									</c:when>
									<c:otherwise>
									<span style="color:grey;">환불불가</span>
									</c:otherwise>
									</c:choose>
									</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<!-- footer -->
	</div>
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>

</html>