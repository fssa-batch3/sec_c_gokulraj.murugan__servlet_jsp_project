package com.fssa.bitwalletservlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.bitwallet.errors.DaoException;
import com.fssa.bitwallet.errors.InvalidInputException;
import com.fssa.bitwallet.model.Balance;
import com.fssa.bitwallet.model.Transaction;
import com.fssa.bitwallet.service.BalanceService;
import com.fssa.bitwallet.service.CurrencyService;
import com.fssa.bitwallet.service.TransactionService;

/**
 * Servlet implementation class PaymentMethodServlet
 */
@WebServlet("/PaymentMethodServlet")
public class PaymentMethodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PaymentMethodServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		Transaction trans = (Transaction) session.getAttribute("Transaction");

		session.removeAttribute("Transaction");

		String method = (String) request.getParameter("radio");

		try {

			Balance balance = new Balance();
			balance.setCurrency(CurrencyService.findById(trans.getCurrencyId()));
			balance.setUserId(trans.getUserId());
			balance.setBalance(trans.getQuantity());

			trans.setTransactionMethod(method);

			TransactionService.addTransaction(trans);

			BalanceService.addBalance(balance);

			response.sendRedirect("./DashboardServlet");
		} catch (DaoException | InvalidInputException e) {

			e.printStackTrace();
		}

	}

}
