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

@WebServlet("/Collegeservlet")
public class Collegeservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        List<CBhopal> cplaces = new ArrayList<>();

        try {
          
            Class.forName("com.mysql.cj.jdbc.Driver");

       
            String dbUrl = "jdbc:mysql://localhost:3306/Newcomer_Navigator";
            String dbUser = "root";
            String dbPassword = "Tanmay@2001";
            conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

            String query = "SELECT id, collegename FROM collegeplaces";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);

      
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("collegename");
                cplaces.add(new CBhopal(id, name));
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

   
        Gson gson = new Gson();
        String json = gson.toJson(cplaces);

      
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

     
        PrintWriter out = response.getWriter();
        out.print(json);
        out.flush();
    }

   
    private class CBhopal {
        private int id;
        private String name;

        public CBhopal(int id, String name) {
            this.id = id;
            this.name = name;
        }
    }
}

