<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.bitwallet.model.Currency"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<h1>success</h1>

	<%
	Currency cur = (Currency) request.getAttribute("currency");
	%>
	<h2><%=cur.getName()%></h2>
</body>
</html>