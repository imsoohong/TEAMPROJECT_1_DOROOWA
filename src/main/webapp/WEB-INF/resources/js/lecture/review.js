'use strict';

const $comments = document.querySelector('#oldList');

$(document).ready(function(){
	// 읽은 알림 총 갯수
	var oldListCnt = '${oldListCnt}';
	// 조회 인덱스
	var startIndex = 1;	// 인덱스 초기값
	var searchStep = 5;	// 5개씩 로딩
	
	// 페이지 로딩 시 첫 실행
	readOldNotify(startIndex);
	
	// 더보기 클릭시
	$('#searchMoreNotify').click(function(){
		startIndex += searchStep;
		readOldNotify(startIndex);
	})
		
	// 더보기 실행함수 **
	function readOldNotify(index){
		let _endIndex = index+searchStep-1;	// endIndex설정
		$.ajax({
			type: "post",
			async: "true",
			dataType: "json",
			data: {
				title: '${title}',
				startIndex: index,
				endIndex: _endIndex
			},
			url: "${contextPath}/lecture/reviewList",
			success: function (data, textStatus) {
				let NodeList = "";
				for(i = 0; i < data.length; i++){
					let newNode = "<div style='display: none;' class='card form-group col-sm-10 mx-auto p-0'>";
					newNode += "<div class='card-body pt-3'><div class='row px-3 mb-2'>";
					newNode += "<strong class='d-block text-gray-dark'></strong>";
					newNode += "<span class='text-muted ml-auto'></span>";
					newNode += "</div><span></span></div></div>";
					NodeList += newNode;
				}
				$(NodeList).appendTo($("#oldList")).slideDown();

				// 더보기 버튼 삭제
				if(startIndex + searchStep > oldListCnt){
					$('#searchMoreNotify').remove();
				}				
			}
		});
	}
});










