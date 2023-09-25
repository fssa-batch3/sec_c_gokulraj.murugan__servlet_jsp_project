package com.fssa.bitwalletservlet;

import java.io.IOException;
import java.io.PrintWriter;

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
			
			HttpSession session = request.getSession();
			
			session.setAttribute("email", email);
			
			response.sendRedirect("ReadProfileServlet");
			
		}

	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		super.doGet(req, resp);
	}

}
