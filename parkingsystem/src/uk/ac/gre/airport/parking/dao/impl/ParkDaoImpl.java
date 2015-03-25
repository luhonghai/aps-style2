package uk.ac.gre.airport.parking.dao.impl;

import javax.ejb.Stateless;

import uk.ac.gre.airport.parking.dao.BaseDAO;
import uk.ac.gre.airport.parking.dao.ParkDAO;
import uk.ac.gre.airport.parking.dao.entity.Park;

@Stateless
public class ParkDaoImpl extends BaseDAO<Park> implements ParkDAO {

	public ParkDaoImpl() {
		super(Park.class);
	}

}
