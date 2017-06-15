package com.pullup;

public class Listing {
	private int listingID;
	private String listingName;
	private String address;
	private double price;
	private String parkingType;
	private String timeAvailable;
	private String availableTill;
	private int renterID;
	private int tenantID;
	private String renterPhoneNumber;
	private String tenantPhoneNumber;
	private String renterName;
	private String tenantName;
	
	
	public Listing() {
		
	}
	
	public Listing(int listingID, String listingName, String address, double price, String parkingType, String timeAvailable, String availableTill, int renterID) {
		this.listingID = listingID;
		this.listingName = listingName;
		this.address = address;
		this.price = price;
		this.parkingType = parkingType;
		this.timeAvailable = timeAvailable;
		this.availableTill = availableTill;
		this.renterID = renterID;
		//this.renterPhoneNumber = renterPhoneNumber;
		//this.tenantID = tenantID;
	}
	
	public int getListingID() {
		return listingID;
	}
	
	public String getListingName() {
		return listingName;
	}
	
	public String getAddress() {
		return address;
	}
	
	public double getPrice() {
		return price;
	}
	
	public String getParkingType() {
		return parkingType;
	}
	
	public String getTimeAvailable() {
		return timeAvailable;
	}
	
	public String getAvailableTill() {
		return availableTill;
	}
	
	public int getRenterID() {
		return renterID;
	}
	
	public int getTenantID() {
		return tenantID;
	}
	
	public void setRenterID(int id) {
		this.renterID = id;
	}
	
	public void setTenantID(int id) {
		this.tenantID = id;
	}
	
	public void setRenterPhoneNumber(String renterPhoneNumber) {
		this.renterPhoneNumber = renterPhoneNumber;
	}
	
	public String getRenterPhoneNumber() {
		return this.renterPhoneNumber;
	}
	
	public void setTenantPhoneNumber(String tenantPhoneNumber) {
		this.tenantPhoneNumber = tenantPhoneNumber;
	}
	
	public String getTenantPhoneNumber() {
		return this.tenantPhoneNumber;
	}
	
	public String getRenterName() {
		return renterName;
	}
	
	public String getTenantName() {
		return tenantName;
	}
	
	public void setRenterName(String name) {
		this.renterName = name;
	}
	
	public void setTenantName(String name) {
		this.tenantName = name;
	}
}

