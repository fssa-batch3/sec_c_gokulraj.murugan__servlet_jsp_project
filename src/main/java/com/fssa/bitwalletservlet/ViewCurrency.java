package com.fssa.bitwalletservlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.bitwallet.errors.DaoException;
import com.fssa.bitwallet.errors.InvalidInputException;
import com.fssa.bitwallet.model.Currency;
import com.fssa.bitwallet.service.CurrencyService;

/**
 * Servlet implementation class ViewCurrency
 */
@WebServlet("/ViewCurrency")
public class ViewCurrency extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ViewCurrency() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	  protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	
		  String currencyName = request.getParameter("name");

	        try {
	            // Retrieve the currency details using the findCurrenciesByName method
	            Currency currency = CurrencyService.findByName(currencyName);

	            // Set the currency object as a request attribute
	            request.setAttribute("currency", currency);

	            // Forward the request to the JSP page
	            request.getRequestDispatcher("/viewCurrency.jsp").forward(request, response);
	        } catch (DaoException | InvalidInputException e) {
	            // Handle any exceptions (e.g., currency not found)
	            e.printStackTrace();
	            response.getWriter().write("An error occurred: " + e.getMessage());
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
