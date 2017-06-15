package com.pullup;



import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class NewListingServlet
 */
//@WebServlet("/ListingServlet")
public class ListingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				
				HttpSession session = req.getSession();
				User user = (User) session.getAttribute("user");
		
				String theAddress = req.getParameter("address");
				String thePrice = req.getParameter("price");
				String theTimeAvailable = req.getParameter("availableFrom") + ":00";
				String theAvailableTill = req.getParameter("availableTill") + ":00";
				String whereClause = "WHERE";
				
				
				whereClause = whereClause.concat(" AND address LIKE '%" + theAddress + "%'");	
				whereClause = whereClause.concat(" AND price <= " + thePrice);
				whereClause = whereClause.concat(" AND timeAvailable <= '" + theTimeAvailable + "'");
				whereClause = whereClause.concat(" AND availableTill >= '" + theAvailableTill + "'");
				whereClause = whereClause.concat(" AND tenantID IS NULL");
				whereClause = whereClause.concat(" AND renterID <> " + user.getId());
				
				
				whereClause = whereClause.replaceFirst(" AND address LIKE \'%%\'", "");
				
				
				
				whereClause = whereClause.replaceFirst(" AND price <=  ", " ");
				
				
				
				whereClause = whereClause.replaceFirst("AND ", "");
				
				System.out.println(whereClause);
				
		
				final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
				final String DB_URL = "jdbc:mysql://localhost:3306/pullup";
				
				//  Database credentials
				final String USER = "root";
				final String PASS = "cs157a"; // need to enter your password for mysql
				Connection conn = null;
				PreparedStatement preparedStatement = null;
				ArrayList<Listing> resultList = new ArrayList<Listing>();
				
						
				try	{
					Class.forName(JDBC_DRIVER);
					System.out.println("Connecting to database....");
					conn = DriverManager.getConnection(DB_URL, USER, PASS);
					
					String sql = "SELECT * FROM PARKINGLISTING " + whereClause;
					Statement statement = conn.createStatement();
					ResultSet rs = statement.executeQuery(sql);
					
					while(rs.next())	{
						int listingID = rs.getInt("listingID");
						String listingName = rs.getString("listingName");
						String address = rs.getString("address");
						double price = rs.getDouble("price");
						String parkingType = rs.getString("parkingType");
						String timeAvailable = rs.getString("timeAvailable");
						String availableTill = rs.getString("availableTill");
						int renterID = rs.getInt("renterID");
						
						String sql2 = "SELECT uPhoneNumber, uFname, uLname FROM USER WHERE uID in (SELECT renterID FROM PARKINGLISTING WHERE renterID = " + renterID + ")";
						Statement statement2 = conn.createStatement();
						ResultSet rs2 = statement2.executeQuery(sql2);
						
						while(rs2.next()) {
							String phoneNumber = rs2.getString("uPhoneNumber");
							String firstName = rs2.getString("uFname");
							String lastName = rs2.getString("uLname");
							Listing result = new Listing(listingID, listingName, address, price, parkingType, timeAvailable, availableTill, renterID);
							result.setRenterPhoneNumber(phoneNumber);
							result.setRenterName(firstName + " " + lastName);
							resultList.add(result);	
						}			
					}
					
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
				
				req.setAttribute("results", resultList);
				req.getRequestDispatcher("Results.jsp").forward(req, resp);

			}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException, NullPointerException {
		String pname = req.getParameter("name");
		String address = req.getParameter("address");
		String price = req.getParameter("price");
		String available = req.getParameter("available") + ":00";
		String endAvailable = req.getParameter("EndAvailable") + ":00";
		String pType = req.getParameter("description");
		//String image = req.getParameter("image");
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		int renterID = user.getId();
		System.out.println(available);
		System.out.print(endAvailable);
		
		
		final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
		final String DB_URL = "jdbc:mysql://localhost:3306/pullup";
		
		//  Database credentials
		final String USER = "root";
		final String PASS = "cs157a"; // need to enter your password for mysql
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		
		try	{
			Class.forName(JDBC_DRIVER);
			System.out.println("Connecting to database....");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			
			
			String sql = "INSERT INTO PARKINGLISTING(listingName, address, price, parkingType, timeAvailable, availableTill, renterID, tenantID)"
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, pname);
			preparedStatement.setString(2, address);
			preparedStatement.setString(3, price);
			preparedStatement.setString(4, pType);
			preparedStatement.setString(5, available);
			preparedStatement.setString(6, endAvailable);
			preparedStatement.setInt(7, renterID);
			preparedStatement.setNull(8, java.sql.Types.INTEGER);
			preparedStatement.executeUpdate();
			
			req.getRequestDispatcher("MyListingsServlet").forward(req, response);

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
}

