//package com.fssa.bitwalletservlet;
//
//import java.io.IOException;
//import java.sql.SQLException;
//import java.time.LocalDate;
//import java.time.format.DateTimeFormatter;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import com.fssa.bitwallet.errors.DaoException;
//import com.fssa.bitwallet.errors.InvalidInputException;
//import com.fssa.bitwallet.model.User;
//import com.fssa.bitwallet.model.UserRole;
//import com.fssa.bitwallet.service.UserService;
//
//
//
///**
// * Servlet implementation class SignUpServlet
// */
//@WebServlet("/SignUpServlet")
//public class SignUpServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//
//	/**
//	 * @see HttpServlet#HttpServlet()
//	 */
//	public SignUpServlet() {
//		super();
//		
//	}
//
//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
//	 *      response)
//	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}
//
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
//	 *      response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//
//		String userName = request.getParameter("username");
//		String email = request.getParameter("email");
//		String DOB = request.getParameter("date_of_birth");
//		UserRole role = UserRole.valueOf(request.getParameter("type"));
//		String password = request.getParameter("password");
//	
//		DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//		LocalDate dateOfBirth = LocalDate.parse(DOB, dateFormatter);
//
//		User user = new User(userName, email, password, role, dateOfBirth);
//
//		try {
//			UserService.addUser(user);
//			response.sendRedirect("./Login.jsp");
//		} catch (InvalidInputException | DaoException e) {
//			response.getWriter().append(e.getMessage());
//			e.printStackTrace();
//		}
//	}
//
//}
