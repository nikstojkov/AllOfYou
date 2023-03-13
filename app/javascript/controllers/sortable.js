import Sortable from "sortablejs"

const initSortable = () => {
  const list = document.querySelector("#shortlist-sortable")

  if (list) {
    Sortable.create(list, {
      animation: 150,
      ghostClass: 'ghost'
    })
  }
}

export { initSortable }
