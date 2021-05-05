<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var="contextPath" value="${pageContext.request.contextPath }" />   
<c:set var="openYn" value="${openYn }"/>
<c:set var="videoCnt" value="${videoCnt }"/>
<!DOCTYPE html>
<html>
<script defer src="${contextPath }/js/video/view.js"></script>
<title>W3.CSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous">
<style>
    body{
        display: flex;
        text-align: center;
        margin: 0; padding: 0;
        over-flow: hidden;
    }
    .video{
    	margin: 0;
    	width: 100%;
    	height: 80%;
    }
    #myvideo{
        width: 100%; 
        height: 80%;
    }
    #mySidebar{
        display: none;
        flex-direction: column;
        z-index: 1;
        width: 30%;
        height: 100%;

    }

    #mySidebar a{
        all: unset;
        border-radius: 4px;
        margin: 2px;
        color: black;
        font-size: 1.2em;
    }
    
    .menu{
        background-color: #f1f3f5;
        height: 100vh;
        margin: 0;
        padding: 0.5em;
    }

    .menuBtn{
        all: unset;
        text-align: center;
        background-color: #00acee;
        color: white;
        width: 30px;
        height: 30px;
        border-radius: 4px;
        right: 0px;
    }
    .list__title{
        background-color: #DADADB;
        font-size: 1.2em;
    }
    .accordion-button{
    backgroun-color: #e7f1ff;
    }
    .accordion-body{
    display: flex;
    flex-direction: column;
    padding: 0;
    }
    
    .curriculum__text{
    	display: block;
    	width: 100%;
    	margin:0;
    	text-indent: 1em;
    	height: auto;
    	border-bottom: 1px solid rgb(234,234,234);
    }
    .curriculum__text:hover{
    	background-color: rgb(230,230,230);
    }
    .curriculum__text div{
    	padding-top: 1rem;
      padding-bottom: 1rem;
      text-align: left;
      position: relative;
    }
    .curriculum__text div i{
    	display:block;
    	position: absolute;
    	right: 1em;
    	top: 45%;
    	color: blue;
    }
    hr{
    	margin:0;
    }

</style>
<body>
<input type="hidden" name="member_id" id="member_id" value="${sessionScope.member.member_id }"/>
<input type="hidden" name="lecture_title" id="lecture_title" value="${videoVO.lecture_title }"/>
<input type="hidden" name="filename" id="filename" value="${videoVO.filename }"/>
<input type="hidden" name="lastVidYn" id="lastVidYn" value="${lastVidYn }"/>
<input type="hidden" name="success" id="success" value="${success }"/>
<input type="hidden" name="openYn" id="openYn" value="${openYn }"/>
${videoVO.lecture_title }
${videoVO.title }
	  <video id="myvideo" src="${contextPath }/video/${videoVO.filename }" controls="controls" data-vid="${videoVO.video_id }"></video>
		<div class="sidebar"  id="mySidebar">
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
  <button class="menuBtn" onclick="side_menu()"><i class="fas fa-bars"></i></button>
</div>
<!-- <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script> -->
<script>    
const menuBtn = document.querySelector('.menuBtn');
const sidebar = document.querySelector('#mySidebar');
const video = document.querySelector('#myvideo');
const currentVid = document.querySelector('#currentVid');


function side_menu(){
    if(sidebar.style.display === "none"){
        sidebar.style.display = "flex";
            }else{
                sidebar.style.display = "none";
            }
    currentVid.parentNode.style.backgroundColor = 'rgba(200,200,200, 0.3)';
}
// const lock = document.querySelector('.locked');
// const lockParent = lock.parentNode;
// lockParent.addEventListener('click', (evt)=>{
// 	  evt.preventDefault();
// })

const locks = document.querySelectorAll('.locked');
for(let i=0;i<locks.length;i++){
	var lockParent = locks[i].parentNode;
	lockParent.addEventListener('click', (evt)=>{
		  evt.preventDefault();
	})
}




</script>
</body>
</html> 
