'use strict'
const $name = document.querySelector("#name");

//비밀번호 입력시 ajax를 통하여 비밀번호 검증
let checkPw = false;
console.log(checkPw);
pw.addEventListener('blur',()=>checkPassword());


	function checkPassword(){
	let pwvalue=pw.value;
	console.log("비밀번호 변경 감지");

	const url = `http://localhost:9080/doroowa/member/checkPw?pw=${pwvalue}`;
		  
	fetch(url,{method:'GET',headers: { 'Accept' : 'application/json'}})
	.then(result => result.json())
	.then(json => {console.log("비밀번호 확인"+json);pwchkhandler(json);})
	}

	//비밀번호 검증 후 결과 메세지 출력 함수
	
	function pwchkhandler(json){
		if(json){
			checkPw = true;
		}else{
			console.log("이건 비밀번호가 false일때 후처리");
			checkPw = false;
		}
	}






//도로명 주소 검색 후 주소입력
region.addEventListener("click",()=>{
	console.log("주소창 클릭됨");
	window.open("http://localhost:9080/doroowa/test/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes");
})

//도로명 주소값 검색 후 주소를 부모창에 반환하는 함수
function jusoCallBack(a){
	document.getElementById('region').value = a;

}

//수정 버튼
modifyBtn.addEventListener('click',memberModify);

//수정 버튼 클릭시 유효성 검증 시작 
function memberModify(evt){
	evt.preventDefault();
	console.log("회원 정보 수정 버튼 클릭함");

	if(!validationChk()){
		return
	}
	modifyForm.submit();
}

//취소 버튼 클릭
cancelBtn.addEventListener('click',evt=>{
	console.log('취소버튼 클릭함');
	location.href='http://localhost:9080/doroowa/student/myPage';
})

// 유효성 검증에 관한 함수
function validationChk(){
	
	// 별명 입력 확인
	if(nickname.value.length == 0){
		errmsg_nickname.textContent = '별명을 입력하세요';
		nickname.focus();
		nickname.select();
		console.log("별명 공백 오류 발생");
		return false;
	}else{
		errmsg_nickname.textContent = '';
	}
	
	
	// 주소 입력 확인
	if(region.value.length == 0){
		errmsg_addr.textContent = '주소를 검색하세요';
		console.log("주소 공백 오류 발생");
		return false;
	}else{
		errmsg_addr.textContent = '';
	}
	
	
	// 전화번호 유효성 체크
	if(!isTel(tel.value)){
		errmsg_tel.textContent = '하이픈(-)을 포함하여 입력하세요 ex) 000-1111-2222';
		tel.focus();
		tel.select();
		console.log("전화번호 유효성 오류 발생");
		return false;
	}else{
		errmsg_tel.textContent = '';
	}
	
		// 비밀번호 입력 확인
	if(pw.value.length == 0){
		alert("회원 정보를 수정하려면 비밀번호를 입력하세요.")
		pw.focus();
		pw.select();
		console.log("비밀번호 공백 오류 발생");
		return false;
	}

	if(checkPw){
		console.log("비밀번호 일치");
		errmsg_pw.textContent ='';
		
	}else{
		errmsg_pw.textContent ='비밀번호가 일치하지 않습니다';
		return false;
	}

/*	
	if(checkPassword().json){
		
		console.log("값이뭐니?"+checkPassword().result())
	}else{
		console.log('비밀번호 불일치')
		console.log("값이뭐니?"+checkPassword().result())
		return false;
	}
*/
	
	return true;
}


// 이메일 체크
function isEmail(email){
  const emailPattern = /^[\w]([-_\.]?[\w])*@[\w]([-_\.]?[\w])*\.[a-zA-Z]{2,3}$/;
  return emailPattern.test(email);
}
// 비밀번호 유효성 체크
function isPassword(password){
	const passwdPattern = /^[\w]{4,10}$/; // /^[A-Za-z0-9]{4,10}$/
  return passwdPattern.test(password); 
}

//전화번호체크
function isTel(tel){
  const telPattern = /^\d{3}-\d{3,4}-\d{4}$/;
  return telPattern.test(tel); 
}






/*
//비밀번호 재확인 체크
function isPassword(pw1,pw2){
	let boolean = null;
	if(pw1 == pw2){
		boolean = false;
	}else{
		boolean = true;
	}
	return boolean;
}
*/