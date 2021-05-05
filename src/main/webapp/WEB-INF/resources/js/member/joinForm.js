'use strict'
const $name = document.querySelector("#name");

//아이디 입력시 ajax를 통하여 중복아이디 검사
member_id.addEventListener('blur',()=>{
	let idvalue=member_id.value;
	console.log("아이디 변경 감지");
	console.log("아이디값은"+idvalue);
	const url = `http://localhost:9080/doroowa/member/checkId?member_id=${idvalue}`;
		  
	fetch(url,{method:'GET',headers: { 'Accept' : 'application/json'}})
	.then(result => result.json())
	.then(json => {console.log(json);idchkhandler(json);})
});

//아이디 중복 체크 후 결과 메세지 출력 함수
function idchkhandler(json){
	if(json){
		errmsg_member_id.textContent ='이미 사용중인 아이디 입니다.';
	}else{
		errmsg_member_id.textContent ='';
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

//가입 버튼
joinBtn.addEventListener('click',memberJoin);

//가입 버튼 클릭시 유효성 검증 시작 
function memberJoin(evt){
	evt.preventDefault();
	console.log("회원가입 버튼 클릭함");

	if(!validationChk()){
		return
	}
	joinForm.submit();
	 

}

// 유효성 검증에 관한 함수
function validationChk(){
	//아이디 유효성 체크(이메일 형식 확인)
	if(!isEmail(member_id.value)){
		errmsg_member_id.textContent = "올바른 이메일 형식의 아이디를 입력하세요. ex)example@example.com";
		member_id.focus();
		member_id.select();
		console.log("아이디 유효성 오류 발생");
		return false;
	}else{
		errmsg_member_id.textContent='';
	}
	// 비밀번호 유효성 체크
	if(!isPassword(pw.value)){
		errmsg_password_main.textContent = '비밀번호는 4~10자리의 영어, 숫자만 가능합니다.';
		pw.focus();
		pw.select();
		console.log("비밀번호 유효성 오류 발생");
		return false;
	}else{
		errmsg_password_main.textContent =''; 
	}
	
	// 비밀번호 재확인 체크
	if(pw.value !== pwchk.value){
		errmsg_password.textContent = "비밀번호가 일치하지 않습니다.";
		console.log("비밀번호 체크 오류 발생");
		return false;
	}else{
		errmsg_password.textContent='';
	}
	
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
	
	// 이름 입력 확인
	if($name.value.length == 0){
		errmsg_name.textContent = '이름을 입력하세요';
		$name.focus();
		$name.select();
		console.log("이름 공백 오류 발생");
		return false;
	}else{
		errmsg_name.textContent = '';
	}
	
	// 주소 입력 확인
	if(region.value.length == 0){
		errmsg_addr.textContent = '주소를 검색하세요';
		console.log("주소 공백 오류 발생");
		return false;
	}else{
		errmsg_addr.textContent = '';
	}
	
	//인증코드 입력 확인
	if(code.value.length == 0){
		errmsg_aucode.textContent = '인증코드를 입력하세요';
		return false;
	}else{
		errmsg_aucode.textContent = '';
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