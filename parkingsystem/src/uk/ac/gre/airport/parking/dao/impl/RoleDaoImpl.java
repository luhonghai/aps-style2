package uk.ac.gre.airport.parking.dao.impl;

import javax.ejb.Stateless;

import uk.ac.gre.airport.parking.dao.BaseDAO;
import uk.ac.gre.airport.parking.dao.RoleDAO;
import uk.ac.gre.airport.parking.dao.entity.Role;

@Stateless
public class RoleDaoImpl extends BaseDAO<Role> implements RoleDAO {

	public RoleDaoImpl() {
		super(Role.class);
	}
	
}
