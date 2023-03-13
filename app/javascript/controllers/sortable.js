import Sortable from "sortablejs"

const list = document.querySelector("#shortlist-sortable")

const initSortable = () => {
  Sortable.create(list, {
    animation: 150,
    ghostClass: 'ghost'
})
}

export { initSortable }
