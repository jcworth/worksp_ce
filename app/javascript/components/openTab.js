function openTab(request) {
  const tab = document.getElementById(request)
  if (tab.style.display === "block") {
    tab.style.display = "none";
  } else {
    tab.style.display = "block";
  }
};

// const openTab = (request) => {
// };



export { openTab };
