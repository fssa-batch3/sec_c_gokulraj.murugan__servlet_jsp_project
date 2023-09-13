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
				<th>Price</th>
				<th>Rank</th>
				<th>All Time High</th>
				<th>Market Cap</th>
				<th>Total Supply</th>
				<th>Maximum Supply</th>
				<th>Volume 24H</th>
				<th>All Time High</th>
			</tr>
		</thead>
		<tbody>
			<%
			Currency currencyList = (Currency) request.getAttribute("currency");
			if (currencyList != null) {
			%>
			<tr>
				<td><%=currencyList.getName()%></td>
				<td><%=currencyList.getPrice()%></td>
				<td><%=currencyList.getRank()%></td>
				<td><%=currencyList.getAllTimeHigh()%></td>
				<td><%=currencyList.getMarketCap()%></td>
				<td><%=currencyList.getTotalSupply()%></td>
				<td><%=currencyList.getMaximumSupply()%></td>
				<td><%=currencyList.getVolume24h()%></td>
				<td><%=currencyList.getAllTimeHigh()%></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>

</body>
</html>
