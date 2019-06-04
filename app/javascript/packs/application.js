import "bootstrap";
import { searchItunes } from '../plugins/init_itunes_search';
import { alertClose } from '../plugins/alert_close.js';

import { startTimer} from '../plugins/init_practice_timer'
import { endRehearse} from '../plugins/init_practice_timer'



const searchBox = document.querySelector("#song-search");
const searchBoxText = document.querySelector('#song-search .query');
const noteContent = document.querySelector('.form-practice-show-container #note_content');
const drops = document.querySelectorAll('.dropdown-song');
const dropMenus = document.querySelectorAll('.dropdown-song-content')

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

if (dropMenus){
  let counter = 1;
  dropMenus.forEach((dropmenu) => {
    dropmenu.id = `dm-${counter}`;
    counter = counter + 1;
  });
};

if(drops){
  let counter = 1;
  drops.forEach((drop) => {
    drop.id = `drop${counter}`;
    console.log(drop.id)
    let menuID = `dm-${counter}`
    let dropMenu = document.getElementById(menuID);
    console.log(dropMenu);
    drop.addEventListener('click', (event) => {
      console.log(counter);
      dropMenu.classList.toggle("show");
    });
    counter = counter + 1;
  });
}





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
