const btc = document.getElementById("bitcoin");
const ltc = document.getElementById("litecoin");
const eth = document.getElementById("ethereum");
const doge = document.getElementById("dogecoin");

const liveprice = {
  async: true,
  scroosDomain: true,
  url: "https://api.coingecko.com/api/v3/simple/price?ids=bitcoin%2Clitecoin%2Cethereum%2Cdogecoin&vs_currencies=usd",

  method: "GET",
  headers: {},
};

$.ajax(liveprice).done((response) => {
  btc.innerHTML = `${response.bitcoin.usd}USD`;
  ltc.innerHTML = `${response.litecoin.usd}USD`;
  eth.innerHTML = `${response.ethereum.usd}USD`;
  doge.innerHTML = `${response.dogecoin.usd}USD`;
});
