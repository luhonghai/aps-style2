<%@page import="uk.ac.gre.airport.parking.dao.entity.User"%>
<%@page import="uk.ac.gre.airport.parking.service.UserService"%>
<%@page import="java.util.List"%>
<%
	UserService service = new UserService();
	List<User> users = service.findAll();
	if (users == null || users.size() == 0) {
		User user = new User();
		user.setEmail("admin@aps.com");
		user.setPassword("admin");
		user.setRoleId(1);
		user.setId(-1L);
		service.save(user);
	}
%>