/**
 * 
 */
let username = document.getElementById("username");

let dateofbirth = document.getElementById("dob");
let email = document.getElementById("staticEmail");


let button = document.getElementById("btn1");

let save = document.getElementById("btn2");



function update() {




	const base = location.origin;

	const url = base + "/bitwallet/ProfileUpdateServlet?name=" + username.value + "&email=" + email.value + "&dob=" + dateofbirth.value;

	axios.post(url)
		.then(function(response) {
			console.log(response.data);
			if (response.data == true) {
				swal("success!", "Susccessfully updated In", "success");


			}
			else {
				swal("Failed!", response.data, "error");
			}
		})


	username.setAttribute("disabled", "");
	dateofbirth.setAttribute("disabled");
	


}

button.addEventListener("click", function() {

	username.removeAttribute("disabled", "");
	dateofbirth.removeAttribute("disabled");
	email.removeAttribute("disabled");

})
save.addEventListener("click", update())