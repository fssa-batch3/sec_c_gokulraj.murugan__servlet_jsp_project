package com.fssa.bitwalletservlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.bitwallet.model.Currency;
import com.fssa.bitwallet.service.CurrencyService;

@WebServlet("/AddCurrency")
public class AddCurrency extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			// Retrieve data from the form
			String name = request.getParameter("name");
			String symbol = request.getParameter("symbol");
			int rank = Integer.parseInt(request.getParameter("rank"));
			double price = Double.parseDouble(request.getParameter("price"));
			double marketCap = Double.parseDouble(request.getParameter("marketCap"));
			double totalSupply = Double.parseDouble(request.getParameter("totalSupply"));
			double maximumSupply = Double.parseDouble(request.getParameter("maximumSupply"));
			double volume24h = Double.parseDouble(request.getParameter("volume24h"));
			double allTimeHigh = Double.parseDouble(request.getParameter("allTimeHigh"));
			double allTimeLow = Double.parseDouble(request.getParameter("allTimeLow"));

			// Create a Currency object
			Currency currency = new Currency();
			currency.setName(name);
			currency.setSymbol(symbol);
			currency.setRank(rank);
			currency.setPrice(price);
			currency.setMarketCap(marketCap);
			currency.setTotalSupply(totalSupply);
			currency.setMaximumSupply(maximumSupply);
			currency.setVolume24h(volume24h);
			currency.setAllTimeHigh(allTimeHigh);
			currency.setAllTimeLow(allTimeLow);

			// Call the service layer to add the currency
			CurrencyService.addCurrency(currency);

			// Redirect to the CurrencyServlet after successfully adding the currency
			response.sendRedirect("CurrencyServlet");
		} catch (Exception e) {
			e.printStackTrace();
			// Handle any errors, you can redirect to an error page or display an error
			response.sendRedirect("AddCurrency.jsp");
		}

	}
}
