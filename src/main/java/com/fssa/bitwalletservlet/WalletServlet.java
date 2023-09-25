package com.fssa.bitwalletservlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
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
import com.fssa.bitwallet.service.TransactionService;
import com.fssa.bitwallet.service.UserService;

/**
 * Servlet implementation class WalletServlet
 */
@WebServlet("/WalletServlet")
public class WalletServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WalletServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		
		String email = (String)session.getAttribute("email");
		
		
		try {
			int id = UserService.getIdByEmail(email);
			
			List<Transaction> trans = TransactionService.readTransatByUserId(id);
			
			List<Balance> balance = BalanceService.readBalanceById(id);
			
			
			request.setAttribute("Transaction", trans);
			
			request.setAttribute("balance", balance);

			RequestDispatcher dispatcher = request.getRequestDispatcher("/wallet.jsp");
			dispatcher.forward(request, response);
			
			
		} catch (InvalidInputException | DaoException e) {

			e.printStackTrace();
		}
		
	} 

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
