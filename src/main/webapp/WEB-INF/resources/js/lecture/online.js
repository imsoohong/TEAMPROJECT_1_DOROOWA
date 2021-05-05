'use strict';
//버튼, 정렬 선택하면 편의성으로 메시지 제공하는 기능
let search_msg = document.getElementById('search_msg');

//백업용 코드
//location.href = `/Doroowa/lecture/online/${lType}/${sType}`;

//const lType = selectType.dataset.type;
//selectType.dataset.type = lType;
//console.log(selectType.dataset.type);
//location.href = `/Doroowa/lecture/online/${selectType.value}`;

//전역변수 선언
var lType; //강의타입
var a;     //실험용
var sType; //분류타입

//버튼 클릭시 버튼에 색이 주입되는 용도의 '전역변수'
 

//강의목록
let allLecture = document.getElementById('allLecture');

//강의 목록이 비어있을경우 메시지
const undefined_msg = document.getElementById('undefined_msg');

//문서가 실행되면
window.onload=function(){
 console.log("window onload ");
 //강의 목록 버튼을 누르지 않고 검색할 경우 메시지를 띄움.     
 if(allLecture.textContent.trim().length == 0){
	undefined_msg.textContent = '강의 버튼을 누른후 검색해주세요.';
	}else{
		undefined_msg.textContent = '';
	}


}

//메뉴 (최신순, 인기순, 별점순)
const $selectType = document.getElementById('selectType');
$selectType.addEventListener('change', evt =>{
	if(selectType.value == 'late'){ 
		console.log('최신순선택!');
		sType = 'late';
	}
	if(selectType.value == 'pop'){
		console.log('인기순선택!');
		sType = 'pop';
		
	}
	if(selectType.value == 'star'){
		console.log('별점순선택!');
		sType = 'star';
	}
});

/* 돋보기(검색버튼) */
const $search = document.querySelector('.fa-search')
$search.addEventListener('click',evt=>{
	//location.href = `/Doroowa/lecture/online/${lType}/${selectType.value}`;
	location.href = `/doroowa/lecture/online/${sType}`;
	if(lType != 'all'){
		location.href = `/doroowa/lecture/online/${lType}/${sType}`;
	}
	
})


/* 전체 강의 목록*/
const allBtn = document.getElementById('allBtn');
allBtn.addEventListener('click',evt=>{
	console.log(evt.target.value);
	console.log(lType);
	lType = evt.target.value;
	selectType.dataset.type = lType;
	//allBtn.style.backgroundColor = 'blue';
	//location.href = `/Doroowa/lecture/online/${lType}/${selectType.value}`;
	search_msg.textContent = '전체 목록 선택 (돋보기 버튼 클릭시 검색)';
	
});

/* it 강의 목록*/
itBtn.addEventListener('click',evt=>{
	lType = evt.target.value;
	selectType.dataset.type = lType;
	//location.href = `/Doroowa/lecture/online/${lType}/${selectType.value}`;
	search_msg.textContent = 'IT 목록 선택 (돋보기 버튼 클릭시 검색)';
});
/*financeLecture 강의 목록*/
financeBtn.addEventListener('click',evt=>{
	lType = evt.target.value;
	selectType.dataset.type = lType;
	//location.href = `/Doroowa/lecture/online/${lType}/${selectType.value}`;
	search_msg.textContent = '금융 목록 선택 (돋보기 버튼 클릭시 검색)';
});
/*fitness 강의 목록*/
fitnessBtn.addEventListener('click',evt=>{
	lType = evt.target.value;
	selectType.dataset.type = lType;
	//location.href = `/Doroowa/lecture/online/${lType}/${selectType.value}`;
	search_msg.textContent = '피트니스 목록 선택 (돋보기 버튼 클릭시 검색)';
});

/*creation 강의 목록*/
creationBtn.addEventListener('click',evt=>{
	lType = evt.target.value;
	selectType.dataset.type = lType;
	//location.href = `/Doroowa/lecture/online/${lType}/${selectType.value}`;
	search_msg.textContent = '창작 목록 선택 (돋보기 버튼 클릭시 검색)';
});

/*확인용 */
/*
check.addEventListener('click',evt=>{
	console.log("lType 확인용=>"+lType);
	a = a + 1;
})
check2.addEventListener('click',evt=>{
	console.log("data-type 확인용=>"+selectType.dataset.type);
})
*/



