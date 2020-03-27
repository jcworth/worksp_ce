function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    const searchInput = document.getElementById('meeting-address');

    if (searchInput) {
      const autocomplete = new google.maps.places.Autocomplete(searchInput, { types: [ 'establishment' ],
        componentRestrictions: {country: 'gb'}
      });
      google.maps.event.addDomListener(searchInput, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault();
        }
      });
    }
  });
}

export { autocomplete };
