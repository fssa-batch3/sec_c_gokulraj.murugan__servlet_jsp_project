

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
	// getCrypto(param_value);
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
			// Request encountered an error
			console.error('Request failed:', error);
		});

}







