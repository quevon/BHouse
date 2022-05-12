
// let list = document.querySelectorAll('.navigation li')

// function activeLink(){
//     list.forEach((item) =>
//     item.classList.remove('hovered'));
//     this.classList.add('hovered');
// }

// document.addEventListener('turbolinks:load', () => {  
//     list.forEach((item) =>
//     item.addEventListener('mouseover',activeLink));
// });

const main = document.querySelector('.main');

function hideShowNav() { 
    const navigation = document.querySelector('.navigation');
    navigation.classList.toggle("active");
}
document.addEventListener('turbolinks:load', () => {  
    const toggles = document.querySelector('.toggle');
    toggles.addEventListener('click',hideShowNav);
});
