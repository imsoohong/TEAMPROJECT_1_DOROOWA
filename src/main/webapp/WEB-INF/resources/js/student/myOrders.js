'use strict';


const refundBtn = document.querySelector('.refund');



// refundBtn.addEventListener('click',evt=>{
//   if(confirm('환불하시겠습니까?')){

//   }
// })


function refund(obj){
  var order_id = obj.parentNode.parentNode.firstElementChild.textContent;
  console.log(order_id);

  var url = null;
	
  url = `/doroowa/student/refund/${order_id}`;
  
  if(confirm('환불하시겠습니까?')){
    console.log('url:'+url);
    console.log('order_id:'+order_id);
    fetch(url, {
      method: 'PATCH'
    })
      .then(response => response.text())      //json 대신 text
      .then(text => { console.log(text); handler(text, obj); }) 
      .catch(error => console.error(error));
  }




  
  
}


function handler(text, target){
  if(text === 'ok'){
    console.log('성공!');

  }else{
    console.log('실패!');
  }

  location.href = `/doroowa/student/myOrders`;
}