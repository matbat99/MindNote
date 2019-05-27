
const searchBox = documnet.querySelector(#song-search);

const baseUrl = "https://itunes.apple.com/search?term="

searchBox.addEventListener('submit', (event) => {
  const searchTerm = searchBox.value;

  fetch(baseUrl+searchTerm+"&entity=musicTrack")
  .then(response => response.json())
  .then((data)=> {
    console.log(data)''
  });
});

