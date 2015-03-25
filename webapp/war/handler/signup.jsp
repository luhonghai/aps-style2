<%@page import="uk.ac.gre.airport.parking.service.OrderService"%>
<%@page import="uk.ac.gre.airport.parking.dao.entity.Order"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="uk.ac.gre.airport.parking.service.UserService"%>
<%@page import="uk.ac.gre.airport.parking.dao.entity.User"%>
<%
	UserService userService = new UserService();
	User user = new User();
	user.setFirstName(request.getParameter("txtFirstName"));
	user.setSurname(request.getParameter("txtSurname"));
	user.setAddress(request.getParameter("txtAddress"));
	user.setEmail(request.getParameter("txtEmail"));
	user.setPassword(request.getParameter("txtPassword"));
	user.setPhoneNumber(request.getParameter("txtPhone"));
	user.setRoleId(0);
	user.setGender(request.getParameter("rdGender").equalsIgnoreCase("male"));
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	if (request.getParameter("txtDob") != null && request.getParameter("txtDob").length() > 0) {
		user.setDob(sdf.parse(request.getParameter("txtDob")));
	}
	user.setId(-1L);
	user = userService.save(user);
	if (user != null) {
		session.setAttribute("user", user);
		Order order = (Order) session.getAttribute("order");
		if (order != null) {
			OrderService orderService = new OrderService();
			order.setUserId(user.getId());
			orderService.save(order);
			session.setAttribute("message", "Booking is added successfully!");
			session.setAttribute("booking", null);
			response.sendRedirect(request.getContextPath() + "/booking.jsp");
		} else {
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		}
	} else {
		session.setAttribute("needlogin", true);
		response.sendRedirect(request.getContextPath() + "/index.jsp");
	}
%>