package com.Reservation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.searchResults.SearchResult;



public class ReservationDBUtill {

	

	//method to get No of seats assigned to the train for a perticuler class
	public static int getNoOfSeatsInAClassInTrain(int trainid,int trainclass) {
				
				//build connection
				String url = "jdbc:mysql://localhost:3306/onlinetrainreservationsystem";
				String user = "root";
				String password = "root";
				int noOfSeats=0;
				
				//search and assign details
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection com = DriverManager.getConnection(url,user,password);
					Statement stmt = com.createStatement();
					String sql = "SELECT sum(num_seats) FROM compartment where train_id='"+trainid+"' and class='"+trainclass+"';";
					ResultSet rs = stmt.executeQuery(sql);
					
					if(rs.next()) {
						
						noOfSeats = rs.getInt(1);
						
					}
					
					
					
					
					
				}catch(Exception e){
					
					e.printStackTrace();
				}
				
		return noOfSeats;
	}
	
	
	//calculate no of available seats*******************************************************************
	public static int noOfAvailableSeats(int tripID,int trainid, String date,int trainclass) {
		
		
		String url = "jdbc:mysql://localhost:3306/onlinetrainreservationsystem";
		String user = "root";
		String password = "root";
		int noOfSoldClassSeats=0;
		int availableSeatsInclass=0;
		//search
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection com = DriverManager.getConnection(url,user,password);
			Statement stmt = com.createStatement();
			String sql = "SELECT sum(noOfchilds+noOfAdults) FROM reservation where tripID='"+tripID+"' and date='"+date+"' and seatClass='"+trainclass+"';";
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				
				noOfSoldClassSeats = rs.getInt(1);
				
			}
			
			availableSeatsInclass = getNoOfSeatsInAClassInTrain(trainid,trainclass)-noOfSoldClassSeats;
			
			
			
		}catch(Exception e){
			
			e.printStackTrace();
		}
		
		return availableSeatsInclass;
	}
	
	
	
	
	//calculate ticket price per Person****************************************************************
	
	public static double calcPricePerTicket(int tripID,String from, String to,int seatClass) {
		
		
		String url = "jdbc:mysql://localhost:3306/onlinetrainreservationsystem";
		String user = "root";
		String password = "root";
		int fromIndex=0;
		int toIndex=0;
		int indexDeference;
		double seatClassRate =0;
		double pricePerAdultTicket=0;
		
		
		//search
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection com = DriverManager.getConnection(url,user,password);
			Statement stmt = com.createStatement();
			
			
			//get start Location start arrivingIndex for calculate ticket price
			String sql = "SELECT arrivingIndex FROM onlinetrainreservationsystem.trainstation where tripID = '"+tripID+"' and stationName = '"+from+"';";
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				
				fromIndex = rs.getInt(1);
				
			}
			
			
			//get destination Location arrivingIndex for calculate ticket price
			sql = "SELECT arrivingIndex FROM trainstation where tripID = '"+tripID+"' and stationName = '"+to+"';";
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				
				toIndex = rs.getInt(1);
				
			}
			
			//deference between to index and from index for calculate the ticket price
			indexDeference=toIndex-fromIndex;
		
			
			//get compartment seat rate of relevant class for calculate ticket price
			sql = "select avg(price) from optrain o ,compartment c,trip t where o.train_id = c.train_id and t.trainID = o.train_ID and t.tripID='"+tripID+"' and c.class='"+seatClass+"';";
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				
				seatClassRate = rs.getDouble(1);
				
			}
			
			pricePerAdultTicket = indexDeference*seatClassRate;
			
		}catch(Exception e){
			
			e.printStackTrace();
		}
		
		return pricePerAdultTicket;
	}
	
	
	//calculate ticket price per child******************************************************************
	public static double pricePerchild(int tripID,String from, String to,int seatClass) {
		
		
		//70% from adult ticket is the price of child ticket 
		//calculate here
		double pricePerChild = calcPricePerTicket(tripID,from, to,seatClass)*0.7;
		
		
		return pricePerChild;
	}
	public static double getServiceChargePerPerson(int tripID,String from, String to,int seatClass) {
		
		
		//get compartment seat rate of relevant class for calculate ticket price
		String url = "jdbc:mysql://localhost:3306/onlinetrainreservationsystem";
		String user = "root";
		String password = "root";
		double serviceCharge=0;
		double seatClassRate=0;
		//search
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection com = DriverManager.getConnection(url,user,password);
			Statement stmt = com.createStatement();
			String sql = "select avg(price) from optrain o ,compartment c,trip t where o.train_id = c.train_id and t.trainID = o.train_ID and t.tripID='"+tripID+"' and c.class='"+seatClass+"';";
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()) {
				
				seatClassRate = rs.getDouble(1);
				
			}
			serviceCharge=seatClassRate*3;
			
			
			
			
			
		}catch(Exception e){
			
			e.printStackTrace();
		}
		
		return serviceCharge;
	}
	
	
	
	//add Reservation to database method********************************************************************************
	
	public static void setReservation(String customerNIC, String email, int tripID, String date, String endAt, String startFrom, int quantityChild, int adultquantity, String reservationStatus, int seatclass, double fullTotal) {
		
		
		
		String url = "jdbc:mysql://localhost:3306/onlinetrainreservationsystem";
		String user = "root";
		String password = "root";
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection com = DriverManager.getConnection(url,user,password);
			Statement stmt = com.createStatement();
			
			String sql = "INSERT INTO reservation (`customeNIC`, `email`, `tripID`, `date`, `to`, `from`, `noOfchilds`, `noOfAdults`, `reservationStatus`, `seatClass`, `totalAmmount`) VALUES ('"+customerNIC+"', '"+email+"', '"+tripID+"', '"+date+"', '"+endAt+"', '"+startFrom+"', '"+quantityChild+"', '"+adultquantity+"', '"+reservationStatus+"', '"+seatclass+"', '"+fullTotal+"');";
			int rs = stmt.executeUpdate(sql);
			
			
			if(rs>0) {
				System.out.println("\ninsertion successfull!!\n");
			}else {
				System.out.println("\ninsertion not successfull!!\n");
			}
			
			
			
			
			
		}catch(Exception e){
			
			e.printStackTrace();
		}
		
		
	}
	
	
	
	//get all the completed reservations************************************************************************
	
	public static List<Reservation> showReservations(){
		ArrayList<Reservation> searchResult = new ArrayList<>();
		
		//create database connection
		String url = "jdbc:mysql://localhost:3306/onlinetrainreservationsystem";
		String user = "root";
		String password = "root";
		
		//search
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection com = DriverManager.getConnection(url,user,password);
			Statement stmt = com.createStatement();
			Statement stmt2 = com.createStatement();
			String sql = "select * From reservation where reservationStatus='completed';";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				
				int reservationID = rs.getInt(1);
				String customerNIC = rs.getString(2);
				String email = rs.getString(3);
				int tripID =  rs.getInt(4);
				String date = rs.getString(5);
				String endAt = rs.getString(6);
				String startFrom = rs.getString(7);
				int noOfchilds = rs.getInt(8);
				int noOfAdults = rs.getInt(9);
				String reservationStatus = rs.getString(10);
				int seatClass  = rs.getInt(11);
				String totalAmmount  = rs.getString(12);
				
				
				Reservation sRObj = new Reservation(reservationID,customerNIC,email,tripID,date,endAt,startFrom,noOfchilds,noOfAdults,reservationStatus,seatClass,totalAmmount);
				searchResult.add(sRObj);
				
				
				
			}
			
			
			
			
			
		}catch(Exception e){
			
			e.printStackTrace();
		}
		
		//crate object
		
		return searchResult;
		
		
	}
	
	
	//update a reservation as refunded**************************************************************
	
	public static void updateAsrefunded(String reservationID) {
		
		
		//get compartment seat rate of relevant class for calculate ticket price
		String url = "jdbc:mysql://localhost:3306/onlinetrainreservationsystem";
		String user = "root";
		String password = "root";
		
		//search
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection com = DriverManager.getConnection(url,user,password);
			Statement stmt = com.createStatement();
			
			String sql = "UPDATE `onlinetrainreservationsystem`.`reservation` SET `reservationStatus` = 'refunded' WHERE `reservationID` = '"+reservationID+"';";
			System.out.println("\ninsertion not successfull!!\n");
			int rs = stmt.executeUpdate(sql);
			System.out.println("\ninsertion not successfull!!\n");
			
			if(rs>0) {
				System.out.println("\ninsertion successfull!!\n");
			}else {
				System.out.println("\ninsertion not successfull!!\n");
			}
			
			
			
			
			
		}catch(Exception e){
			
			e.printStackTrace();
		}
		
		
	}
	
	//delete old reservations
	
	public static int deleteOldReservations(String date) {
		
		
		
		String url = "jdbc:mysql://localhost:3306/onlinetrainreservationsystem";
		String user = "root";
		String password = "root";
		int noOfAffectedRows = 0;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection com = DriverManager.getConnection(url,user,password);
			Statement stmt = com.createStatement();
			
			
			String sql = "SELECT count(*) FROM reservation WHERE date<'"+date+"';";
			ResultSet rss = stmt.executeQuery(sql);
			
				if(rss.next()) {
				
					noOfAffectedRows = rss.getInt(1);
					
				}
			
			
			
			sql = "DELETE FROM reservation WHERE date<'"+date+"';";
			int rs = stmt.executeUpdate(sql);
			
			
			
			if(rs>0) {
				System.out.println("\ninsertion successfull!!\n");
			}else {
				System.out.println("\ninsertion not successfull!!\n");
			}
			
			
			
			
			
		}catch(Exception e){
			
			e.printStackTrace();
		}
		
		return noOfAffectedRows;
	}
	
	
	

}
