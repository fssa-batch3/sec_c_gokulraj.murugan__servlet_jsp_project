<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.bitwallet.model.Currency"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<!-- font family link -->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,300;0,500;1,400&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Bitwallet</title>
<!-- CSS link  -->
<link rel="stylesheet" href="assets/css/dashboard.css">
</head>
<body>
	<%
	String username = (String) request.getAttribute("username");
	%>

	<jsp:include page="header.jsp"></jsp:include>
	<div class="content">
		<div class="sec-1">
			<div>
				<h4 class="username">Username</h4>
				<h1>Dashboard</h1>
			</div>
		</div>
		<div class="sec-2">
			<div class="para">
				<h2>Started to Discover New Our Crypto Currency</h2>
				<p>lets started a crypt portfolio</p>
				<button id="trans_details">
					<a href="./wallet.html">Detail Transaction</a>
				</button>
			</div>
			<img src="https://iili.io/JJk0sbs.png" id="phone" alt="">
		</div>
		<!-- <div class="sec-3">
        </div> -->
		<div class="sec-4">
			<div class="exchang">
				<div class="option">
					<div class="choose">Buy</div>
					<!--  <div class="choose" id="sell_option"></div>-->
				</div>
				<form id="form" action="AddTransactionServlet" method="POST">
					<div class="sell">
						<div>
							<p>Get</p>
							<input type="number" class="input" name="quantity">
						</div>
						<div>
							<select name="currency" id="currency">
								<%
								List<Currency> currencyList = (List<Currency>) request.getAttribute("currencyList");
								if (currencyList != null) {
									for (Currency e : currencyList) {
								%>
								<option value="<%=e.getName()%>"><%=e.getName()%></option>
								<%
								}
								}
								%>
							</select>
						</div>
					</div>

					<div class="sell">
						<div>
							<p>Spend</p>
							<input type="number" class="input" name="amount">
						</div>
						<div class="flex">

							<p>&#8377;</p>
							<p>INR</p>

						</div>
					</div>

					<button id="btn_sell" type="Submit">Buy</button>
				</form>
			</div>
		</div>

		<div>
			<!-- <img src="../Assets/Images/statics.jpg" width="100%" id="statics" alt=""> -->
		</div>
	</div>




	<div class="aside">
		<div class="sec-5">
			<div>
				<i class="fa-solid fa-bell"></i>
			</div>
			<div class="sec5-1">
				<img src="../Assets/Images/profile.png" width="20%" alt=""
					id="profile_image"> <a href="./profile.html">
					<h2 class="username">Username</h2>
				</a>
			</div>
		</div>
		<div class="sec-6">
			<h2>My Cards</h2>
		</div>
		<div class="sec-7">
			<div class="sec7-1">
				<h4>Balance</h4>
				<h1 id="balance">12,34,567</h1>
			</div>
			<div class="sec7-2">
				<p>Monthly profilt</p>
				<h2>12,345</h2>
			</div>
		</div>
		<div class="sec-8">
			<a href="./Exchange.html">
				<div class="transfer">
					<div class="small">
						<i class="fa-solid fa-arrow-up"></i>
					</div>
					<div>
						<h5 class="buy">Transfer</h5>
					</div>
				</div>
			</a> <a href="./Exchange.html">
				<div class="transfer" style="background-color: #2696F9;">
					<div class="small" style="color: #2696F9;">
						<i class="fa-solid fa-arrow-down"></i>
					</div>
					<div>
						<h5 class="buy">Request</h5>
					</div>
				</div>
			</a>
		</div>
		<div class="sec-9">
			<h2>Top Coins</h2>
			<div class="Transaction">
				<img src="assets/Images/Logo/eth.png" width="20%" class="img2"
					alt="">
				<div class="para1">
					<h4>Ether</h4>
					<p id="ethereum"></p>
				</div>
			</div>
			<div class="Transaction">
				<img src="assets/Images/Logo/btc.png" width="20%" alt=""
					class="img2">
				<div class="para1">
					<h4>Bitcoin</h4>
					<p id="bitcoin"></p>
				</div>
			</div>
			<div class="Transaction">
				<img src="assets/Images/Logo/sol.png" width="20%" class="img2"
					alt="">
				<div class="para1">
					<h4>Dodge coin</h4>
					<p id="dogecoin"></p>
				</div>
			</div>
			<div class="Transaction">
				<img src="../Assets/Images/Logo/ltc.png" width="20%" class="img2"
					alt="">
				<div class="para1">
					<h4>lite coin</h4>
					<p id="litecoin"></p>
				</div>
			</div>
		</div>
	</div>





	<!-- Javascript  -->


	<script src="https://kit.fontawesome.com/ee40c53027.js"
		crossorigin="anonymous" integrity="">
		
	</script>

</body>

</html>