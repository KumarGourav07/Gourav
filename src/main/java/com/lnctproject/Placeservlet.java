package com.lnctproject;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

@WebServlet("/Placeservlet")
public class Placeservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        List<Bhopal> places = new ArrayList<>();

        try {
        
            Class.forName("com.mysql.cj.jdbc.Driver");

          
            String dbUrl = "jdbc:mysql://localhost:3306/projectx";
            String dbUser = "root";
            String dbPassword = "Aexam22@";
            conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

            String query = "SELECT id, placename FROM foodplaces";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);

    
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("placename");
                places.add(new Bhopal(id, name));
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        // Converting the list of countries to JSON using the Gson library
        Gson gson = new Gson();
        String json = gson.toJson(places);

        // Setting the response type to JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Sending the JSON response to the client
        PrintWriter out = response.getWriter();
        out.print(json);
        out.flush();
    }


    private class Bhopal {
        private int id;
        private String name;

        public Bhopal(int id, String name) {
            this.id = id;
            this.name = name;
        }
    }
}

