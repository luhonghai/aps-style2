<%@tag description="User management" pageEncoding="UTF-8" %>
<h1>Order management</h1>
	<hr>
	<div class="row">
		<div class="col-md-12">
			 <div class="table-responsive" id="tableContainer">
			</div>
		</div>
	</div>
	<script>
		var TableData = {
			saveUrl: App.contextPath + "/rest/order/save",
			deleteUrl: App.contextPath + "/rest/order/delete",
			findUrl: App.contextPath + "/rest/order/find",
			listUrl : App.contextPath + "/rest/order/list",
			init: function() {
				
			},
			showAddForm: function() {
				
			},
			showEditForm: function(obj) {
				
			},
			checkForm: function() {
				return true;	
			},
			prepareObject: function() {
				return null;
			},
			processData: function(data) {
				if (data.length == 0) return data;
				var i;
				for (i = 0; i < data.length; i++) {
					data[i].strArrivalDate = (typeof data[i].arrivalDate == 'undefined' || data[i].arrivalDate <= 0) 
					? "" 
					: new Date(data[i].arrivalDate).customFormat("#DD#/#MM#/#YYYY#");
					
					data[i].strDepartureDate = (typeof data[i].departureDate == 'undefined' || data[i].departureDate <= 0) 
					? "" 
					: new Date(data[i].departureDate).customFormat("#DD#/#MM#/#YYYY#");
				}
				return data;
			},
			name : "Order",
			columns : [
				{data: "id", title: "ID"},
				{data: "strArrivalDate", title: "Arrival Date"},
				{data: "strDepartureDate", title: "Departure Date"},
				{data: "carNumber", title: "Register number"},
				{data: "carMadeBy", title: "Made by"},
				{data: "carModel", title: "Model"},
			]
		}
	</script>
