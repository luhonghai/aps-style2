package uk.ac.gre.airport.parking.service;

import java.util.List;

import javax.jws.WebService;

import uk.ac.gre.airport.parking.dao.OrderDAO;
import uk.ac.gre.airport.parking.dao.entity.Order;
import uk.ac.gre.airport.parking.dao.impl.OrderDaoImpl;
import uk.ac.gre.airport.parking.utils.EJBConnector;

@WebService()
public class ParkingService implements IParkingService{
	private OrderDAO orderDao;
	
	public ParkingService() {
		orderDao = new EJBConnector<OrderDAO, OrderDaoImpl>(OrderDAO.class, OrderDaoImpl.class).newInstance();
	}
	
	@Override
	public boolean checkin(String carNo) {
		return orderDao.checkin(carNo);
	}

	@Override
	public boolean checkout(String carNo) {
		return orderDao.checkout(carNo);
	}

	@Override
	public Order[] search(String s) {
		List<Order> orders = orderDao.search(s);
		if (orders == null || orders.size() == 0) return new Order[]{};
		Order[] objects = new Order[orders.size()];
		orders.toArray(objects);
		return objects;
	}

}
