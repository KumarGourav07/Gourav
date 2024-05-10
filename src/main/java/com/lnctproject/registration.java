package com.lnctproject;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class registration extends HttpServlet {
	public void service(HttpServletRequest request ,HttpServletResponse response) throws IOException, ServletException {
		PrintWriter out =response.getWriter();
	
		String username=request.getParameter("username");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		Connection con=null;
		RequestDispatcher rd=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectx","root","Aexam22@");
			String query="insert into  credentials values(?,?,?)";
			PreparedStatement pstmt =con.prepareStatement(query);
			pstmt.setString(1,username);
			pstmt.setString(2,email);
			pstmt.setString(3,password);
			
			pstmt.executeUpdate();
			
     		request.setAttribute("status","success"); 
     		rd=request.getRequestDispatcher("index.jsp");
     		rd.forward(request,response);
			
		}
		catch(Exception e) {
			rd=request.getRequestDispatcher("index.jsp");
     		request.setAttribute("status","fail");    
     		rd.forward(request,response);		
		}
		finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
