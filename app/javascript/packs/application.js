import "bootstrap";
import { searchItunes } from '../plugins/init_itunes_search';
import { alertClose } from '../plugins/alert_close.js';

import { startTimer} from '../plugins/init_practice_timer'
import { endRehearse} from '../plugins/init_practice_timer'
import { addDropDownMenus} from '../plugins/init_drop_down_menus'

// import { mySwiper } from '../plugins/init_swiper'
import { swipeMe } from '../plugins/init_swiper'
import { showUserPlaylists } from '../plugins/init_spotify_playlists'

const searchBox = document.querySelector("#song-search");
const searchBoxText = document.querySelector('#song-search .query');
const noteTextField = document.querySelector('#note_content');
const noteContent = document.querySelector('.form-practice-show-container #note_content');
const playlistList = document.querySelector('#playlists');
var drops = document.querySelectorAll('.dropdown-song');

if(playlistList) {
  showUserPlaylists();
}

if(searchBox) {
  searchBox.addEventListener('keyup', (event) => {
    event.preventDefault();
    searchItunes();
  });
  };

if(searchBoxText) {
  searchBoxText.addEventListener('click', (event) => {
    searchBoxText.placeholder = "";
  });
  };

  if(noteTextField) {
  noteTextField.addEventListener('click', (event) => {
    noteTextField.placeholder = "";
  });
  };


if(drops) {
  addDropDownMenus();
}


swipeMe();



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
