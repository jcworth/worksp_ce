function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    let searchInput = document.getElementById('meeting-address');

    if (searchInput) {
      const autocomplete = new google.maps.places.Autocomplete(searchInput, { types: [ 'establishment' ],
        componentRestrictions: {country: 'gb'}
      });
      google.maps.event.addDomListener(searchInput, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault();
        }
      });
      autocomplete.addListener('place_changed', () => {
        const hiddenField = document.getElementById('meeting_google_place_id');
        // const place = autocomplete.getPlace();
        // console.log(autocomplete.getPlace());
        hiddenField.value = autocomplete.getPlace().place_id
        console.log(hiddenField.value);
      })
    }
  });
}

export { autocomplete };

