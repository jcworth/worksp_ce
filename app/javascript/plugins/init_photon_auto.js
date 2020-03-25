


// show autocomplete to fix location
// take final location and show on map
// save location

const initPhotonAuto = () => {
  // display results
  const results = document.getElementById('results');
  results.innerHTML = "";

  const insertResults = (data) => {
    data.features.forEach((location) => {
      // results.innerHTML = "";
      // results.classList.toggle('list-on')
      console.log(location)
      const result = `<li class="list-item">${location.properties.name}</li>`
      setTimeout(function () {
        results.insertAdjacentHTML('afterbegin', result);
      }, 1000);
      // results.innerHTML = "";
    });
  };

  // setTimeout(function() {
  //      clickPlay.classList.toggle('click');
  // }, 200)

  // function to query API with the location
  // http://photon.komoot.de/api/?q=${query}&limit=3
  // `https://nominatim.openstreetmap.org/search/gb/${query}/?format=geocodejson&limit=3`
  const sendRequest = (query) => {
    const nominatimUrl = (`http://photon.komoot.de/api/?q=${query}&limit=3`);
    fetch(nominatimUrl)
      .then(response => response.json())
      .then((data) => {
        // console.log(data);
        insertResults(data);
    });
  };

  // grab input from location input
  const input = document.getElementById('meeting-address');
  // const button = document.getElementById('search-button');
  // const searchLocation = document.getElementById('search-location')
  input.addEventListener('keyup', (event) => {
    // event.preventDefault();
    results.innerHTML = "";
    sendRequest(input.value);
    // console.log(input.value);
  });
};

export { initPhotonAuto };
