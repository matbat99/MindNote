import "bootstrap";
import { searchItunes } from '../plugins/init_itunes_search';
import { alertClose } from '../plugins/alert_close.js';

import { startTimer} from '../plugins/init_practice_timer'
import { pauseTimer} from '../plugins/init_practice_timer'
import { endRehearse} from '../plugins/init_practice_timer'



const searchBox = document.querySelector("#song-search");

if(searchBox) {
searchBox.addEventListener('keyup', (event) => {
  event.preventDefault();
  searchItunes();
});
};

alertClose();

const beginTimerButton = document.querySelector('.timer');
const startTimerButton = document.querySelector('.startTimer');
const pauseTimerButton = document.querySelector('.pauseTimer');
const stopTimerButton = document.querySelector('.resetTimer');



if(beginTimerButton) {
  beginTimerButton.addEventListener('click', startTimer);
}

if(startTimerButton) {
  startTimerButton.addEventListener('click', startTimer);
}

if(pauseTimerButton) {
  pauseTimerButton.addEventListener('click', pauseTimer);
}

if(stopTimerButton) {
  stopTimerButton.addEventListener('click', endRehearse);
}
