

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="food1.css">
</head>
<body >
  <img  class="image" src="images/f16.jpg" alt="cartoon image">
  <header>
    <a  class="brand" id="ko">Newcomer Navigator</a>
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
 <div class="section middle-section" id="meal-section">
      <!-- First Section - Meal Selection -->
           <form action="DataServlet" method="post">
              <label for="meal" required>Select Meal:</label>
              <input type="radio" id="breakfast" name="meal" value="breakfast">
              <label for="breakfast" id="Bname">Breakfast</label>
              <input type="radio" id="lunch" name="meal" value="lunch">
              <label for="lunch" id="Lname">Lunch</label>
              <input type="radio" id="dinner" name="meal" value="dinner">
              <label for="dinner" id="Dname">Dinner</label>     
              <select id="countrySelect" name="selectOption">
               <option value="">Select a Place</option>
                <!-- Data will be populated here -->
                </select>
                  
                <!--  <button type="submit">submit</button>-->
          </form>
          
    </div>
    <div class="section" id="search-section">
      <!-- Second Section - Search Menu -->
      <div class="justinfo">
        As per your selected options all places will be displayed here
      </div>
      
      <div class="result-container" id="resultDiv"></div>
      
    </div>
    
  <script src="script.js"></script>

   <script>
    document.addEventListener("DOMContentLoaded", function() {
        var countrySelect = document.getElementById("countrySelect");
        
        //  AJAX request to the CountryServlet to fetch data
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "Placeservlet", true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var data = JSON.parse(xhr.responseText);
                data.forEach(function(Bhopal) {
                    var option = document.createElement("option");
                    option.value = Bhopal.name;
                    option.text = Bhopal.name;
                    countrySelect.appendChild(option);
                });
            }
        };
        xhr.send();
    });
</script>

 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	  $('input[type=radio], select').change(function() {
	    var meal = $('input[name=meal]:checked').val();
	    var selectOption = $('select[name=selectOption]').val();

	    if (meal && selectOption) {
	      $.ajax({
	        type: 'POST',
	        url: 'DataServlet',
	        data: {
	          meal: meal,
	          selectOption: selectOption
	        },
	        success: function(data) {
	          var resultContainer = $('#resultDiv');
	          resultContainer.empty();

	          data.forEach(function(item) {
	            // Create a container for each set of data
	            var dataContainer = $("<div class='data-container'>");

	            var nameElement = $("<h2>");
	            nameElement.text(item.shopname);
	            nameElement.addClass("shopname"); 

	            var ratingElement = $("<p>");
	            ratingElement.text("Rating: " + item.ratings);
	            ratingElement.addClass("ratings");

	            var hoursElement = $("<p>");
	            hoursElement.text("Opening Hours: " + item.opens);
	            hoursElement.addClass("opens"); 

	            var specialityElement = $("<p>");
	            specialityElement.text("Speciality: " + item.speciality);
	            specialityElement.addClass("speciality"); 

	            var directionButton = $("<button>Get Directions</button>");
	            directionButton.addClass("direction-button"); 
	            directionButton.on("click", function() {
	              window.location.href = item.direction;
	            });

	            var imageElement = $("<img>");
	            imageElement.attr("src", item.img);
	            imageElement.attr("alt", "Restaurant Image");
	            imageElement.addClass("restaurant-image"); 

	            // Append all elements to the data container
	            dataContainer.append(nameElement, ratingElement, hoursElement, specialityElement, directionButton, imageElement);

	            // Append the data container to the result container
	            resultContainer.append(dataContainer);
	          });
	        }
	      });
	    }
	  });
	});

  </script>


</body>
</html>