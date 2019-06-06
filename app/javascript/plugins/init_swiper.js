import Swiper from 'swiper';

const swipeMe = () => {

  const openMenu = function () {
    swiper.slidePrev();
  }

  const mySwiper = new Swiper('.swiper-container', {
      speed: 400,
      spaceBetween: 10,
      slidesPerView: 1,
      pagination: {
        el: '.swiper-pagination',
        type: 'bullets',
      },
    });
  }
// var mySwiper = document.querySelector('.swiper-container').swiper

export { swipeMe }
