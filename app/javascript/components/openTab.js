
const initTabs = () => {
  function openTab(request) {
    const tab = document.getElementById(request)
    tab.style.display = "block";
    event.target.classList.add('tab-active')
  };

  // DASHBOARD PAGE //
  // Hide all dashboard tab options
  const tabContent = document.querySelectorAll('.tab-content')
  tabContent.forEach((element) => {
    element.style.display = "none";
  });

  // Select the tabs, click the first as a default view
  const select = document.querySelector('.tab-select')

  document.addEventListener("DOMContentLoaded", () => {
    select.firstElementChild.click()
  });

  // On click show the new tab and hide others
  select.addEventListener('click', (event) => {
    // select.classList.remove('tab-active');
    if (event.target && event.target.nodeName === 'BUTTON') {
      const request = event.target.dataset.content;
      tabContent.forEach((element) => {
        element.style.display = "none"
      });
      document.querySelectorAll('.tablinks').forEach((link) => {
        link.classList.remove('tab-active')
      });
      console.log(request);
      openTab(request);
    }
  });

}

export { initTabs };
