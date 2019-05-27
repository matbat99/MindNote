import "bootstrap";
import { searchItunes } from '../plugins/init_itunes_search';


const searchBox = document.querySelector("#song-search");


searchBox.addEventListener('keyup', (event) => {
  event.preventDefault();
  searchItunes();
});
