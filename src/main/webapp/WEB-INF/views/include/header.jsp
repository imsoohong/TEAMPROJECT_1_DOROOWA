<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
        <div class="header">
            <div class="logo"><a href="${contextPath }/"><img src="${contextPath }/img/doroowa.jpg" alt=""></a></div>
            <div class="blank"></div>
            <div class="top">
                <div class="input-group mb-3">
                    <input type="text" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2" id="search">
                    <button class="btn btn-outline-secondary" type="button" id="button-addon2">검색</button>
                  </div>
            <!-- 로그인 전 출력 -->
            <!-- 만약 세션이 멤버가 비워져 있다면 -->
            <c:if test="${empty sessionScope.member}">
            <div class="right">
                <a href="${contextPath }/member/loginForm">로그인</a> |
                <a href="${contextPath }/member/joinSelect">회원가입</a>
            </div>
            </c:if>
            <!-- 로그인 후 출력 -->
            <!-- 만약 세션이 안비워져 있으며 member.type의 값이 "수강생"일 경우 -->
            <c:if test="${'수강생' == sessionScope.member.type}">
            <div class="right">
                <a href="${contextPath }/student/myPage">${sessionScope.member.nickname}</a> |
                <a href="${contextPath }/logout">로그아웃</a>
            </div>
            </c:if>
            <!-- 로그인 후 출력 -->
            <!-- 만약 세션이 안비워져 있으며 member.type의 값이 "강사"일 경우 -->
            <c:if test="${'강사' == sessionScope.member.type}">
            <div class="right">
                <a href="${contextPath }/teacher/myPage">${sessionScope.member.nickname}</a> |
                <a href="${contextPath }/logout">로그아웃</a>
            </div>
            </c:if>
            <!-- 로그인 후 출력 -->
            <!-- 만약 세션이 안비워져 있으며 member.type의 값이 "강사"일 경우 -->
            <c:if test="${'관리자' == sessionScope.member.type}">
            <div class="right">
                <a href="${contextPath }/admin/myPage">${sessionScope.member.nickname}</a> |
                <a href="${contextPath }/logout">로그아웃</a>
            </div>
            </c:if>
              </div>
            <c:choose>
							<c:when test="${'관리자' == sessionScope.member.type}">
            <div class="bottom">
                <nav>
                    <a href="${contextPath }/lecture/online">온라인 강의</a>
                    <a href="#">오프라인 강의</a>
                    <a href="#">게시판</a>
                    <a href="#" class="bottom_tooltip">강의 개설</a>
                </nav>
            </div>
            	</c:when>
							<c:otherwise>
            <div class="bottom">
                <nav>
                    <a href="${contextPath }/lecture/online">온라인 강의</a>
                    <a href="#">오프라인 강의</a>
                    <a href="#">게시판</a>
                    <a href="${contextPath }/lecture/applyForm">강사 지원</a>
                </nav>
            </div>
            	</c:otherwise>
            	
            	
           </c:choose>
        </div>

