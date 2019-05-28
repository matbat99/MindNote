const outputToScreen = (songs) => {
  const resultList = document.querySelector('#song-search-results')
  resultList.innerHTML = "";
  if (songs) {
    songs.forEach((song) => {
      resultList.insertAdjacentHTML('beforeend',
        `<form action="/songs" method='post'>
          <input type="hidden" name="album_url" value='${song['collectionViewUrl']}'>
          <input type="text" name="title" value='${song['trackName']}'>
          <input type="text" name="artist" value='${song['artistName']}'>
          <input type="submit">
        </form>`
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
