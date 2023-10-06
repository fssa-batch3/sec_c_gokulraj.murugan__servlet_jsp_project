package com.fssa.bitwalletservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.bitwallet.errors.DaoException;
import com.fssa.bitwallet.errors.InvalidInputException;
import com.fssa.bitwallet.model.User;
import com.fssa.bitwallet.service.UserService;

/**
 * Servlet implementation class ProfileUpdateServlet
 */
@WebServlet("/ProfileUpdateServlet")
public class ProfileUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProfileUpdateServlet() {
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
		
		String name = (String) request.getParameter("username");
		String DOB = request.getParameter("dob");
		String email = request.getParameter("email");
		
		DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate dateOfBirth = LocalDate.parse(DOB, dateFormatter);

		
		User user = new User();
		user.setUsername(name);
		user.setDOB(dateOfBirth);
		user.setEmail(email);
		

		try {
			boolean result = UserService.updateUser(user);
			out.print(result);
			out.close();
			out.flush();

		} catch (InvalidInputException | DaoException e) {
			response.getWriter().append(e.getMessage());
			e.printStackTrace();
		}

	}

}
