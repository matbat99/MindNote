
const closeAllMenus = (not_this_one) => {
  var dropMenus = document.querySelectorAll('.dropdown-song-content');

  dropMenus.forEach((menu) => {
    if (menu.id !== not_this_one){
    menu.classList.remove('show-options');
    }
  });
}


const addDropDownMenus = () => {

  var drops = document.querySelectorAll('.dropdown-song');
  var dropMenus = document.querySelectorAll('.dropdown-song-content');


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

        closeAllMenus(dropMenu.id);
        dropMenu.classList.toggle("show-options");
      });
      counter = counter + 1;
    });
  }

};




export {addDropDownMenus}

