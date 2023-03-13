const myModal = document.getElementById('myModal')
const myInput = document.getElementById('myInput')

if (myModal && myInput) {
  myModal.addEventListener('shown.bs.modal', () => {
    myInput.focus()
  })
}
