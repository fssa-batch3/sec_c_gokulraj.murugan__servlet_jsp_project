<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Currency</title>
    <link rel = "stylesheet" href="./assets/css/addCurrency.css">
</head>
<body>
    <h1>Add Currency</h1>

    <form action="AddCurrency" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br><br>
        
        <label for="symbol">Symbol:</label>
        <input type="text" id="symbol" name="symbol" required><br><br>
        
        <label for="rank">Rank:</label>
        <input type="number" id="rank" name="rank" required><br><br>
        
        <label for="price">Price:</label>
        <input type="number"  id="price" name="price" required><br><br>
        
        <label for="marketCap">Market Cap:</label>
        <input type="number" id="marketCap" name="marketCap" required><br><br>
        
        <label for="totalSupply">Total Supply:</label>
        <input type="number"  id="totalSupply" name="totalSupply" required><br><br>
        
        <label for="maximumSupply">Maximum Supply:</label>
        <input type="number"  id="maximumSupply" name="maximumSupply" required><br><br>
        
        <label for="volume24h">24h Volume:</label>
        <input type="number"  id="volume24h" name="volume24h" required><br><br>
        
        <label for="allTimeHigh">All-Time High:</label>
        <input type="number"  id="allTimeHigh" name="allTimeHigh" required><br><br>
        
        <label for="allTimeLow">All-Time Low:</label>
        <input type="number"  id="allTimeLow" name="allTimeLow" required><br><br>
        
        <button type="submit">Submit</button>
    </form>
</body>
</html>
