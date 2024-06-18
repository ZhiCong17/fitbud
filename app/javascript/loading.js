function showLoadingPage() {
  // var loadingPage = document.getElementById("loading-page");
  // loadingPage.style.display = "block";
  const loadingPage = document.getElementById('loading-page');
    const loadingText = document.getElementById('loading-text');
    const texts = [
      "Generating your workout plan...",
      "Loading your gym routine...",
      "Preparing your exercises...",
      "Almost there...",
      "Stay fit and healthy!"
    ];

    let textIndex = 0;
    setInterval(() => {
      textIndex = (textIndex + 1) % texts.length;
      loadingText.textContent = texts[textIndex];
    }, 3000); // Change text every 3 seconds

    // To show the loading page, remove the display: none style
    loadingPage.style.display = 'flex';


  var iconContainer = document.getElementById("icon-container");
  iconContainer.style.display = "block";

  var icons = [
    "https://cdn-icons-gif.flaticon.com/8756/8756295.gif",
    "https://cdn-icons-gif.flaticon.com/10968/10968107.gif",
    "https://cdn-icons-gif.flaticon.com/8756/8756192.gif",
    "https://cdn-icons-gif.flaticon.com/10968/10968103.gif"
  ];
  var currentIndex = 0;

  function showNextIcon() {
    var iconUrl = icons[currentIndex];
    var icon = new Image();
    icon.src = iconUrl;
    iconContainer.innerHTML = ""; // Clear previous icon
    iconContainer.appendChild(icon);

    currentIndex = (currentIndex + 1) % icons.length; // Move to the next icon, loop back to the first icon if at the end

    setTimeout(showNextIcon, 4000); // Show the next icon after 4 second
  }

  showNextIcon(); // Start the loop

  var spinner = document.querySelector(".spinner");
  spinner.style.display = "block";

  var text = document.querySelector("#loading-page > div:nth-child(3)");
  text.style.display = "block";
}

function hideLoadingPage() {
  var loadingPage = document.getElementById("loading-page");
  loadingPage.style.display = "none";

  var iconContainer = document.getElementById("icon-container");
  iconContainer.innerHTML = ""; // Clear the icon container
}

document.addEventListener("turbo:load", () => {
  hideLoadingPage(); // Ensure loading page is hidden on page load
});

document.addEventListener("turbo:submit-start", function() {
  showLoadingPage();
});

document.addEventListener("turbo:submit-end", function() {
  hideLoadingPage();
});

document.addEventListener("turbo:render", function() {
  hideLoadingPage();
});
