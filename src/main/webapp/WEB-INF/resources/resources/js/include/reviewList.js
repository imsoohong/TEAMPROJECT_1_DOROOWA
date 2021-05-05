'use strict'
//강의 정보를 어떻게 효과적으로 받아오지 ??
const lecture_title = document.getElementById('lecture_title_ele').innerText;
let recNum = 1; 
const ReviewListTable = document.getElementById('ReviewListTable');
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
		.then(json => {console.log(json);handler2(json);})
}

//리뷰 리스트 랜더링 핸들러
function handler2(json){
	console.log(json);

	let reviewList = json.resultMessage.list;
	for(const rec of reviewList){
		var cnt = rec.rating;
		
		let div = document.createElement("div");
		div.setAttribute("class","list__item");
		
		
		let p = document.createElement("p");
		p.setAttribute("class","item__rating");
		for(let i=0;i<cnt;i++){
		p.innerHTML += `<i class="fas fa-star">`;
		}
		
		
		
		let p1 = document.createElement("p");
		p1.setAttribute("class","item__id");
		p1.textContent = rec.member_id
		let p2 = document.createElement("p");
		p2.textContent = rec.cdate
		p2.setAttribute("class","item__date");
		let p3 = document.createElement("p");
		p3.textContent = rec.rcontent
		p3.setAttribute("class","item__content");
		div.append(p);
		div.append(p1);
		div.append(p2);
		div.append(p3);
		ReviewListTable.append(div);
	}
	recNum += 1;
	}
	
