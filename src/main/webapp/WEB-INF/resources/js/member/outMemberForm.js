'use strict'

//2021-03-29

//취소 버튼 클릭
cancelBtn.addEventListener('click',evt=>{
	console.log('취소버튼 클릭함');
	location.href='http://localhost:9080/doroowa/student/myPage';
})



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
	
	
//탈퇴 버튼 클릭
outMemberBtn.addEventListener('click',outMember);

//수정 버튼 클릭시 유효성 검증 시작 
function outMember(evt){
	evt.preventDefault();
	console.log("회원 탈퇴 버튼 클릭함");

	if(!validationChk()){
		return
	}
	
	outMemberForm.submit();
}

