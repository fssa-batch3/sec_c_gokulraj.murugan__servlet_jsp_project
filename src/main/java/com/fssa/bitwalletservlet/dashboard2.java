package com.fssa.bitwalletservlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.fssa.bitwallet.errors.DaoException;
import com.fssa.bitwallet.model.Currency;
import com.fssa.bitwallet.service.CurrencyService;

/**
 * Servlet implementation class dashboard2
 */
@WebServlet("/dashboard2")
public class dashboard2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public dashboard2() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			List<Currency> currencyList = CurrencyService.readCurrency();

			JSONArray currencyJson = new JSONArray(currencyList);

			response.setContentType("application/json");

		} catch (DaoException e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "Database error: " + e.getMessage());
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub		
		doGet(request, response);
	}

}
