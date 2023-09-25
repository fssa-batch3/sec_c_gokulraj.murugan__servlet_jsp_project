
<%--
<%@page import="com.fssa.bitwallet.service.CurrencyService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.bitwallet.model.Currency"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<div class="boxes">
		<%
		List<Currency> product_list = CurrencyService.readCurrency(); 

		for (List<Currency> product : product_list) {
		%>
		<a class="link" href="./statistics.html?name=<%=product.get("name")%>">
			<div class="box">
				<div class="text">
					<h2><%=product.get("name")%></h2>
					<p><%=product.get("symbol")%></p>
				</div>
			</div>
		</a>
		<%
		}
		%>
	</div>

</body>
</html>--%>
