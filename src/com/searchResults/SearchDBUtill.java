package com.searchResults;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.Statement;




public class SearchDBUtill {
	
	
	//search trips for search results jsp
	public static List<SearchResult> search(String from, String to){
		ArrayList<SearchResult> searchResult = new ArrayList<>();
		
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
			System.out.println("here lastqqq");
			String sql = "SELECT * FROM trainstation s,trainstation b where s.stationName='"+from+"' and b.stationName ='"+to+"' and s.tripID = b.tripID and s.arrivingIndex<b.arrivingIndex;";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				
				int tripID = rs.getInt(1);
				String startStation = rs.getString(2);
				String arrivalTime = rs.getString(3);
				String depatureTime = rs.getString(4);
				int trainID=0 ;
				String frequency=null;
				String type=null;
				
				
				
				ResultSet innerRs = stmt2.executeQuery("select * from trip where tripID='"+tripID+"'");
				if(innerRs.next()) {
					trainID=innerRs.getInt(2);
					frequency= innerRs.getString(3);
					type = innerRs.getString(4);
					
					
				}
				System.out.println(tripID);
				SearchResult sRObj = new SearchResult(tripID,trainID,frequency,type,arrivalTime,depatureTime,startStation,to);
				searchResult.add(sRObj);
				
				
			}
			
			
			
			
			
		}catch(Exception e){
			
			e.printStackTrace();
		}
		
		//crate object
		
		return searchResult;
		
		
	}
	
	
	//get staions name for search form
	public static List<String> getStations(){
		ArrayList<String> searchResult = new ArrayList<>();
		
		//create database connection
		String url = "jdbc:mysql://localhost:3306/onlinetrainreservationsystem";
		String user = "root";
		String password = "root";
		
		//search
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection com = DriverManager.getConnection(url,user,password);
			Statement stmt = com.createStatement();
			String sql = "SELECT distinct stationName FROM onlinetrainreservationsystem.trainstation order by stationName asc;";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				searchResult.add(rs.getString(1));
				
				
				
				
				
			}
			
			
			
			
			
		}catch(Exception e){
			
			e.printStackTrace();
		}
		
		
		
		return searchResult;
		
		
	}
	
	
}
