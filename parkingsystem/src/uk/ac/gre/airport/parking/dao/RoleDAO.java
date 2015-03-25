package uk.ac.gre.airport.parking.dao;

import javax.ejb.Remote;

import uk.ac.gre.airport.parking.dao.entity.Role;

@Remote
public interface RoleDAO extends IBaseDAO<Role> {

}
