<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>
<body>
  <link
	href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css'
	rel='stylesheet'>
<link href='' rel='stylesheet'>
<script type='text/javascript'
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<style>
body {
	background-position: center;
	background-color: #eee;
	background-repeat: no-repeat;
	background-size: cover;
	color: #505050;
	font-family: "Rubik", Helvetica, Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	line-height: 1.5;
	text-transform: none
}

.forgot {
	background-color: transparent;
  color:black;
	padding: 12px;
	border: 2px solid black;
  position:relative;
  top:12px;
  left:30px;
  border-radius: 20px;
}

.padding-bottom-3x {
	padding-bottom: 72px !important
}

.card-footer {
	background-color: transparent;
}
.card{
  background-color: transparent;
  color:black;
  position:relative;
  top:100px;
  left:30px;
  border:2px solid black;
  border-radius: 20px;
}

.form-text {
  color:red;
}
.btn {
	font-size: 13px
}

.form-control:focus {
	color: #495057;
	background-color: #fff;
	border-color: #76b7e9;
	outline: 0;
	box-shadow: 0 0 0 0px #28a745
}

.video-slide {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;
  z-index: -1; 
  pointer-events: none; 
}


.container {
  position: relative; 
  z-index: 1; 
}

.card-footer {
  display: flex; 
}

.btn-success,
.btn-danger {
  display: flex; 
  margin-right: 10px; 
}

</style>
</head>
<body oncontextmenu='return false' class='snippet-body'>
	<div class="container padding-bottom-3x mb-2 mt-5">
		<div class="row justify-content-center">
			<div class="col-lg-8 col-md-10">
				<div class="forgot">
					<h2>Forgot your password?</h2>
					<p>Change your password in easy steps. This will help you
						to secure your password!</p>
					<ol class="list-unstyled">
						<li><span class="text-primary text-medium"></span>1. Enter
							your email address below.</li>
						<li><span class="text-primary text-medium"></span>2. Our
							system will send you an OTP to your email</li>
					</ol>
				</div>
				<form class="card mt-4" action="generateOTP" method="POST">
					<div class="card-body">
						<div class="form-group">
							<label for="email-for-pass">Enter your email address</label> <input
								class="form-control" type="email" name="email" id="email-for-pass" required=""><small
								class="form-text text-muted">Enter the registered email address . Then team ProjectX will
								send a OTP to this Mobile number.</small>
						</div>
					</div>
					<div class="card-footer">
						<button class="btn btn-success" type="submit">Get New
							Password</button>
			      </form>
			      <form class="back" action="index.jsp">		
						<button class="btn btn-danger" type="submit">Back to
							Home</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<video class="video-slide active" src="videos/email.mp4" autoplay muted loop></video>
	<script type='text/javascript'
		src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
	<script type='text/javascript' src=''></script>
	<script type='text/javascript' src=''></script>
	<script type='text/Javascript'></script>
</body>
</html>
