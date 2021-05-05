'use strict';
const resetOrder = document.querySelector('.main__order');
//결제 요청 url 선언
const url = "/doroowa/order/order";

  // checkAll.addEventListener('click', (evt)=>{
  //   console.log('클릭됨');
  //   var $inputs = document.querySelectorAll('input[type=checkbox]');
    // $inputs.forEach((ele)=>{
    //   ele.checked = true;
      
    // });
  //   checkAll.id = 'deleteAll';
  // });


  // deleteAll.addEventListener('click',(evt)=>{
  //   console.log("deleteAll 클릭");
  //   var $inputs = document.querySelectorAll('input[type=checkbox]');
  //   $inputs.forEach((ele)=>{
  //     ele.checked = false;
      
  //   });
  //   deleteAll.id = 'checkAll';
  // });


  const $allBtn = document.querySelector('.allBtn');


  $allBtn.addEventListener('click',evt=>{

    console.log(evt.target);
    func(evt.target);

  });

  function func(obj){
    console.log(obj);
    var $inputs = document.querySelectorAll('input[type=checkbox][name=title]');
    if(obj.id === 'checkAll'){
      $inputs.forEach((ele)=>{
        ele.checked = true;
      });
      obj.setAttribute('id', 'deleteAll');

    }else if(obj.id === 'deleteAll'){
      $inputs.forEach((ele)=>{
        ele.checked = false;
      });
      obj.setAttribute('id', 'checkAll');
    }
  }

if(orderBtn){
  orderBtn.addEventListener('click', ()=>{
    var list = new Array();
		var $selectEls =  document.querySelectorAll('input[type=checkbox][name=title]:checked');
    console.log('클릭됨');
    $selectEls.forEach((ele) => {
      console.log(ele.getAttribute('data-title'));
      var lecture_title = ele.getAttribute('data-title');
      list.push(lecture_title);
    });
  	console.log(list);
		fetch(url,{method: 'POST',
							 headers: {
												'Content-type' : 'application/json',
												'Accept' : 'application/json'
												},
							 body: JSON.stringify(list)
						}).then(response => response.json())
							.then(json => {console.log(json);handler(json);})
						
						resetOrder.innerHTML=" ";
						resetOrder.innerHTML=`<h3 style="color: blue">구매해주셔서 감사합니다</h3>`;
						

						});
}

function handler(json){
	
	if(json.resultMessage == '강의 구매 성공'){
		resetOrder.innerHTML=" ";
		resetOrder.innerHTML=`<h3 style="color: blue">구매해주셔서 감사합니다</h3>`;
	}else{
		resetOrder.innerHTML=" ";
		resetOrder.innerHTML=`<h3 style="color: blue">수강인원이 가득찼거나, 알 수 없는 이유로 구매에 실패하였습니다.</h3>`;
	}

	
}

