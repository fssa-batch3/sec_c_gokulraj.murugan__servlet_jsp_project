<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BitWallet</title>
<link rel="stylesheet" href="assets/css/signup.css">
</head>
<body>
	<div class="all">
		<div class="head">
			<a href="./index.html"> <i class="fa-solid fa-arrow-left"></i>
			</a>
			<h5>
				Already member? <a href="" id="Sign_up">Login</a>
			</h5>
		</div>
		<%
		String errorMessage = request.getParameter("errorMessage");
		if (errorMessage != null) {
			out.println("<p>" + errorMessage + "</p>");
		}
		%>
		<div class="h2">
			<h2>Sign Up</h2>
		</div>
		<form id="form">
			<div class="content">

				<label for="username">UserName :</label> <input type="text"
					name="username" id="username" placeholder="User Name"
					 required> <br> <label
					for="email">Email :</label> <input type="email" name="email"
					id="email" placeholder="Email" required> <br> <label
					for="date_of_birth">Date Of Birth :</label> <input type="date"
					name="date_of_birth" id="date_of_birth" required> <br>

				<label for="password">Password :</label> <input type="password"
					name="password" id="password" placeholder="Password"
					pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
					title="Enter a Uppercase,a lowercase, a number,a special character"
					required> <br> <label for="cpassword">Confirm
					Password :</label> <input type="password" name="cpassword"
					id="confirm_password" placeholder="Confirm Password"
					pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
					title="Enter a Uppercase,a lowercase, a number,a special character"
					required> <br>
				<button type="submit" id="btn">Sign up</button>
			</div>
		</form>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script src="https://kit.fontawesome.com/ee40c53027.js"
		crossorigin="anonymous" integrity="">
	</script>
	<script src="assets/js/signUp.js"></script>
	<script src="assets/js/sweetalert.min.js"></script>
	
	
</body>
</html>