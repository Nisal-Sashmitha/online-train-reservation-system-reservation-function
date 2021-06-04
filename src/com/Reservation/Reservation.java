package com.Reservation;

public class Reservation {
	private int reservationID;
	private String customerNIC;
	private String email;
	private int tripID;
	private String date;
	private String to;
	private String from;
	private int noOfchilds;
	private int noOfAdults;
	private String reservationStatus;
	private int seatClass;
	private String totalAmmount;
	
	public Reservation(int reservationID, String customerNIC, String email,int tripID, String date, String to, String from,
			int noOfchilds, int noOfAdults, String reservationType, int seatClass, String totalAmmount) {
		super();
		this.reservationID = reservationID;
		this.customerNIC = customerNIC;
		this.email = email;
		this.tripID = tripID;
		this.date = date;
		this.to = to;
		this.from = from;
		this.noOfchilds = noOfchilds;
		this.noOfAdults = noOfAdults;
		this.reservationStatus = reservationType;
		this.seatClass = seatClass;
		this.totalAmmount = totalAmmount;
	}

	
	//getters
	public int getReservationID() {
		return reservationID;
	}

	public String getCustomerNIC() {
		return customerNIC;
	}

	public int getTripID() {
		return tripID;
	}

	public String getDate() {
		return date;
	}

	public String getTo() {
		return to;
	}

	public String getFrom() {
		return from;
	}

	public int getNoOfchilds() {
		return noOfchilds;
	}
	public String getEmail() {
		return email;
	}

	public int getNoOfAdults() {
		return noOfAdults;
	}

	public String getReservationStatus() {
		return reservationStatus;
	}

	public int getSeatClass() {
		return seatClass;
	}

	public String getTotalAmmount() {
		return totalAmmount;
	}
	
	
	
	
	
}
