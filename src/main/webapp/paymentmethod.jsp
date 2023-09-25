<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bitwallet</title>
<link rel="stylesheet" href="assets/css/paymentmethod.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="all">

		<div class="payment-container">
			<h1>Payment Form</h1>
			<form id="payment-form" method="Post" action="PaymentMethodServlet">
				<label for="payment-method">Select Payment Method:</label> <label
					for="radio"> <input type="radio" name="radio"
					value="Paypal">PayPal
				</label> <label for="radio"><input type="radio" name="radio"
					value="cards">Cards</label> <br>
				<br>
				<button type="submit" id="pay-button">Pay Now</button>
			</form>
		</div>

	</div>
</body>
</html>