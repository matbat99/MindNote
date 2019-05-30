import "bootstrap";
import { searchItunes } from '../plugins/init_itunes_search';
import { alertClose } from '../plugins/alert_close.js';


const searchBox = document.querySelector("#song-search");

if(searchBox) {
searchBox.addEventListener('keyup', (event) => {
  event.preventDefault();
  searchItunes();
});
};

alertClose();
