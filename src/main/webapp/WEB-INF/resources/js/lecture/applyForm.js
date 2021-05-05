'use strict';
const $applyBtn = document.getElementById('applyBtn');

$applyBtn.addEventListener("click",applyLecture);

const url = "/doroowa/lecture/apply";
const $name = document.getElementById('name');
const $tel = document.getElementById('tel');
const $title = document.getElementById('title');
const $price = document.getElementById('price');
const $description = document.getElementById('description');
const $etctext = document.getElementById('etctext');
var obj_length = document.getElementsByName("category").length;
var $category = null;

    
  
    

	
function applyLecture(evt){

        for (var i=0; i<obj_length; i++) {
            if (document.getElementsByName("category")[i].checked == true) {
                $category = document.getElementsByName("category")[i].value;
            }
        }
		const jsonObj = {
			name: $name.value,
			tel : $tel.value,
			title : $title.value,
			price : $price.value,
			description : $description.value,
			category : $category,
			etctext : $etctext.value
		}
		ajaxCall.post(url,jsonObj,handler);
		alert("개설신청완료");
	}


function handler(jsonObj){
	if(jsonObj.rtcd === '00'){
		console.log("완료");
//		alert("신청 완료");
	}else{
		console.log("실패");
	}
	
	
	
}




