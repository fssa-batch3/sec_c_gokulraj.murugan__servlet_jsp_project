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

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		PrintWriter out = response.getWriter();
		if (email == null || "".equals(email)) {
			out.println("Invalid Email");
			response.sendRedirect("login.jsp?errorMessage=Invalid Email");
		}

		else if (password == null || "".equals(password) || password.length() < 6) {
			response.sendRedirect("login.jsp?errorMessage=Invalid Password");
		} 
		else {
			out.println("Email and password is valid");
			HttpSession session = request.getSession();
			session.setAttribute("loggedInEmail", email);
//			request.setAttribute("loggedInEmail", email); // Only the next page or servlet can access the request scope attribute values. 
			RequestDispatcher dispatcher = request.getRequestDispatcher("i.jsp");
			
			dispatcher.forward(request, response);
		}

	}

}
