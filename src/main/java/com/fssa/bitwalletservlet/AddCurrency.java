package com.fssa.bitwalletservlet;

import java.io.IOException;
import java.io.PrintWriter;

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

		PrintWriter out = response.getWriter();
		try {

			// Retrieve data from the form
			String name = request.getParameter("name");
			String symbol = request.getParameter("symbol");
			String logo = request.getParameter("logo");

			// Create a Currency object
			Currency currency = new Currency();
			currency.setName(name);
			currency.setSymbol(symbol);
			currency.setLogo(logo);

			// Call the service layer to add the currency
			CurrencyService.addCurrency(currency);

			// Redirect to the CurrencyServlet after successfully adding the currency
			response.sendRedirect("CurrencyServlet");
			out.println("success");

		} catch (Exception e) {
			
			out.println(e.getMessage());
			out.flush();
			out.close();
			// Handle any errors, you can redirect to an error page or display an error

		}

	}
}
