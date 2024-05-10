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

@WebServlet("/DataServlet")
public class DataServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        String radioOption = request.getParameter("meal");
        String selectOption = request.getParameter("selectOption");

    
        List<Restaurant> restaurants = new ArrayList<>();

     
        String url = "jdbc:mysql://localhost:3306/projectx";
        String user = "root";
        String password = "Aexam22@";

        try {
            Connection conn = DriverManager.getConnection(url, user, password);
            String query = "SELECT * FROM japan WHERE place = ? AND mealtype = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, selectOption);
            pstmt.setString(2, radioOption);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                String shopname = rs.getString("shopname");
                String ratings = rs.getString("ratings");
                String opens = rs.getString("opens");
                String speciality = rs.getString("speciality");
                String direction = rs.getString("direction");
                String img = rs.getString("img");

                restaurants.add(new Restaurant(shopname, ratings, opens, speciality, direction, img));
            }

        
            Gson gson = new Gson();
            String json = gson.toJson(restaurants);
            out.print(json);

            rs.close();
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public class Restaurant {
        private String shopname;
        private String ratings;
        private String opens;
        private String speciality;
        private String direction;
        private String img;

        public Restaurant(String shopname, String ratings, String opens, String speciality, String direction, String img) {
            this.shopname = shopname;
            this.ratings = ratings;
            this.opens = opens;
            this.speciality = speciality;
            this.direction = direction;
            this.img = img;
        }
    }
}

