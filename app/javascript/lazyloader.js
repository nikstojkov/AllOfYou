document.addEventListener("DOMContentLoaded", () => {
  // selecting all the images
  const lazyImages = [].slice.call(document.querySelectorAll("img.lazy"));

  if ("IntersectionObserver" in window) {
    // we create the observer with a callback that will be invoked whenever a target entry
    // crosses the threshold (default when 1 pixel is visible in viewport)

    let lazyImageObserver = new IntersectionObserver((entries, observer) => {
      // entries is the set of targets that have changed their intersection status
      entries.forEach((entry) => {
        // .isIntersecting returns true if the entry has gone from non-intersecting to intersecting
        if (entry.isIntersecting) {
          // if it is intersecting we select the image element
          let lazyImage = entry.target;
          // replace loading gif with actual image src from data-src attribute
          lazyImage.src = lazyImage.dataset.src;
          //lazyImage.srcset = lazyImage.dataset.srcset;

          // remove .lazy class
          lazyImage.classList.remove("lazy");
          lazyImage.classList.add("lazy__loaded");
          // remove image from set of entries now it is loaded
          lazyImageObserver.unobserve(lazyImage);
        }
      });
    });

    // add each image to the set of targets being watched by LazyImageObserver
    lazyImages.forEach((lazyImage) => {
      lazyImageObserver.observe(lazyImage);
    });
  } else {
    // Possibly fall back to event handlers here
  }
});
