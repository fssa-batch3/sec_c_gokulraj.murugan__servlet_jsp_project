package com.fssa.bitwalletservlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.bitwallet.model.Currency;
import com.fssa.bitwallet.service.CurrencyService;

@WebServlet("/UpdateCurrencyServlet")
public class UpdateCurrencyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String name = request.getParameter("name");
			String symbol = request.getParameter("symbol");
			String logo = request.getParameter("logo");

			Currency currency = new Currency();
			currency.setName(name);
			currency.setSymbol(symbol);
			currency.setLogo(logo);
			

			// Update the currency record in the database
			boolean updated = CurrencyService.updateCurrency(currency);

			if (updated) {
				// Redirect to a success page
				response.sendRedirect("CurrencyServlet");
			} else {
				// Redirect to an error page
				response.sendRedirect("index.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
			// Handle any errors, you can redirect to an error page or display an error
			// message
			response.sendRedirect("index.jsp");
		}
	}
}
