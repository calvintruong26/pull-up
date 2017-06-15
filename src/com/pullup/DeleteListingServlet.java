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
@WebServlet(name="DeleteListingServlet", urlPatterns=("/DeleteListingServlet"))
public class DeleteListingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteListingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	doDelete(req, resp);
    }
    
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		int listingID = Integer.parseInt(req.getParameter("listingID"));
		
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
			
			
			String sql = "DELETE FROM PARKINGLISTING WHERE listingID = " + listingID;
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.executeUpdate();
			
			req.getRequestDispatcher("MyListingsServlet").forward(req, resp);

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

