
// function showLoadingPage() {
//   document.getElementById("loading-page").style.display = "block";
// }

// function hideLoadingPage() {
//   document.getElementById("loading-page").style.display = "none";
// }

// document.addEventListener("turbolinks:load", () => {
//   var iconContainer = document.getElementById("icon-container");

//   var icon = new Image();
//   icon.onload = function() {
//     icon.classList.add("icons");
//     iconContainer.appendChild(icon);
//   };
//   icon.src = "https://preview.redd.it/one-piece-icons-by-me-v0-qweam8vkaxv91.jpg?width=1000&format=pjpg&auto=webp&s=5423e6d70e3e39abe768e15caec9daf6d24801d0";
// });
// var icons = [
//   "https://preview.redd.it/one-piece-icons-by-me-v0-qweam8vkaxv91.jpg?width=1000&format=pjpg&auto=webp&s=5423e6d70e3e39abe768e15caec9daf6d24801d0",
//   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRh6do6fB0OMsSAVnsOHzkJYhH4GELzKFBYYkX_epyKi-lGENGK9t0TFajNaTYly9gE5E0&usqp=CAU",
//   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPZOHh7Y_1egiTp2yYmTLDUYOxgL75CyHxLxrfuofpNvqW6NRHOMntjSfyTuQ0xYWZdaQ&usqp=CAU"
// ];

//   var icon = new Image();
//   icon.src = "https://cdn.icon-icons.com/icons2/2248/PNG/512/react_icon_136462.png";
//   icon.onload = function() {
//     iconContainer.appendChild(icon);
//     icon.style.display = "block"; // Show the icon once loaded
//   };
// });

function showLoadingPage() {
  var loadingPage = document.getElementById("loading-page");
  loadingPage.style.display = "block";

  var iconContainer = document.getElementById("icon-container");
  iconContainer.style.display = "block";

  var icons = [
    "https://preview.redd.it/one-piece-icons-by-me-v0-qweam8vkaxv91.jpg?width=1000&format=pjpg&auto=webp&s=5423e6d70e3e39abe768e15caec9daf6d24801d0",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRh6do6fB0OMsSAVnsOHzkJYhH4GELzKFBYYkX_epyKi-lGENGK9t0TFajNaTYly9gE5E0&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPZOHh7Y_1egiTp2yYmTLDUYOxgL75CyHxLxrfuofpNvqW6NRHOMntjSfyTuQ0xYWZdaQ&usqp=CAU"
  ];
  var currentIndex = 0;

  function showNextIcon() {
    var iconUrl = icons[currentIndex];
    var icon = new Image();
    icon.src = iconUrl;
    iconContainer.innerHTML = ""; // Clear previous icon
    iconContainer.appendChild(icon);

    currentIndex = (currentIndex + 1) % icons.length; // Move to the next icon, loop back to the first icon if at the end

    setTimeout(showNextIcon, 4000); // Show the next icon after 1 second
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
