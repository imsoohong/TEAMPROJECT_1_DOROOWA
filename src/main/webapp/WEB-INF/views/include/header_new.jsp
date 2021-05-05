<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!-- 폰트 어썸 -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.2/css/all.css"
	integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu"
	crossorigin="anonymous">
	
	
	<!-- 헤더 CSS -->
<link rel="stylesheet" href="${contextPath }/css/header.css">
	<link rel="icon" type="img/png" href="${contextPath }/img/favicon.png"> 

<!-- 헤더 -->
<div class="header">

	<span class="openmenu" onclick='openNav()'><i class="fas fa-bars"></i></span>
	<div id="mysidenav" class="sidenav">
		<a href="#" class="closebtn" onclick='closeNav()'><i class="fas fa-times"></i></a>
		<a href="${contextPath }/lecture/online/">온라인</a>
		<a href="${contextPath }/offlinelectures/list/전체">오프라인</a>
		<a href="${contextPath }/notice/">공지사항</a>
		<a href="${contextPath }/notice/event">이벤트</a>
<c:choose>
		<c:when test="${'관리자' == sessionScope.member.type}">
				<a href="#" class="mobile__drop">강의개설</a>
				<div class="mobile__nav__new">
					<div><a href="${contextPath}/admin/registerOnLectureForm" class="">온라인</a></div>
					<div><a href="${contextPath}/admin/registerOffLectureForm" class="">오프라인</a></div>
				</div>
		</c:when>
		<c:otherwise>
				<a href="${contextPath }/lecture/applyForm">강사지원</a>
		</c:otherwise>
	</c:choose>
		<!-- 로그인 전 출력 -->
		<!-- 만약 세션이 멤버가 비워져 있다면 -->
		<c:if test="${empty sessionScope.member}">
					<div class="member__con">
						<div><a href="${contextPath }/member/loginForm"><i class="fas fa-sign-in-alt"></i></a></div>
						<div><a href="${contextPath }/member/joinSelect"><i class="fas fa-user-plus"></i></a></div>
					</div>
		</c:if>
		
				<!-- 로그인 후 출력 -->
		<!-- 만약 세션이 안비워져 있으며 member.type의 값이 "수강생"일 경우 -->
		<c:if test="${'수강생' == sessionScope.member.type}">
							<div class="member__con">
					<div><a href="${contextPath }/student/myPage"><i
							class="far fa-user"></i></a></div>
					<div><a href="${contextPath }/student/myBasket"><i
							class="fas fa-shopping-cart"></i></a></div>
					<div><a href="${contextPath }/logout"><i
							class="fas fa-sign-out-alt"></i></a></div>
							</div>
		</c:if>
		<!-- 만약 세션이 안비워져 있으며 member.type의 값이 "강사"일 경우 -->
		<c:if test="${'강사' == sessionScope.member.type}">
							<div class="member__con">
					<div><a href="${contextPath }/teacher/studio"><i
							class="far fa-user"></i></a></div>
					<div><a href="${contextPath }/logout"><i
							class="fas fa-sign-out-alt"></i></a></div>
							</div>
		</c:if>
				<!-- 만약 세션이 안비워져 있으며 member.type의 값이 "관리자"일 경우 -->
		<c:if test="${'관리자' == sessionScope.member.type}">
							<div class="member__con">
				<div><a href="${contextPath }/admin/myPage"><i class="far fa-user"></i></a></div>
				| <div><a href="${contextPath }/logout"><i
					class="fas fa-sign-out-alt"></i></a></div>
					</div>
		</c:if>
	</div>




	<div class="header__wrapper">
		<div class="header__left">
			<a class="logo" href="${contextPath }/">DOROOWA</a>
		</div>
		
		
		
					<div class="header__center">
			<ul class="center__menu">
				<li><a href="${contextPath }/lecture/online/">온라인</a></li>
				<li><a href="${contextPath }/offlinelectures/list/전체">오프라인</a></li>
				<li><a href="${contextPath }/notice/">공지사항</a></li>
				<li><a href="${contextPath }/notice/event">이벤트</a></li>
			<c:choose>
		<c:when test="${'관리자' == sessionScope.member.type}">
				<li><a href="#" class="bottom_tooltip">강의개설</a></li>
		</c:when>
		<c:when test="${'강사' == sessionScope.member.type}">
				<li><a href="${contextPath }/lecture/applyForm">강의개설</a></li>
		</c:when>
		<c:otherwise>
				<li><a href="${contextPath }/lecture/applyForm">강사지원</a></li>
		</c:otherwise>
	</c:choose>
			</ul>
		</div>
					

			<div class="header__right">
				<ul class="right__menu">
		<!-- 로그인 전 출력 -->
		<!-- 만약 세션이 멤버가 비워져 있다면 -->
		<c:if test="${empty sessionScope.member}">
					<li><a href="${contextPath }/member/loginForm"><i class="fas fa-sign-in-alt"></i></a></li>
					<li><a href="${contextPath }/member/joinSelect"><i class="fas fa-user-plus"></i></a></li>
		</c:if>
		
				<!-- 로그인 후 출력 -->
		<!-- 만약 세션이 안비워져 있으며 member.type의 값이 "수강생"일 경우 -->
		<c:if test="${'수강생' == sessionScope.member.type}">
					<li><a href="${contextPath }/student/myPage"><i
							class="far fa-user"></i></a></li>
					<li><a href="${contextPath }/student/myBasket"><i
							class="fas fa-shopping-cart"></i></a></li>
					<li><a href="${contextPath }/logout"><i
							class="fas fa-sign-out-alt"></i></a></li>
		</c:if>
		<!-- 만약 세션이 안비워져 있으며 member.type의 값이 "강사"일 경우 -->
		<c:if test="${'강사' == sessionScope.member.type}">
					<li><a href="${contextPath }/teacher/studio"><i
							class="far fa-user"></i></a></li>
					<li><a href="${contextPath }/logout"><i
							class="fas fa-sign-out-alt"></i></a></li>
		</c:if>
				<!-- 만약 세션이 안비워져 있으며 member.type의 값이 "관리자"일 경우 -->
		<c:if test="${'관리자' == sessionScope.member.type}">
				<li><a href="${contextPath }/admin/myPage"><i class="far fa-user"></i></a></li>
				| <li><a href="${contextPath }/logout"><i
					class="fas fa-sign-out-alt"></i></a></li>
		</c:if>
				</ul>
			</div>


	</div>
	
	
	
	

</div>



<script>
const openMenu = document.querySelector('.openmenu');
const mySideNav = document.getElementById('mysidenav');
const mobileNav = document.querySelector('.mobile__nav__new');
const mobileDrop = document.querySelector('.mobile__drop');
function openNav() {
	mySideNav.style.width = '250px';
}
function closeNav() {
	mySideNav.style.width = '0';
}
mobileDrop.addEventListener('click', ()=>{
	if(mobileNav.style.display='none'){
		mobileNav.style.display='block';
	} else {
		mobileNav.style.display='none';
	}
})
</script>




<%--  <div class="header">
	<div class="header__logo">
		<a href="${contextPath }/"><img
			src="${contextPath }/img/doroowa.jpg"></a>
	</div>
	<div class="header__top">
		<div class="input-group mb-3">
			<input type="text" class="form-control"
				aria-label="Recipient's username" aria-describedby="button-addon2"
				id="search">
			<button class="btn btn-outline-secondary" type="button"
				id="button-addon2">검색</button>
		</div>
		<!-- 로그인 전 출력 -->
		<!-- 만약 세션이 멤버가 비워져 있다면 -->
		<c:if test="${empty sessionScope.member}">
			<div class="header__right">
				<a href="${contextPath }/member/loginForm">로그인</a> | <a
					href="${contextPath }/member/joinSelect">회원가입</a>
			</div>
		</c:if>
		<!-- 로그인 후 출력 -->
		<!-- 만약 세션이 안비워져 있으며 member.type의 값이 "수강생"일 경우 -->
		<c:if test="${'수강생' == sessionScope.member.type}">
			<div class="header__right">
				<a href="${contextPath }/student/myPage"><i class="far fa-user"></i></a><a
					href="${contextPath }/student/myBasket"><i
					class="fas fa-shopping-cart"></i></a><a href="${contextPath }/logout"><i
					class="fas fa-sign-out-alt"></i></a>
			</div>
		</c:if>
		<!-- 만약 세션이 안비워져 있으며 member.type의 값이 "강사"일 경우 -->
		<c:if test="${'강사' == sessionScope.member.type}">
			<div class="header__right">
				<a href="${contextPath }/teacher/myPage"><i class="far fa-user"></i></a>
				| <a href="${contextPath }/logout"><i
					class="fas fa-sign-out-alt"></i></a>
			</div>
		</c:if>
		<!-- 만약 세션이 안비워져 있으며 member.type의 값이 "관리자"일 경우 -->
		<c:if test="${'관리자' == sessionScope.member.type}">
			<div class="header__right">
				<a href="${contextPath }/admin/myPage"><i class="far fa-user"></i></a>
				| <a href="${contextPath }/logout"><i
					class="fas fa-sign-out-alt"></i></a>
			</div>
		</c:if>
	</div>
	<c:choose>
		<c:when test="${'관리자' == sessionScope.member.type}">
			<div class="header__bottom">
				<nav>
					<a href="${contextPath }/lecture/online">온라인 강의</a> <a href="#">오프라인
						강의</a> <a href="#">게시판</a> <a href="#" class="bottom_tooltip">강의
						개설</a>
				</nav>
			</div>
		</c:when>
		<c:otherwise>
			<div class="header__bottom">
				<nav>
					<a href="${contextPath }/lecture/online">온라인 강의</a> <a href="#">오프라인
						강의</a> <a href="#">게시판</a> <a href="${contextPath }/lecture/applyForm"
						class="">강사 지원</a>
				</nav>
			</div>
		</c:otherwise>
	</c:choose>
</div>  --%>

