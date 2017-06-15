package com.pullup;



import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterServlet
 */
//@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	//private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String fname = req.getParameter("fname");
		String lname = req.getParameter("lname");
		String address = req.getParameter("address");
		String city = req.getParameter("city");
		String state = req.getParameter("state");
		String zipcode = req.getParameter("zcode");
		String uname = req.getParameter("uname");
		String pword = req.getParameter("pword");
		String email = req.getParameter("email");
		String phonenumber = req.getParameter("phonenumber");
		//boolean verified = false;
		
		final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
		final String DB_URL = "jdbc:mysql://localhost:3306/PULLUP";
		
		//  Database credentials
		final String USER = "root";
		final String PASS = "cs157a"; // need to enter your password for mysql
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		//User thisUser = new User(null, null, null,null, null);
		
		try	{
			Class.forName(JDBC_DRIVER);
			System.out.println("Connecting to database....");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			
			
			String sql = "INSERT INTO USER(uUsername, uEmail, uPWord, uRenter, uFname, uLname, uPhoneNumber)"
					+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, uname);
			preparedStatement.setString(2, email);
			preparedStatement.setString(3, pword);
			preparedStatement.setInt(4, 0);
			preparedStatement.setString(5, fname);
			preparedStatement.setString(6, lname);
			preparedStatement.setString(7, phonenumber);
			
			preparedStatement.executeUpdate();
			
			RequestDispatcher view = req.getRequestDispatcher("WelcomePage.jsp");
			view.forward(req ,response);
			
		//doGet(request, response);
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
