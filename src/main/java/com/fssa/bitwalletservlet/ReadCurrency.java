package com.fssa.bitwalletservlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.bitwallet.errors.DaoException;
import com.fssa.bitwallet.errors.InvalidInputException;
import com.fssa.bitwallet.model.Currency;
import com.fssa.bitwallet.service.CurrencyService;

@WebServlet("/CurrencyServlet")
public class ReadCurrency extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			List<Currency> currencyList = CurrencyService.readCurrency();

			request.setAttribute("currencyList", currencyList);

		} catch (DaoException e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "Database error: " + e.getMessage());
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("/ListCurrency.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
