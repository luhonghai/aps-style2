package uk.ac.gre.airport.parking.dao;

import javax.ejb.Remote;

import uk.ac.gre.airport.parking.dao.entity.Park;

@Remote
public interface ParkDAO extends IBaseDAO<Park> {
}
