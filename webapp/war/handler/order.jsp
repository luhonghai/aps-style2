<%@page import="uk.ac.gre.airport.parking.dao.entity.User"%>
<%@page import="uk.ac.gre.airport.parking.service.OrderService"%>
<%@page import="uk.ac.gre.airport.parking.dao.entity.Order"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	OrderService orderService = new OrderService();
	SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
	Order order = new Order();
	order.setType(Integer.parseInt(request.getParameter("selType")));
	order.setParkId(Long.parseLong(request.getParameter("selCarpark")));
	if (request.getParameter("txtArrivalDate") != null && request.getParameter("txtArrivalDate").length() > 0) {
		order.setArrivalDate(sdf.parse(request.getParameter("txtArrivalDate")));
	}
	if (request.getParameter("txtDepartureDate") != null && request.getParameter("txtDepartureDate").length() > 0) {
		order.setDepartureDate(sdf.parse(request.getParameter("txtDepartureDate")));
	}
	order.setCarNumber(request.getParameter("txtCarNumber"));
	order.setCarMadeBy(request.getParameter("txtCarMadeBy"));
	order.setCarModel(request.getParameter("txtCarModel"));
	User user = (User) session.getAttribute("user");
	if (user == null) {
		session.setAttribute("order", order);
		session.setAttribute("needlogin", true);
		response.sendRedirect(request.getContextPath() + "/index.jsp");
	} else {
		order.setUserId(user.getId());
		orderService.save(order);
		session.setAttribute("message", "Booking added successfully");
		response.sendRedirect(request.getContextPath() + "/booking.jsp");
	}
%>