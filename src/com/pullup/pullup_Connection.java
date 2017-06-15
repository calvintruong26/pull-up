package com.pullup;

import java.sql.*;
import java.util.ArrayList;

class pullup_Connection {
	// JDBC driver name and database URL
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	static final String DB_URL = "jdbc:mysql://localhost:3306/PULLUP";
	
	//  Database credentials
	static final String USER = "root";
	static final String PASS = "cs157a"; // need to enter your password for mysql
	private static Connection conn = null;
	private static PreparedStatement preparedStatement = null;
	
	
	public pullup_Connection() throws SQLException	{
		try	{
			Class.forName(JDBC_DRIVER);
			System.out.println("Connecting to database....");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			
			getUsers();
			getRenters();
			getParkingListings();
			
			insertIntoUser("Student5", "student5@sjsu.edu", "cs160", 0, "junior", "sjsu");
		}
		catch(SQLException se){se.printStackTrace();}
		catch(Exception e)	{
			e.printStackTrace();
		}
		finally	{
			try{ if(preparedStatement!=null) preparedStatement.close(); }
			catch(SQLException se2){ }// nothing we can do

			try{ if(conn!=null) conn.close(); }
			catch(SQLException se){ se.printStackTrace(); }
		}
	}
	
	public static ArrayList<User> getUsers()	throws SQLException{
		ArrayList<User> tempList = new ArrayList<User>();
		String sql = "SELECT * FROM USER";
		Statement statement = conn.createStatement();
		ResultSet rs = statement.executeQuery(sql);
			
		while(rs.next())	{
			int uID = rs.getInt("uID");
			String uName = rs.getString("uUsername");
			String email = rs.getString("uEmail");
			String pswd = rs.getString("uPWord");
			int renter = rs.getInt("uRenter");
			String fName = rs.getString("uFname");
			String lName = rs.getString("uLname");
			
			User temp = new User(uName, pswd, fName, lName, email);
			tempList.add(temp);
			
			//System.out.println(uID + " "+ uName + " " + email + " " + pswd + " " + renter + " " + fName + " " + lName);
		}
		return tempList;
	}
	
	public static void getRenters()	throws SQLException{
		String sql = "SELECT * FROM RENTER";
		Statement statement = conn.createStatement();
		ResultSet rs = statement.executeQuery(sql);
			
		while(rs.next())	{
			int uID = rs.getInt("uID");
			int renterID = rs.getInt("rRenterID");
			String street = rs.getString("rStreet");
			String city = rs.getString("rCity");
			String state = rs.getString("rState");
			int zip = rs.getInt("rZip");
				
			System.out.println(uID + " " + renterID + " " + street + " " + city + " " + state + " " + zip);
		}
	}
	
	public static void getParkingListings()	throws SQLException{
		String sql = "SELECT * FROM PARKINGLISTING";
		Statement statement = conn.createStatement();
		ResultSet rs = statement.executeQuery(sql);
			
		while(rs.next())	{
			int renterID = rs.getInt("rRenterID");
			int listingID = rs.getInt("listingID");
			double price = rs.getDouble("price");
			String parkingType = rs.getString("parkingType");
			String daysAvail = rs.getString("daysAvailable");
			Time availableWhen = rs.getTime("timeAvailable");
			Time availableTill = rs.getTime("availableTill");
			
			System.out.println(renterID + " " + listingID + " " + price + " " + parkingType + " " + daysAvail + " " + availableWhen + " " + availableTill);
		}
	}
	
	public static void insertIntoUser(String uname, String uEmail, String upswd, int renter, String fName, String lName) throws SQLException	{
		String sql = "INSERT INTO USER(uUsername, uEmail, uPWord, uRenter, uFname, uLname)"
				+ "VALUES (?, ?, ?, ?, ?, ?)";
		preparedStatement = conn.prepareStatement(sql);
		preparedStatement.setString(1, uname);
		preparedStatement.setString(2, uEmail);
		preparedStatement.setString(3, upswd);
		preparedStatement.setInt(4, renter);
		preparedStatement.setString(5, fName);
		preparedStatement.setString(6, lName);
		
		preparedStatement.executeUpdate();
	}
	
	public static void insertIntoRenter(String street, String city, String state, String zip) throws SQLException	{
		String sql = "INSERT INTO RENTER(rStreet, rCity, rState, rZip)"
				+ "VALUES (?, ?, ?, ?)";
		preparedStatement = conn.prepareStatement(sql);
		preparedStatement.setString(1, street);
		preparedStatement.setString(2, city);
		preparedStatement.setString(3, state);
		preparedStatement.setString(4, zip);
		
		preparedStatement.executeUpdate();
	}
	
	public static void insertIntoParkingListing(double price, String parkingType, String daysAvailable,Time timeAvailable, Time availableTill) throws SQLException	{
		String sql = "INSERT INTO PARKINGLISTING(price, parkingType, daysAvailable, timeAvailable, availableTill)"
				+ "VALUES (?, ?, ?, ?, ?)";
		preparedStatement = conn.prepareStatement(sql);
		preparedStatement.setDouble(1, price);
		preparedStatement.setString(2, parkingType);
		preparedStatement.setString(3, daysAvailable);
		preparedStatement.setTime(4, timeAvailable);
		preparedStatement.setTime(5, availableTill);
		
		preparedStatement.executeUpdate();
	}
	
	public static void getUserBy(String column, String toGet) throws SQLException	{
		String sql = "SELECT * FROM USER WHERE " + column + " = " + toGet;
		
		Statement statement = conn.createStatement();
		ResultSet rs = statement.executeQuery(sql);
			
		while(rs.next())	{
			int uID = rs.getInt("uID");
			String uName = rs.getString("uUsername");
			String email = rs.getString("uEmail");
			String pswd = rs.getString("uPWord");
			int renter = rs.getInt("uRenter");
			String fName = rs.getString("uFname");
			String lName = rs.getString("uLname");
			
			System.out.println(uID + " "+ uName + " " + email + " " + pswd + " " + renter + " " + fName + " " + lName);
		}
	}
	
	public static void getRenterBy(String column, String toGet) throws SQLException	{
		String sql = "SELECT * FROM RENTER WHERE " + column + " + " + toGet;
		Statement statement = conn.createStatement();
		ResultSet rs = statement.executeQuery(sql);
			
		while(rs.next())	{
			int uID = rs.getInt("uID");
			int renterID = rs.getInt("rRenterID");
			String street = rs.getString("rStreet");
			String city = rs.getString("rCity");
			String state = rs.getString("rState");
			int zip = rs.getInt("rZip");
				
			System.out.println(uID + " " + renterID + " " + street + " " + city + " " + state + " " + zip);
		}
	}
	
	public static void getListingBy(String column, String toGet) throws SQLException	{
		String sql = "SELECT * FROM PARKINGLISTING WHERE "+ column + " = " + toGet;
		Statement statement = conn.createStatement();
		ResultSet rs = statement.executeQuery(sql);
			
		while(rs.next())	{
			int renterID = rs.getInt("rRenterID");
			int listingID = rs.getInt("listingID");
			double price = rs.getDouble("price");
			String parkingType = rs.getString("parkingType");
			String daysAvail = rs.getString("daysAvailable");
			Time availableWhen = rs.getTime("timeAvailable");
			Time availableTill = rs.getTime("availableTill");
			
			System.out.println(renterID + " " + listingID + " " + price + " " + parkingType + " " + daysAvail + " " + availableWhen + " " + availableTill);
		}
	}
}
