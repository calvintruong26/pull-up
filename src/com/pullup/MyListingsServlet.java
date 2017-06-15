package com.pullup;



import java.io.IOException;
import java.lang.NullPointerException;
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
@WebServlet(name="MyListingsServlet", urlPatterns=("/MyListingsServlet"))
public class MyListingsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyListingsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
    	doGet(req, response);
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, NullPointerException {
				
				HttpSession session = req.getSession();
				User user = (User) session.getAttribute("user");
				int userID = user.getId(); 
				
		
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
					
					String sql = "SELECT * FROM PARKINGLISTING WHERE renterID = " + userID;
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
						
						if (rs.getInt("tenantID") != 0) {
							int tenantID = rs.getInt("tenantID");
							System.out.println(tenantID);
							
							String sql2 = "SELECT uPhoneNumber, uFname, uLname FROM USER WHERE uID in (SELECT tenantID FROM PARKINGLISTING WHERE tenantID = " + tenantID + ")";
							Statement statement2 = conn.createStatement();
							ResultSet rs2 = statement2.executeQuery(sql2);
							
							while(rs2.next()) {
								String phoneNumber = rs2.getString("uPhoneNumber");
								String firstName = rs2.getString("uFname");
								String lastName = rs2.getString("uLname");
								
								Listing result = new Listing(listingID, listingName, address, price, parkingType, timeAvailable, availableTill, renterID);
								result.setTenantPhoneNumber(phoneNumber);
								result.setTenantName(firstName + " " + lastName);
								result.setTenantID(tenantID);
								resultList.add(result);	
							}
						}
						else {
							Listing result = new Listing(listingID, listingName, address, price, parkingType, timeAvailable, availableTill, renterID);

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
				req.getRequestDispatcher("MyListings.jsp").forward(req, resp);

			}

}