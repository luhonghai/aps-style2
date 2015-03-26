package uk.ac.gre.airport.parking.dao.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.ejb.Stateless;

import uk.ac.gre.airport.parking.dao.BaseDAO;
import uk.ac.gre.airport.parking.dao.OrderDAO;
import uk.ac.gre.airport.parking.dao.entity.Order;

@Stateless
public class OrderDaoImpl extends BaseDAO<Order> implements OrderDAO {

	public OrderDaoImpl() {
		super(Order.class);
	}

	@Override
	public List<Order> findByCar(String carNo) {
		return getEntityManager()
				.createQuery("SELECT u from " + Order.class.getName() + " u "
							+ "WHERE u.carNumber = :carNo", Order.class)
				.setParameter("carNo", carNo)		
				.getResultList();
	}

	@Override
	public List<Order> findByDate(Date date) {
		return getEntityManager()
				.createQuery("SELECT u from " + Order.class.getName() + " u "
							+ "WHERE u.arrivalDate = :d", Order.class)
				.setParameter("d", date)		
				.getResultList();
	}

	@Override
	public List<Order> search(String s) {
		return getEntityManager()
				.createQuery("SELECT u from " + Order.class.getName() + " u "
							+ "WHERE u.carNumber like :s or u.carMadeBy like :s or u.carModel like :s ORDER BY id DESC", Order.class)
				.setParameter("s", "%" + s + "%")			
				.getResultList();
	}

	@Override
	public boolean checkin(String carNo) {
		List<Order> orders = findByCar(carNo);
		if (orders != null && orders.size() > 0) {
			for (Order order : orders) {
				Calendar ad = Calendar.getInstance();
				ad.setTime(order.getArrivalDate());
				ad.set(Calendar.HOUR_OF_DAY, 0);
				ad.set(Calendar.MINUTE, 0);
				ad.set(Calendar.SECOND, 1);
				
				Calendar dd = Calendar.getInstance();
				dd.setTime(order.getDepartureDate());
				dd.set(Calendar.HOUR_OF_DAY, 23);
				dd.set(Calendar.MINUTE, 59);
				dd.set(Calendar.SECOND, 59);
				
				long now = System.currentTimeMillis();
				if (now > ad.getTimeInMillis() && dd.getTimeInMillis() < now) {
					return true;
				}
			}
		}
		return false;
	}

	@Override
	public boolean checkout(String carNo) {
		return checkin(carNo);
	}

	@Override
	public List<Order> findByUser(long userId) {
		return getEntityManager()
				.createQuery("SELECT u from " + Order.class.getName() + " u "
							+ "WHERE u.userId = :uid ORDER BY id DESC", Order.class)
				.setParameter("uid", userId)		
				.getResultList();
	}

	@Override
	public List<Order> findByParkingTime(Date from, Date to) {
		return getEntityManager()
				.createQuery("SELECT u from " + Order.class.getName() + " u "
							+ "WHERE u.arrivalDate BETWEEN :from AND :to and u.departureDate BETWEEN :from AND :to ORDER BY id DESC", Order.class)
				.setParameter("from", from)
				.setParameter("to", to)
				.getResultList();
	}
}
