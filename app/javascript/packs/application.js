import "bootstrap";
import { searchItunes } from '../plugins/init_itunes_search';
import { alertClose } from '../plugins/alert_close.js';

import { startTimer} from '../plugins/init_practice_timer'
import { endRehearse} from '../plugins/init_practice_timer'
import { addDropDownMenus} from '../plugins/init_drop_down_menus'
// import { mySwiper } from '../plugins/init_swiper'
import { swipeMe } from '../plugins/init_swiper'


const searchBox = document.querySelector("#song-search");
const searchBoxText = document.querySelector('#song-search .query');
const noteContent = document.querySelector('.form-practice-show-container #note_content');
var drops = document.querySelectorAll('.dropdown-song');



if(searchBox) {
  searchBox.addEventListener('keyup', (event) => {
    event.preventDefault();
    searchItunes();
  });
  };



if(drops) {
  addDropDownMenus();
}

// if(mySwiper) {
//   console.log(swiper)
//   mySwiper.swiper.clickedSlide();
// }

swipeMe();
// mySwiper.slideNext();


alertClose();

const beginTimerButton = document.querySelector('.timer');
const startTimerButton = document.querySelector('.startTimer');
const stopTimerButton = document.querySelector('.resetTimer');



if(beginTimerButton) {
  startTimer();
};

if(startTimerButton) {
  startTimerButton.addEventListener('click', startTimer);
};

if(stopTimerButton) {
  stopTimerButton.addEventListener('click', endRehearse);
};
