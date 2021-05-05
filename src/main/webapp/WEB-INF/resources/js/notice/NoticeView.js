'use strict';

const $writeBtn = document.getElementById('writeBtn');
const $modifyBtn = document.getElementById('modifyBtn');
const $mType = document.getElementById('mType');


/* 
관리자로 로그인 하면 글쓰기 버튼이 출력되고, 아닐시에,
출력이 되지 않습니다.
*/
//문서가 실행되면
window.onload=function(){
 console.log(nnum.value);
 console.log("window onload ");     
 $writeBtn.style.display = 'none';
 viewWriteBtn();
 
  

};
function viewWriteBtn(){
	if($mType.value == '관리자'){
		$writeBtn.style.display = 'inline-block';
	}
}

//글쓰기 버튼 클릭
writeBtn.addEventListener('click',evt=>{
	location.href = `/doroowa/notice/writeForm`;
})
//목록 버튼 클릭
listBtn.addEventListener('click',evt=>{
	location.href = `/doroowa/notice/`;
})
// 수정 버튼 클릭 (수정 폼으로 이동된다.)
const modifyBtn = document.getElementById('modifyBtn');
modifyBtn.addEventListener('click',evt=>{
	const nnum = document.getElementById('nnum');
	location.href = `/doroowa/notice/replyForm/${nnum.value}`;
	
})
//삭제버튼 클릭
const deleteBtn = document.getElementById('deleteBtn');
  deleteBtn.addEventListener('click',evt=>{
	console.log('삭제버튼클릭!');
	const nnum = document.getElementById('nnum');
  	//const nnum = evt.target.getAttribute('data-bnum');		
		//location.href = '/portfolio/board/delete/'+bnum;  
		location.href = `/doroowa/notice/delete/${nnum.value}`;  
  });



const $modal = document.querySelector('.modal');
//modal
$modal.addEventListener('show.bs.modal',evt=>{
  console.log('show');
  const word = evt.relatedTarget.textContent;
  document.querySelector('.modal .badge.bg-danger').textContent = word;
  document.querySelector('.modal .modal-body').textContent = 
    `${word} 하시겠습니까?`;
});


