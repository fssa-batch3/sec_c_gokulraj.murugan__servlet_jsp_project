/**
 * 
 */

const addprod_btn = document.getElementById("addprod_btn")
const overlay = document.querySelector('#overlay');
const popup = document.querySelector('.popup');
const closebtn = document.getElementById("close_btn");

const addproduct = document.getElementById("addproduct")

function openPopup() {
	popup.style.display = 'block';
	overlay.style.display = 'block';
}

function closePopup() {
	popup.style.display = 'none';
	overlay.style.display = 'none';
}

closebtn.addEventListener("click", closePopup);
addprod_btn.addEventListener("click", openPopup);
