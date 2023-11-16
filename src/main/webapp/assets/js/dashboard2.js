/**
 * 
 */




for (let i = 0; i < currencyData.length; i++) {


	// Find the coin with the specified symbol
	const coin = data.find((coin) => coin.symbol === currencyData[i].symbol.toLowerCase());

	console.log(coin);

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
		td3.setAttribute("style", "width:100px")
		one_coin.appendChild(td3);

		const td4 = document.createElement("td");
		one_coin.appendChild(td4);

		const buy_button = document.createElement("button");
		buy_button.setAttribute("class", "buy_button");
		buy_button.innerText = "Buy";
		td4.appendChild(buy_button);

		// buy_button.addEventListener("click", console.log("aakash"));

		let tbodyElements = document.querySelectorAll("tbody");
		tbodyElements.forEach(function(tbody) {
			tbody.appendChild(one_coin);

		});
	} else {
		console.error(`${currencyData[i].symbol} not found in the response.`);
	}


}


let live_price = document.getElementById("live_price");

let right_box = document.querySelector(".right_box");

let buy = document.querySelectorAll(".buy_button");

console.log("buy", buy);


buy.forEach((button) => {

	console.log(button);

	button.addEventListener("click", (e) => {
		console.log("price jdkjk");

	});

});



