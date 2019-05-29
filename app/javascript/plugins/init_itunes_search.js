const outputToScreen = (songs) => {

  const resultList = document.querySelector('.song-holder')
  // resultList.innerHTML = '<input type="submit" name="commit" value="add a song" data-disable-with="add a song">'

  resultList.innerHTML = ''
  if (songs) {
    let incrementor = 1;
    songs.forEach((song) => {
      resultList.insertAdjacentHTML('afterbegin',
          `<div class="form-group">
              <input type="hidden" name="album_url" value='${song['artworkUrl100']}'>
              <input type="hidden" name="title" value='${song['trackName']}'>
              <input type="hidden" name="artist" value='${song['artistName']}'>
              <input type="radio" style="display: none" name="radios" id="choice-${incrementor}">
              <label class="song-item" for='choice-${incrementor}'>
                <img src="${song['artworkUrl100']}" alt="${song['trackName']}">
                <div class="song-item-info">
                  <h2>${song['trackName']}</h2>
                  <p>${song['artistName']}</p>
                </div>
              </label>
            </div>`
        )
      incrementor++;
    })
  }
}

const searchItunes =()=> {
  const searchTerm= event.currentTarget.querySelector('.query');
  const baseUrl = "https://itunes.apple.com/search?term="
  fetch(baseUrl+searchTerm.value+"&entity=song&limit=4")
  .then(response => response.json())
  .then((data)=> {
    console.log(data);
    outputToScreen(data.results);
  });
}

export { searchItunes }
