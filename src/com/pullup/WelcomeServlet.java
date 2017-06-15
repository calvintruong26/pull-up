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
import javax.servlet.ServletException;


/**
 * Servlet implementation class WelcomeServlet
 */
//@WebServlet(name="WelcomeServlet", urlPatterns=("/WelcomeServlet"))
public class WelcomeServlet extends HttpServlet {
	//private static final long serialVersionUID = 1L;
      
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uname = req.getParameter("uname");
		String pword = req.getParameter("pword");
		String ip = req.getRemoteAddr();
		boolean verified = false;
		HttpSession session= req.getSession();
		
		final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
		final String DB_URL = "jdbc:mysql://localhost:3306/PULLUP";
		
		//  Database credentials
		final String USER = "root";
		final String PASS = "cs157a"; // need to enter your password for mysql
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		User thisUser = new User(null, null, null,null, null);
		
		try	{
			Class.forName(JDBC_DRIVER).newInstance();
			System.out.println("Connecting to database....");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			String sql = "SELECT * FROM USER";
			Statement statement = conn.createStatement();
			ResultSet rs = statement.executeQuery(sql);
				
			while(rs.next())	{
				System.out.print("success");
				int uID = rs.getInt("uID");
				String uName = rs.getString("uUsername");
				String email = rs.getString("uEmail");
				String pswd = rs.getString("uPWord");
				int renter = rs.getInt("uRenter");
				String fName = rs.getString("uFname");
				String lName = rs.getString("uLname");
				
				
				if(uName.equals(uname) && pswd.equals(pword))	{
					verified = true;
					thisUser.setFirstName(fName);
					thisUser.setLastName(lName);
					thisUser.setEmial(email);
					thisUser.setId(uID);
					thisUser.setUsername(uName);
					thisUser.setPassword(pswd);
					break;
				}
				else	{
					verified = false;
				}
			}
		}
		catch(SQLException se){
			se.printStackTrace();
			System.out.println("Test");
		}
		catch(Exception e)	{
			System.out.println("Test");
			e.printStackTrace();
		}
		finally	{
			try{ if(preparedStatement!=null) preparedStatement.close(); }
			catch(SQLException se2){ }// nothing we can do

			try{ if(conn!=null) conn.close(); }
			catch(SQLException se){ se.printStackTrace(); }
		}
		
		
		if(verified)	{
			session.setAttribute("user", thisUser);
			RequestDispatcher view = req.getRequestDispatcher("WelcomePage.jsp");
			view.forward(req, resp);
		}
		else	{
			req.getRequestDispatcher("WelcomePage.jsp").forward(req, resp);
		}
	}

    
}