<%@page import="uk.ac.gre.airport.parking.service.UserService"%>
<%@page import="uk.ac.gre.airport.parking.dao.entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<%
	String email = request.getParameter("txtEmail");
	String password = request.getParameter("txtPassword");
	UserService service = new UserService();
	User user = service.login(email, password);
	if (user != null) {
		session.setAttribute("admin", user);
		response.sendRedirect(request.getContextPath() + "/admin/index.jsp");
	} else {
		session.setAttribute("error", "Invalid username or password");
		response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
	}
%>