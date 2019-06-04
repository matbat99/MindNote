import Swiper from 'swiper';

const swipeMe = () => {

  const openMenu = function () {
    swiper.slidePrev();
  }

  const mySwiper = new Swiper('.swiper-container', {
      speed: 400,
      spaceBetween: 100
  });

  console.log(mySwiper);
  console.log(mySwiper.slides)
}
// var mySwiper = document.querySelector('.swiper-container').swiper

export { swipeMe }
