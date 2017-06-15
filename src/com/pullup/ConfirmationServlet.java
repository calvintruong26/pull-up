package com.pullup;



import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class NewListingServlet
 */
@WebServlet(name="ConfirmationServlet", urlPatterns=("/ConfirmationServlet"))
public class ConfirmationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		int tenantID = user.getId();
		
		
		
		final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
		final String DB_URL = "jdbc:mysql://localhost:3306/pullup";
		
		//  Database credentials
		final String USER = "root";
		final String PASS = "cs157a"; // need to enter your password for mysql
		Connection conn = null;
		Statement statement = null;
		
		try	{
			Class.forName(JDBC_DRIVER);
			System.out.println("Connecting to database....");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			statement = conn.createStatement();
			
			String sql = "UPDATE PARKINGLISTING SET tenantID = " + tenantID + " WHERE listingID = " + req.getParameter("listingID");
			
			statement.executeUpdate(sql);
			
			RequestDispatcher rd = req.getRequestDispatcher("PurchasedListingsServlet");
			rd.forward(req, response);
			
		}
		catch(SQLException se){se.printStackTrace();}
		catch(Exception e)	{
			e.printStackTrace();
		}
		finally	{
			try{ if(statement!=null) statement.close(); }
			catch(SQLException se2){ }// nothing we can do

			try{ if(conn!=null) conn.close(); }
			catch(SQLException se){ se.printStackTrace(); }
		}
	}
}

