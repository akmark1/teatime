jQuery(function($){

  console.log(1);

function fadeAnime(){

$('.fadeUpTrigger').each(function(){
	var elemPos = $(this).offset().top-50;
	var scroll = $(window).scrollTop();
	var windowHeight = $(window).height();
	if (scroll >= elemPos - windowHeight){
	$(this).addClass('fadeUp');
	}else{
	$(this).removeClass('fadeUp');
	}
});

}

$(window).scroll(function (){
  fadeAnime();
});

});

