'use strict';

const $registerBtn = document.getElementById('registerBtn');

$registerBtn.addEventListener('click',registerHandler);

function registerHandler(evt){
	evt.preventDefault(); // submit 기본 이벤트 취소
	console.log('클릭')
	
	//유효성 통과시
	registerLectureForm.submit();
}


  // var cnt=0;
  // function fn_addFile(){
	//   if(cnt == 0){
	// 	  $("#d_file").append("<br>"+"<input  type='file' name='main_image' id='f_main_image' />");	  
	//   }else{
	// 	  $("#d_file").append("<br>"+"<input  type='file' name='detail_image"+cnt+"' />");
	//   }
  	
  // 	cnt++;
  // }
  
  
  // function fn_add_new_goods(obj){
	// 	 fileName = $('#f_main_image').val();
	// 	 if(fileName != null && fileName != undefined){
	// 		 obj.submit();
	// 	 }else{
	// 		 alert("메인 이미지는 반드시 첨부해야 합니다.");
	// 		 return;
	// 	 }
		 
	// }