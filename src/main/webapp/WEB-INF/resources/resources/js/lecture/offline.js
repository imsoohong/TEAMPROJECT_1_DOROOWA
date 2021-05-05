'use strict'
/*
const $viewBtn = document.querySelector(".viewBtn");
const $reserveBtn = document.querySelector(".reserveBtn");

const viewBtnValue = document.querySelector(".viewBtn").value;
const reserveBtnValue = document.querySelector(".reserveBtn").value;

$viewBtn.addEventListener('click', evt => {
	console.log("강의 상세 버튼 클릭 됨");
	console.log(viewBtnValue);
	location.href=`/doroowa/offlinelectures/view/${viewBtnValue}`;
});

$reserveBtn.addEventListener('click', evt => {
	console.log("바로 예약 버튼 클릭 됨")
	console.log(reserveBtnValue);
	loaction.href=`/doroowa/offlinelectures/view/${reserveBtnValue}`;
});
*/
const listset = document.getElementById("listset");
const lectures = document.querySelector(".lecture");

function handler(json) {
	lectures.textContent = "";
	if(json.length>0){
		
	let $listHTML = '';
	for(const rec of json){
		$listHTML += `<a href="/doroowa/lecture/${rec.lecture_title}/detail" class="lecture__list">`
    $listHTML += `  <div class="list__img">`
    $listHTML += `<img src="/doroowa/img/xxx.jpg">`
    $listHTML += `</div>`
    $listHTML += `  <div class="list__content">`
    $listHTML += `  <h4>${rec.lecture_title }</h4>`
    $listHTML += `  <h6 class="content__count">`
    $listHTML += `  <span>현재 인원 ${rec.count}명</span> / <span>정원 ${rec.amount }명</span>`
    $listHTML += `  </h6>`
    $listHTML += `  <h6 class="content__location">`
    $listHTML += `  <span>강의 장소</span> : <span>${rec.location } </span>`
    $listHTML += `  </h6>`
    $listHTML += `  </div>`
    $listHTML += `  <div class="content__reserve">`
    $listHTML += `<div class="reserve__price">`
    $listHTML += `<h5 class="price">가격 ${rec.price }</h5>`
    $listHTML += `<h6 class="reserve__wrapper">`

if(`${rec.amount == rec.count}` == 'true'){
    $listHTML += `<button class="end__wrapper-btn" onclick="location.href='#' ">마감</button>`
   // $listHTML += `${rec.amount}, ${rec.count}, ${rec.amount == rec.count}`
	
}else{
    $listHTML += `<button class="reserve__wrapper-btn" onclick="location.href='#' ">예약하기</button>`
	
}

  //  $listHTML += `<c:if test="${rec.amount == rec.count}">` 
  //  $listHTML += `</c:if>`
  //  $listHTML += `<c:if test="${rec.amount != rec.count}">`
  //  $listHTML += `</c:if>`
    $listHTML += `</h6>`
    $listHTML += `</div>`
    $listHTML += `</div>`
    $listHTML += `</a>`};
	lectures.innerHTML = $listHTML;
		
		
		
/*		let div = document.createElement("div");
		div.setAttribute("class","sideRight");
		let inner = document.createElement("div");
		inner.setAttribute("class","title");
		inner.textContent = rec.lecture_title;
		div.append(inner);
		lectures.append(div);*/
	}

};


listset.addEventListener("change",()=>geet());

 function geet(){
	
			let location = listset.dataset.location;
			let option = listset.value;

			console.log(location);
			console.log(option);
      let url =`/doroowa/offlinelectures/list/${location}/${option}`;

      fetch(url,{method:'GET',headers:{accept:'application/json'}
    }).then(response=>response.json()).then(json=>handler(json)).catch(error=>console.log(error))
    
}


