'use strict';

var myList = document.getElementById('myList');
const lecture_title = document.getElementById('lecture_title').value;
const addBtn = document.querySelector('#addBtn');
const nextBtn = document.getElementById('btn_popup_open');

	nextBtn.addEventListener('click', ()=> {
	  console.log(lecture_title);
	  location.href=`/doroowa/teacher/studio/${lecture_title}/vid`;
	})
   
	addBtn.addEventListener('click', (obj)=>{
	  var text = document.getElementById('inputText').value;
      var newList = document.createElement('li');
var cnt;

if(myList.lastElementChild.tagName !== 'LI'){
	cnt = 0;
}else{
	  cnt = myList.lastElementChild.firstChild.getAttribute('idx');
}
	


      var url = null;
			
			if(cnt==null){
				console.log("null값임");
				cnt == 0;
			}
			
      newList.innerHTML = '<span idx='+(++cnt)+'>' + text + '</span> <i onclick="modify(this)" class="fas fa-pen"></i> <i onclick="del(this)" class="fas fa-eraser"></i>';
      myList.appendChild(newList)

      document.getElementById('inputText').value = '';
      document.getElementById('inputText').focus();
      
      url = `/doroowa/teacher/studio/${lecture_title}/${text}/${cnt}`;
      console.log(url);
      
      fetch(url, {
        method: 'POST'
      })
        .then(response => response.text())      //json 대신 text
        .then(text => { console.log(text); handler(text, obj); }) 
        .catch(error => console.error(error));
    })

    function del(obj) {
	
      
      if(!confirm('삭제시 해당 챕터의 영상이 모두 사라집니다. 삭제하시겠습니까?')){
        return;				
			}
      var url = null;
      var o = obj.parentElement;
      var currentIdx = obj.previousElementSibling.previousElementSibling.getAttribute('idx');
      o.remove();
      console.log(currentIdx);

      url = `/doroowa/teacher/studio/${lecture_title}/${currentIdx}`;
      console.log(url);

      fetch(url, {
        method: 'DELETE'
      })
        .then(response => response.text())      //json 대신 text
        .then(text => { console.log(text); handler(text, obj); }) 
        .catch(error => console.error(error));

      
			
    }

    function modify(obj) {
		console.log("클릭됨");
      var o = obj.parentElement;
			var currentIdx = obj.previousElementSibling.getAttribute('idx');
      var text = o.firstChild.textContent;
      console.log(text);
			//var currentIdx = o.firstChild.getAttribute('idx');
      o.innerHTML = '<span idx='+currentIdx+'><input style="width : 300px;" value="'+text+'"></span><button onclick="modifyCom(this)">완료</button>';
    }

    function modifyCom(obj) {
      var o = obj.parentElement;
			var currentIdx = obj.previousElementSibling.getAttribute('idx');
      var url = null;
			console.log(currentIdx);
      var text = o.firstChild.firstChild.value;
      o.innerHTML = '<span idx='+currentIdx+'>' + text + '</span> <i onclick="modify(this)" class="fas fa-pen"></i> <i onclick="del(this)" class="fas fa-eraser"></i>'
      
      url = `/doroowa/teacher/studio/${lecture_title}/${text}/${currentIdx}`;
      console.log(url);

      fetch(url, {
        method: 'PATCH'
      })
        .then(response => response.text())      //json 대신 text
        .then(text => { console.log(text); handler(text, obj); }) 
        .catch(error => console.error(error));
    

    
    
    }



    // function save(obj) {
    //   if(!confirm('저장하시겠습니까?')){
    //     return;
    //   }
    //   var cnt = myList.childElementCount;

    //   var list = new Array();


    //   console.log("총 갯수"+cnt);

    //   for(var i=0; i<cnt; i++){
    //     var idx = myList.children[i].firstChild.getAttribute('idx');
    //     var chapter_title = myList.children[i].firstChild.textContent;

    //     //console.log(idx, chapter_title,lecture_title);

				
    //     list.push({idx,chapter_title,lecture_title});

    //   }


    //   //console.log(list);



    //    const url = `/doroowa/teacher/studio/${lecture_title}/modify`;
		
		//  //AJAX call
    //  fetch(url, {
    //    method: 'POST'
    //  })
    //    .then(response => response.text())     
    //    .then(text => {console.log(text);handler(text,list);})
    //    .catch(error => console.error(error));


      

    //   //location.href = `/doroowa/studio/${lecture_title}/modify`;
    // }


	// function handler(text, list){
	// 	if(text === 'ok'){
	// 		console.log('성공!');
      
	// 	}else{
	// 		console.log('실패!');
  //     console.log(list);
	// 	}
	// }



  function handler(text, target) {
    if (text === 'ok') {
      console.log('성공!');
    } else {
      console.log('실패!');
    }
  }

