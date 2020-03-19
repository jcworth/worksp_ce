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
import { initPhotonAuto } from '../plugins/init_photon_auto';

document.addEventListener('turbolinks:load', () => {
  initMapbox();
});

initPhotonAuto()

// mapboxgl.accessToken = 'pk.eyJ1IjoiY2Ftcm4iLCJhIjoiY2s3dzBpYmFrMWYxcTNmcGd5NnlwdWtubyJ9.kUT1Vv1POM3rVfUfsrKSZA';
// const map = new mapboxgl.Map({
//   container: 'map', // Container ID
//   style: 'mapbox://styles/mapbox/streets-v11', // Map style to use
//   center: [-122.25948, 37.87221], // Starting position [lng, lat]
//   zoom: 12, // Starting zoom level
// });


