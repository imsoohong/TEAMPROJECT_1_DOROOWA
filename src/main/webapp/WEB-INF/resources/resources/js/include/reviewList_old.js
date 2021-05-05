'use strict'
//강의 정보를 어떻게 효과적으로 받아오지 ??
const lecture_title = document.getElementById('lecture_title_ele').innerText;
let recNum = 1; 

//let lecture_title = document.querySelector('.title').innerText;

//페이지 진입시 처음 5개의 리뷰목록 출력
reviewList(recNum);

//더 보기 버튼 클릭시 5개의 리뷰목록 추가 
moreReviewBtn.addEventListener('click',event => reviewList(recNum));

function reviewList(recNum){
	let url = `http://localhost:9080/doroowa/lecture/review/${lecture_title}/${recNum}`;
	console.log('강의 후기 더 보기 버튼 클릭');
	fetch(url,
			  {method:'GET', 
				 headers: {'Accept':'application/json'}
	}).then(response => response.json())
		.then(json => {
										console.log(json);
										handler2(json);
		})
}

//리뷰 리스트 랜더링 핸들러
function handler2(json){
	console.log(recNum);
	let reviewList = json.resultMessage.list;
	let listHTML = ' ';
	reviewList.forEach(item =>{
	listHTML += `<div class="item__review">`;	
	listHTML += `리뷰 아이디: ${item.review_id}<br>`;
	listHTML += `내용: ${item.rcontent}<br>`;
	listHTML += `멤버 아이디: ${item.member_id}<br>`;
	listHTML += `날짜: ${item.cdate}<br>`;
	listHTML += `</div>`
	});
	console.log(listHTML);
	ReviewListTable.innerHTML += listHTML;
	recNum += 1;
}