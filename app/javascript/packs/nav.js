function activeLink() {
  const list = document.querySelectorAll('.navigation li')
  list.forEach((item) => item.classList.remove('hovered'))
  this.classList.add('hovered')
}

document.addEventListener('turbolinks:load', () => {
  const list = document.querySelectorAll('.navigation li')
  list.forEach((item) => item.addEventListener('mouseover', activeLink))
})

function hideShowNav() {
  const main = document.querySelector('.main')
  const navigation = document.querySelector('.navigation')
  navigation.classList.toggle('active')
  main.classList.toggle('active')
}
document.addEventListener('turbolinks:load', () => {
  const toggles = document.querySelector('.toggle')
  toggles.addEventListener('click', hideShowNav)
})
