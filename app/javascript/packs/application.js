import "bootstrap";
import { searchItunes } from '../plugins/init_itunes_search';
import { alertClose } from '../plugins/alert_close.js';

import { startTimer} from '../plugins/init_practice_timer'
import { endRehearse} from '../plugins/init_practice_timer'



const searchBox = document.querySelector("#song-search");
const searchBoxText = document.querySelector('#song-search .query');
const noteContent = document.querySelector('.form-practice-show-container #note_content');
const dropDownSong = document.querySelector('.dropdown-song');
const dropDownContent = document.querySelector('.dropdown-song-content')

if(searchBox) {
searchBox.addEventListener('keyup', (event) => {
  event.preventDefault();
  searchItunes();
});
};

if(searchBoxText) {
  searchBoxText.addEventListener('click', (event) => {
    searchBoxText.placeholder= "";
  });
};

if(noteContent) {
  noteContent.addEventListener('click', (event) => {
    noteContent.placeholder= "";
  });
};

if(dropDownSong) {
  dropDownSong.addEventListener('click',(event) => {
    dropDownContent.classList.toggle("show");
  });
};


alertClose();

const beginTimerButton = document.querySelector('.timer');
const startTimerButton = document.querySelector('.startTimer');
const stopTimerButton = document.querySelector('.resetTimer');



if(beginTimerButton) {
  beginTimerButton.addEventListener('click', startTimer);
};

if(startTimerButton) {
  startTimerButton.addEventListener('click', startTimer);
};

if(stopTimerButton) {
  stopTimerButton.addEventListener('click', endRehearse);
};
