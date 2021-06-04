package com.Reservation;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ShowReservations")
public class ShowReservations extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//start to work form the reques of admin panel and send details to refunds jsp
		
		//get all completed reservations and send
		
		try {
			List<Reservation> reservations= ReservationDBUtill.showReservations();
			request.setAttribute("reservations", reservations);
			for( Reservation strDay : reservations ){
			    System.out.println(strDay.getReservationID());
			}
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("in here..............");
		}
		request.setAttribute("status", 0);
		RequestDispatcher dis = request.getRequestDispatcher("refunds.jsp");
		dis.forward(request, response);
	}

}
