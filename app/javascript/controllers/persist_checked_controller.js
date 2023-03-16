import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="persist-checked"
export default class extends Controller {
  static targets = ["artists", "artworks", "opportunities"]

  connect() {
    const lastChecked = window.localStorage.getItem("checked");

    switch (lastChecked) {
      case "artists":
        this.artistsTarget.checked = true;
        break;

      case "opportunities":
        this.opportunitiesTarget.checked = true;
        break;

      case "artworks":
        this.artworksTarget.checked = true;
        break;
      default:
        this.artistsTarget.checked = true;
        break;
    }

    const labels = document.querySelectorAll(".acc-label");

    labels.forEach((label) => {
      label.addEventListener("click", this.#storeValue);
    });
  }

  #storeValue(event) {
    const selected = event.currentTarget.dataset.id
    window.localStorage.setItem("checked", selected)
  }
}
