<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
<title>Blue Water a Hotel Category Flat Bootstrap Responsive Web Template| Home :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Blue Water Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel='stylesheet' type='text/css' />
<script src="js/jquery-1.11.0.min.js"></script>
<link href='http://fonts.googleapis.com/css?family=Exo:100,200,300,400,500,600,700,800,900,100italic,200italic,300italic,400italic,500italic,600italic,700italic,800italic,900italic' rel='stylesheet' type='text/css'>  
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
	<div class="banner1" id="home">
		<div class="container">
			<div class="header">
				<div class="menu">
                                     <a class="toggleMenu" href="#"><img src="images/menu-icon.png" alt="" /> </a>
					<ul class="nav" id="nav">
					<li ><a href="<%=request.getContextPath() %>/" class="active">Home</a></li>
					<li><a href="<%=request.getContextPath() %>/booking.jsp">Booking</a></li>
					<li class="active"><a href="<%=request.getContextPath() %>/contact.jsp">Contact</a></li>
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
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!--end-banner-->
	<!--start-contact-->
	<div class="contact">
		<div class="container">
			<div class="contact-main">
				<h3>HOW TO FIND US</h3>
				<div class="contact-top">
					<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3887.934190118153!2d77.63611399999999!3d12.976061!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bae16a3f47ada21%3A0x6959ab57b8bec812!2sDFS%2C+No+184+1st+Floor!5e0!3m2!1sen!2sin!4v1421480060066" frameborder="0" style="border:0"></iframe>
					<p>Phasellus mollis hendrerit magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tortor ante, fringilla porttitor gravida at, ullamcorper non lacus. Integer rhoncus sem sit amet ante accumsan pulvinar. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Ut mollis, sapien in porta tristique, ante tellus sagittis neque, eu vehicula mi lorem a tellus.Morbi sed libero eu est tempor porttitor eu a orci. Aliquam imperdiet est auctor turpis ultricies viverra vitae dictum nibh. Etiam vel augue ipsum.</p>
					<div class="contact-one">
						<div class="col-md-4 contact-left">
							<div class="c-left">
								<span class="adrs"> </span>
							</div>
							<div class="c-right">
								<h5>The Company Name agi,<span>756 gt globel Place.</span></h5>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="col-md-4 contact-left">
							<div class="c-left">
								<span class="ph"> </span>
							</div>
							<div class="c-right">
							<p>Telephone: +1 234 567 9871
								<span>FAX: +1 234 567 9871</span>
							</p>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="col-md-4 contact-left">
							<div class="c-left">
								<span class="mail"> </span>
							</div>
							<div class="c-right">
								<p><a href="mailto:info@example.com">mail@user.com</a></p>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="contact-bottom">
					<h3>CONTACT FORM</h3>
					<div class="contact-text">
						<input type="text" value="First Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'First Name';}"/>
						<input type="text" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}"/>
						<textarea value="Message:" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Message';}">Message..</textarea>
						<div class="contact-but">
							<input type="submit" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--end-contact-->
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
					<p>Mail Us On <a href="mailto:info@example.com"> 123example@gmail.com</a></p>
					<p>Call Us On  +00 0111 011 111</p>
				</div>
				<div class="col-md-7 footer-right">
					<h4>Subscribe For Updates</h4>
					<span>
						<input type="text"  value="Enter email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Enter email';}">
						<input type="submit" value="SUBSCRIBE">
					</span>
					<ul>
						<li><a href="<%=request.getContextPath() %>/">Home</a></li>
						<li><a href="<%=request.getContextPath() %>/booking.jsp">Booking</a></li>
						<li><a href="<%=request.getContextPath() %>/contact.jsp">Contact</a></li>
					</ul>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="footer-text">
				&copy; 2015 Airport parking system
			</div>
		</div>
		<a href="#home" id="toTop" class="scroll" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
	</div>
	<!--end-footer-->
</body>
</html>