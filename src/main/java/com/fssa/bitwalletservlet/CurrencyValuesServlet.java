package com.fssa.bitwalletservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CurrencyValuesServlet
 */
@WebServlet("/CurrencyValuesServlet")
public class CurrencyValuesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CurrencyValuesServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();

		String symbol = request.getParameter("symbol");
		try {
			// CoinLib API URL
			String apiUrl = "https://coinlib.io/api/v1/coin?key=0f699c336c04344a&pref=INR&symbol="+symbol;

			// Create a URL object
			URL url = new URL(apiUrl);

			// Open a connection to the URL
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();

			// Set the request method to GET
			connection.setRequestMethod("GET");

			// Get the response from the API
			Scanner scanner = new Scanner(connection.getInputStream());
			StringBuilder jsonResponse = new StringBuilder();

			while (scanner.hasNextLine()) {
				jsonResponse.append(scanner.nextLine());
			}
			scanner.close();

			// Send the JSON response to the client
			out.print(jsonResponse.toString());
		} catch (Exception e) {
			e.printStackTrace();
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		} finally {
			out.close();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
