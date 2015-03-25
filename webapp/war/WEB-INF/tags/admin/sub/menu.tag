<%@tag description="Menu" pageEncoding="UTF-8" %>
<%@attribute name="index"%>
	<ul class="list-unstyled">
		<li class="nav-header"><a href="<%=request.getContextPath() %>/admin/user.jsp?role=0" >
				<h5>
					Customer management
				</h5>
		</a></li>
		<li class="nav-header"><a href="<%=request.getContextPath() %>/admin/user.jsp?role=1" >
				<h5>
					Staff management
				</h5>
		</a></li>	
		<li class="nav-header"><a href="<%=request.getContextPath() %>/admin/park.jsp" >
				<h5>
					Carpark management
				</h5>
		</a></li>	
		<li class="nav-header"><a href="<%=request.getContextPath() %>/admin/order.jsp" >
				<h5>
					Order management
				</h5>
		</a></li>
	</ul>

