<!DOCTYPE html>
<html>
<head>
<style>
#contentTable, th, td {
	border: solid 1px black;
}
</style>
</head>
<body>
	<h1>Bitcoin (BTC) Data in INR</h1>
	<form action="CurrenyValuesServlet">
	<input type= "text" name = "symbol">
	<button>Submit</button>
	</form>
	<div id="bitcoinData"></div>

	<script>
		$(document).ready(
				function() {
					// Define a function to fetch Bitcoin data using AJAX
					function fetchBitcoinData() {
						$.ajax({
							type : "GET",
							url : "CurrencyValuesServlet", // URL of your servlet
							dataType : "json",
							success : function(data) {
								// Handle the JSON response and display it on the page
								var bitcoinDataHtml = "<pre>"
										+ JSON.stringify(data, null, 2)
										+ "</pre>";
								$("#bitcoinData").html(bitcoinDataHtml);
							},
							error : function() {
								// Handle errors
								$("#bitcoinData").html(
										"Error fetching Bitcoin data.");
							}
						});
					}

					// Call the fetchBitcoinData function when the page loads
					fetchBitcoinData();
				});
	</script>
</body>

</html>