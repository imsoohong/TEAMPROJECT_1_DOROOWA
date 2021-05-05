'use strict';


const wishes = document.querySelectorAll('.btn-wish');

for(let i=0;i<wishes.length;i++){
	wishes[i].addEventListener('click',(evt)=>{
		evt.preventDefault();
		
	})
	
}



function heart(obj) {
	var title = obj.previousElementSibling.value;
	console.log(title);
	
	var url = null;
	
	url = `/doroowa/student/${obj.id}/${title}`;


	//AJAX call
			fetch(url, {
				method: 'PATCH'
			})
				.then(response => response.text())      //json 대신 text
				.then(text => { console.log(text); handler(text, obj); }) 
				.catch(error => console.error(error));


	
}
    



	function handler(text, target){
		if(text === 'ok'){
			console.log('성공!');
			
			var newList = document.createElement('i');
			
			if(target.id==='deleteWish'){
				target.setAttribute('id','insertWish');
				target.firstElementChild.remove();
				newList.classList.add('far');
				newList.classList.add('fa-heart');
				target.appendChild(newList);

			}else{
				target.setAttribute('id','deleteWish');
				target.firstElementChild.remove();
				newList.classList.add('fas');
				newList.classList.add('fa-heart');
				target.appendChild(newList);
			}


		}else{
			console.log('실패!');
		}
	}