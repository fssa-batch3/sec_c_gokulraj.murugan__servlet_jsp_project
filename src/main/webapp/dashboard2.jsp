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

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">



</head>
<body>
	<%
	String currencyJson = (String) request.getAttribute("currencyJson");
	%>
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
					<div class="right_box">
						<div class="buy">
							<form action="">
								<div class="col-md-10">
									<div class="input-group mb-4">
										<div class="input-group-prepend">
											<span class="input-group-text"  >Price</span>
										</div>
										<input type="text" class="form-control" readonly
											aria-label="Default"
											aria-describedby="inputGroup-sizing-default" id="live_price">
									</div>
								</div>

								<div class="col-md-10">
									<div class="input-group mb-4">
										<div class="input-group-prepend">
											<span class="input-group-text" id="amount_span">Amount</span>
										</div>
										<input type="text" class="form-control" aria-label="Default"
											aria-describedby="inputGroup-sizing-default" >
									</div>
								</div>

								<div class="col-md-10">
									<div class="input-group mb-4">
										<div class="input-group-prepend">
											<span class="input-group-text" id="total_inr">Total
												INR</span>
										</div>
										<input type="text" class="form-control" aria-label="Default"
											aria-describedby="inputGroup-sizing-default">
									</div>
								</div>

								<button type="submit">Buy BTC</button>

							</form>

						</div>

					</div>

				</div>
			</div>
		</div>

	</main>
	<script src="https://kit.fontawesome.com/ee40c53027.js"
		crossorigin="anonymous" integrity="">
		
	</script>


	<script type="text/javascript">
    let currencyJsonString = '${currencyJson}';
    let currencyData = JSON.parse(currencyJsonString);
    const url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=100&page=1&sparkline=false";
    let details;
    let live_price = document.getElementById("live_price");
	let popup = document.querySelector(".right_box");
	let amount_text = document.getElementById("amount_span");
    
    async function main() {
        try {
            const response = await axios.get(url);
            details = response.data;
            append_data();
       
        } catch (error) {
            console.log(error);
        }
    }

    async function append_data() {
        let tbodyElements = document.querySelectorAll("tbody");
        
        for (let i = 0; i < currencyData.length; i++) {
            const coin = details.find((coin) => coin.symbol === currencyData[i].symbol.toLowerCase());

            if (coin) {
                const one_coin = document.createElement("tr");
                one_coin.setAttribute("class", "one_coin");

                const coin_detail = document.createElement("td");
                coin_detail.setAttribute("class", "coin_detail");
                one_coin.appendChild(coin_detail);

                const img = document.createElement("img");
                img.setAttribute("src", currencyData[i].logo);
                coin_detail.appendChild(img);

                const coin_name = document.createElement("p");
                coin_name.innerText = currencyData[i].name;
                coin_name.setAttribute("class", "coin_name");
                coin_detail.appendChild(coin_name);

                const span = document.createElement("span");
                span.innerText = currencyData[i].symbol;
                coin_name.appendChild(span);

                const br = document.createElement("br");
                span.prepend(br);

                const td2 = document.createElement("td");
                td2.innerText = coin.current_price;
                one_coin.appendChild(td2);

                const td3 = document.createElement("td");
                td3.innerText = coin.ath_change_percentage;
                td3.setAttribute("style", "width:100px");
                one_coin.appendChild(td3);

                const td4 = document.createElement("td");
                one_coin.appendChild(td4);

                const buy_button = document.createElement("button");
                buy_button.setAttribute("class", "buy_button");
                buy_button.innerText = "Buy";
                td4.appendChild(buy_button);
                
                buy_button.addEventListener("click", (e) => {
                    
                    live_price.setAttribute("value",coin.current_price);
                    
                    popup.style.display = "block";
                    
                    amount_text.innerText = "Amount " + currencyData[i].symbol;

                });
                
                

                tbodyElements.forEach(function (tbody) {
                    tbody.appendChild(one_coin);
                });
            } else {
                console.error(`${currencyData[i].symbol} not found in the response.`);
            }
        }
    }

 

    main();
</script>



</body>
</html>