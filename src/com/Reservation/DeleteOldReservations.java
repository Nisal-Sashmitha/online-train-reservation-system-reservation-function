package com.Reservation;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteOldReservations
 */
@WebServlet("/DeleteOldReservations")
public class DeleteOldReservations extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//get details
		String date=request.getParameter("finalDate");
		int affectedRows=ReservationDBUtill.deleteOldReservations(date);
		
		//set details
		request.setAttribute("affectedRows", affectedRows);
		request.setAttribute("status", 1);
		
		//dipature
		RequestDispatcher dis = request.getRequestDispatcher("deleteOldRecords.jsp");
		dis.forward(request, response);
	}

}
