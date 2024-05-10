package com.lnctproject;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.http.HttpSession;


public class logout extends HttpServlet {
	public void service(HttpServletRequest request ,HttpServletResponse response) throws IOException {
		HttpSession session=request.getSession();
		session.setAttribute("savedusername",null);
		response.sendRedirect("index.jsp");
	}

}
