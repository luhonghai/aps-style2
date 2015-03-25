package uk.ac.gre.airport.parking.service;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;

import uk.ac.gre.airport.parking.dao.OrderDAO;
import uk.ac.gre.airport.parking.dao.entity.Order;
import uk.ac.gre.airport.parking.dao.impl.OrderDaoImpl;

@Path("order")
public class OrderService extends BaseService<Order, OrderDAO, OrderDaoImpl> {

	public OrderService() {
		super(OrderDAO.class, OrderDaoImpl.class);
	}

	@Override
	@GET
	@Path("/delete")
	@Produces("application/json")
	public boolean delete(@QueryParam("id") long id) {
		return super.delete(id);
	}
	
	@Override
	@POST
	@Path("/save")
	@Produces("application/json")
	public Order save(final Order obj) {
		return super.save(obj);
	}

	@Override
	@GET
	@Path("/find")
	@Produces("application/json")
	public Order find(@QueryParam("id") long id) {
		return super.find(id);
	}

	@Override
	@GET
	@Path("/list")
	@Produces("application/json")
	public List<Order> findAll() {
		return super.findAll();
	}
}
