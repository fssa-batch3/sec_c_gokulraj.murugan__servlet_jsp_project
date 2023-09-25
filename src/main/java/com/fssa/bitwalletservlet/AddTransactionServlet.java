package com.fssa.bitwalletservlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.bitwallet.dao.CurrencyDao;
import com.fssa.bitwallet.dao.UserDAO;
import com.fssa.bitwallet.errors.DaoException;
import com.fssa.bitwallet.errors.InvalidInputException;
import com.fssa.bitwallet.model.Transaction;
import com.fssa.bitwallet.service.CurrencyService;

/**
 * Servlet implementation class AddTransaction
 */
@WebServlet("/AddTransactionServlet")
public class AddTransactionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddTransactionServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		String email = (String) session.getAttribute("email");

		String quantity_st = request.getParameter("quantity");
		String amount_st = request.getParameter("amount");
		String currencyName = (String) request.getParameter("currency");


		try {
			

			int currencyId = CurrencyService.findIdByName(currencyName);

			int sellerId = 1;
			
			int userId = UserDAO.getIdByEmail(email);

			double quantity = Double.parseDouble(quantity_st);
			
			double amount = Double.parseDouble(amount_st);

			Transaction trans = new Transaction();
			trans.setUserId(userId);
			trans.setCurrencyId(currencyId);
			trans.setAmount(amount);
			trans.setQuantity(quantity);
			trans.setSellerId(sellerId);

	
			session.setAttribute("Transaction", trans);



		} catch (InvalidInputException | DaoException e) {

			e.printStackTrace();
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("paymentmethod.jsp");
		dispatcher.forward(request, response);

	}

}
