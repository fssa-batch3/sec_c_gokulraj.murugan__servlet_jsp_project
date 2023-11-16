<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
	
	<style>
	.all{

    border: 1px solid black;
    margin:22px 0px 0px  350px  ;
    width: 77%;
    height: 800px;
}
	
	</style>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="all">
		<h1>Error Page</h1>
		<p>Upcoming Feature</p>
		<p>
			Please go to <a href="dashboard.jsp">home</a> page
		</p>

	</div>
</body>
</html>