'use strict';

ClassicEditor
	.create(document.querySelector('#intro'), {
		removePlugins: ['Title'],
		toolbar: {
			items: [
				'heading',
				'|',
				'underline',
				'bold',
				'italic',
				'link',
				'|',
				'bulletedList',
				'numberedList',
				'alignment',
				'|',
				'imageUpload',
				'blockQuote',
				'insertTable',
				'mediaEmbed',
				'undo',
				'redo',
				'|',
				'fontBackgroundColor',
				'fontColor',
				'fontSize',
				'fontFamily',
				'highlight',
			]
		},
		language: 'ko',
		image: {
			toolbar: [
				'imageTextAlternative',
				'imageStyle:full',
				'imageStyle:side'
			]
		},
		table: {
			contentToolbar: [
				'tableColumn',
				'tableRow',
				'mergeTableCells',
				'tableCellProperties',
				'tableProperties'
			]
		},
	})
	.then(editor => {
		window.editor = editor;
		editor.isReadOnly = true;
		const wordCountPlugin = editor.plugins.get('WordCount');
		const wordCountWrapper = document.getElementById('word-count');
		wordCountWrapper.appendChild(wordCountPlugin.wordCountContainer);
	})
	.catch(error => {
		console.error(error);
	});



const $member_id = document.getElementById('member_id');
const $lecture_title = document.getElementById('lecture_title');
const modifyForm = document.getElementById('modifyForm');
const modifyBtn = document.getElementById('modifyBtn');
const deleteWish = document.getElementById('deleteWish');
var $basket = document.querySelector('.basket')





  document.querySelector('.basket__delete').addEventListener('click', function () {
    document.querySelector('.basket').classList.remove('show');
  });


if (modifyBtn) {
	modifyBtn.addEventListener('click', evt => {
		const toolbar = document.querySelector('.ck-toolbar_grouping');
		toolbar.style.visibility = 'visible';

		editor.isReadOnly = false;

		// 수정모드에서 필요한 요소를 보이도록 설정
		const umodes = document.querySelectorAll('.umode');
		Array.from(umodes).forEach(umode => {
			umode.style.display = 'inline-block';
		});


		// 읽모드에서 필요한 요소를 숨김 설정
		const rmodes = document.querySelectorAll('.rmode');
		Array.from(rmodes).forEach(rmode => {
			rmode.style.display = 'none';
		});
	})
}


if (cancelBtn) {
	cancelBtn.addEventListener('click', evt => {
		// 수정모드에서 필요한 요소를 숨김 설정
		const umodes = document.querySelectorAll('.umode');
		Array.from(umodes).forEach(umode => {
			umode.style.display = 'none';
		});
		// 읽모드에서 필요한 요소를 보이도록 설정
		const rmodes = document.querySelectorAll('.rmode');
		Array.from(rmodes).forEach(rmode => {
			rmode.style.display = 'inline-block';
		});

		const toolbar = document.querySelector('.ck-toolbar_grouping');
		toolbar.style.visibility = 'hidden';
		editor.isReadOnly = true;
	})
}



//저장
if (saveBtn) {
	saveBtn.addEventListener('click', evt => {
		console.log('저장 클릭!');
		evt.preventDefault();


		if (modifyForm) {
			modifyForm.submit();
			alert("수정 완료!");
		}

	});
}





//if(deleteWish){
//
//	deleteWish.addEventListener('click',evt=>{
//		console.log(evt.target); //이벤트가 실제 발생한 요소
//		console.log(evt.currentTarget); //addEventListner를 등록한 요소
//
//        var title = $lecture_title.value;
//		var mid = $member_id.value;
//		const url = `/doroowa/student/deleteWish/${title}/${mid}`;
//		
//		//AJAX call
//		fetch(url, {
//      method: 'DELETE'
//    })
//      .then(response => response.text())      //json 대신 text
//      .then(text => {console.log(text);handler(text,evt.target);}) //evt.target은 i요소 제거하기 위해 사용
//      .catch(error => console.error(error));
//		
//		
//	});
//	
//	function handler(text, target){
//		if(text === 'ok'){
//			console.log('삭제 성공!');
//
//			deleteWish.setAttribute('id','insertWish');
//			deleteWish.innerText = "찜 등록하기";
//
//		}else{
//			console.log('삭제 실패!');
//		}
//	}
//
//}




function wish(obj) {


	console.log("id:" + obj.id);
	console.log('수정중!');

	var title = $lecture_title.value;
	var mid = $member_id.value;
	var url = null;


	if (mid == '') {
		alert("로그인이 필요합니다!");
		return;
	}
	
	url = `/doroowa/student/${obj.id}/${title}`;
		

		console.log(url);

		//AJAX call
		fetch(url, {
			method: 'PATCH'
		})
			.then(response => response.text())      //json 대신 text
			.then(text => { console.log(text); handler(text, obj); }) 
			.catch(error => console.error(error));

		// obj.remove();

	

}


function order(obj) {
	console.log('클릭됨');

	var title = $lecture_title.value;
	var mid = $member_id.value;
	var url = null;

	if (mid == '') {
		alert("로그인이 필요합니다!");
		return;
	} else {
		if (obj.id === 'recentVideo') {
			location.href = `/doroowa/video/${title}/recent`;
		}else if (obj.id === 'startProgress') {
			if(confirm('수강시작시 환불이 불가능합니다. 수강하시겠습니까?')){
				location.href = `/doroowa/video/${title}/recent`;
			}
		}else if(obj.id === 'orderThis'){
			
			document.querySelector('.basket').classList.add('show');
			
			url = `/doroowa/student/addBasket/${title}`;
			
					//AJAX call
		fetch(url, {
			method: 'POST'
		})
			.then(response => response.text())      //json 대신 text
			.then(text => { console.log(text); handler(text, obj); }) 
			.catch(error => console.error(error));
			
			
		}
		else if(obj.id === 'alreadyExist'){
			
			$basket.firstChild.textContent = '이미 장바구니에 담긴 강의입니다.';
			$basket.children[1].remove();
			
			$basket.classList.add('show');


			
		}
	}

}





function handler(text, target) {
	if (text === 'ok') {
		console.log('성공!');

		if (target.id === 'deleteWish') {
			target.setAttribute('id', 'insertWish');
			target.innerText = "찜 등록하기";
		} else if(target.id === 'insertWish'){
			target.setAttribute('id', 'deleteWish');
			target.innerText = "찜 해제하기";
		} else if(target.id === 'orderThis'){
			target.setAttribute('id', 'alreadyExist');
			target.innerText = "수강신청";
		}
		
		


	} else {
		console.log('실패!');
	}
}



