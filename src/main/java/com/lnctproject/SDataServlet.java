package com.lnctproject;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.google.gson.Gson;

@WebServlet("/SDataServlet")
public class SDataServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        String radioOption = request.getParameter("meal");
        String selectOption = request.getParameter("selectOption");

  
        List<House> houses = new ArrayList<>();

    
        String url = "jdbc:mysql://localhost:3306/projectx";
        String user = "root";
        String password = "Aexam22@";

        try {
            Connection conn = DriverManager.getConnection(url, user, password);
            String query = "SELECT * FROM tokyo WHERE college = ? AND staytype = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, selectOption);
            pstmt.setString(2, radioOption);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                String housename = rs.getString("housename");
                String ratings = rs.getString("ratings");
                String Price = rs.getString("Price");
                String Location = rs.getString("Location");
                String direction = rs.getString("direction");
                String img = rs.getString("img");

                houses.add(new House(housename, ratings, Price, Location, direction, img));
            }

           
            Gson gson = new Gson();
            String json = gson.toJson(houses);
            out.print(json);

            rs.close();
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public class House {
        private String housename;
        private String ratings;
        private String Price;
        private String Location;
        private String direction;
        private String img;

        public House(String housename, String ratings, String Price, String Location, String direction, String img) {
            this.housename = housename;
            this.ratings = ratings;
            this.Price = Price;
            this.Location = Location;
            this.direction = direction;
            this.img = img;
        }
    }
}

