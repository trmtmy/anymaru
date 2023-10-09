$(document).on('turbolinks:load',function() {
  $('.slider').slick({
      arrows: false,  //ボタン非表示
      autoplay: true, //自動再生
      autoplaySpeed: 2500, //再生スピード
  });
});