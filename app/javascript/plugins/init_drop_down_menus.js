


const addDropDownMenus = () => {

  var drops = document.querySelectorAll('.dropdown-song');
  var dropMenus = document.querySelectorAll('.dropdown-song-content')


  if (dropMenus){
    let counter = 1;
    dropMenus.forEach((dropmenu) => {
      dropmenu.id = `dm-${counter}`;
      counter = counter + 1;
    });
  };

  if(drops){
    let counter = 1;
    drops.forEach((drop) => {
      drop.id = `drop${counter}`;

      let menuID = `dm-${counter}`
      let dropMenu = document.getElementById(menuID);

      drop.addEventListener('click', (event) => {

        dropMenu.classList.toggle("show");
      });
      counter = counter + 1;
    });
  }

};

export {addDropDownMenus}
