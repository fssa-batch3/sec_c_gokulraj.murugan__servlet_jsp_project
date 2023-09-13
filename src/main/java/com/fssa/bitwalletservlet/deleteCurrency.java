//package com.fssa.bitwalletservlet;
//
//import java.io.IOException;
//import java.sql.SQLException;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import com.fssa.bitwallet.errors.DaoException;
//import com.fssa.bitwallet.errors.InvalidInputException;
//import com.fssa.bitwallet.service.CurrencyService;
//
///**
// * Servlet implementation class deleteCurrency
// */
//@WebServlet("/deleteCurrency")
//public class deleteCurrency extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//
//	/**
//	 * @see HttpServlet#HttpServlet()
//	 */
//	public deleteCurrency() {
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
//		int id = Integer.parseInt(request.getParameter("id"));
//
//		try {
//
//			CurrencyService.deleteCurrency(id);
//			response.getWriter().append("success");
//		} catch (DaoException | InvalidInputException e) {
//			response.getWriter().append(e.getMessage());
//		}
//	}
//
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
//	 *      response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//
//		doGet(request, response);
//	}
//
//}
