$(document).on('ready', function() {
  $('.card_slider').slick({
    // slide: 'div',		//슬라이드 되어야 할 태그 ex) div, li 
    slidesToShow : 4,		// 한 화면에 보여질 컨텐츠 개수
    slidesToScroll : 4,		//스크롤 한번에 움직일 컨텐츠 개수
    speed : 500,	 // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
    arrows : true, 		// 옆으로 이동하는 화살표 표시 여부
    // prevArrow : "<button type='button' class='slick-prev as fa-chevron-left''>Previous</button>",		// 이전 화살표 모양 설정
    // nextArrow : "<button type='button' class='slick-next as fa-chevron-right'>Next</button>",		// 다음 화살표 모양 설정
    dotsClass : "slick-dots",	//아래 나오는 페이지네이션(점) css class 지정
    draggable: false,
    infinite : false, 	//무한 반복 옵션	 
    responsive: [
    	{
    		breakpoint: 1500,
    		settings: {
	    		slidesToShow:3,
	    		slidesToScroll:1,
	    		draggable: true    			
    			}
    	},
    	{
    		breakpoint: 769,
    		settings: {
    			slidesToShow:2,
	    		slidesToScroll:2    	  			
    		}
		}
    ]
  });
  $('#slider').slick({
      // slide: 'div',		//슬라이드 되어야 할 태그 ex) div, li 
      infinite : true, 	//무한 반복 옵션	 
      slidesToShow : 1,		// 한 화면에 보여질 컨텐츠 개수
      slidesToScroll : 1,		//스크롤 한번에 움직일 컨텐츠 개수
      speed : 100,	 // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
      arrows : true, 		// 옆으로 이동하는 화살표 표시 여부
      dots : true, 		// 스크롤바 아래 점으로 페이지네이션 여부
      autoplay : true,			// 자동 스크롤 사용 여부
      autoplaySpeed : 5000, 		// 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
      pauseOnHover : true,		// 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
      vertical : false,		// 세로 방향 슬라이드 옵션
      // prevArrow : "<button type='button' class='slick-prev'>Previous</button>",		// 이전 화살표 모양 설정
      // nextArrow : "<button type='button' class='slick-next'><i class='fas fa-caret-right'></i></button>",		// 다음 화살표 모양 설정
      dotsClass : "slick-dots" 	//아래 나오는 페이지네이션(점) css class 지정
  });
  $('.recommendation__content').slick({
    //slide: 'div',		//슬라이드 되어야 할 태그 ex) div, li 
    infinite : true, 	//무한 반복 옵션	 
    slidesToShow : 5,		// 한 화면에 보여질 컨텐츠 개수
    slidesToScroll : 1,		//스크롤 한번에 움직일 컨텐츠 개수
    speed : 1000,	 // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
    arrows : false, 		// 옆으로 이동하는 화살표 표시 여부
    dots : false, 		// 스크롤바 아래 점으로 페이지네이션 여부
    autoplay : true,			// 자동 스크롤 사용 여부
    autoplaySpeed : 2000, 		// 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
    pauseOnHover : false,		// 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
    vertical : true,		// 세로 방향 슬라이드 옵션
    // prevArrow : "<button type='button' class='slick-prev'>Previous</button>",		// 이전 화살표 모양 설정
    // nextArrow : "<button type='button' class='slick-next'>Next</button>",		// 다음 화살표 모양 설정
    // dotsClass : "slick-dots" 	//아래 나오는 페이지네이션(점) css class 지정
});
});
