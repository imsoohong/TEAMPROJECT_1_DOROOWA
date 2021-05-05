'use strict';

const $video = document.getElementById('myvideo');
//const $myModal = document.getElementById('myModal');

//const $modal = document.querySelector('.modal');
const $member_id = document.getElementById('member_id');
const $lecture_title = document.getElementById('lecture_title');
const $filename = document.getElementById('filename');
const $lastVidYn = document.getElementById('lastVidYn');
const $openYn = document.getElementById('openYn');
const $success = document.getElementById('success');


load();



$video.addEventListener("timeupdate",
	function(evt) {

		var vid = $video.getAttribute('data-vid');
		var title = $lecture_title.value;

		var url = `/doroowa/video/${title}/${vid}/UpdateStudydate`;





		if ($video.currentTime === $video.duration) {


			url = `/doroowa/video/${title}/${vid}`;

			console.log(url);





			if ($lastVidYn.value != 'true' && $openYn.value === 'true') {
				if (confirm("다음 강의로 넘어가시겠습니까?")) {

					//		console.log(++vid);
					location.href = `/doroowa/video/${title}/${vid}/next`;
				};



			}



			//        AJAX call
			fetch(url, {
				method: 'PATCH'
			})
				.then(response => response.text())
				.then(text => { console.log(text); handler(text, evt.target); })
				.catch(error => console.error(error));




		}
	}








	, false);



function handler(text, target) {
	if (text === 'ok') {
		console.log('성공!');
	} else {
		console.log('실패!');
	}
}



function load() {

console.log("실행");

const locks = document.querySelectorAll('.locked');
for(let i=0;i<locks.length;i++){

document.querySelectorAll('.locked')[i].parentNode.parentNode.removeAttribute("href");




}

document.querySelector('#currentVid').parentNode.parentNode.setAttribute("id", "curVid");

}












