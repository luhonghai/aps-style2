package uk.ac.gre.airport.parking.dao.impl;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.NoResultException;

import uk.ac.gre.airport.parking.dao.BaseDAO;
import uk.ac.gre.airport.parking.dao.UserDAO;
import uk.ac.gre.airport.parking.dao.entity.User;
@Stateless
public class UserDaoImpl extends BaseDAO<User> implements UserDAO {

	public UserDaoImpl() {
		super(User.class);
	}

	@Override
	public User login(String username, String password) {
		try {
			return getEntityManager()
					.createQuery("SELECT u from " + User.class.getName() + " u " 
									+"WHERE u.email=:e and u.password=:p", User.class)
					.setParameter("e", username)
					.setParameter("p", password)
					.setFirstResult(0)
					.setMaxResults(1)
					.getSingleResult();
		} catch (NoResultException e) {
				return null;
		}
	}

	@Override
	public List<User> findByRole(long roleId) {
		return getEntityManager()
				.createQuery("SELECT u from " + User.class.getName() + " u "
							+ "WHERE u.roleId=:r", User.class)
				.setParameter("r", roleId)			
				.getResultList();
	}

	@Override
	public User getLatestUser() {
		List<User> users = getEntityManager()
				.createQuery("SELECT u from " + User.class.getName() + " u "
						+ " ORDER BY id DESC", User.class).
				setFirstResult(0).setMaxResults(1)
				.getResultList();
		return users.size() > 0 ? users.get(0) : null;
	}

}
