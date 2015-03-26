package uk.ac.gre.airport.parking.service;

import java.util.Calendar;
import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;

import uk.ac.gre.airport.parking.dao.OrderDAO;
import uk.ac.gre.airport.parking.dao.entity.Order;
import uk.ac.gre.airport.parking.dao.entity.Park;
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

	@POST
	@Path("/check")
	@Produces("application/json")
	public Message checkAvailable(Order obj) {
		try {
			long uid = obj.getUserId();
			if (uid != -1) {
				Calendar ad1 = Calendar.getInstance();
				ad1.setTime(obj.getArrivalDate());
				ad1.set(Calendar.HOUR_OF_DAY, 0);
				ad1.set(Calendar.MINUTE, 0);
				ad1.set(Calendar.SECOND, 1);
	
				Calendar dd1 = Calendar.getInstance();
				dd1.setTime(obj.getDepartureDate());
				dd1.set(Calendar.HOUR_OF_DAY, 23);
				dd1.set(Calendar.MINUTE, 59);
				dd1.set(Calendar.SECOND, 59);
	
				List<Order> userOrders = findByUser(uid);
				if (userOrders != null && userOrders.size() > 0) {
					for (Order order : userOrders) {
						if (order.getArrivalDate() == null || order.getDepartureDate() == null) continue;
						Calendar ad2 = Calendar.getInstance();
						ad2.setTime(order.getArrivalDate());
						ad2.set(Calendar.HOUR_OF_DAY, 0);
						ad2.set(Calendar.MINUTE, 0);
						ad2.set(Calendar.SECOND, 1);
	
						Calendar dd2 = Calendar.getInstance();
						dd2.setTime(order.getDepartureDate());
						dd2.set(Calendar.HOUR_OF_DAY, 23);
						dd2.set(Calendar.MINUTE, 59);
						dd2.set(Calendar.SECOND, 59);
							
						if (((ad1.getTimeInMillis() >= ad2.getTimeInMillis()
								&& dd2.getTimeInMillis() >= ad1.getTimeInMillis())
							 || (dd1.getTimeInMillis() >= ad2.getTimeInMillis()
								&& dd2.getTimeInMillis() >= dd1.getTimeInMillis()))
								&& order.getParkId() == obj.getParkId()) {
							return new Message("Already booked this time");
						}
					}
				}
			}

			List<Order> orders = ((OrderDAO) getBean()).findByParkingTime(
					obj.getArrivalDate(), obj.getDepartureDate());
			int count = 0;
			for (Order order : orders) {
				if (order.getParkId() == obj.getParkId()) {
					count++;
				}
			}
			ParkService parkService = new ParkService();
			Park park = parkService.find(obj.getParkId());
			if (park == null || park.getCapacity() <= count) {
				return new Message("No slots available");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new Message("Error, could not validate");
		}
		return new Message("OK");
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

	public List<Order> findByUser(long userId) {
		return ((OrderDAO) getBean()).findByUser(userId);
	}
}
