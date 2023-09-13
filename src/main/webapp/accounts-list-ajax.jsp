<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>Display All accounts</title>
</head>

<body>

	<h1>Display All accounts</h1>

	<table class="table table-bordered">
		<thead>
			<tr>
				<th>S No</th>
				<th>Coin Name</th>
				<th>Markets</th>
				<th>Price</th>
				<th>Opening Date</th>
			</tr>
		</thead>
		<tbody id="acc-table">
			
		</tbody>
	</table>

	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script>

		function getAllAccounts() {
			const url = "http://localhost:8080/bitwallet/GetAllAccountJSONServlet";
			axios.get(url)
			  .then(function (response) {
			    // handle success
			    console.log(response.data);
			    const accArr = response.data;
			    displayAccounts(accArr);
			  })
			  .catch(function (error) {
			    // handle error
			    console.log(error);
			  })
		}
		
		function displayAccounts(accArr) {
			console.log("gh" + accArr["symbol"]);
			let content = "";
			let i = 0;
				content = content + "<tr>" + 
				"<td>"+(++i)+"</td>"+
				"<td>"+accArr["symbol"]+"</td>" +
				"<td>"+accArr["markets"]+"</td>" +
				"<td>"+accArr["price"]+"</td>" +
				"<td>"+accArr["last_updated_timestamp"]+"</td>" +
			"</tr>";	
			console.log(content);
			document.querySelector("#acc-table").innerHTML = content;
		}
		
		getAllAccounts();
	</script>
</body>
</html>