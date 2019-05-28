const resultList = document.querySelector('#song-search-results')

const searchBox = document.querySelector("#song-search");

const baseUrl = "https://itunes.apple.com/search?term="


const outputToScreen = (songs) => {
  resultList.innerHTML = "";
  if (songs) {
    songs.forEach((song) => {
      resultList.insertAdjacentHTML('beforeend',
        `<li> <a href='/practices' data-song="${song.trackName}" data-artist="${song.trackName}" method='POST'>
         Song: ${song.trackName} Artist: ${song.artistName} </a></li>`
        )
    })
  }
}


searchBox.addEventListener('submit', (event) => {
  event.preventDefault();
  const searchTerm= event.currentTarget.querySelector('.query');

  fetch(baseUrl+searchTerm.value+"&entity=musicTrack&limit=5")
  .then(response => response.json())
  .then((data)=> {
    outputToScreen(data.results);
  });
});
