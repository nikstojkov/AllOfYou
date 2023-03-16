const animateOut = (ele) => {
  ele.classList.add("animate__animated","animate__fadeOut","animate__faster")
}

document.addEventListener("turbo:before-render", (event) => {
  event.preventDefault()

  console.log({location: window.location})
  //await animateOut()

  const main = document.querySelector("body")
  console.log("animating")
  animateOut(main)
  event.detail.newBody.classList.add("animate__animated","animate__fadeIn","animate__faster")
  setTimeout(() => {
    console.log("resuming")
    console.log(main.classList)
    // animateCSS(event.detail.newBody, "fadeIn")
    main.classList.remove("animate__animated","animate__fadeOut")
    console.log(main.classList)

    event.detail.resume();

  }, 500);
})
