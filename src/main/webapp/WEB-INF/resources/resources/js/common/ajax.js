const ajaxCall = {
  //조회
  get(url,handler) {
    fetch(url, {
      method: 'GET',
      headers: { 'Accept': 'application/json' }
    })
      .then(response => response.json())
      .then(json => {console.log(json);handler(json);})
      .catch(error => console.error(error));
  },

  //생성
  post(url, jsonObj, handler) {

    fetch(url, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',  //전송데이터 타입
        'Accept': 'application/json'         //수신데이터 타입
      },
      body: JSON.stringify(jsonObj)          //js => json포맷 문자열로변환
    })
      .then(response => response.json())
      .then(json => {console.log(json);handler(json);})
      .catch(error => console.error(error));

  },

  //수정
  patch(url, jsonObj, handler) {

    fetch(url, {
      method: 'PATCH',
      headers: {
        'Content-Type': 'application/json',    //전송데이터 타입
        'Accept': 'application/json'         //수신데이터 타입
      },
      body: JSON.stringify(jsonObj)          //js => json포맷 문자열로변환
    })
      .then(response => response.json())
      .then(json => {console.log(json);handler(json);})
      .catch(error => console.error(error));

  },

  //삭제
  del(url, jsonObj, handler) {

    fetch(url, {
      method: 'DELETE',
      headers: {
        'Content-Type': 'application/json',    //전송데이터 타입
        'Accept': 'application/json'         //수신데이터 타입
      },
      body: JSON.stringify(jsonObj)          //js => json포맷 문자열로변환
    })
      .then(response => response.json())
      .then(json => {console.log(json);handler(json);})
      .catch(error => console.error(error));

  }
}     