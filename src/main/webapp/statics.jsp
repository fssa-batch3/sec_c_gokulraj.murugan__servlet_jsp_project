<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bitwallet</title>
<link rel="stylesheet" href="assets/css/statistics.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
</head>
<body>
	<div class="navigation">
		<div>
			<img src="assets/Images/Screenshot__74..png" width="90%" id="logo"
				alt="">
		</div>

		<ul>

			<li><a href="../Pages/dashboard.html"> <span class="icon">
						<i class="fa-solid fa-house"></i>
				</span> <span class="title">Home</span>
			</a></li>
			<li><a href="../Pages/Exchange.html"> <span class="icon">
						<i class="fa-solid fa-arrows-rotate"></i>
				</span> <span class="title">Exchange</span>
			</a></li>
			<li><a href="../Pages/wallet.html"> <span class="icon">
						<i class="fa-solid fa-wallet"></i>
				</span> <span class="title">Wallet</span>
			</a></li>
			<li><a href="../Pages/chart.html"> <span class="icon">
						<i class="fa-solid fa-square-poll-vertical"></i>
				</span> <span class="title">Chart</span>
			</a></li>
			<li><a href="../Pages/profile.html"> <span class="icon">
						<i class="fa-solid fa-user"></i>
				</span> <span class="title">Profile</span>
			</a></li>
			<li><a href="../Pages/content.html"> <span class="icon">
						<i class="fa-solid fa-book"></i>
				</span> <span class="title">Blog</span>
			</a></li>
		</ul>
	</div>


	<div class="all"></div>

	<script src="assets/js/statics.js"></script>
	<script src="https://kit.fontawesome.com/ee40c53027.js"
		crossorigin="anonymous" integrity="">
	
	
		
	</script>
	
	
	<script>


	const url = window.location.search;
	const params = new URLSearchParams(url)
	const param_value = params.get("symbol")
	const logo_param = params.get("logo");
	console.log(logo_param);
	console.log(param_value)


	let a;	
	getCrypto(param_value,logo_param);


	const insert_data = [];
	const xValues = [];


	function demo(date, high) {

		// console.log(high)
		insert_data.push(high)
		insert_data.sort()

		xValues.push(date)
		xValues.sort()
		new Chart("myChart", {
			type: "line",
			data: {
				labels: xValues,
				datasets: [{
					//   data: [13.2800,1140,1060,1060,1070,1110,1330,2210,7830,2478],
					data: insert_data,
					fill: false,
					pointRadius: 2,
					borderColor: "rgba(0,0,255,0.5)",
					fill: false
				}
				]
			},
			options: {
				legend: { display: false }
			}
		});
		// return insert_data
	
	}
	function getUsers() {
		fetch(`https://www.alphavantage.co/query?function=DIGITAL_CURRENCY_DAILY&symbol=${param_value}&market=INR&apikey=EP4QF8JQ134XTCHY`)
			.then((results) =>
				results.json()//[{}];<name></name>//200 ok response//300 request //400 server resource //500  server
			)//try{if(a){console.log(a)}} catch {}
			.catch((error) => {
				console.log(error)
			})
			.then((data) => {
				console.log(data);

				for (let i = 0; i < 30; i++) {
					const check = Array.from(Object.keys(data["Time Series (Digital Currency Daily)"]))[i];
					// console.log(check)
					console.log(data["Time Series (Digital Currency Daily)"][check]["4b. close (USD)"])
					// console.log(check + " " + data["Time Series (15min)"][check]["2. high"])
					demo(check, data["Time Series (Digital Currency Daily)"][check]["4b. close (USD)"])
				}
				//   ["Time Series (15min)"]["2023-05-01 16:15:00"]["2. high"]
				// return data;
			});
			
	}




	function getCrypto(coin,logo_param) {


		var corsProxyUrl = 'https://cors-anywhere.herokuapp.com/'; // Heroku CORS Anywhere service
		var apiUrl = 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=100&page=1&sparkline=false';
		const coin_para = coin;

		axios.get(apiUrl)
			.then(function(response) {
				
				console.log(response);
				const responseJSON = response.data;
				
				document.cookie = responesJSON;
				
				
				
				let resJSON = null;
				
				
				
				for(let i = 0 ; i < responseJSON.length ; i++){
					
				
					if(responseJSON[i].symbol.toUpperCase() == coin_para){
						
						resJSON = responseJSON[i];
						
					}
				}
				
				console.log(resJSON);
				
				

				const main = document.createElement("div");
				main.setAttribute("class", "main");

				const box = document.createElement("div");
				box.setAttribute("class", "box");
				main.append(box);

				const rank = document.createElement("p");
				rank.setAttribute("id", "rank");
				rank.innerText = "# rank " + resJSON.market_cap_rank;
				box.append(rank);

				const top1 = document.createElement("div");
				top1.setAttribute("class", "top")
				box.append(top1);

				const logo = document.createElement("img")
				logo.setAttribute("src", logo_param)
				logo.setAttribute("width", "20%")
				top1.append(logo)

				const coin_name = document.createElement("h1")
				coin_name.innerText = resJSON.name;
				top1.append(coin_name);

				const symbol = document.createElement("h4")
				symbol.innerText = resJSON.symbol.toUpperCase();
				top1.append(symbol);

				

				const price_change = document.createElement("div");
				price_change.setAttribute("class", "price_change");
				box.append(price_change)

				let price = document.createElement("h2");
				price.setAttribute("id", "price");
				price.innerHTML = `&#8377;` + Number(Math.round(resJSON.current_price));
				price_change.append(price);

				const value = document.createElement("div");
				value.setAttribute("class", "value")
				box.append(value);


				const values = document.createElement("div");
				values.innerHTML = ` Market cap: ${resJSON.market_cap} <br><br>
	                    Total Volume 24h: ${resJSON.high_24h} <br><br>
	                   	&#9651; price change 24h: ${resJSON.price_change_24h} <br><br>
	                `
				value.append(values)

				const stat = document.createElement("div")
				stat.setAttribute("class", "stat")
				main.append(stat);

				const canvas = document.createElement("canvas");
				canvas.setAttribute("id", "myChart");
				stat.append(canvas);

				const aside = document.createElement("div");
				aside.setAttribute("class", "aside");

						
				document.querySelector(".all").append(main);
				document.querySelector(".all").append(aside);

				let addd = document.getElementById("tag");



				getUsers();
			})
			.catch(function(error) {
				
				console.error('Request failed:', error);
			});

	}

	
	function getCookie(){
		
		if(document.cookie.length!= 0){
			
			console.log(document.cookie);
		}
		else{
			console.log("NO data found");
			
		}
		
	}







	
	</script>

</body>
</html>