package com.lnctproject;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/newPassword")
public class NewPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection con=null;
		RequestDispatcher rd=null;
		HttpSession session = request.getSession();
		String newPassword = request.getParameter("password");
		String confPassword = request.getParameter("confPassword");
		RequestDispatcher dispatcher = null;
		if(newPassword != null && confPassword != null && newPassword.equals(confPassword)&&!newPassword.trim().isEmpty()) {

			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectx","root","Aexam22@");
				PreparedStatement pst = con.prepareStatement("update credentials set password = ? where email = ? ");
				pst.setString(1, newPassword);
				pst.setString(2, (String) session.getAttribute("email"));

				pst.executeUpdate();
				
	     		request.setAttribute("status","passwordchaned"); 
	     		rd=request.getRequestDispatcher("index.jsp");
	     		rd.forward(request,response);
//				if (rowCount > 0) {
//					request.setAttribute("status", "resetSuccess");
//					dispatcher = request.getRequestDispatcher("login.jsp");
//				} else {
//					request.setAttribute("status", "resetFailed");
//					dispatcher = request.getRequestDispatcher("login.jsp");
//				}
//				dispatcher.forward(request, response);
			} catch (Exception e) {
				rd=request.getRequestDispatcher("index.jsp");
	     		request.setAttribute("status","passwordnotchanged");    
	     		rd.forward(request,response);
			}
			
		}
		else {
			rd=request.getRequestDispatcher("index.jsp");
     		request.setAttribute("status","passwordnotchanged");    
     		rd.forward(request,response);
		}
		
	}
}

