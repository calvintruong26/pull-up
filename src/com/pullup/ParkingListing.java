package com.pullup;


import java.sql.Time;

public class ParkingListing {

	int renterID;
	int listingID;
	double price;
	String parkingType;
	String daysAvail;
	Time beginTime;
	Time endTime;
	
	public ParkingListing(){
	
	}

	void setRenterID(int i){
		renterID = i;
	}

	void setListingID(int i){
		listingID = i;
	}
	
	void setPrice(double d)	{
		price = d;
	}
	
	void setParkingType(String s)	{
		parkingType = s;
	}
	
	void setDaysAvail(String s)	{
		daysAvail = s;
	}
	
	void setBeginTime(Time t)	{
		beginTime = t;
	}
	
	void setEndTime(Time t)	{
		endTime = t;
	}
	
	int getRenterID()	{
		return renterID;
	}
	
	int getListinID()	{
		return listingID;
	}
	
	double getPrice()	{
		return price;
	}
	
	String getParkingType()	{
		return parkingType;
	}
	
	Time getBeginTime()	{
		return beginTime;
	}
	
	Time getEndTime()	{
		return endTime;
	}
	
}
