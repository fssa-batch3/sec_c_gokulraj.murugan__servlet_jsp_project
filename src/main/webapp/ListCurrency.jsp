<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.fssa.bitwallet.model.Currency"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Currency List</title>

<!-- Include Bootstrap CSS -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Include Bootstrap -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<h1>Currency List</h1>

		<!-- Add a search bar using Bootstrap -->
		<div class="input-group mb-3">
			<input type="text" class="form-control"
				placeholder="Search by Name or Symbol" id="searchInput">
			<div class="input-group-append">
				<button class="btn btn-outline-secondary" type="button"
					onclick="searchTable()">Search</button>
			</div>
		</div>

		<table class="table table-bordered">
			<thead>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Symbol</th>
					<th>View</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>
				<%
				List<Currency> currencyList = (List<Currency>) request.getAttribute("currencyList");
				if (currencyList != null) {
					for (Currency ele : currencyList) {
				%>
				<tr>
					<td><%=ele.getId()%></td>
					<td><%=ele.getName()%></td>
					<td><%=ele.getSymbol()%></td>
					<td><a
						href="<%=request.getContextPath()%>/ViewCurrency?name=<%=ele.getName()%>">View</a></td>
					<td><a
						href="<%=request.getContextPath()%>/EditCurrency?id=<%=ele.getId()%>">Edit</a></td>
					<td><a
						href="<%=request.getContextPath()%>/deleteCurrency?id=<%=ele.getId()%>">Delete</a></td>
				</tr>
				<%
				}
				}
				%>
			</tbody>
		</table>
	</div>

	<script>
		function searchTable() {
			let input, filter, table, tr, td, i, txtValue;
			input = document.getElementById("searchInput");
			filter = input.value.toUpperCase();
			table = document.querySelector("table");
			tr = table.getElementsByTagName("tr");

			for (i = 1; i < tr.length; i++) {
				td = tr[i].getElementsByTagName("td")[1];
				if (td) {
					txtValue = td.textContent || td.innerText;
					if (txtValue.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
					}
				}
			}
		}
	</script>
</body>
</html>
