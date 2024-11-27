<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Newcomer Navigator</title>
<link rel="stylesheet" href="index.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<!--for fab icons-->
</head>
<body>
	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">
	<header class="header">
		<a class="brand">Newcomer Navigator</a>
		<div class="menu-btn"></div>
		<div class="navigation">
			<a href="index.jsp">Home</a> <a href="#">About Us</a> <a href="#">Gallery</a>
			<a href="#">Contact</a>
			<%
			if (session.getAttribute("savedusername") == null) {
			%>
			<form>
				<button type="button" class="login">Login</button>
			</form>
			<%
			} else {
			%>
			<form action="logout" method="post">
				<button type="submit" class="logout"><%=session.getAttribute("savedusername")%></button>
			</form>
			<%
			}
			%>
		</div>
	</header>

	<main>
		<section class="home">
			<video class="video-slide active" src="videos/food.mp4" autoplay
				muted loop></video>
			<video class="video-slide" src="videos/stay.mp4" autoplay muted loop></video>
			<video class="video-slide" src="videos/travel.mp4" autoplay muted
				loop></video>

			<div class="content active">
				<h1 class="foodTitle">
					FOOD CORNERS<br>
					<span>Pocket friendly</span>
				</h1>
				<p class="foodContent">
				<pre>Feeling hungry? Searching for reasonably priced and high-quality food shops? Look no further! 
Team HI BHOPAL is here to make your culinary journey more convenient and enjoyable. 
We're here to help you find the best food options and ensure you have a delightful dining experience. </pre>
				</p>
				<form action="food.jsp">
					<button type="submit" class="Foodexplore">Let's Discover</button>
				</form>
			</div>

			<div class="content">
				<h1 class="foodTitle">
					STAYING PLACES<br>
					<span>Home like vibe</span>
				</h1>
				<p class="foodContent">
				<pre>New in Bhopal and looking for accommodation near your college? 
Team HI BHOPAL is here to assist you in finding the perfect place that meets your needs. 
We ensure your stay is not only close to your college but also conveniently located near 
essential amenities such as markets, stationary shops, and more.</pre>
				</p>
				<form action="stay.jsp">
					<button type="submit" class="Foodexplore">Let's Discover</button>
				</form>
			</div>

			<div class="content">
				<h1 class="foodTitle">
					VIEW POINTS<br>
					<span>Close to Nature</span>
				</h1>
				<p class="foodContent">
				<pre>Excited to explore the beauty of Bhopal? Team HI BHOPAL is your perfect guide to discover 
the stunning attractions of this city.We're here to make your visit a visual delight, 
allowing you to experience the captivating beauty of Bhopal. Let us help you explore and 
appreciate the city's wonders, ensuring your journey is filled with memorable moments</pre>
				</p>
				<form action="tour.jsp">
					<button type="submit" class="Foodexplore">Let's Discover</button>
				</form>
			</div>





			<div class="media-icons">
				<a href="#"><i class="fab fa-facebook-f"></i></a> <a href="#"><i
					class="fab fa-instagram"></i></a> <a href="#"><i
					class="fab fa-twitter"></i></a>
			</div>

			<div class="slider-navigation">
				<div class="nav-btn active"></div>
				<div class="nav-btn "></div>
				<div class="nav-btn "></div>
			</div>


			<div class="wrapper">
				<span class="icon-close"> <ion-icon name="close"></ion-icon>
				</span>
				<div class="form-box login">
					<h2>Login</h2>
					<form action="login" method="post">
						<div class="input-box">
							<span class="icon"> <ion-icon name="mail"></ion-icon>
							</span> <input type="email" required name="loginemail"> <label>Email</label>
						</div>

						<div class="input-box">
							<span class="icon"> <ion-icon name="lock-closed"></ion-icon>
							</span> <input type="password" required name="loginpassword"> <label>Password</label>
						</div>

						<div class="forget">
							<a href="forgotPassword.jsp">Forgot Password</a>
						</div>
						<button type="submit" class="btn">Login</button>

						<div class="login-registration">
							<p>
								Don't have an account?<a href="#" class="registration-link">Register</a>
							</p>
						</div>

					</form>
				</div>

				<div class="form-box register">
					<h2>Registration</h2>
					<form action="registration" method="post">
						<div class="input-box">
							<span class="icon"> <ion-icon name="person"></ion-icon>
							</span> <input type="text" required name="username"> <label>Username</label>
						</div>


						<div class="input-box">
							<span class="icon"> <ion-icon name="mail"></ion-icon>
							</span> <input type="email" required name="email"> <label>Email</label>
						</div>



						<div class="input-box">
							<span class="icon"> <ion-icon name="lock-closed"></ion-icon>
							</span> <input type="password" required name="password"> <label>Password</label>
						</div>

						<div class="forget">
							<a href="#"> Agrees to the terms and conditions</a>
						</div>
						<button type="submit" class="btn">Register</button>

						<div class="login-registration">
							<p>
								Aready have an account?<a href="#" class="login-link">Login</a>
							</p>
						</div>

					</form>
				</div>

			</div>
		</section>

		<script type="text/javascript">

        const btns=document.querySelectorAll(".nav-btn");    
        const slides=document.querySelectorAll(".video-slide");
        const contents=document.querySelectorAll(".content");
        
        var sliderNav=function(manual){
           btns.forEach((btn) =>{
             btn.classList.remove("active");
           });
           
           slides.forEach((slide) =>{
           slide.classList.remove("active");
        });

        contents.forEach((content) =>{
            content.classList.remove("active");
        });

            btns[manual].classList.add("active");
            slides[manual].classList.add("active");
            contents[manual].classList.add("active");
        }

        btns.forEach((btn,i)=>{
         btn.addEventListener("click", () =>{
             sliderNav(i);
         });
        });

        </script>

		<script type="module"
			src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
		<script nomodule
			src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

		<script>
    const wrapper=document.querySelector('.wrapper');
    const loginLink=document.querySelector('.login-link');
    const registerLink=document.querySelector('.registration-link');
    const btnPopup=document.querySelector('.login');
    const iconClose=document.querySelector('.icon-close');
    

    registerLink.addEventListener("click", () =>{
           wrapper.classList.add('active');
         });

    loginLink.addEventListener("click", () =>{
           wrapper.classList.remove('active');
         });     
    
    btnPopup.addEventListener("click", () =>{
           wrapper.classList.add('active-popup');
         });   
    
    iconClose.addEventListener("click", () =>{
           wrapper.classList.remove('active-popup');
         });

</script>

		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<link rel="stylesheet" href="alert/dist/sweetalert.css">

		<script type="text/javascript">
     var status=document.getElementById("status").value;
     if(status=="success"){
    	 swal("congratulations","Account Created Successfully","success");
     }
     else if (status == "fail") {
         swal("Error", "Account Already Exists", "error");
     }
     else if (status == "indavlidDetails") {
         swal("Error", "Invalid Credentials Entered", "error");      
     }
     
     else if (status == "loginfirst") {
         swal("Sorry !", "Please Login to Explore Further", "error");      
     }
     
     else if (status == "passwordchaned") {
    	 swal("congratulations","Your Password is changes Successfully","success");      
     }
     
     else if (status == "passwordnotchanged") {
         swal("Sorry !", "unable to chnange password", "error");      
     }
 
     
</script>

	</main>

</body>
</html>
