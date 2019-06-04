const startTimerButton = document.querySelector('.startTimer');
const pauseTimerButton = document.querySelector('.pauseTimer');
const timerDisplay = document.querySelector('.timer');
let startTime;
let updatedTime;
let difference;
let tInterval;
let savedTime;
let paused = 0;
let running = 0;

function startTimer(){
  if(!running){
    startTime = new Date().getTime();
    tInterval = setInterval(getShowTime, 100);
    paused = 0;
    running = 1;
    startTimerButton.innerHTML="<i class='fas fa-pause'></i>";


  }
  else {
    startTimerButton.innerHTML="<i class='fas fa-play'></i>";
    pauseTimer();
  }
}

function pauseTimer(){
  if (!difference){
    // if timer never started, don't allow pause button to do anything
  } else if (!paused) {
    clearInterval(tInterval);
    savedTime = difference;
    paused = 1;
    running = 0;
  } else {
// if the timer was already paused, when they click pause again, start the timer again
startTimer();
  }
}

function endRehearse(){
  clearInterval(tInterval);
  savedTime = 0;
  difference = 0;
  paused = 0;
  running = 0;
}

function getShowTime(){
  let timeStore = document.querySelector('#time')
  updatedTime = new Date().getTime();
  if (savedTime){
    difference = (updatedTime - startTime) + savedTime;
  } else {
    difference =  updatedTime - startTime;
  }
  var hours = Math.floor((difference % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  var minutes = Math.floor((difference % (1000 * 60 * 60)) / (1000 * 60));
  var seconds = Math.floor((difference % (1000 * 60)) / 1000);
  hours = (hours < 10) ? "0" + hours : hours;
  minutes = (minutes < 10) ? "0" + minutes : minutes;
  seconds = (seconds < 10) ? "0" + seconds : seconds;
  timerDisplay.innerHTML = `<h3>${hours}:${minutes}:${seconds}</h3>`;
  timeStore.value = difference
}


export {startTimer}
export {endRehearse}
