
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.bitwallet.model.Transaction"%>
<%@ page import="com.fssa.bitwallet.model.Balance"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bitwallet</title>
<link rel="stylesheet" href="assets/css/wallet.css">
</head>
<body>


	<jsp:include page="header.jsp"></jsp:include>
	<div class="all">
		<div class="wallet">
			<h2>
				<i class="fa-solid fa-wallet"></i>Your Wallet
			</h2>
			<a href="../Pages/my_sell.html" id="my_sell">My Activites</a>
		</div>
		<hr class="line">
		<div class="boxes" style="display: flex;">

			<%
			List<Balance> balance = (List<Balance>) request.getAttribute("balance");
			if (balance != null) {
				for (Balance ele : balance) {
			%>
			<div class="box">
				<img src="<%=ele.getCurrency().getLogo()%>" class="logos" alt="">
				<div class="box1">
					<h2><%=ele.getCurrency().getName()%></h2>
					<h4><%=ele.getBalance()%></h4>
				</div>
			</div>
			<%
			}
			}
			%>

		</div>

		<div class="details">
			<div class="recent_activity">
				<h2>
					<i class="fa-solid fa-clock-rotate-left"></i>Recent Activity
				</h2>
				<hr>
			</div>
			<div class="list_of_details">
				<div class="today">
					<h3 style="margin: 20px 0px 20px 50px; color: grey;">Today</h3>


					<%
					List<Transaction> trans = (List<Transaction>) request.getAttribute("Transaction");
					if (trans != null) {
						for (Transaction ele : trans) {
					%>
					<div class="one_detail">
						<div class="seller_details">
							<h3 class="seller_username"><%=ele.getSellerId()%></h3>
						</div>
						<h4 class="method"><%=ele.getTransactionType()%></h4>
						<h4 class="time"><%=ele.getTransactionTime()%></h4>
						<h4 class="coins"><%=ele.getQuantity()%></h4>
					</div>

					<%
					}
					}
					%>

				</div>

			</div>

		</div>

	</div>

	</div>
	<script src="https://kit.fontawesome.com/ee40c53027.js"
		crossorigin="anonymous" integrity="">
		
	</script>
</body>

</html>