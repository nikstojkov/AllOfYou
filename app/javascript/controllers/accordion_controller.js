import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="accordion"
export default class extends Controller {
  static targets = ["label"]

  connect() {
    console.log("hello")
  }

  // getHeight(content) {
  //   return content.clientHeight
  // }

  tabClick(event) {
    console.log("clicking")
    let contentClass = event.currentTarget.querySelector('div').innerText.toLowerCase()
    console.log(contentClass);
    let content = document.querySelector(`.${contentClass}`);
    console.log(content);
    let contentHeight = content.clientHeight
    console.log(contentHeight)

    this.labelTargets.forEach((label) => {
      label.style.height = `${contentHeight}px`
    });

    setTimeout(() => {
      contentHeight = content.clientHeight;
      console.log(contentHeight)
      this.labelTargets.forEach((label) => {
        label.style.height = `${contentHeight}px`
      });
    }, 500);
  }

}
