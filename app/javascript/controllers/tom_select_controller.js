import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select";


// Connects to data-controller="tom-select"
export default class extends Controller {
  static targets = ["selector"]

  connect() {
    console.log("Connected stimulus controller")
    new TomSelect(this.selectorTarget, {
      maxItems: 10,
      plugins: ['remove_button'],
      create: true
    })
    console.log(this.selectorTarget.selectedOptions)
  }

  change(e) {
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
    const tagBox = document.querySelector('#tag-box')
    tagBox.setAttribute('value', tagString)
    // .item is the selector you Z
    // console.log(element.getAttribute('data-value'))
   // get the selected options, and add them as values to this.selectorTarget. Or in another hidden form field
  }
}

// new TomSelect("#select-tags",{
//

// maxItems: 10,
//  persist: false,
// 	createOnBlur: true,
// 	create: true
// });
