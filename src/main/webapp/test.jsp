<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.lnctproject.DataRetrieval,java.util.Map" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Display Data</title>
    <style>
   *{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:"Poppins",sans-serif;
 }
 
 header{
     z-index:999;
     position:absolute;
     top:0;
     left:0;
     width:100%;
     display: flex;
     justify-content: space-between;
     align-items: center;
     padding: 15px 200px;
     transition: 0.5s ease;
 }
 body{
  /* background-color: #162938; */
  background-color: #212121;
    font-family: Arial, sans-serif;
  display: flex;
  justify-content: space-between;
  padding: 20px;
 }
 .brand{
color: #fff;
  font-size: 2.2em;
  font-weight: 700;
  text-transform: uppercase;
  text-decoration: none;
  position: relative;
  left: -52px;

 }
 .navigation{
     position: relative;
 }
 .navigation-items a{
     position: relative;
     color:#fff;
     font-size: 1em;
     font-weight: 500;
     text-decoration: none;
     margin-left: 30px;
     transition: 0.3s ease;
 }

 .navigation-items a:before{ 
     content:'';
     position: absolute;
     background: #fff;
     width: 0;
     height:3px;
     bottom:0;
     left:0;
     transition:0.3s ease;     
 }
 
 .navigation-items a:hover:before{
     width: 100%;

 }
   
.navigation-items form{
   display:inline;
 }

 .navigation-items button{
     position: relative;
     left:12px;
     background: transparent;
     border: 2px solid white;
     border-radius:12px;
     outline: none;
     padding: 11px 35px; 
     color:#fff;
     font-size: 1.1em;
     font-weight: 500;
     outline: none;
     cursor: pointer;
     transition: .5s
 }

 .navigation-items button:hover{
    background: #fff;
    color:#162938;
 }




      /* ------------------------------------------------------------------------------------------------------------------- */
        .info-box {
   position: relative;
    z-index: 999;
    display: flex;
    align-items: center;
    border: 1px solid #ccc;
    border-radius: 35px;
    padding: 10px;
    width: 190%;
    box-shadow: 0 0 19px rgba(0, 0, 0, 0.2);
    height: 103px;
    background-color: rgba(212, 175, 144, 0.3);
    color: white;
    top: 136px;
    left: 183px;
    height: 230px;
    margin: 12px;
        }
        .circle {
          width: 203px;
          height: 185px;
          border-radius: 13%;
          background: #007bff;
          margin-right: 10px;
          overflow: hidden;
        }
        .circle img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .details {
            flex: 1;
        }

        .place-name {
          font-size: 54px;
  font-weight: bold;
  position: relative;
  left: 174px;
  top: -48px;
  font-family: vegan-style;

        }

        .ratings {
          margin-top: -38px;
  position: relative;
  left: 79px;
  font-family: vegan-style;
  font-size: 29px;
  top: 20px;
  color:rgb(2, 36, 74);
  text-shadow:0 0 12px white;
        }

        .opens-on, .price {
          color: rgb(2, 36, 74);
  position: relative;
  top: 36px;
  position: relative;
  left: 78px;
  font-family: vegan-style;
  font-size: 27px;
text-shadow:0 0 12px skyblue;
        }

        .info-box button {
            padding: 12px;
            border: 1px solid white;
            border-radius: 18px;
            box-shadow: 0 0 9px rgba(0, 0, 0, 0.2);
            position: relative;
            top: 18px;
            right: 10px;
        }

        .image {
            height: 100vh;
            width: 100vw;
            position: fixed;
            top: 0px;
            left: 0px;
        }

        a.info-box-button{
            position: relative;
    top: -6px;
    padding: 21px;
    border: 2px solid white;
    border-radius: 22px;
    left: 711px;
    background-color: rgb(11, 134, 186);
    color: white;
    text-decoration: none;
        }
        
        
    </style>
    
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
        <!-- Your existing header content -->
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
            // Import necessary classes and establish a database connection if required.
              
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
            e.printStackTrace(); // Handle exceptions appropriately.
        }
        %>
    </div>
</body>
</html>
