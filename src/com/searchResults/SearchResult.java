package com.searchResults;

public class SearchResult {
	private int tripID;
	private int trainID;
	private String frequency;
	private String type;
	private String arrivelTIme;
	private String departureTime;
	private String startFrom;
	private String endAt;
	private String stopTime;
	
	
	
	


	public SearchResult(int tripID, int trainID, String frequency, String type, String arrivelTIme,
			String departureTime, String startFrom, String endAt) {
		super();
		this.tripID = tripID;
		this.trainID = trainID;
		this.frequency = frequency;
		this.type = type;
		this.arrivelTIme = arrivelTIme;
		this.departureTime = departureTime;
		this.startFrom = startFrom;
		this.endAt = endAt;
	}



	public int getTripID() {
		return tripID;
	}


	public int getTrainID() {
		return trainID;
	}


	public String getFrequency() {
		return frequency;
	}


	public String getType() {
		return type;
	}


	public String getArrivelTIme() {
		return arrivelTIme;
	}


	public String getDepartureTime() {
		return departureTime;
	}


	public String getStartFrom() {
		return startFrom;
	}


	public String getEndAt() {
		return endAt;
	}


	public String getStopTime() {
		return stopTime;
	}
	
	
}
