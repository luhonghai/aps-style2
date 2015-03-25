<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<%@page import="uk.ac.gre.airport.parking.service.CurrencyService"%>
<%@page import="uk.ac.gre.airport.parking.dao.entity.Currency"%>
<%@page import="java.util.List"%>
<%@page import="uk.ac.gre.airport.parking.service.ParkService"%>
<%@page import="uk.ac.gre.airport.parking.dao.entity.Park"%>
<html>
<head>
<title>Booking Carpark</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
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
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1000);
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
					<a class="toggleMenu" href="#"><img src="images/menu-icon.png"
						alt="" /> </a>
					<ul class="nav" id="nav">
						<li><a href="<%=request.getContextPath()%>/" class="active">Home</a></li>
						<li class="active"><a
							href="<%=request.getContextPath()%>/booking.jsp">Booking</a></li>
						<li><a href="<%=request.getContextPath()%>/contact.jsp">Contact</a></li>
					</ul>
					<!----start-top-nav-script---->
					<script type="text/javascript" src="js/responsive-nav.js"></script>
					<script type="text/javascript">
						jQuery(document).ready(function($) {
							$(".scroll").click(function(event) {
								event.preventDefault();
								$('html,body').animate({
									scrollTop : $(this.hash).offset().top
								}, 1000);
							});
						});
					</script>
					<!----//End-top-nav-script---->
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--end-banner-->
	<!--start-booking-->
	<div class="booking">
		<div class="container">
			<div class="booking-main">
				<h3>BOOKING</h3>
				<div class="booking-top">
					<div class="col-md-4 booking-top-left">
						<h4>BOOK CARKPARK NOW</h4>
						<div class="booking-form">
							<form name="action-form" id="action-form"
								action="<%=request.getContextPath()%>/handler/order.jsp"
								method="post">
								<div class="b_room">
									<div class="booking_room">
										<div class="reservation">
											<ul>
												<li class="span1_of_1 left">
													<div class="book-text">
														<h5>Arrival date:</h5>
													</div>
													<div class="book_date">
															<input class="date datepicker-input"
																name="txtArrivalDate" id="txtArrivalDate" type="text"
																value="" onfocus="this.value = '';"
																onblur="if (this.value == '') {this.value = '';}"
																required=>
							
													</div>
													<div class="clearfix"></div>
												</li>
												<li class="span1_of_1 left">
													<div class="book-text">
														<h5>Departure date:</h5>
													</div>
													<div class="book_date">
															<input class="date datepicker-input"
																name="txtDepartureDate" id="txtDepartureDate"
																type="text" value="" onfocus="this.value = '';"
																onblur="if (this.value == '') {this.value = '';}"
																required=>
														
													</div>
													<div class="clearfix"></div>
												</li>
												<li class="span1_of_1">
													<div class="book-text">
														<h5>Parking type:</h5>
													</div> <!----------start section_room----------->
													<div class="book_date">
														<select name="selType" id="selType"
															class="frm-field required">
															<option value="0">Default</option>
															<option value="1">Family</option>
															<option value="2">Disabled</option>
														</select>
													</div>
													<div class="clearfix"></div>
												</li>
												<li class="span1_of_1">
													<div class="book-text">
														<h5>Carpark:</h5>
													</div> <!----------start section_room----------->
													<div class="book_date">
														<select name="selCarpark" id="selCarpark"
															class="frm-field required">
															<%
																ParkService parkService = new ParkService();
																												List<Park> parks = parkService.findAll();
																												if (parks != null && parks.size() > 0) {
																													for (Park park : parks) {
															%>
															<option price="<%=park.getPrice()%>"
																value="<%=park.getId()%>"><%=park.getName()%>
																-
																<%=park.getAirPort()%></option>
															<%
																}
																												}
															%>
														</select>
													</div>
													<div class="clearfix"></div>
												</li>
												<li class="span1_of_1 left">
													<div class="book-text">
														<h5>Car RegNo:</h5>
													</div>
													<div class="book_date">
			
															<input name="txtCarNumber" type="text" placeholder=""
																required="frm-field required">
													
													</div>
													<div class="clearfix"></div>
												</li>
												<li class="span1_of_1 left">
													<div class="book-text">
														<h5>Made by:</h5>
													</div>
													<div class="book_date">
												
															<input name="txtCarMadeBy" type="text" placeholder=""
																required="frm-field required">
													
													</div>
													<div class="clearfix"></div>
												</li>
												<li class="span1_of_1 left">
													<div class="book-text">
														<h5>Model:</h5>
													</div>
													<div class="book_date">
													
															<input name="txtCarModel" type="text" placeholder=""
																required="frm-field required">
												
													</div>
													<div class="clearfix"></div>
												</li>

												<div class="clearfix"></div>
											</ul>
										</div>
									</div>
									<div class="clearfix"></div>
								</div>
								<!---->
								<div class="properties">
									<h6>Total price</h6>
									<span id="txtPrice"
										style="float: left; padding-right: 10px; font-weight: bold; font-size: 14px;">0</span>
									<select id="selCurrency" style="width: 200px; float: right;">
										<%
											CurrencyService currencyService = new CurrencyService();
															List<Currency> currencies =	currencyService.listAllCurrencies();
															if (currencies != null && currencies.size() > 0) {
																for (Currency currency : currencies) {
										%>
										<option value="<%=currency.getCode()%>"><%=currency.getName()%>
											(<%=currency.getCode()%>)
										</option>
										<%
											}}
										%>
									</select>
								</div>
								<div class="b-btn">
									<a href="javascript:void(0)" id="btnSubmit">Book now!</a>
								</div>
							</form>
						</div>
					</div>
					<div class="col-md-8 booking-top-right"></div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
	<!--end-booking-->
	<!---strat-date-piker---->
	<script type="text/javascript">
		function updateTotalPrice() {
			var ad = $("#txtArrivalDate").val();
			var dd = $("#txtDepartureDate").val();
			if (ad.length == 0 || dd.length == 0) {
				$("#txtPrice").html("0");
			} else {
				var day = Math.round((new Date(dd).getTime() - new Date(ad)
						.getTime())
						/ (24 * 60 * 60 * 1000));
				if (day >= 0) {
					var price = $("#selCarpark option:selected").attr("price");
					var code = $("#selCurrency").val();
					$.ajax({
						type : "GET",
						url : "rest/money/convert",
						data : {
							amount : (day + 1) * parseFloat(price),
							code : code
						},
						contentType : "application/json",
						dataType : "json",
					}).done(function(data) {
						$("#txtPrice").html(data);
					}).error(function() {
						$("#txtPrice").html("0");
					});
				} else {
					alert('Invalid date range');
					$("#txtPrice").html("0");
					$("#txtArrivalDate").val("");
					$("#txtDepartureDate").val("");
				}
			}
		}
	</script>
	<link rel="stylesheet" href="css/jquery-ui.css" />
	<script src="js/jquery-ui.js"></script>
	<script>
		$(function() {
			$(".datepicker-input").datepicker({
				minDate : new Date(),
				onSelect : function() {
					updateTotalPrice();
				}
			});
		});
	</script>
	<!---/End-date-piker---->
	<link type="text/css" rel="stylesheet" href="css/JFGrid.css" />
	<link type="text/css" rel="stylesheet" href="css/JFFormStyle-1.css" />
	<script type="text/javascript" src="js/JFCore.js"></script>
	<script type="text/javascript" src="js/JFForms.js"></script>
	<!-- Set here the key for your domain in order to hide the watermark on the web server -->
	<script type="text/javascript">
		(function() {
			JC.init({
				domainKey : ''
			});
			$("#btnSubmit").click(function() {
				console.log("booking now");
				$('#action-form').submit();
			});
			$("#selCurrency").on("change", function() {
				updateTotalPrice();
			});
		})();
	</script>
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
						<li><a href="<%=request.getContextPath()%>/">Home</a></li>
						<li><a href="<%=request.getContextPath()%>/booking.jsp">Booking</a></li>
						<li><a href="<%=request.getContextPath()%>/contact.jsp">Contact</a></li>
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