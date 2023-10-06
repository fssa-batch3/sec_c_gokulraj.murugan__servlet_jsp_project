<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.bitwallet.model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bitwallet</title>
<link rel="Stylesheet" href="assets/css/profile.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
</head>

<body>

	<jsp:include page="header.jsp"></jsp:include>

	<div class="box">
		<div class="box1">

			<div class="profile_pic">
				<img src="assets/Images/profile.png" alt="" id="profile_image">
			</div>
			<div class="profile_details">


				<form action="ProfileUpdateServlet" id="form" method="post">

					<%
					User user = (User) request.getAttribute("user");
					if (user != null) {
					%>

					<div class="form-group row " style="margin-top: 10px;">
						<label for="username" class="col-sm-4 col-form-label">UserName</label>
						<div class="col-sm-7">
							<input type="text"  class="form"
								name="username" id="username"
                                placeholder="User Name"
								value="<%=user.getUsername()%>" disabled>
						</div>
					</div>
					<div class="form-group row" style="margin-top: 10px;">
						<label for="email" class="col-sm-4 col-form-label">Email</label>
						<div class="col-sm-8">
							<input type="text"  class="form" name="email"
								id="staticEmail" placeholder="Email"
								value="<%=user.getEmail()%>" disabled>
						</div>
					</div>
					<div class="form-group row" style="margin-top: 10px;">
						<label for="dob" class="col-sm-4 col-form-label">Date Of
							Birth</label>
						<div class="col-sm-7">
							<input type="date" name="dob" class="form" id="dob"
								placeholder="dob" value="<%=user.getDOB()%>" disabled>
						</div>
					</div>
					<%
					}
					%>


					<button id="btn2" type="submit">Save</button>

				</form>
				<button id="btn1">Edit</button>
			</div>

		</div>

		<div class="right_box"></div>
	</div>

	<script src="https://kit.fontawesome.com/ee40c53027.js"
		crossorigin="anonymous" integrity="">
		
	</script>

<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/Profile.js"></script>


</body>


</html>