<%@tag import="uk.ac.gre.airport.parking.dao.entity.User"%>
<%@tag description="Header" pageEncoding="UTF-8" %>
<%@attribute name="index"%>
<%
	User user = (User) session.getAttribute("admin");
if (user != null) {
%>

 <!-- Docs master nav -->
    <header class="navbar navbar-static-top bs-docs-nav" id="top" role="banner">
  <div class="container">
    <div class="navbar-header">
      <button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a href="<%=request.getContextPath() %>/admin/index.jsp" class="navbar-brand">Airport parking system</a>
    </div>
    <nav class="collapse navbar-collapse bs-navbar-collapse">
      <ul class="nav navbar-nav">
      <li <%=Integer.parseInt(index) == 1 ? "class='active'" : "" %>>
          <a href="<%=request.getContextPath() %>/admin/user.jsp?role=1">Staff</a>
        </li>
        <li <%=Integer.parseInt(index) == 2 ? "class='active'" : "" %>>
          <a href="<%=request.getContextPath() %>/admin/user.jsp?role=0">Customer</a>
        </li>
        <li <%=Integer.parseInt(index) == 3 ? "class='active'" : "" %>>
          <a href="<%=request.getContextPath() %>/admin/order.jsp">Order</a>
        </li>
        <li <%=Integer.parseInt(index) == 4 ? "class='active'" : "" %>>
          <a href="<%=request.getContextPath() %>/admin/park.jsp">Carpark</a>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a role="button" href="#"><i class="glyphicon glyphicon-user"></i> <%=user.getEmail() %></a></li>
        <li><a href="<%=request.getContextPath() + "/admin/handler/logout.jsp"%>"><i class="glyphicon glyphicon-lock"></i> Logout</a></li>
      </ul>
    </nav>
  </div>
</header>
<%}%>