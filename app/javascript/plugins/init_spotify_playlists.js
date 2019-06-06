const outputPlaylistsToScreen = (playlists, access_token) => {

  const playlistList = document.querySelector('#playlists');

  playlistList.innerHTML = ''
  if (playlists) {
    let incrementor = 1;
    playlists.forEach((playlist) => {
      playlistList.insertAdjacentHTML('beforeend',
          `<input type="radio" style="display: none" name="playlist_id" id="choice-${incrementor}" value='' required>
              <label class="playlist-card" for='choice-${incrementor}' style="background-image: linear-gradient(208deg, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.8)), url('${playlist['images'][0]['url']}')">
                  <h2 class="boldify">${playlist['name']}</h2>
                  <p class="muted-text">${playlist['tracks']['total']} songs</p>
              </label>`
        )
        document.getElementById(`choice-${incrementor}`).value = playlist["id"];
      incrementor++;
    });
    playlistList.insertAdjacentHTML('beforeend',
      `<input type="hidden" name="access_token" value="${access_token}">`
  )
  }
}

// SPOFITY API JS
const showUserPlaylists = () => {
  const urlParams = new URLSearchParams(location.hash.slice(1));
  const access_token = urlParams.get('access_token');
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
    fetch(`https://api.spotify.com/v1/users/${user_id}/playlists?offset=0&limit=50`, {
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
      // console.log(playlists);
      outputPlaylistsToScreen(playlists, access_token);
    });
  });
}

export { showUserPlaylists }
