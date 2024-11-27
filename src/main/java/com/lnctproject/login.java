package com.lnctproject;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpSession;


public class login extends HttpServlet {
	public void service(HttpServletRequest request ,HttpServletResponse response) throws IOException, ServletException {
		PrintWriter out =response.getWriter();
		out.println("ho");
		
		String loginemail =request.getParameter("loginemail");
		String loginpassword=request.getParameter("loginpassword");
		String savedusername=null;
		String savedemail=null;
		String savedpassword=null;
		Connection con=null;
		RequestDispatcher rd=null;
		HttpSession session=request.getSession();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ Newcomer_Navigator","root","Tanmay@2001");
			String query ="select * from credentials where email=?";
			PreparedStatement pstmt=con.prepareStatement(query);
			pstmt.setString(1,loginemail);
			
			ResultSet rs=pstmt.executeQuery();
			int count=0;
			while(rs.next()) {
				savedusername=rs.getString(1);
				savedemail = rs.getString(2);
				savedpassword= rs.getString(3);
			}
			
			if(savedemail.equals(loginemail) && savedpassword.equals(loginpassword)) {
				session.setAttribute("savedusername",savedusername);
				
				request.setAttribute("savedusername",savedusername);
				rd=request.getRequestDispatcher("index.jsp");
				rd.forward(request, response);
			}

			else {
				request.setAttribute("status","indavlidDetails");
				rd=request.getRequestDispatcher("index.jsp");
				rd.forward(request, response);
			}
		       
		}
		catch(Exception e) {
			request.setAttribute("status","indavlidDetails");
			rd=request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
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
