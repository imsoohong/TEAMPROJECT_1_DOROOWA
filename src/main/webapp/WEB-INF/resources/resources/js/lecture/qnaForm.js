'use strict';

const $file = document.getElementById('file');
const $profilePic = document.getElementById('profilePic');
const $profilePicArea = document.getElementById('profilePicArea');
const $profile = document.getElementById('profile');

//프로파일사진 첨부영역 클릭시 파일선택창이 실행됨
$profilePicArea.addEventListener('click',()=>{
	$file.click();
});

//파일선택창에서 파일을 선택했을때
$file.addEventListener('change',()=>{
	//메모리상에 로딩된 uri정보를 읽어와 미리보기
	const url = URL.createObjectURL($file.file);
	$profilePic.src = url;
});

//파일을 이미지영역에 드래그앤드롭 했을때
$profilePicArea.addEventListener('drop',(evt)=>{
	evt.preventDefault();
	console.log('드롭!!1');
	console.log(evt);
	console.log(evt.dataTransfer.file);
	
	const file = evt.dataTransfer.file;
	
	//파일유형체크
	const regex = /image\/*/;
	if(!file.type.match(regex)){
		$profile.textContent = '이미지 파일만 첨부 가능합니다!';
		return;
	}else {
		$profile.textContent = '';
	}
	//파일 사이즈 체크
	if(file.size > 1024 * 200){
		$profile.textContent = '200kb이하 이미지만 첨부 가능합니다.'
	}
	
	//메모리에 있는 이미지파일 url 읽어오기
	const url = URL.createObjectURL(file);
	$profilePic.src = url;
	$profilePicArea.classList.remove('dragover');
	
	//드래그한 파일을 파일요소에 추가
	$file.file = evt.dataTransfer.file;
});

//이미지 영역에 마우스 올렸을때
$profilePicArea.addEventListener('dragover',(evt)=>{
	evt.preventDefault();
	console.log('드롭!!2');
	console.log(evt);
	$profilePicArea.classList.add('dragover');
	
});
//이미지 영역을 벗어났을때
$profilePicArea.addEventListener('dragleave',(evt)=>{
	evt.preventDefault();
	console.log('드롭!!3');
	console.log(evt);
	$profilePicArea.classList.remove('dragover');
});











