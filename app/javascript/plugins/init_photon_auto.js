


// show autocomplete to fix location
// take final location and show on map
// save location

const initPhotonAuto = () => {
  // display results
  const results = document.getElementById('results');
  results.innerHTML = "";

  const insertResults = (data) => {
    data.features.forEach((location) => {
      console.log(location)
      const result = `<li>${location.properties.name}, ${location.properties.postcode}, ${location.properties.city || location.properties.country }</li>`
      results.insertAdjacentHTML('beforeend', result);
    });
  };

  // function to query API with the location
  // http://photon.komoot.de/api/?q=${query}&limit=3
  // `https://nominatim.openstreetmap.org/search/gb/${query}/?format=geocodejson&limit=3`
  const sendRequest = (query) => {
    const nominatimUrl = (`http://photon.komoot.de/api/?q=${query}&limit=3`);
    fetch(nominatimUrl)
      .then(response => response.json())
      .then((data) => {
        insertResults(data);
    });
  };

  // grab input from location input
  const input = document.getElementById('meeting-address');
  const submit = document.getElementById('search-button')
  submit.addEventListener('click', (event) => {
    event.preventDefault();
    if (input.value.length > 4) {
      results.innerHTML = "";
      sendRequest(input.value);
    }
  });
};

export { initPhotonAuto };
