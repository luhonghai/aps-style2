<%@tag import="uk.ac.gre.airport.parking.dao.entity.User"%>
<%@tag description="Main screen" pageEncoding="UTF-8" %>
<%@taglib prefix="include" tagdir="/WEB-INF/tags/admin/sub" %>
<%@attribute name="pageTitle" required="true" %>
<%@attribute name="index"%>
<%
	User user = (User) session.getAttribute("admin");
 	if (user == null) {
 		response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
 	}
%>
<!DOCTYPE html>
<html lang="en">
    <include:head pageTitle="<%=pageTitle%>">
    </include:head>
<body>
	<include:header index="<%=index %>"></include:header>
	<!-- Main -->
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<jsp:doBody/>
			</div>
		</div>
	</div>
	
    <include:footer></include:footer>
</body>
</html>

