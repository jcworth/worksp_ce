// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------
import "bootstrap";
import { openTab } from "../components/openTab"

document.querySelectorAll('.tab-content').forEach((element) => {
  element.style.display = "none"
});
document.querySelector('.tab-select').addEventListener('click', (event) => {
  if (event.target && event.target.nodeName === 'BUTTON') {
    const request = event.target.dataset.content;
    console.log(request);
    openTab(request);
  }
});

// const inputArea = document.getElementById('meeting-address');
// const list = document.getElementById('results');
// list.addEventListener('click', (event) => {
//   if (event.target && event.target.nodeName == 'LI') {
//     inputArea.value = event.target.innerText;
//     list.classList.toggle('on')
//   }
// });


