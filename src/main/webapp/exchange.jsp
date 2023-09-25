<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bitwallet</title>
    <link rel="stylesheet" href="assets/css/Exchange.css">
</head>
<body>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="all">

        <div class="head">
            <h3>
                <a href="./Exchange.html">Buy</a>
            </h3>
            <button id="sell_button" type="button">Sell</button>
            <div>
                <input type="search" name="search" placeholder="Search" id="search">
            </div>
        </div>
        <hr class="line">

        <div class="main">


            <div class="exchagnes">
                <h2 class="crypto_name">Bitcoin</h2>
                <div data-id="bitcoin" class="cards">
                </div>
            </div>
            <div class="exchagnes">
                <h2 class="crypto_name">Tether</h2>
                <div data-id="tether" class="cards">
                </div>
            </div>
            <div class="exchagnes">
                <h2 class="crypto_name">Doge Coin</h2>
                <div data-id="doge coin" class="cards">
                </div>
            </div>
            <div class="exchagnes">
                <h2 class="crypto_name">Solana</h2>
                <div data-id="solana" class="cards">
                </div>
            </div>
            <div class="exchagnes">
                <h2 class="crypto_name">Ethereum</h2>
                <div data-id="ethereum" class="cards">
                </div>
            </div>
            <div class="exchagnes">
                <h2 class="crypto_name">Lite Coin</h2>
                <div data-id="litecoin" class="cards">
                </div>
            </div>
            <div class="exchagnes">
                <h2 class="crypto_name">Binance</h2>
                <div data-id="binace" class="cards">
                </div>
            </div>
            <div class="exchagnes">
                <h2 class="crypto_name">Cardano</h2>
                <div data-id="cardano" class="cards">
                </div>
            </div>

            <!-- pop up -->
            <div id="overlay"></div>
            <div class="popup">

                <div>
                    <a href="#">
                        <i class="fa-solid fa-xmark" id="close-btn"></i>
                    </a>
                </div>
                <form id="form">
                    
                    <label for="cryoto_name2" class="coiname">COIN </label>
                    <input type="text" name="cryoto_name2" id="crypto_name" required>
                    <br>

                    <label for="crypto">HOW MANY COINS </label>
                    <input type="number" name="crypto" id="no_of_coins" required>
                    <br>

                    <label for="crypto">MONEY </label>
                    <input type="number" name="money" id="money" required>
                    <br>



    
                    <div class="coin">
                        <div class="one_coin">
                            <img src="../Assets/Images/Logo/btc.png" alt="" width="40px" height="40px">
                            <h3>Bitcoin</h3>
                            <h6>BTC</h6>
                        </div>
                        <div class="one_coin">
                            <img src="../Assets/Images/Logo/usdt.png" alt="" width="40px" height="40px">
                            <h3>Tether</h3>
                            <h6>USDT</h6>
                        </div>
                        <div class="one_coin">
                            <img src="../Assets/Images/Logo/eth.png" alt="" width="40px" height="40px">
                            <h3>Ethereum</h3>
                            <h6>ETH</h6>
                        </div>
                        <div class="one_coin">
                            <img src="../Assets/Images/Logo/bnb.png" alt="" width="40px" height="40px">
                            <h3>Binace</h3>
                            <h6>BNB</h6>
                        </div>
                        <div class="one_coin">
                            <img src="../Assets/Images/Logo/doge.png" alt="" width="40px" height="40px">
                            <h3>Doge Coin</h3>
                            <h6>DOGE</h6>
                        </div>
                        <div class="one_coin">
                            <img src="../Assets/Images/Logo/sol.png" alt="" width="40px" height="40px">
                            <h3>Solana</h3>
                            <h6>SOL</h6>
                        </div>
                        <div class="one_coin">
                            <img src="../Assets/Images/Logo/ltc.png" alt="" width="40px" height="40px">
                            <h3>LiteCoin</h3>
                            <h6>LTC</h6>
                        </div>
                        <div class="one_coin">
                            <img src="../Assets/Images/Logo/ada.png" alt="" width="40px" height="40px">
                            <h3>Cardano</h3>
                            <h6>ADA</h6>
                        </div>
                    </div>

                    <button id="sell">Sell</button>
                </form>
            </div>

        </div>
        
        <script src="https://kit.fontawesome.com/ee40c53027.js" crossorigin="anonymous" integrity="">
        </script>

        <script src="../Assets/js/exchange.js"></script>

</body>
</body>
</html>