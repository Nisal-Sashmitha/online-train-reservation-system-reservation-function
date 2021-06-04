package com.Reservation;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.searchResults.SearchResult;


@WebServlet("/ReservationServlet")
public class ReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//get details form search result jsp
		int	tripID = Integer.parseInt(request.getParameter("tripID"));
		int trainID = Integer.parseInt(request.getParameter("trainID"));
		String freequency = request.getParameter("freequency");
		String type = request.getParameter("type");
		String arrivelTime = request.getParameter("arrivelTime");
		String departureTime = request.getParameter("departureTime");
		String startFrom = request.getParameter("startFrom");
		String endAt = request.getParameter("endAt");
		String date = request.getParameter("date");
		int seatclass = Integer.parseInt(request.getParameter("seatclass"));
		
		 
		
		 //get relevent details from the databse using DBUtill classes
		 int NoOfSeatInTheTrainForTheClass=ReservationDBUtill.getNoOfSeatsInAClassInTrain(trainID, seatclass);
		 int NoOfAvailableSeatsInTheTrainForTheClass=ReservationDBUtill.noOfAvailableSeats(tripID, trainID, date, seatclass);
		 double pricePerTicket = ReservationDBUtill.calcPricePerTicket(tripID, startFrom, endAt, seatclass);
		 double pricePerChild = ReservationDBUtill.pricePerchild(tripID, startFrom, endAt, seatclass);
		 double serrviceChargePerPerson = ReservationDBUtill.getServiceChargePerPerson(tripID, startFrom, date, seatclass);
		 
		 System.out.println("All Seats in class 1:"+ReservationDBUtill.getNoOfSeatsInAClassInTrain(trainID, 1));
		 System.out.println("All Seats in class 2:"+ReservationDBUtill.getNoOfSeatsInAClassInTrain(trainID, 2));
		 System.out.println("available seats in class 1:"+ReservationDBUtill.noOfAvailableSeats(tripID, trainID, date, 1));
		 System.out.println("available seats in class 2:"+ReservationDBUtill.noOfAvailableSeats(tripID, trainID, date, 2));
		 System.out.println("price per ticket:"+pricePerTicket);
		 System.out.println("pricePerChild:"+pricePerChild);
		 System.out.println("serrviceChargePerPerson:"+serrviceChargePerPerson);
		 
		 //set details for send reservation jsp
		 request.setAttribute("tripID", tripID);
		 request.setAttribute("trainID", trainID);
		 request.setAttribute("freequency", freequency);
		 request.setAttribute("type", type);
		 request.setAttribute("arrivelTime", arrivelTime);
		 request.setAttribute("departureTime", departureTime);
		 request.setAttribute("startFrom", startFrom);
		 request.setAttribute("endAt", endAt);
		 request.setAttribute("date", date);
		 request.setAttribute("seatclass", seatclass);
		 request.setAttribute("NoOfSeatInTheTrainForTheClass", NoOfSeatInTheTrainForTheClass);
		 request.setAttribute("NoOfAvailableSeatsInTheTrainForTheClass", NoOfAvailableSeatsInTheTrainForTheClass);
		 request.setAttribute("pricePerTicket", pricePerTicket);
		 request.setAttribute("pricePerChild", pricePerChild);
		 request.setAttribute("serrviceChargePerPerson", serrviceChargePerPerson);
		
		 
		 RequestDispatcher dis = request.getRequestDispatcher("reservation.jsp");
		 dis.forward(request, response);
		
	}

}
