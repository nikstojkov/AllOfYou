const animateOut = (ele) => {
  ele.classList.add("animate__animated","animate__fadeOut","animate__faster")
}

document.addEventListener("turbo:before-render", (event) => {
  event.preventDefault()
  //await animateOut()

  const main = document.querySelector(".main-content")
  console.log("animating")
  animateOut(main)
  event.detail.newBody.classList.add("animate__animated","animate__fadeIn","animate__faster")
  setTimeout(() => {
    console.log("resuming")
    // animateCSS(event.detail.newBody, "fadeIn")
    event.detail.resume();

    main.classList.remove("animate__animated","animate__fadeOut")
  }, 1000);
})
