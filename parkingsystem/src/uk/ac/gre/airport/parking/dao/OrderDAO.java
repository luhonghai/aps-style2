package uk.ac.gre.airport.parking.dao;

import java.util.Date;
import java.util.List;

import javax.ejb.Remote;

import uk.ac.gre.airport.parking.dao.entity.Order;

@Remote
public interface OrderDAO extends IBaseDAO<Order> {
	public List<Order> findByCar(String carNo);
	
	public List<Order> findByDate(Date date);
	
	public List<Order> search(String s);
	
	public boolean checkin(String carNo);
	
	public boolean checkout(String carNo);
}
