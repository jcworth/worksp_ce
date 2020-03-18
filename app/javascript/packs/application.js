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
import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';

document.addEventListener('turbolinks:load', () => {
  initMapbox();
});


// display results
const results = document.getElementById('results');
results.innertHTML = "";
const insertResults = (data) => {
  data.features.forEach((location) => {
    // results.innerHTML = "";
    const result = `<li>${location.place_name}</li>`
    results.insertAdjacentHTML('beforeend', result);
  });
};


// function to query mapbox places API with the location
const sendRequest = (query) => {
  const mapboxUrl = (`https://api.mapbox.com/geocoding/v5/mapbox.places/${query}.json?access_token=pk.eyJ1IjoiY2Ftcm4iLCJhIjoiY2s3dzBpYmFrMWYxcTNmcGd5NnlwdWtubyJ9.kUT1Vv1POM3rVfUfsrKSZA`);
  fetch(mapboxUrl)
    .then(response => response.json())
    .then((data) => {
      console.log(data);
      insertResults(data);
  });
};

// grab input from location input
const input = document.getElementById('meeting-address')
const searchLocation = document.getElementById('search-location')
searchLocation.addEventListener('click', (event) => {
  // event.preventDefault();
  sendRequest(input.value);
  console.log(input.value);
});


// show autocomplete to fix location
// take final location and show on map
// save location

