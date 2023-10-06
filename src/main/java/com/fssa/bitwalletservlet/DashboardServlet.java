package com.fssa.bitwalletservlet;

import java.io.IOException;
import java.io.PrintWriter;
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
import com.fssa.bitwallet.model.Currency;
import com.fssa.bitwallet.model.User;
import com.fssa.bitwallet.service.CurrencyService;
import com.fssa.bitwallet.service.UserService;

/**
 * Servlet implementation class DashboardServlet
 */
@WebServlet("/DashboardServlet")
public class DashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DashboardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession(false);
		
		PrintWriter out = response.getWriter();
		
		String email = (String)session.getAttribute("email");		
		
		System.out.println(email);
		
		try {

			User user = UserService.getUserbyEmail(email); 
			
			List<Currency> currencyList = CurrencyService.readCurrency();
			System.out.println(currencyList.get(0).getName());
			
			System.out.println();
			request.setAttribute("currencyList", currencyList);
			
			request.setAttribute("username", user.getUsername());

		} catch (InvalidInputException | DaoException e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "Database error: " + e.getMessage());
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("/dashboard.jsp");
		dispatcher.forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
