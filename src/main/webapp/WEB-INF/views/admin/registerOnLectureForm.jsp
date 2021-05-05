<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var="contextPath" value="${pageContext.request.contextPath }" />  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 


<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
 <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script defer src="${contextPath }/js/lecture/registerLectureForm.js"></script>
<style>
    .tab_container{
        border: 1px solid black;
        margin: 2em;
        padding: 4em;
        padding-left: 5rem;
        padding-right: 15em;
        position:relative;
    }
    .form-control{
        display: inline-block;
        width: 40%;
    }
    .form-select{
        width: 40%;
    }
    .form-select:nth-child(3){
    	width:38%;
    }
    div{
        margin-top: 2em;
    }
    textarea{
        height: 250px;
    }
    #registerBtn{
 		position: absolute;
 		bottom:25px;
 		right:4%;
 		left:auto;
 	}
	@media screen and (max-width: 768px) { 
	.tab_container{
        padding-left: 5rem;
        padding-right: 5rem;
 	}
 	#registerBtn{
 		width: 100%;
 		position: static;
 		margin-top: 1rem;
 	}
	}
</style>
</head>
<body>

<form:form id="registerLectureForm" modelAttribute="lectureVO" 
action="${contextPath}/admin/registerOnLecture" enctype="multipart/form-data"
method="post">

    <div class="tab_container">
        <div class="tab_content" id="tab1">
                    <p>
                        강의종류
                        <select name="kinds" class="form-select" aria-label="Default select example" style="width: 150px;">
                            <option value="it" selected>IT
                            <option value="fitness">피트니스
                            <option value="fitness">창작
                            <option value="fitness">기타
                        </select>
                    </p>
                    <p>
                        강의이름
                    <input class="form-control"  name="lecture_title" type="text" style="width: 200px;" />
                    </p>
                    <p>
                        강사아이디
                    <input class="form-control"  name="member_id" type="text"  style="width: 200px;"   />
                    </p>
                    <p>
                        가격
                    <div class="input-group mb-3"  style="width: 235px; margin-top: -1em;" >
                    <input type="text" class="form-control"  name="price" type="text" size="20" aria-label="Amount (to the nearest dollar)">
                    <span class="input-group-text">원</span></div>
                    </p>
                    <p>
                        오픈일<br>
                        <br>
                    <input name="opendate"  type="date"   />
                    </p>
                </table>	
                    </div>
                <div class="input-group">
                    <span class="input-group-text">강사소개</span>
                    <textarea name="teacher_intro" class="form-control" aria-label="With textarea"></textarea>
                </div>
                <div class="input-group">
                    <span class="input-group-text">강의소개</span>
                    <textarea name="lecture_intro" class="form-control" aria-label="With textarea"></textarea>
                  </div>
                <div class="input-group mb-3">
                    <input type="file" name="file" class="form-control" placeholder="이미지 추가" aria-label="Recipient's username" aria-describedby="button-addon2">
                    <button class="btn btn-outline-secondary" type="button" id="button-addon2">파일찾기</button>
                </div>
    <input  type="button" class="btn btn-success" value="강의 등록" id="registerBtn">
    </div>
</form:form>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
</body>
</html>