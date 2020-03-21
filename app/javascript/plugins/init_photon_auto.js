


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
      const result = `<li id="list-item">${location.properties.name}, ${location.properties.country}</li>`
      results.insertAdjacentHTML('beforeend', result);
    });
  };

  // function to query mapbox places API with the location
  const sendRequest = (query) => {
    const photonUrl = (`http://photon.komoot.de/api/?q=${query}&limit=3`);
    fetch(photonUrl)
      .then(response => response.json())
      .then((data) => {
        console.log(data);
        insertResults(data);
    });
  };

  // grab input from location input
  const input = document.getElementById('meeting-address')
  // const searchLocation = document.getElementById('search-location')
  input.addEventListener('keyup', (event) => {
    // event.preventDefault();
    results.innerHTML = "";
    sendRequest(input.value);
    console.log(input.value);
  });
};

export { initPhotonAuto };
