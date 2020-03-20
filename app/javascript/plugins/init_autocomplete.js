import places from 'places.js';

const initAutocomplete = () => {
  const newAddressInput = document.getElementById('meeting-address');
  if (newAddressInput) {
    places({ container: newAddressInput });
  }
};

export { initAutocomplete };
