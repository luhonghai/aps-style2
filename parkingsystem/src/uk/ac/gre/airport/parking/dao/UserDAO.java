package uk.ac.gre.airport.parking.dao;

import java.util.List;

import javax.ejb.Remote;

import uk.ac.gre.airport.parking.dao.entity.User;

@Remote
public interface UserDAO extends IBaseDAO<User> {
	
	public User login(String username, String password);
	
	public List<User> findByRole(long roleId);
	
	public User getLatestUser();
}
