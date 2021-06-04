package com.Reservation;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/RefundedServlet")
public class RefundedServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//get reservation id and call update method
		String id = request.getParameter("reservationID");
		ReservationDBUtill.updateAsrefunded(id);
		
		try {
			
			//take all completed reservations and set
			List<Reservation> reservations= ReservationDBUtill.showReservations();
			request.setAttribute("reservations", reservations);
			
			
		}catch(Exception e){
			e.printStackTrace();
			
		}
		
		
		//set details to refunds.jsp and dispatch
		request.setAttribute("status", 1);
		request.setAttribute("updatedID", id);
		RequestDispatcher dis = request.getRequestDispatcher("refunds.jsp");
		dis.forward(request, response);
		
	}

}
