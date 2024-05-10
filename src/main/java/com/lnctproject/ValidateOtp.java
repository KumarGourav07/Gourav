package com.lnctproject;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ValidateOtp")
public class ValidateOtp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String value = request.getParameter("otp");
//	    PrintWriter out=response.getWriter();
//	    out.println(value);
	    
	    HttpSession session=request.getSession();
	    RequestDispatcher dispatcher=null;
//	    out.println(session.getAttribute("otp"));
	    try {
	    	String systemOtp=(String)session.getAttribute("otp");
	    	if (value.equals(systemOtp)) 
			{
				
					request.setAttribute("email", request.getParameter("email"));
					request.setAttribute("status", "success");
				    dispatcher=request.getRequestDispatcher("newPassword.jsp");
				    dispatcher.forward(request, response);
				
			}
			else
			{
				request.setAttribute("message","wrong otp");
				
			   dispatcher=request.getRequestDispatcher("EnterOtp.jsp");
			   dispatcher.forward(request, response);
			
			}
	    }
	    catch(Exception e) {
	    	request.setAttribute("message","invalid otp");
			
			   dispatcher=request.getRequestDispatcher("EnterOtp.jsp");
			   dispatcher.forward(request, response);

	    }	
	    
	}
}	

