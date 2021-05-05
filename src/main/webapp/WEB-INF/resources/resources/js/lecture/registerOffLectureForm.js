'use strict';

const $roadAddrBtn = document.getElementById("roadAddrBtn");
$roadAddrBtn.addEventListener("click",()=>{
	window.open("http://localhost:9080/doroowa/test/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes");
})
function jusoCallBack(a){
	document.getElementById('address').value = a;

}



const $registerBtn = document.getElementById('registerBtn');

$registerBtn.addEventListener('click',registerHandler);

function registerHandler(evt){
	evt.preventDefault(); // submit 기본 이벤트 취소
	console.log('클릭')
	
	//유효성 통과시
	registerLectureForm.submit();
}
