'use strict';

const $writeBtn = document.getElementById('writeBtn');
const $mType = document.getElementById('mType');


/* 
관리자로 로그인 하면 글쓰기 버튼이 출력되고, 아닐시에,
출력이 되지 않습니다.
*/
//문서가 실행되면
window.onload=function(){
 console.log("window onload ");     
 $writeBtn.style.display = 'none';
 viewWriteBtn();
}
function viewWriteBtn(){
	if($mType.value == '관리자'){
		$writeBtn.style.display = 'inline-block';
	}
}

//글쓰기 버튼 클릭
writeBtn.addEventListener('click',evt=>{
	location.href = `/doroowa/notice/writeForm`;
})

//검색 버튼 클릭시
findBtn.addEventListener('click',evt=>{
	
	//검색어입력유무
	if(keyword.value.trim().length == 0){
		alert('검색어를 입력하세요');
		keyword.focus();
		keyword.select();
		return false;
	}
	
	location.href = `/doroowa/notice/1/${searchType.value}/${keyword.value}`;
});

//검색입력창 엔터키 눌렀을때
keyword.addEventListener('keydown',evt=>{
	console.log(evt.key);
	if(evt.key == 'Enter'){ //엔터키
		evt.preventDefault();
		//검색어입력유무
		if(evt.target.value.trim().length == 0){
			alert('검색어를 입력하세요');
			evt.target.focus();
			evt.target.select();
			return false;
		}
	
		location.href = `/doroowa/notice/1/${searchType.value}/${keyword.value}`;		

	}
});