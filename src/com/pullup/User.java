package com.pullup;



public class User {
	
	private int id;
	private String username;
	private String password;
	private String firstName;
	private String lastName;
	private String cityStateZip;
	private String street;
	private String city;
	private String state;
	private String zip;
	private String email;
	
	public User()	{
		
	}
	
	public User(String uName, String pswd, String fName, String lName, String email) {
		// TODO Auto-generated constructor stub
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public int getId() {
		return id;
	}

	public String getEmail(){
		return email;
	}
	
	public void setEmial(String email)	{
		this.email = email;
	}
	
	public String getCity()	{
		return city;
	}
	
	public String getState()	{
		return state;
	}
	
	public String getZip()	{
		return zip;
	}
	
	public void setCity(String city) {
		this.city = city;
	}
	public void setState(String state) {
		this.state = state;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	
	public void setCityStateZip(String cityStateZip)	{
		this.cityStateZip = cityStateZip;
	}
	
	public String getCityStateZip() {
		return cityStateZip;
	}
	
	public String getStreet()	{
		return street;
	}
	
	public void setStreet(String street)	{
		this.street = street;
	}
	
	public String getLastName()	{
		return lastName;
	}
	
	public void setLastName(String lastName)	{
		this.lastName = lastName;
	}
	
	public String getFirstName()	{
		return firstName;
	}
	
	public void setFirstName(String firstName)	{
		this.firstName = firstName;
	}
	
	public void setUsername(String username)	{
		this.username = username;
	}
	
	public String getUsername()	{
		return username;
	}
	
	public String getPassword()	{
		return password;
	}
	
	public void setPassword(String username)	{
		this.password = password;
	}
}
