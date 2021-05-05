'use strict';

  $('#star_grade a').click(function () {
    $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */
    $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
    return false;
  });


$('#star_grade').value = document.querySelectorAll('a.star.on').length;


  $('.submitBtn').click(function () {
      document.getElementById('reviewForm').submit();

  });