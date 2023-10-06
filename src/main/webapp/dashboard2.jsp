<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.bitwallet.model.Currency"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bitwallet</title>
<link rel="stylesheet" href="assets/css/dashboard2.css">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap"
	rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


</head>
<body>
	<header>
		<div class="left_header">
			<img src="assets/images/Screenshot__74..png" width="12%"
				alt="error_found" style="margin: 10px 0px 0px 20px;">
		</div>
		<div class="right_header"></div>
	</header>
	<main>
		<div class="navbar">
			<div class="one_nav">
				<a href="#"><i class="fa-solid fa-user"
					style="color: #787878; font-size: 18px;"></i>Dashboard 
			</div>
			</a>

			<div class="one_nav">
				<a href="#"><i class="fa-solid fa-user"
					style="color: #787878; font-size: 20px;"></i>Dashboard 
			</div>
			</a>

			<div class="one_nav">
				<a href="#"><i class="fa-solid fa-user"
					style="color: #787878; font-size: 20px;"></i>Dashboard 
			</div>
			</a>

			<div class="one_nav">
				<a href="#"><i class="fa-solid fa-user"
					style="color: #787878; font-size: 20px;"></i>Dashboard 
			</div>
			</a>

			<div class="one_nav">
				<a href="#"><i class="fa-solid fa-user"
					style="color: #787878; font-size: 20px;"></i>Dashboard 
			</div>
			</a>

			<div class="one_nav">
				<a href="#"><i class="fa-solid fa-user"
					style="color: #787878; font-size: 20px;"></i>Dashboard 
			</div>
			</a>

			<div class="one_nav">
				<a href="#"><i class="fa-solid fa-user"
					style="color: #787878; font-size: 20px;"></i>Dashboard 
			</div>
			</a>


			<div class="one_nav">
				<a href="#"><i class="fa-solid fa-user"
					style="color: #787878; font-size: 20px;"></i>Dashboard 
			</div>
			</a>
		</div>


		<div class="main_content">
			<div class="main_content_top">
				<img src="../assets/images/profile.png" alt="" id="user_image">
				<div class="user_details">
					<p>username</p>
				</div>
			</div>
			<div class="main_content_down">
				<div class="content">
					<div class="balance">
						<h2>Estimated Balance</h2>

						<h2 id="bala">0.00 BTC</h2>
					</div>
					<div class="markets">
						<h2>Markets</h2>
						<div class="table_scroll">
							<table>
								<thead>
									<tr>
										<th>Name</th>
										<th>Price</th>
										<th>24H Change</th>
									</tr>
								</thead>
								<tbody>
									<%
									List<Currency> currencyList = (List<Currency>) request.getAttribute("currencyList");
									if (currencyList != null) {
										for (Currency ele : currencyList) {
											
											String image = ele.getLogo();
									%>
									<!-- <tr class="one_coin">
										<td class="coin_detail"><img src="<%=ele.getLogo()%>"
											alt=""> <span class="coin_name"><%=ele.getName()%><br><%=ele.getSymbol()%>
										</span></td>
										<td>$4783</td>
										<td style="width: 100px;">34l</td>
										<td>Buy</td>
									</tr>  -->

									<%
									}
									}
									%>

								</tbody>
							</table>
						</div>
					</div>

				</div>
				<div class="aside">
					<div class="search_div">
						<h2>Explore</h2>
						<input type="search" placeholder="Search" id="search">
					</div>

				</div>
			</div>
		</div>

	</main>
	<script src="https://kit.fontawesome.com/ee40c53027.js"
		crossorigin="anonymous" integrity="">
	</script>



	<script type="text/javascript">
	
	showDetails();
	
	function getData(coin_symbol) {
	    // Construct the URL with query parameters
	    const url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=100&page=1&sparkline=false";
	  
	    $.ajax({
	      url: url,
	      method: "GET",
	      dataType: "json",

	      success: function (data) {
	        // Find the coin with the specified symbol
	        const coin = data.find((coin) => coin.symbol === coin_symbol);
	  
	        console.log(coin);

	        if (coin) {
	          console.log(`${coin.name} Details:`);
	          console.log(`Name: ${coin.name}`);
	          console.log(`Symbol: ${coin.symbol}`);
	          console.log(`Current Price (INR): ${coin.current_price}`);
	          // Add more details as needed
	        } else {
	          console.error(`${coin_symbol} not found in the response.`);
	        }
	      },
	      error: function (xhr, status, error) {
	        console.error("AJAX Error:", status, error);
	      }
	    });
	  }

	function showDetails(){
		
		fetch('/dashboard2')
		  .then(response => response.json())
		  .then(data => {
			 
			  console.log(respones.data);
			  console.log(data.name);
			  
        const one_coin = document.createElement("tr");
        one_coin.setAttribute("class", "one_coin");


        const coin_detail = document.createElement("td");
        coin_detail.setAttribute("class", "coin_detail");
        one_coin.appendChild(coin_detail);

        
        const img = document.createElement("img");
        coin_detail.appendChild(img);

        const coin_name = document.createElement("p");
        coin_name.innerText="Bitcoin";
        coin_name.setAttribute("class", "coin_name");
        coin_detail.appendChild(coin_name);

        const span = document.createElement("span");
        span.innerText="BTC"
        coin_name.appendChild(span);


        const br = document.createElement("br");
        span.prepend(br);

        const td2 = document.createElement("td");
        td2.innerText="$4783";
        one_coin.appendChild(td2);

        const td3 = document.createElement("td");
        td3.innerText="341";
        td3.setAttribute("style", "width:100px")
        one_coin.appendChild(td3);

        const td4 = document.createElement("td");
        td4.innerText="Buy";
        one_coin.appendChild(td4);

        let tbodyElements = document.querySelectorAll("tbody");
        tbodyElements.forEach(function (tbody) {
            tbody.appendChild(one_coin);
        });
        
		  })
		  .catch(error => {
		    console.error('Error:', error);
		  });
        
	}




    </script>


</body>
</html>