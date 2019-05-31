const outputToScreen = (songs) => {

  const resultList = document.querySelector('.song-list')
  // resultList.innerHTML = '<input type="submit" name="commit" value="add a song" data-disable-with="add a song">'

  resultList.innerHTML = ''
  if (songs) {
    let incrementor = 1;
    songs.forEach((song) => {
      resultList.insertAdjacentHTML('beforeend',
          `<input type="radio" style="display: none" name="radios" id="choice-${incrementor}" value='' required>
            <label class="song-item" for='choice-${incrementor}'>
              <img src="${song['artworkUrl100']}" alt="${song['trackName']}">
              <div class="song-item-info">
                <h2>${song['trackName']}</h2>
                <p>${song['artistName']}</p>
              </div>
            </label>`
        )
        document.getElementById(`choice-${incrementor}`).value = JSON.stringify(song);
      incrementor++;
    })
  }
}

const searchItunes =()=> {
  const searchTerm= event.currentTarget.querySelector('.query');
  const baseUrl = "https://itunes.apple.com/search?term="
  const url = `${baseUrl}${searchTerm.value}&entity=song&limit=4`
  fetch(url)
  .then(response => response.json())
  .then((data)=> {
    console.log(data);
    outputToScreen(data.results);
  }).catch(error => console.error(error));
}

export { searchItunes }
