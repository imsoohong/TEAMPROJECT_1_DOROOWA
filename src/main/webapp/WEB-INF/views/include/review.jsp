<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.list__item {
	margin-bottom: 16px;
	border: none;
	border-radius: 8px;
	background-color: #f4f4f4;
	padding: 8px 16px;
}

.item__id {
	font-weight: 600;
	font-size: 14px;
	margin: 0;
}

.item__date {
	font-weight: 600;
	font-size: 13px;
	color: #999999;
	margin: 0 0 8px;
}

.item__content {
	font-size: 15px;
}
</style>
<div id="oldList"></div>
<div id="ReviewListTable">

</div>

<input type="hidden" id="current_id" value="${sessionScope.member.member_id }"/>

<c:if test="${reviewCnt != 0 }">
<button id="moreReviewBtn"
	class="btn btn-outline-primary btn-block col-sm-10 mx-auto">더
	보기</button>
</c:if>
<c:if test="${reviewCnt == 0 }">
작성된 후기가 없습니다.
</c:if>