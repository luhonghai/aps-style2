<%@tag description="Carpark management" pageEncoding="UTF-8" %>
<h1>Carpark management</h1>
	<hr>
	<div class="row">
		<div class="col-md-12">
				<!-- Button trigger modal -->
			<button type="button" class="btn btn-primary btn-add table-action">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add new carpark
			</button>
			 <div class="table-responsive" id="tableContainer">
			</div>
		</div>
	</div>
<!-- Modal -->
<div class="modal fade" id="dataModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="dataModelTitle"></h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" role="form" id="dataModelForm">
					<div class="form-group" id="dataModelID" style="display: none">
						<label for="txtId" class="col-sm-2 control-label">ID</label>
						<div class="col-xs-4">
							<input type="text" class="form-control" name="txtId" value="-1" />
						</div>
					</div>
							<div class="form-group">
								<label for="txtName" class="col-sm-2 control-label">Name</label>
				                <div class="col-xs-4">
				                  <input type="text" class="form-control" name="txtName"/>
				                </div>
				              </div>
				              <div class="form-group">
								<label for="txtAirPort" class="col-sm-2 control-label">Airport</label>
				                <div class="col-xs-4">
				                  <input type="text" class="form-control" name="txtAirport"/>
				                </div>
				              </div>
				              <div class="form-group">
								<label for="txtCapacity" class="col-sm-2 control-label">Capacity</label>
				                <div class="col-xs-4">
				                  <input type="text" class="form-control" name="txtCapacity"/>
				                </div>
				              </div>
				              <div class="form-group">
								<label for="txtPrice" class="col-sm-2 control-label">Price</label>
				                <div class="col-xs-4">
				                  <input type="text" class="form-control" name="txtPrice"/>
				                </div>
				              </div>
				              <div class="form-group">
								<label for="txtPhone" class="col-sm-2 control-label">Phone</label>
				                <div class="col-xs-4">
				                  <input type="text" class="form-control" name="txtPhone"/>
				                </div>
				              </div>
				              <div class="form-group">
				                <label for="txtAddress" class="col-sm-2 control-label">Address</label>
				                <div class="col-xs-4">
				                  <textarea class="form-control" name="txtAddress"></textarea>
				                </div>
				              </div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary btn-save"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span> Save</button>
			</div>
		</div>
	</div>
</div>
	<script>
		var TableData = {
			saveUrl: App.contextPath + "/rest/park/save",
			deleteUrl: App.contextPath + "/rest/park/delete",
			findUrl: App.contextPath + "/rest/park/find",
			listUrl : App.contextPath + "/rest/park/list",
			showAddForm: function() {
				$("#dataModelTitle").html("Add carpark");
				$("input[name=txtId]").val("-1");
   				$("input[name=txtName]").val("");
   				$("input[name=txtAirport]").val("");
   				$("input[name=txtPhone]").val("");
   				$("input[name=txtCapacity]").val("");
   				$("input[name=txtPrice]").val("");
   				$("textarea[name=txtAddress]").val("");
				$("#dataModelID").hide();
				$("#dataModal").modal("show");
			},
			showEditForm: function(obj) {
				$("#dataModelTitle").html("Edit carpark");
				$("input[name=txtId]").val(obj.id);
				$("input[name=txtId]").prop("disabled", "disabled");
   				$("input[name=txtName]").val(obj.name);
   				$("input[name=txtAirport]").val(obj.airPort);
   				$("input[name=txtPhone]").val(obj.phoneNumber);
   				$("input[name=txtCapacity]").val(obj.capacity);
   				$("input[name=txtPrice]").val(obj.price);
   				$("textarea[name=txtAddress]").val(obj.address);
				$("#dataModelID").show();
				$("#dataModal").modal("show");
			},
			checkForm: function() {
				return true;	
			},
			prepareObject: function() {
				var obj = {
						id : $("input[name=txtId]").val(),
	       	        	name : $("input[name=txtName]").val(),
	       	        	airPort : $("input[name=txtAirport]").val(),
	       	        	phoneNumber : $("input[name=txtPhone]").val(),
	       	        	capacity : parseInt($("input[name=txtCapacity]").val()),
	       	        	price : parseFloat($("input[name=txtPrice]").val()),
	       	        	address: $("textarea[name=txtAddress]").val()
	       	        	
				};
				return obj;
			},
			processData: function(data) {
				if (data.length == 0) return data;
				var i;
				for (i = 0; i < data.length; i++) {
							
				}
				return data;
			},
			name : "Carpark",
			columns : [
				{data: "id", title: "ID"},
				{data: "name", title: "Name"},
				{data: "airPort", title: "Airport"},
				{data: "phoneNumber", title: "Phone number"},
				{data: "address", title: "Address"},
				{data: "capacity", title: "Capacity"},
				{data: "price", title: "Price"},
				{data: "command", title: ""}
			]
		}
	</script>
