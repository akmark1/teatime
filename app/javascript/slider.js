jQuery(function($){

var windowwidth = window.innerWidth || document.documentElement.clientWidth || 0;
  if (windowwidth > 768){
    var responsiveImage =[
      {src: 'https://shop.tsumagari.co.jp/page/wallpaper/img/dl_wp1608_ph2.jpg'},
      {src: 'https://tabippo.net/wp-content/uploads/shutterstock_256605766.jpg'},
      {src: 'https://kinarino.k-img.com/system/press_images/000/981/731/c94c67fef871ca30520751c97b6614a432cee938.jpg?1492896333'}
    ];
  } else {
    var responsiveImage =[
      {src: 'https://shop.tsumagari.co.jp/page/wallpaper/img/dl_wp1608_ph2.jpg'},
      {src: 'https://tabippo.net/wp-content/uploads/shutterstock_256605766.jpg'},
      {src: 'https://kinarino.k-img.com/system/press_images/000/981/731/c94c67fef871ca30520751c97b6614a432cee938.jpg?1492896333'}
    ];
  }
  
$('#slider').vegas({
  overlay: true,
  transition: 'fade2',
  transitionDuration: 2000,
  delay: 5000,
  animationDuration: 20000,
  animation: 'random',
  slides: responsiveImage,
});

});