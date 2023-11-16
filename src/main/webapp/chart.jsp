<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.bitwallet.model.Currency"%>
<%@ page import="com.fssa.bitwallet.model.User"%>
<%@ page import="com.fssa.bitwallet.service.UserService"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bitwallet</title>
<link rel="stylesheet" href="assets/css/chart.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="all">
		<div class="head">

			
		
		</div>
		<div class="boxes">

			<%
			List<Currency> currencyList = (List<Currency>) request.getAttribute("currencyList");
			if (currencyList != null) {
				for (Currency ele : currencyList) {
			%>

			<a
				href="<%=request.getContextPath()%>/statics.jsp?symbol=<%=ele.getSymbol()%>&logo=<%=ele.getLogo()%>"
				class="link">
				<div class="box">
					<img src="<%=ele.getLogo()%>" width="25%" alt="error_found"
						class="img">

					<div class="text">
						<h2><%=ele.getName()%></h2>
						<p><%=ele.getSymbol()%></p>
					</div>
				</div>
			</a>

			<%
			}
			}
			%>

			<div id="overlay"></div>
			<div class="popup">

				<i class="fa-solid fa-xmark" id="close_btn"></i>

				<form id="form" action="AddCurrency" method="post">
					<div class="form-group row">
						<label for="Name" class="col-sm-3 col-form-label">Name</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" id="name"
								placeholder="Name" name="name"> <br>
						</div>
					</div>
					<div class="form-group row">
						<label for="Symbol" class="col-sm-3 col-form-label">Symbol</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" id="symbol"
								placeholder="Symbol" name="symbol"> <br>
						</div>
					</div>

					<div class="form-group row">
						<label for="Logo" class="col-sm-3 col-form-label">Logo Url</label>
						<div class="col-sm-7">
							<input type="url" class="form-control" id="logo"
								placeholder="Logo" name="logo"> <br>
						</div>
					</div>
				</form>
			</div>



		</div>


		<script src="https://kit.fontawesome.com/ee40c53027.js"
			crossorigin="anonymous" integrity=""></script>
		<script type="text/javascript" src="assets/js/chart.js"></script>
</body>
</html>