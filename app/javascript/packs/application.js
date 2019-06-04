import "bootstrap";
import { searchItunes } from '../plugins/init_itunes_search';
import { alertClose } from '../plugins/alert_close.js';

import { startTimer} from '../plugins/init_practice_timer'
import { endRehearse} from '../plugins/init_practice_timer'
import { addDropDownMenus} from '../plugins/init_drop_down_menus'

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



// SPOFITY API JS
const urlParams = new URLSearchParams(location.hash.slice(1));
const access_token = urlParams.get('access_token');
const showUserPlaylists = () => {
  // console.log(access_token);
  let user_id = null;

  fetch(`https://api.spotify.com/v1/me`, {
    headers: {
      "Authorization": `Bearer ${access_token}`,
      "Accept": "application/json",
      "Content-Type": "application/json"
    }
  })
  .then((response) => response.json())
  .then((data) => {
    user_id = data["id"];
    // console.log(user_id);
    fetch(`https://api.spotify.com/v1/users/${user_id}/playlists?offset=0&limit=10`, {
      headers: {
        "Authorization": `Bearer ${access_token}`,
        "Accept": "application/json",
        "Content-Type": "application/json"
      }
    })
    .then((response) => response.json())
    .then((data) => {
      // console.log(data);
      const playlists = data["items"]
      console.log(playlists);
      outputPlaylistsToScreen(playlists);
    });
  });
}


// Form creator from MindNote

const outputPlaylistsToScreen = (playlists) => {

  const resultList = document.querySelector('#playlists')
  // resultList.innerHTML = '<input type="submit" name="commit" value="add a song" data-disable-with="add a song">'

  resultList.innerHTML = ''
  if (playlists) {
    let incrementor = 1;
    playlists.forEach((playlist) => {
      resultList.insertAdjacentHTML('beforeend',
          `<input type="radio" style="display: none" name="playlist_id" id="choice-${incrementor}" value='' required>
              <label class="playlist-card" for='choice-${incrementor}' style="background-image: linear-gradient(208deg, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.8)), url('${playlist['images'][0]['url']}')">
                  <h2 class="boldify">${playlist['name']}</h2>
                  <p class="muted-text">${playlist['tracks']['total']} songs</p>
              </label>`
        )
        document.getElementById(`choice-${incrementor}`).value = playlist["id"];
      incrementor++;
    });
    resultList.insertAdjacentHTML('beforeend',
      `<input type="hidden" name="access_token" value="${access_token}">`
  )
  }
}

showUserPlaylists();
