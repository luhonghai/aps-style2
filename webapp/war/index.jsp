<%@page import="uk.ac.gre.airport.parking.dao.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Airport parking system</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel='stylesheet' type='text/css' />
<script src="js/jquery-1.11.0.min.js"></script>
<link
	href='http://fonts.googleapis.com/css?family=Exo:100,200,300,400,500,600,700,800,900,100italic,200italic,300italic,400italic,500italic,600italic,700italic,800italic,900italic'
	rel='stylesheet' type='text/css'>
<!---- start-smoth-scrolling---->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
				});
			});
		</script>
<!--start-smoth-scrolling-->
</head>
<body>
	<!--start-banner-->
	<div class="banner" id="home">
		<div class="container">
			<div class="header">
				<div class="menu">
					<a class="toggleMenu" href="#"><img src="images/menu-icon.png"
						alt="" /> </a>
					<ul class="nav" id="nav">
						<li class="active"><a href="<%=request.getContextPath() %>/"
							class="active">Home</a></li>
						<li><a href="<%=request.getContextPath() %>/booking.jsp">Booking</a></li>
						<li><a href="<%=request.getContextPath() %>/contact.jsp">Contact</a></li>
					</ul>
					<!----start-top-nav-script---->
					<script type="text/javascript" src="js/responsive-nav.js"></script>
					<script type="text/javascript">
					jQuery(document).ready(function($) {
						$(".scroll").click(function(event){		
							event.preventDefault();
							$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
						});
						
					});
					</script>
					<!----//End-top-nav-script---->
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="log-in">
			
				<ul>
				<%
						User user = (User) session.getAttribute("user");
						if (user == null) {
					%>
					<li><a class="play-icon popup-with-zoom-anim"
						id="btnShowLogin" href="#small-dialog"><span> </span>Login</a></li>
					<li><a class="play-icon popup-with-zoom-anim"
						id="btnShowSignup" href="#small-dialog1">Signup</a></li>
					<%
						} else {
					%>
						<li><a class="play-icon"
						 href="<%=request.getContextPath()%>/booking.jsp"><span> </span>Booking</a></li>
					<li><a class="play-icon"
						 href="<%=request.getContextPath()%>/handler/logout.jsp">Logout</a></li>
					<%		
						}
					%>
				</ul>
			</div>
		</div>
	</div>
	<!--start-login-->

	<!---pop-up-box---->
	<script type="text/javascript" src="js/modernizr.custom.min.js"></script>
	<link href="css/popup-box.css" rel="stylesheet" type="text/css"
		media="all" />
	<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
	<link rel="stylesheet" href="css/jquery-ui.css" />
	<script src="js/jquery-ui.js"></script>
	<script>
		$(function() {
			$(".datepicker-input").datepicker({
			});
		});
	</script>
	<!---//pop-up-box---->
	<div id="small-dialog" class="mfp-hide">
		<div class="login">
			<h3>Log In</h3>
			<h4>Already a Member</h4>
			<form action="<%=request.getContextPath()%>/handler/login.jsp" method="post">
			<input type="text" value="Email" name="txtEmail" onfocus="this.value = '';"
				onblur="if (this.value == '') {this.value = 'Email';}" /> <input
				type="password" value="Password" name="txtPassword" onfocus="this.value = '';"
				onblur="if (this.value == '') {this.value = 'Password';}" /> <input
				type="submit" value="Login" />
				</form>
		</div>
	</div>
	<div id="small-dialog1" class="mfp-hide">
		<div class="signup">
			<h3>Sign Up</h3>
			<h4>Enter Your Details Here</h4>
			<form action="<%=request.getContextPath()%>/handler/signup.jsp" method="post">
			<input type="text" value="First Name" name="txtFirstName" onfocus="this.value = '';"
				onblur="if (this.value == '') {this.value = 'First Name';}" />
			<input
				type="text" name="txtSurname" value="Surname" onfocus="this.value = '';"
				onblur="if (this.value == '') {this.value = 'Surname';}" /> 
			<input
				type="text" name="txtEmail" class="email" value="Enter Email"
				onfocus="this.value = '';"
				onblur="if (this.value == '') {this.value = 'Enter Email';}" />
			<input
				type="password" name="txtPassword" value="Password" onfocus="this.value = '';"
				onblur="if (this.value == '') {this.value = 'Password';}" />
				<div style="width: 100%">
				<input
				type="radio" name="rdGender" value="male" />
				<span>Male</span>
				<input
				type="radio" name="rdGender" style="margin-left: 20px;"  value="female" />
				<span>Female</span>
				</div> 
				<input
				type="text" name="txtPhone" value="Phone number" onfocus="this.value = '';"
				onblur="if (this.value == '') {this.value = 'Phone number';}" />
				<input
				type="text" name="txtDob" class="datepicker-input" value="Date of birth" onfocus="this.value = '';"
				onblur="if (this.value == '') {this.value = 'Date of birth';}" />
				<input
				type="text" name="txtAddress" class="email" value="Address" onfocus="this.value = '';"
				onblur="if (this.value == '') {this.value = 'Address';}" />
				
				<div style="width: 100%">
			<input
				type="submit" value="SignUp" />
				</div>
			</form>
			
		</div>
	</div>
	<script>
						$(document).ready(function() {
							$('.popup-with-zoom-anim').magnificPopup({
								type: 'inline',
								fixedContentPos: false,
								fixedBgPos: true,
								overflowY: 'auto',
								closeBtnInside: true,
								preloader: false,
								midClick: true,
								removalDelay: 300,
								mainClass: 'my-mfp-zoom-in'
							});
							var showLogin = <%=session.getAttribute("needlogin") != null? session.getAttribute("needlogin") : "false"%>;
							if (showLogin) {
								$("#btnShowLogin").click();
							}
							<% session.setAttribute("needlogin", null); %>
																						
						});
				</script>
	<!--End-pop-up-box-->
	<!--end-login-->
	<!--end-banner-->
	<!--start-footer-->
	<div class="footer">
		<div class="container">
			<div class="footer-main">
				<div class="col-md-5 footer-left">
					<h4>Follow Us</h4>
					<ul>
						<li><a href="#"><span class="twt"> </span></a></li>
						<li><a href="#"><span class="fb"> </span></a></li>
						<li><a href="#"><span class="p"> </span></a></li>
						<li><a href="#"><span class="yt"> </span></a></li>
						<li><a href="#"><span class="in"> </span></a></li>
					</ul>
					<h4>Address</h4>
					<h5>capetown,Georgia, Lipsum street, New york.</h5>
					<p>
						Mail Us On <a href="mailto:info@example.com">
							123example@gmail.com</a>
					</p>
					<p>Call Us On +00 0111 011 111</p>
				</div>
				<div class="col-md-7 footer-right">
					<h4>Subscribe For Updates</h4>
					<span> <input type="text" value="Enter email"
						onfocus="this.value = '';"
						onblur="if (this.value == '') {this.value = 'Enter email';}">
						<input type="submit" value="SUBSCRIBE">
					</span>
					<ul>
						<li><a href="<%=request.getContextPath() %>/">Home</a></li>
						<li><a href="<%=request.getContextPath() %>/booking.jsp">Booking</a></li>
						<li><a href="<%=request.getContextPath() %>/contact.jsp">Contact</a></li>
						<li><a class="play-icon popup-with-zoom-anim"
							href="#small-dialog">Login</a></li>
						<li><a class="play-icon popup-with-zoom-anim"
							href="#small-dialog1">Signup</a></li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="footer-text">&copy; 2015 Airport parking system</div>
		</div>
		<a href="#home" id="toTop" class="scroll" style="display: block;">
			<span id="toTopHover" style="opacity: 1;"> </span>
		</a>
	</div>
	<!--end-footer-->
</body>
</html>