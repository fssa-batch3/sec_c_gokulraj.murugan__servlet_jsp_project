<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bitwallet</title>
<link rel="stylesheet" href="assets/css/paymentmethod.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="all">

		 <div class="payment-container">
            <h1>Payment Form</h1>
            <form id="payment-form" action="PaymentMethodServlet" method="POST">
                <label for="payment-method">Select Payment Method:</label>
                <input type="radio" name="radio" id="paypal" onclick="disp();"><label for="radio" value="Paypal">PayPal</label> 
                <input type="radio" name="radio" id="card" onclick="dis();"><label for="radio" vlaue="CARDS">Cards</label>
                
                <br><br>
    
                <div class="container" >
                    <div id="Checkout" class="inline">
                        <h1>Payment </h1>
                        <div class="card-row">
                            <span class="visa"></span>
                            <span class="mastercard"></span>
                            <span class="amex"></span>
                            <span class="discover"></span>
                        </div>
                       
                            <!-- <div class="form-group">
                                <label for="PaymentAmount">Payment amount</label>
                                <div class="amount-placeholder">
                                    <span>$</span>
                                    <span>500.00</span>
                                </div>
                            </div> -->
                            <div class="form-group">
                                <label or="NameOnCard">Name on Card :</label>
                                <input id="NameOnCard" class="form-control" type="text" maxlength="255"></input>
                            </div>
                            <br>
                            <div class="form-group">
                                <label for="CreditCardNumber">Card Number :</label>
                                <input id="CreditCardNumber" class="null card-image form-control" type="text"></input>
                            </div>
                            <br>
                            <div class="expiry-date-group form-group" style="padding-right:  10px;">
                                <label for="ExpiryDate">Expiry Date :</label>
                                <input id="ExpiryDate" class="form-control" type="date" placeholder="MM / YY" maxlength="7"></input>

                            </div>
                            
                            <div class="security-code-group form-group">
                                <label for="SecurityCode">Security Code :</label>
                                <div class="input-container" >
                                    <input id="SecurityCode" class="form-control" type="text" ></input>
                                    <!-- <i id="cvc" class="fa fa-question-circle"></i> -->
                                </div>
                                <!-- <div class="cvc-preview-container two-card hide">
                                    <div class="amex-cvc-preview"></div>
                                    <div class="visa-mc-dis-cvc-preview"></div>
                                </div> -->

                                <br>
                            </div>
                            
                      
                            
                  
                    </div>
                  </div>
                  <button type="submit" id="pay-button" >Pay Now</button>
            </form>
        </div>

    </div>
    <script>
    	
  
    	
        function dis() {
        	
   
        	
        	
            var containers = document.getElementsByClassName("container");
            
            for (var i = 0; i < containers.length; i++) {
                    containers[i].style.display = "block";
                    
                    
            }
            
            
        }

        function disp() {
            var containers = document.getElementsByClassName("container");
            for (var i = 0; i < containers.length; i++) {
                containers[i].style.display = "none";
            }
        }

    </script>
    <script src="https://kit.fontawesome.com/ee40c53027.js" crossorigin="anonymous" integrity="">
    </script>
    </body>
</html>