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
    "https://preview.redd.it/one-piece-icons-by-me-v0-qweam8vkaxv91.jpg?width=1000&format=pjpg&auto=webp&s=5423e6d70e3e39abe768e15caec9daf6d24801d0",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRh6do6fB0OMsSAVnsOHzkJYhH4GELzKFBYYkX_epyKi-lGENGK9t0TFajNaTYly9gE5E0&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPZOHh7Y_1egiTp2yYmTLDUYOxgL75CyHxLxrfuofpNvqW6NRHOMntjSfyTuQ0xYWZdaQ&usqp=CAU",
    "https://preview.redd.it/one-piece-icons-by-me-v0-7f9c4f2laxv91.jpg?width=1000&format=pjpg&auto=webp&s=cc7d0cb91f414e92cfc06be3998123c11a216033",
    "https://preview.redd.it/one-piece-icons-by-me-v0-tl852d7laxv91.jpg?width=1000&format=pjpg&auto=webp&s=790b8863e9c30967383ad633eca4df68f2ac16c0",
    "https://preview.redd.it/one-piece-icons-by-me-v0-haf5bvblaxv91.jpg?width=1000&format=pjpg&auto=webp&s=647e4d53195d992daccf1cb8946587dbfac83995",
    "https://preview.redd.it/one-piece-icons-by-me-v0-k6bm2relaxv91.jpg?width=1000&format=pjpg&auto=webp&s=606855cec7aaad24944db642d61e38dfff52f73b",
    "https://preview.redd.it/one-piece-icons-by-me-v0-ojqbkahlaxv91.jpg?width=1000&format=pjpg&auto=webp&s=1e64fc83e541276fa0dc8cd2811c4a55c06b6975",
    "https://preview.redd.it/one-piece-icons-by-me-v0-y8kch0klaxv91.jpg?width=1000&format=pjpg&auto=webp&s=1edb3bf72374c2a4da00c15e6052d41690078a15",
    "https://preview.redd.it/one-piece-icons-by-me-v0-di03oomlaxv91.jpg?width=1000&format=pjpg&auto=webp&s=ceab5433c24ee52e3bca9c9a9ef804f2f9c5f27c",
    "https://preview.redd.it/one-piece-icons-by-me-v0-15v3ydplaxv91.jpg?width=1000&format=pjpg&auto=webp&s=da09cc7638f57cd2e0e3cb5ffa45519945aa4e13",
    "https://preview.redd.it/one-piece-icons-by-me-v0-v6tqxrwlaxv91.jpg?width=1000&format=pjpg&auto=webp&s=347aaae059b7e44c99e18c93005e827073b424da"
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
