

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.lnctproject.DataRetrieval,java.util.Map" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tour</title>
    <link rel="stylesheet" href="tour1.css">  
    <script>
    function toggleNavigation() {
        var navigation = document.querySelector('.navigation');
        if (navigation.style.display === 'block') {
            navigation.style.display = 'none';
        } else {
            navigation.style.display = 'block';
        }
    }
    

    var menuBtn = document.querySelector('.menu-btn');
    menuBtn.addEventListener('click', toggleNavigation);
</script> 
</head>
<body>
 <img class="image" src="images/t01.jpg" alt="Cartoon Image">
    <header>   
        <a class="brand" id="ko">HI BHOPAL</a>
        <div class="menu-btn"></div>
        <div class="navigation">
            <div class="navigation-items">
                <a href="index.jsp">Home</a>
                <a href="#">About Us</a>
                <a href="#">Gallery</a>
                <a href="#">Contact</a>
                <form action="logout" method="post">
                <button type="submit"><%= session.getAttribute("savedusername") %></button>
            </form>
            </div>
        </div>
    </header>
    <div id="container">
        <%
        try {
            
              
            List<Map<String, String>> dataFromDatabase = DataRetrieval.fetchDataFromDatabase();

            for (Map<String, String> entry : dataFromDatabase) {
                String imageUrl = entry.get("imageUrl");
                String place = entry.get("place");
                String rate = entry.get("rate");
                String opening = entry.get("opening");
                String link = entry.get("link");
                String buttonLink = entry.get("buttonLink");
        %>
        <div class="info-box">
            <div class="circle">
                <a href="<%= link %>">
                    <img src="<%= imageUrl %>" alt="<%= place %>" />
                </a>
            </div>
            <div class="details">
                <div class="place-name"><%= place %></div>
                <div class="ratings">Ratings: <span id="rate"><%= rate %></span></div>
                <div class="opens-on">Opens-on: <span id="opening"><%= opening %></span></div>
                <a href="<%= buttonLink %>" class="info-box-button">Direction</a>
            </div>
        </div>
        <%
            }
        } catch (Exception e) {
            e.printStackTrace(); 
        }
        %>
    </div>
</body>
</html>
