package com.Reservation;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ReserveServlet")
public class ReserveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//get details from reservation jsp
		String customerNIC = request.getParameter("customerNIC");
		System.out.println("NIC OK:"+customerNIC);
		String email = request.getParameter("email");
		System.out.println("email OK:"+email);
		int	tripID = Integer.parseInt(request.getParameter("tripID"));
		System.out.println("tripID OK:"+tripID);
		String date = request.getParameter("date");
		System.out.println("date OK:"+date);
		String endAt = request.getParameter("endAt");
		System.out.println("endAt OK:"+endAt);
		String startFrom = request.getParameter("startFrom");
		System.out.println("startFrom OK:"+startFrom);
		int quantityChild = Integer.parseInt(request.getParameter("quantityChild"));
		System.out.println("quantityChild OK:"+quantityChild);
		int adultquantity = Integer.parseInt(request.getParameter("quantity"));
		System.out.println("adultquantity OK:"+adultquantity);
		String reservationStatus ="incompleted";
		int seatclass = Integer.parseInt(request.getParameter("seatclass"));
		double fullTotal = Double.parseDouble(request.getParameter("fullTotal"));
		System.out.println("fullTotal OK:"+fullTotal);
		
		
		//send reservation details to db
		ReservationDBUtill.setReservation(customerNIC, email,tripID, date, endAt, startFrom, quantityChild, adultquantity, reservationStatus, seatclass, fullTotal);
		
		RequestDispatcher dis = request.getRequestDispatcher("reservationSuccesfull.jsp");
		dis.forward(request, response);
		
		
	}

}
