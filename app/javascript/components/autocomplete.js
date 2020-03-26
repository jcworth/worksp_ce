function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    const searchInput = document.getElementById('meeting-address');

    if (searchInput) {
      const autocomplete = new google.maps.places.Autocomplete(searchInput, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(searchInput, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
