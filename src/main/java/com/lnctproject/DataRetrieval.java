package com.lnctproject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

public class DataRetrieval {

    public static List<Map<String, String>> fetchDataFromDatabase() {
        List<Map<String, String>> dataFromDatabase = new ArrayList<>();
        Connection connection = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectx", "root", "Aexam22@");

            String sql = "SELECT * FROM tourism";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Map<String, String> rowData = new HashMap<>();
                rowData.put("imageUrl", resultSet.getString("image_url"));
                rowData.put("place", resultSet.getString("place"));
                rowData.put("rate", resultSet.getString("rate"));
                rowData.put("opening", resultSet.getString("opening"));
                rowData.put("link", resultSet.getString("link"));
                rowData.put("buttonLink", resultSet.getString("button_link"));

                dataFromDatabase.add(rowData);
            }

            resultSet.close();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return dataFromDatabase;
    }
}
