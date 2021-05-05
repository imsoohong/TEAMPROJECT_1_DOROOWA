<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 목록</title>
</head>
<body>
	<h3>회원 전체 목록</h3>
	<hr />
	<table border="1">
		<thead>
			<tr>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>전화번호</th>
				<th>별칭</th>
				<th>성별</th>
				<th>지역</th>
				<th>생년월일</th>
				<th>가입일</th>
				<th>수정일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="rec" items="${memberList }">
			<tr>
				<td>${rec.id }</td>
				<td>${rec.pw }</td>
				<td>${rec.tel }</td>
				<td>${rec.nickname }</td>
				<td>${rec.gender }</td>
				<td>${rec.region }</td>
				<td>${rec.birth }</td>
				<td>${rec.cdate }</td>
				<td>${rec.udate }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>







