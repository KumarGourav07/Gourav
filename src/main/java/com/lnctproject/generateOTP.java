package com.lnctproject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Properties;

import javax.net.ssl.HttpsURLConnection;

import com.trying.OTP;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;


public class generateOTP extends HttpServlet {
	 public void service(HttpServletRequest request ,HttpServletResponse response) throws IOException, ServletException {
			PrintWriter out =response.getWriter();
			HttpSession mySession = request.getSession();
			RequestDispatcher dispatcher = null;
			
		        String from = "abhijitkumar5577@gmail.com";
		        String to = request.getParameter("email");
		        String subject = "OTP: OTP to recover your HI BHOPAL login ID";
		      //  String text = "This is a example email send using gmail and java program with out less secure app";            
		        String otpmessage=OTP.generateOTP(5);
			    String text="This message is send by team HI BHOPAL  . Your OTP is : "+otpmessage;
		        
		        Properties properties = new Properties();
		        properties.put("mail.smtp.auth", true);
		        properties.put("mail.smtp.starttls.enable", true);
		        properties.put("mail.smtp.port", "587");
		        properties.put("mail.smtp.host", "smtp.gmail.com");
		        
		        
		        final String user = "abhijitkumar5577";
		        final String pass = "xnic ehpo oekr bsfe"; // REVOKED
		        
		        Session session = Session.getInstance(properties, new Authenticator() {
		            @Override
		            protected PasswordAuthentication getPasswordAuthentication() {
		                return new PasswordAuthentication(user , pass);
		            }
		        });

		        try {

		            Message message = new MimeMessage(session);
		            message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
		            message.setFrom(new InternetAddress(from));
		            message.setSubject(subject);
		            message.setText(text);
		            Transport.send(message);
		            out.println("done");
		            
		        } catch (Exception e) {
		            e.printStackTrace();
		            out.println("not done");
		        }
		        dispatcher = request.getRequestDispatcher("EnterOtp.jsp");
				request.setAttribute("message","OTP is sent to your email id");
				//request.setAttribute("connection", con);
				mySession.setAttribute("otp",otpmessage); 
				mySession.setAttribute("email",to); 
				dispatcher.forward(request, response);
		        
			
		}	
}

