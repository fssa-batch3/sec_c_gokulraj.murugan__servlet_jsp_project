<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BitWallet</title>
<link rel="stylesheet" href="assets/css/login.css">
</head>
<body>
	<div class="login">
		<div class="head">
			<a href="./index.html"> <i class="fa-solid fa-arrow-left"></i>
			</a>
			<h5>
				New member? <a href="./SignUp.jsp" id="Sign_up">Sign Up</a>
			</h5>
		</div>
		<div class="h2">
			<h2>Sign In</h2> 	
		</div>

		<form id="form" method="post">

			<label for="email">Email :</label> <input type="email" name="email"
				id="email" placeholder="Email" required> <br> <label
				for="password">Password :</label> <input type="password"
				name="password" id="password" placeholder="Password"
				pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
				title="Enter a Uppercase,a lowercase, a number,a special character"
				required> <br> <input type="checkbox"
				name="viewpassword" id="viewpassword"> <label
				for="viewpassword">Show Password</label> <br>

			<button type="submit" id="btn">Sign in</button>
		</form>

	</div>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script src="https://kit.fontawesome.com/ee40c53027.js"
		crossorigin="anonymous" integrity="">
	
    </script>
    	<script src="assets/js/sweetalert.min.js"></script>
	<script>
    	
	
	
    const checkbox = document.getElementById("viewpassword");

    checkbox.addEventListener("click", e => {
        if (checkbox.checked) {
            password.setAttribute("type", "text");
        }
        else {
            password.setAttribute("type", "password");
        }
    })
    
    function login(){
    	
    const email = document.getElementById("email").value;
	const password = document.getElementById("password").value;
	
	const base = location.origin;
	
	const url = base+"/bitwallet/CheckEmailServlet?email="+email+"&password="+password;
    
	axios.post(url)
    .then(function(response){
    	console.log(response);
    	if(response.data==true){
        	 swal("success!", "Susccessfully Logged In", "success");
        	 window.location.href = "http://localhost:8080/bitwallet/ReadProfileServlet";
        	
         }
         else{
        	 swal("Failed!", "Email doesn't exits", "error"); 
         }
    })
    }
    
    
    const form = document.getElementById("form");
    form.addEventListener("submit", e => {
        e.preventDefault();
        login()
    })
    </script>

</body>
</html>