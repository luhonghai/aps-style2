
<%@page import="uk.ac.gre.airport.parking.service.OrderService"%>
<%@page import="uk.ac.gre.airport.parking.dao.entity.Order"%>
<%@page import="uk.ac.gre.airport.parking.dao.entity.User"%>
<%@page import="uk.ac.gre.airport.parking.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UserService userService = new UserService();
	User user = userService.login(request.getParameter("txtEmail"), request.getParameter("txtPassword"));
	if (user != null) {
		session.setAttribute("user", user);
		Order order = (Order) session.getAttribute("order");
		if (order != null) {
			OrderService bookingService = new OrderService();
			bookingService.save(order);
			session.setAttribute("message", "Booking added successfully");
			session.setAttribute("order", null);
		}
		response.sendRedirect(request.getContextPath() + "/booking.jsp");
	} else {
		session.setAttribute("needlogin", true);
		response.sendRedirect(request.getContextPath() + "/index.jsp");
	}
%>