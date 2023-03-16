import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select";

// Connects to data-controller="toms-no2"
export default class extends Controller {
  static targets = ["artwork"]


  connect() {
    console.log("Connected (second TOMS) stimulus controller")
    new TomSelect(this.artworkTarget, {
      maxItems: 10,
      // plugins: ['remove_button'],
      create: true
    })
    console.log(this.artworkTarget.selectedOptions)
  }

  tagger(e) {
    console.log(e)
    // Find the tom-select element that is visible
    const elements = document.querySelectorAll(".item");
    const tagArray = []
    console.log(elements)
    elements.forEach((tag) => {
      const tagValue = tag.dataset.value
      console.log(tagValue)
      tagArray.push(tagValue)
    })

    const tagString = tagArray.join(", ")
    const tagBox = document.querySelector('#worktag-box')
    tagBox.setAttribute('value', tagString)
    // .item is the selector you Z
    // console.log(element.getAttribute('data-value'))
   // get the selected options, and add them as values to this.selectorTarget. Or in another hidden form field
  }
}
