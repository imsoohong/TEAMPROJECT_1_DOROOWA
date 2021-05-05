'use strict';

const $writeBtn = document.getElementById('writeBtn');
const $mType = document.getElementById('mType');
const NoticeWriteForm = document.getElementById('NoticeWriteForm');

/* 유효성체크용 */
const cid_errmsg = document.getElementById('cid_errmsg');
const ntitle_errmsg = document.getElementById('ntitle_errmsg');
const ncontent_errmsg = document.getElementById('ncontent_errmsg');

let cid = document.getElementById('cid');
let ntitle = document.getElementById('ntitle');
let ncontent = document.getElementById('ncontent');


/*ck 에디터 시작 */
ClassicEditor
		.create( document.querySelector( '#ncontent' ), {
		 plugin:['Markdown','MediaEmbed','MediaEmbedToolbar'],
			toolbar: {
				items: [
					'heading',
					'|',
					'underline',
					'bold',
					'italic',
					'link',
					'bulletedList',
					'numberedList',
					'todoList',
					'|',
					'outdent',
					'indent',
					'|',
					'imageInsert',
					'imageUpload',
					'blockQuote',
					'insertTable',
					'mediaEmbed',
					'markdown',
					'undo',
					'redo',
					'|',
					'highlight',
					'fontFamily',
					'fontColor',
					'fontBackgroundColor',
					'fontSize',
					'|',
					'htmlEmbed',
					'specialCharacters'
				]
			},
			language: 'en',
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
		.then( editor => {
			window.editor = editor;
			const wordCountPlugin = editor.plugins.get( 'WordCount' );
      const wordCountWrapper = document.getElementById( 'word-count' );
      wordCountWrapper.appendChild( wordCountPlugin.wordCountContainer );
		} )
		.catch( error => {
			console.error( error );
		} );
/*ck 에디터 끝 */



//뒤로가기, 다른곳으로 이동할떄 경고
window.onbeforeunload = function() {
  return "아직 정보가 저장되지 않았습니다, 나가시겠습니까?";
}


//목록 버튼 클릭
listBtn.addEventListener('click',evt=>{
	location.href = `/doroowa/notice/`;
})

//글쓰기 버튼 클릭
$writeBtn.addEventListener('click',evt=>{
	evt.preventDefault();
	if(validChk()){
		NoticeWriteForm.submit();
	}
	//NoticeWriteForm.submit();
})


//유효성 체크
function validChk(){
	let result = true;
	//1) 카테고리 선택 유무
	if(cid.selectedIndex == 0) {
		cid_errmsg.textContent = '분류를 선택하세요!';
		cid.focus();
		result = false;
	}else{
		cid_errmsg.textContent = '';
	}
	//2) 제목 입력 여부
	if(ntitle.value.trim().length == 0){
		ntitle_errmsg.textContent = '제목을 입력하세요!';
		ntitle.focus();
		ntitle.select();
		result = false;
	}else{
		ntitle_errmsg.textContent = '';
	}
	//3) 내용 입력 여부
/*	if(ncontent.value.trim().length == 0){
		ncontent_errmsg.textContent = '내용을 입력하세요!';
		ncontent.focus();
		ncontent.select();
		result = false;
	}else{
		ncontent_errmsg.textContent = '';
	}*/
	return result;
}





