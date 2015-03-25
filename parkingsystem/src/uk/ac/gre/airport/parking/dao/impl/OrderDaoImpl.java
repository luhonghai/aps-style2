package uk.ac.gre.airport.parking.dao.impl;

import java.util.Date;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;

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
							+ "WHERE u.carNumber like :s or u.carMadeBy like :s or u.carModel like :s", Order.class)
				.setParameter("s", "%" + s + "%")			
				.getResultList();
	}

	@Override
	public boolean checkin(String carNo) {
		List<Order> orders = findByCar(carNo);
		return (orders != null && orders.size() > 0);
	}

	@Override
	public boolean checkout(String carNo) {
		List<Order> orders = findByCar(carNo);
		return (orders != null && orders.size() > 0);
	}
}
