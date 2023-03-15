import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="lazy-loader"
export default class extends Controller {
  static targets = ["image"]

  connect() {

    if ("IntersectionObserver" in window) {
      let lazyImageObserver = new IntersectionObserver((entries, observer) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {

            let lazyImage = entry.target;

            lazyImage.src = lazyImage.dataset.src;
            //lazyImage.srcset = lazyImage.dataset.srcset;
            lazyImage.classList.remove("lazy");
            lazyImage.classList.add("lazy__loaded");
            lazyImageObserver.unobserve(lazyImage);
          }
        });
      });

      this.imageTargets.forEach((lazyImage) => {
        lazyImageObserver.observe(lazyImage);
      });
    }

  }
}
