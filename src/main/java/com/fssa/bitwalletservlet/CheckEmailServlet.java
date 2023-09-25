package com.fssa.bitwalletservlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.bitwallet.errors.DaoException;
import com.fssa.bitwallet.errors.InvalidInputException;
import com.fssa.bitwallet.service.UserService;

/**
 * Servlet implementation class CheckEmailServlet
 */
@WebServlet("/CheckEmailServlet")
public class CheckEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CheckEmailServlet() {
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

		PrintWriter out = response.getWriter();

		try {
			
			String email = (String) request.getParameter("email");
			String password = (String)request.getParameter("password");
			boolean result = UserService.checkMailAndPassword(email,password);

			if (email == null || "".equals(email)) {
				out.println("Invalid Email");
				response.sendRedirect("login.jsp?errorMessage=Invalid Email");
			}
			

			else if (password == null || "".equals(password) || password.length() < 6) {
				response.sendRedirect("login.jsp?errorMessage=Invalid Password");
			} 			
			else if(result) {
				
				HttpSession session = request.getSession();
				session.setAttribute("email", email);
				out.println(result);
				out.close();
				out.flush();
			}
			
			out.println(result);
		} catch (InvalidInputException | DaoException e) {

			e.printStackTrace();
		}
	}

}
