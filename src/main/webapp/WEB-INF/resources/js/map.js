'use strict'
let loca_y =35.5350640706116;
let loca_x =129.31090252897906;
let markers = [];
//카카오 맵이 출력될 HTML상의 영역지정 
var mapContainer = document.getElementById('map');

//카카오 맵 옵션값	
var mapOptions = {
	center: new kakao.maps.LatLng(loca_y, loca_x),
	level: 3
};
		
//카카오 맵 생성 및 초기화
var map = new kakao.maps.Map(mapContainer, mapOptions);

//주소를 좌표값으로 변환하는 객체 
var geocoder = new kakao.maps.services.Geocoder();



let addr;
function getmaps() {
  console.log("지도 검색 버튼 클릭함");
  addr = document.getElementById('address').innerText;
  console.log(addr); 
	geocoder.addressSearch(addr,callback);

}


var callback = function(result, status) {
    if (status === kakao.maps.services.Status.OK) {
        console.log(result);
        console.log(result[0].x);
        console.log(result[0].y);
				loca_x = result[0].x;
				loca_y = result[0].y;
				if(markers[0] != null){
				markers[0].setMap(null);
				};
				var centerVal = new kakao.maps.LatLng(loca_y, loca_x);
				//마커 표시
				var marker = new kakao.maps.Marker({map: map,position:centerVal});
				markers.push(marker);
				map.setCenter(centerVal);
				}else{alert("강의 장소 주소가 올바르지 않거나 주소 정보가 없습니다. 고객센터에 문의하세요.");
				}
};

//const $roadAddrBtn = document.getElementById("roadAddrBtn");
//$roadAddrBtn.addEventListener("click",()=>{
	//window.open("http://localhost:9080/doroowa/test/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes");
//})
//function jusoCallBack(a){
	//document.getElementById('address').value = a;

//}
getmaps();