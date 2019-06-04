import Swiper from 'swiper';

const swipeMe = () => {

  const openMenu = function () {
    swiper.slidePrev();
  }

  const mySwiper = new Swiper('.swiper-container', {
      speed: 400,
      spaceBetween: 100,
      autoplay: {
        delay: 5000,
      },
  });

}
// var mySwiper = document.querySelector('.swiper-container').swiper

export { swipeMe }
