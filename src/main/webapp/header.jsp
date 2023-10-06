<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bitwallet</title>
<link rel="stylesheet" href="assets/css/header.css">
</head>
<body>

	<div class="navigation">
		<div>
			<img src="assets/Images/logo.png" width="90%" id="logo"
				alt="">
		</div>
		<ul>
			<li><a href="<%request.getContextPath();%>/bitwallet/DashboardServlet"> <span class="icon"> <i
						class="fa-solid fa-house"></i>
				</span> <span class="title">Home</span>
			</a></li>
			<li><a href="./exchange.jsp" diabled> <span class="icon"> <i
						class="fa-solid fa-arrows-rotate"></i>
				</span> <span class="title">Exchange</span>
			</a></li>
			<li><a href="<%request.getContextPath();%>/bitwallet/WalletServlet"> <span class="icon"> <i
						class="fa-solid fa-wallet"></i>
				</span> <span class="title">Wallet</span>
			</a></li>
			<li><a href="<%request.getContextPath();%>/bitwallet/CurrencyServlet"> <span class="icon"> <i
						class="fa-solid fa-square-poll-vertical"></i>
				</span> <span class="title">Chart</span>
			</a></li>
			<li><a href="<%request.getContextPath();%>/bitwallet/ReadProfileServlet"> <span class="icon"> <i
						class="fa-solid fa-user"></i>
				</span> <span class="title">Profile</span>
			</a></li>
			<li><a href="./blog.jsp"> <span class="icon"> <i
						class="fa-solid fa-book"></i>
				</span> <span class="title">Blog</span>
			</a></li>
		</ul>
	</div>
	<script src="https://kit.fontawesome.com/ee40c53027.js"
		crossorigin="anonymous" integrity="">
		
	</script>
</body>
</html>