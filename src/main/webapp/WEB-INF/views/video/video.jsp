<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var="contextPath" value="${pageContext.request.contextPath }" />   
<c:set var="openYn" value="${openYn }"/>
<c:set var="videoCnt" value="${videoCnt }"/>
<!DOCTYPE html>
<html>
<script defer src="${contextPath }/js/video/view.js"></script>
<title>${lectureVO.lecture_title }</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous">
<link rel="stylesheet" href="${contextPath }/css/video/video.css">
<body>
<input type="hidden" name="member_id" id="member_id" value="${sessionScope.member.member_id }"/>
<input type="hidden" name="lecture_title" id="lecture_title" value="${videoVO.lecture_title }"/>
<input type="hidden" name="filename" id="filename" value="${videoVO.filename }"/>
<input type="hidden" name="lastVidYn" id="lastVidYn" value="${lastVidYn }"/>
<input type="hidden" name="success" id="success" value="${success }"/>
<input type="hidden" name="openYn" id="openYn" value="${openYn }"/>

	  <video id="myvideo" src="${contextPath }/video/${videoVO.filename }" controls="controls" data-vid="${videoVO.video_id }"></video>
	<div id="mysidenav" class="sidenav">
			<a href="#" class="closebtn" onclick='closeNav()'><i class="fas fa-times"></i></a>
    <div class="lecInfo">
        <h3>${videoVO.lecture_title }</h3>
        <div class="lec_description">
            수강기한 : 무제한<br>
            진도율 : ${progressCnt }강 / ${videoCnt}강 (${Math.floor(progressCnt/videoCnt*100)}%) | 시간: 0분/585분
            <progress value="${Math.floor(progressCnt/videoCnt*100)}"  max="100"></progress>
        </div>
    </div>
  


			
							<div class="list">
		<%@ include file="/WEB-INF/views/lecture/videoList.jsp"%>				
</div>

		
  
</div>

<!-- Page Content -->
<div class="menu">
	<span class="openmenu" onclick='openNav()'><i class="fas fa-bars"></i></span>
</div>
<!-- <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script> -->
<script>    
const openMenu = document.querySelector('.openmenu');
const mySideNav = document.getElementById('mysidenav');
const menu = document.querySelector('.menu');
const video = documnet.querySector('#myvideo');
function openNav() {
	mySideNav.style.width = '400px';
	menu.style.display ='none';
	video.style.marginRight = '400px';
}
function closeNav() {
	mySideNav.style.width = '0';
	menu.style.display ='block';
	video.style.marginRight = '0px';
}
mobileDrop.addEventListener('click', ()=>{
	if(mobileNav.style.display='none'){
		mobileNav.style.display='block';
	} else {
		mobileNav.style.display='none';
	}
})
// const lock = document.querySelector('.locked');
// const lockParent = lock.parentNode;
// lockParent.addEventListener('click', (evt)=>{
// 	  evt.preventDefault();
// })

// const locks = document.querySelectorAll('.locked');
// for(let i=0;i<locks.length;i++){
// // 	var lockParent = locks[i].parentNode.parentNode;
// // 	lockParent.removeAttribute('href');
// locks.parentNode.parentNode.removeAttribute("href");
// // 	lockParent.addEventListener('click', (evt)=>{
// // 		log.info("클릭됨");
// // 		  evt.preventDefault();
// // 	})
// }




</script>
</body>
</html> 
