<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.fssa.bitwallet.model.Currency"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Currency Details</title>
</head>
<body>
	<h1>Currency Details</h1>

	<table class="table table-bordered">
		<thead>
			<tr>
				<th>Name</th>
				<th>Symbol</th>
				<th>Logo</th>
				
			</tr>
		</thead>
		<tbody>
			<%
			Currency currencyList = (Currency) request.getAttribute("currency");
			if (currencyList != null) {
			%>
			<tr>
				<td><%=currencyList.getName()%></td>
				<td><%=currencyList.getSymbol()%></td>
				<td><img src="<%=currencyList.getLogo()%>"></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>

</body>
</html>
