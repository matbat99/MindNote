const outputToScreen = (songs) => {
  const resultList = document.querySelector('.new_song')
  resultList.innerHTML = '<input type="submit" name="commit" value="add a song" data-disable-with="add a song">'
  if (songs) {
    songs.forEach((song) => {
      resultList.insertAdjacentHTML('afterbegin',
        `  <div class="form-group">
          <input type="hidden" name="album_url" value='${song['collectionViewUrl']}'>
          <input type="text" name="title" value='${song['trackName']}'>
          <input type="text" name="artist" value='${song['artistName']}'>
          <input type="radio" name="choice" id="choice" value="1">
           </div>`
        )
    })
  }
}

const searchItunes =()=> {
  const searchTerm= event.currentTarget.querySelector('.query');
  const baseUrl = "https://itunes.apple.com/search?term="
  fetch(baseUrl+searchTerm.value+"&entity=musicTrack&limit=5")
  .then(response => response.json())
  .then((data)=> {
    console.log(data);
    outputToScreen(data.results);
  });
}

export { searchItunes }


