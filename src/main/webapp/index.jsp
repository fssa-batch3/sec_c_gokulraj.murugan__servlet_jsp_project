<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Currency Page</title>
</head>
<body>

	<h1>Currency Page</h1>

	<c:forEach var="currency" items="${currencyList}">
		<p>${currency}</p>
		<a href="./CurrencyServlet?id=${currency.id}">${currency.getName}</a>
	</c:forEach>

</body>
</html>