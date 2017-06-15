package com.pullup;


public class Renter {

	int uID;
	int renterID;
	String street;
	String city;
	String state;
	int zip;
	
	public Renter()	{
		
	}
	
	void setUID(int i)	{
		uID = i;
	}
	
	void setRenterID(int i)	{
		renterID = i;
	}
	
	void setStreet(String s)	{
		street = s;
	}
	
	void setCity(String s)	{
		city = s;
	}
	
	void setState(String s)	{
		state = s;
	}
	
	void setZip(int i)	{
		zip = i;
	}
	
	int getUID()	{
		return uID;
	}
	
	int getRenterID()	{
		return renterID;
	}
	
	String getStreet()	{
		return street;
	}
	
	String getCity()	{
		return city;
	}
	
	String getState()	{
		return state;
	}
	
	int getZip()	{
		return zip;
	}
	
}
